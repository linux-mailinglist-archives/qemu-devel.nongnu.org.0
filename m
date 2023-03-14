Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D16B9139
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:13:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2ZG-00068r-Rg; Tue, 14 Mar 2023 07:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pc2ZD-00066g-PA
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:11:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pc2ZC-00071F-8b
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BZjeX02hrVmqO8Q7jITeeJMXLlrEdE3Snoz4TfQBNhA=; b=Du656YFBj25xwmKrqYc84DFU6G
 Q+UvtI43D1O3NWG4FfhtKuIy6X3W9LXhMEcjMxxi2wR+pt/Tui2Zs7WFFNfZzTjHAvytZP6wIrpTp
 bFZLdexsXQxirEP3gPaB2MuvOcx6x3Oh7DyHllHxUKNKooYAhjJbCIqio/oV5KxmFue+PlTimEX9M
 5B5O8AxG4eKe21WCLfGxLIF3gotjc4e/fUrv02sfwU6VEJbnrg6y9YMZKrJQwWIssNqRVn7zWErBk
 5wXmzOIPxlVVFxdnP+gl7M+55ghWTrBH0h4j+FoqW/fwnZeI06S50Ey0jYchKa9MsUb/ccLcrwMFv
 Njsou/rhVaZhQpO4P5Dl8+BLt97g/uqiod27UrlAFaC9wvSngsrWrf7+H7HBFbq3/5duMhxWsXXd0
 6Jj1qjeIj4JGSdA0P8m7q04PSgYRA7MVsXHkPb9jGVrx0YGIWCldt1QSRtiab6kcJX3sxe2VmDgBZ
 VPLHgdJwZtr/RIKqnA4RY2Cff5a7ThzycVlvcwJukDvWhh8HcWa23BpewHotzvxCZXoXAZB/Cxvla
 +QBZRbll9gQC2v3wFov7OxJ0NLb4QS6SRmQSkdVfPliKb4k5eep/I63sSEkw9h9x83nMvE//FlX1B
 eAczCPQq/f1sN0cElQiLds5nvSjpOVTA1jCIbXan8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com, Dorinda Bassey <dbassey@redhat.com>
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Tue, 14 Mar 2023 12:11:38 +0100
Message-ID: <2477546.FPcbO7chfY@silver>
In-Reply-To: <CACzuRyz39A0ptHGY=8LNf=mXEkiTDD3OQ2a8gnk1_dbEn72YPw@mail.gmail.com>
References: <20230306171020.381116-1-dbassey@redhat.com>
 <3379148.aeAvL9zz9z@silver>
 <CACzuRyz39A0ptHGY=8LNf=mXEkiTDD3OQ2a8gnk1_dbEn72YPw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, March 13, 2023 8:06:15 PM CET Dorinda Bassey wrote:
> >
> > Are you sure about sizeof(n_bytes) here? That's 4. ;-)
> >
> my bad!
> 
> >
> > Volker's point was that "silence" is the center of the wave range. With
> > signed
> > range that's zero, yes, but with unsigned range that's 2^(bitdepth) / 2.
> >
> > So you need to memset() the correct value to generate "silence".
> >
> I understand now, Thanks. I guess it should work for signed range, so I
> would do:
> 
> @@ -117,7 +117,9 @@ playback_on_process(void *data)
>      }
> 
>      if (avail == 0) {
> -        memset(p, 0, n_bytes);
> +        memset(p, 0, (int32_t) n_bytes);

No, that would not fix anything. You are actually making several false
assumptions here.

Anyway, in audio/audio.c there is a function which does it correctly:

  audio_pcm_info_clear_buf(struct audio_pcm_info *info, void *buf, int len)

So you probably just want to call this function instead to generate silence
correctly. Keep in mind though that it's `len` argument is in sample points,
not in bytes.




