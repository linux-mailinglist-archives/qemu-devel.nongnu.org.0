Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C951BD97
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:59:41 +0200 (CEST)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZCu-0008DI-E0
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmYOK-00010L-3v
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:07:27 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:35546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmYOH-0000QM-36
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651745239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/315jSzMTU8IKFccJcB31Sy9to3XQ2cyeTlrRX+fJU=;
 b=hWJ1xVLvfMS2x/k33LnvaPGv7ifF1s97UxjLO4xpQ0ODm7w8/d+xKyyKhx1YBDpZdZ1Lr5
 iMuGjQnHHiMNN0fCZ6uYRP59aLeBjF8lF88RUaSV4hDcBG1t6TFk+cWOtbTRSop/JL1NQw
 2ONN8BeZ/DOoIOSRA69jiEZ3WmpTpN0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-Yl0PcQdvMlCwfcLQfvyCqQ-1; Thu, 05 May 2022 06:07:16 -0400
X-MC-Unique: Yl0PcQdvMlCwfcLQfvyCqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E282811E75;
 Thu,  5 May 2022 10:07:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6E214C18DF;
 Thu,  5 May 2022 10:07:15 +0000 (UTC)
Date: Thu, 5 May 2022 11:07:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/5] net: slirp: switch to slirp_new
Message-ID: <YnOh0To8iqUfjlnu@redhat.com>
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-4-pbonzini@redhat.com>
 <CAJ+F1CLyTN90uBhc5W8i8i_Vre+FsMU3O-OXUy53kf-4EWxRiQ@mail.gmail.com>
 <CABgObfZaucTwU5vo5JKLabiBEKg7dEPhqYv+vSDvbHS72bDk1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfZaucTwU5vo5JKLabiBEKg7dEPhqYv+vSDvbHS72bDk1A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 10:29:07AM +0200, Paolo Bonzini wrote:
> On Thu, May 5, 2022 at 10:20 AM Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Thu, May 5, 2022 at 1:07 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> Replace slirp_init with slirp_new, so that a more recent cfg.version
> >> can be specified.
> >
> >
> > It was introduced in v4.1.0, but I don't see a minimum libslirp version check.
> 
> In fact 4.3.0 is needed for version 3 of the struct, so the following
> needs to be
> squashed:
> 
> diff --git a/meson.build b/meson.build
> index 11876f5141..c902dfabd3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2638,7 +2638,7 @@ if have_system
>    if slirp_opt in ['enabled', 'auto', 'system']
>      have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
>      slirp = dependency('slirp', kwargs: static_kwargs,
> -                       method: 'pkg-config',
> +                       method: 'pkg-config', version: '>=4.3.0',

Adding a dep on version 4.3.0 is not desirable. Ubuntu 20.04 has
version 4.1.0, and we want to be able to drop slirp submodule
when we drop Ubuntu 18.04 (hopfully in this dev cycle).


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


