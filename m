Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7A0329CE9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:40:32 +0100 (CET)
Received: from localhost ([::1]:38802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3OB-0006sC-Cd
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH3N3-0006G2-0X
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH3N0-0002iv-Qj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614685157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SAn1+hWkVX6ECO2l2KuGcb/JRxcUJX+DdyaSx2srscA=;
 b=HPpS+uxf59ZLaSh9MxRPHosTj2Ewp3+hR566fWkpz+st3c4Ty9R1vrgVafpSS2/it615+J
 O4aZWJH5+Dp4GJ3IM+00LnZHn3Dw6v/q7G4d1IEnhEWj01Xlj+O8FL5r6VZHG5Qo/nf5E5
 8ybLIij+y503onTExcv73sy0LtRTVvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-r8NJwF_aPPyi6u6XEGy0iA-1; Tue, 02 Mar 2021 06:39:13 -0500
X-MC-Unique: r8NJwF_aPPyi6u6XEGy0iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1345180196C
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 11:39:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B9E1F0;
 Tue,  2 Mar 2021 11:39:12 +0000 (UTC)
Date: Tue, 2 Mar 2021 11:39:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] chardev: add nodelay option
Message-ID: <YD4j3ajydE61gT7N@redhat.com>
References: <20210302110444.39084-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302110444.39084-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 12:04:44PM +0100, Paolo Bonzini wrote:
> The "delay" option was introduced as a way to enable Nagle's algorithm
> with ",nodelay".  Since the short form for boolean options has now been
> deprecated, introduce a more properly named "nodelay" option.  The "delay"
> option remains as an undocumented option.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  chardev/char-socket.c |  9 +++++++--
>  gdbstub.c             |  2 +-
>  qemu-options.hx       | 14 +++++++-------
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 06a37c0cc8..73a7afe5a0 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1472,8 +1472,13 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
>      sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
>      qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>  
> -    sock->has_nodelay = qemu_opt_get(opts, "delay");
> -    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
> +    sock->has_nodelay =
> +        qemu_opt_get(opts, "delay") ||
> +        qemu_opt_get(opts, "nodelay");
> +    sock->nodelay =
> +        !qemu_opt_get_bool(opts, "delay", true) ||
> +        qemu_opt_get_bool(opts, "nodelay", false);

We should raise an explicit error if both options are present,
otherwise you get into a debate about prioritization with nonsense
such as

   -chardev socket,.....,delay=on,nodelay=on


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


