Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF952851D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:15:22 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaZE-0003rj-VF
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqaCW-00013k-Rt
 for qemu-devel@nongnu.org; Mon, 16 May 2022 08:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqaCU-00041H-1l
 for qemu-devel@nongnu.org; Mon, 16 May 2022 08:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652705509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKA+vwK4Dsm58IgrNzTRVVNroFFPExHEATOBY2Q/bRU=;
 b=W41UIPoiU78Ggw0w+xhpgX3coxzrYPoFRm1Si258EC0h7XY8r7/zXlTgbOSngO1pPi9n/Q
 myEeZBW3lDcF/ViqEfDP2ZkBf9BK+g0+E8iaIQSp60CkM/ge6OF4A8H121o5baYwhjAyk+
 SeH78BVDfvxF9/npYhFsF9w1lfEeSzQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-eaorQaDPOaS2OqoWQd-WhQ-1; Mon, 16 May 2022 08:51:47 -0400
X-MC-Unique: eaorQaDPOaS2OqoWQd-WhQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a18-20020adffb92000000b0020cff565b91so565442wrr.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 05:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qKA+vwK4Dsm58IgrNzTRVVNroFFPExHEATOBY2Q/bRU=;
 b=RyIBpNmyTrhWPSaOixy9do2V/y0VeoIpTX0yGqMYINPJ9/IBxusiAropOBrZNPTv8e
 PAJXOKv4hCdLh8zFe2NAblMqoFeGgoIHsgaix8p7uL7VmTE2dtAVS7gIT/HMZXm3DF1O
 pLcclkIDZvTprmTUMKLxo3Tf3puZ6SdHqI7XXAWoP3Fi8Bgigy3vxfAIAi5Rma+LzvQ1
 EXSBvBsi0v3C7XbmNdGk9O7PwJPicYyym2x1ZN8ErNkeBztLggyK3/MNJMl0cZq+tByO
 zdtCF39IICZ/wG7KWDF83t7DcD5/dNsR0daEG5bxA0gpYFbIRFALjkgzRggFA8vglQ/X
 l++w==
X-Gm-Message-State: AOAM53345YplikqPvhWVItpKDb0a5MRJte4mcB2mke3R3KJQeWTHzSRD
 uhws3qEbN7RwRRS0Jph+AMk+wxE2gLKN6JOctXG3wwRzSfRCzKZURbvhnTGHhmaHPLFyLFWVfMU
 LvsTuf6uq74j+TLs=
X-Received: by 2002:adf:9d89:0:b0:20d:e97:1640 with SMTP id
 p9-20020adf9d89000000b0020d0e971640mr1777804wre.441.1652705506671; 
 Mon, 16 May 2022 05:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi8RwXIe95UkR5W9JdbMPJQCAjHebFTZCffksJMHviYT6BBq3iVyE/F6HCMTMYPtVxNyEcCw==
X-Received: by 2002:adf:9d89:0:b0:20d:e97:1640 with SMTP id
 p9-20020adf9d89000000b0020d0e971640mr1777776wre.441.1652705506400; 
 Mon, 16 May 2022 05:51:46 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o19-20020adfca13000000b0020c5253d8e1sm11354682wrh.45.2022.05.16.05.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 05:51:45 -0700 (PDT)
Date: Mon, 16 May 2022 13:51:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v13 1/8] meson.build: Fix docker-test-build@alpine when
 including linux/errqueue.h
Message-ID: <YoJI34nIHXMjQDRi@work-vm>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-2-leobras@redhat.com>
 <YoIxzC88w+jQlqoG@work-vm> <YoIyzi1PRYotgOyC@redhat.com>
 <YoI1x7PNtnuAAPr4@work-vm> <YoI3A9lybeUtPM2N@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoI3A9lybeUtPM2N@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, May 16, 2022 at 12:30:15PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Mon, May 16, 2022 at 12:13:16PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Leonardo Bras (leobras@redhat.com) wrote:
> > > > > A build error happens in alpine CI when linux/errqueue.h is included
> > > > > in io/channel-socket.c, due to redefining of 'struct __kernel_timespec':
> > > > 
> > > > OK, looks to be same mechanism as other meson tests.
> > > 
> > > > 
> > > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > 
> > > As of about an hour or so ago, this patch should not be required.
> > > 
> > >   https://gitlab.alpinelinux.org/alpine/aports/-/issues/13813
> > 
> > I'll take it anyway as protection against any other broken build envs.
> 
> Can you update the commit message at least then.

Sure, I've added:

[dgilbert: This has been fixed in Alpine issue 13813 and liburing]

> The root casue trigger for the bug is the OS uses a busybox

I guess you mean musl??

> impl of mkdtemp, which isn't compat with the args liburing
> configure was previously using. I doubt there are many such OS
> around to be honest, as most will use coreutils.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


