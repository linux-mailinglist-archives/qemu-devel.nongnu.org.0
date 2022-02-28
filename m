Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A36B4C69FE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:16:42 +0100 (CET)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOe17-0006XA-Px
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOdz3-0005hw-1V
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOdyz-000149-Hu
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646046863;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3uLmPMcXIAaO9mLQtiD653p40eRZex5GZ+o/osAa1o=;
 b=Lvy+16GWVASXzSBJjmbqAQtLtCqYIlAcaozmFrjdLZqwYr3qjPfdQGTK/qQN9yhWNkODtf
 gvNIcQJibiklRJ3Rsaoa6NYw36IqYjF5ZnLGjfHn80hvZzmaFPb3PoPFXrDRT1HfXQH+rg
 RoKsvL65wIyu2akrgNid2OxG13ll4qE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-WK4SjbLiM1m-umK_Wr13eg-1; Mon, 28 Feb 2022 06:14:16 -0500
X-MC-Unique: WK4SjbLiM1m-umK_Wr13eg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B6D0814600;
 Mon, 28 Feb 2022 11:14:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CD87B6F2;
 Mon, 28 Feb 2022 11:14:07 +0000 (UTC)
Date: Mon, 28 Feb 2022 11:14:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
Message-ID: <YhyufAWVPGSiDSQY@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-7-marcandre.lureau@redhat.com>
 <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
 <8d5b4245-56e7-8384-4104-33d3ab1adf42@redhat.com>
 <CAJ+F1CK5U1agzbDztrWBavmoiAfmwW3AHcWBKRwGh9f0LRan0A@mail.gmail.com>
 <YhySJepNwSuv/zP5@redhat.com>
 <CAFEAcA-MrYMhYDiwvAV8zgtFrbQTR6m5pOkwWuWOtX3fcrdNSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-MrYMhYDiwvAV8zgtFrbQTR6m5pOkwWuWOtX3fcrdNSQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 11:07:19AM +0000, Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 09:13, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > We only support the current major release, and thue previous major
> > release for 2 years overlap. If we consider 11.x releases as major,
> > then 11.3 went out of scope from QEMU's POV in Aug 2020, and thus
> > we don't need to care about this code.
> >
> > More generally though, Solaris isn't even a platform we try to
> > support at all is it ?
> >
> > We've never had any formal testing on it. Have we seen people filing
> > bugs mentioning solaris in the last 5 years ? If QEMU works at all,
> > I suspect it is merely by luck.
> 
> This last came up in June 2020:
> https://lore.kernel.org/qemu-devel/CAEgYsbE7s5hD+5ARj_Xt1D0ALDPDQx7uvocd5zRF6P=EzwxTZQ@mail.gmail.com/
> 
> where somebody pointed out that illumos also doesn't (didn't?)
> support openpty(). So we do have at least one or two people
> who have tried to compile on Solaris and been enthusiastic
> enough to post to the mailing list about it.

Ah yes, and we even updated the comment to say we're keeping this for
Illumos, not for Solaris

  commit 9df8b20d1632d108da316134d4d86a00b4028803
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Mon Jun 29 14:13:24 2020 +0200

    configure / util: Auto-detect the availability of openpty()


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


