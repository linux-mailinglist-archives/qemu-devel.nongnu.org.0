Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48732B800
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:26:35 +0100 (CET)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRWM-00016g-B0
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHRUG-0008W0-Ro
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHRUD-0001fT-QG
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614777859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfFhhlyVDFG+zt4joPcWBwChaRXUzwt0CxZ4vclHncs=;
 b=HwsC9YdV/B1qRB9re4t7IoBSQ75+fDFr2JIFPzMVQ4+F+/E092BWGXxLO7NhAIX4RbDMJ+
 SOQuUxXkG+530cWQXHbPXH6ttWvRsOg7wy6aRYJObzIkQ2lXZ5VDx9VTL9P7viYhf8rCE/
 hb/xdqGug80mPXk2C9KlyAqvooe8CEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-AwMTf-v7PzaPQcp6PzeTGQ-1; Wed, 03 Mar 2021 08:24:16 -0500
X-MC-Unique: AwMTf-v7PzaPQcp6PzeTGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB42100A8F2
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 13:24:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB0E10023B1;
 Wed,  3 Mar 2021 13:24:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30712113860F; Wed,  3 Mar 2021 14:24:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] chardev: add nodelay option
References: <20210303123235.63171-1-pbonzini@redhat.com>
Date: Wed, 03 Mar 2021 14:24:13 +0100
In-Reply-To: <20210303123235.63171-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 3 Mar 2021 13:32:35 +0100")
Message-ID: <87mtvkjrpe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> The "delay" option was introduced as a way to enable Nagle's algorithm
> with ",nodelay".  Since the short form for boolean options has now been
> deprecated, introduce a more properly named "nodelay" option.  The "delay"
> option remains as an undocumented option.
>
> "delay" and "nodelay" are mutually exclusive.  Because the check is
> done at consumption time, the code also rejects them if one of the
> two is specified via -set.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  chardev/char-socket.c | 13 +++++++++++--
>  gdbstub.c             |  2 +-
>  qemu-options.hx       | 14 +++++++-------
>  3 files changed, 19 insertions(+), 10 deletions(-)

I believe this is
Based-on: <20210226080526.651705-1-pbonzini@redhat.com>

>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 06a37c0cc8..c8bced76b7 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1472,8 +1472,17 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
>      sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
>      qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>  
> -    sock->has_nodelay = qemu_opt_get(opts, "delay");
> -    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
> +    if (qemu_opt_get(opts, "delay") && qemu_opt_get(opts, "nodelay")) {
> +        error_setg(errp, "'delay' and 'nodelay' are mutually exclusive");
> +        return;
> +    }
> +    sock->has_nodelay =
> +        qemu_opt_get(opts, "delay") ||
> +        qemu_opt_get(opts, "nodelay");
> +    sock->nodelay =
> +        !qemu_opt_get_bool(opts, "delay", true) ||
> +        qemu_opt_get_bool(opts, "nodelay", false);
> +
>      /*
>       * We have different default to QMP for 'server', hence
>       * we can't just check for existence of 'server'

$ qemu-system-x86_64 -chardev socket,id=chr0,path=sock,nodelay=on
qemu-system-x86_64: -chardev socket,id=chr0,path=sock,nodelay=on: Invalid parameter 'nodelay'

You forgot to update qemu_chardev_opts:

   diff --git a/chardev/char.c b/chardev/char.c
   index 288efebd12..e6128c046f 100644
   --- a/chardev/char.c
   +++ b/chardev/char.c
   @@ -864,6 +864,9 @@ QemuOptsList qemu_chardev_opts = {
            },{
                .name = "server",
                .type = QEMU_OPT_BOOL,
   +        },{
   +            .name = "nodelay",
   +            .type = QEMU_OPT_BOOL,
            },{
                .name = "delay",
                .type = QEMU_OPT_BOOL,

[...]


