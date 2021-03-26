Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78D34AA5A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:44:52 +0100 (CET)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnhj-0001GA-Ov
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPnea-0008E7-4t
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPneT-0002fk-Rf
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616769686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uBYUJ9wS6Z5PVdioNghlLIeDBt9vdqUg9mfPwVmBgEA=;
 b=aNL9o2Oc0aN2vl7B/3xPbBXuenQiskkGYTKbNdB0lVdGUZn3BDI+rnH8zGX5JrwNi/vLIc
 kP5MPCfpR9TPRwRPHYnluRg5kQ05RHzgIAwsm3z6yq2Qqtyt6GBXRWLCb8AveSfsoCF5hR
 PtiDMcx18U4GtUfHTGT2sMJ/ljcqXVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-usJxHKVYOpuSViaKiamR1A-1; Fri, 26 Mar 2021 10:41:24 -0400
X-MC-Unique: usJxHKVYOpuSViaKiamR1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC60FEC1AE;
 Fri, 26 Mar 2021 14:41:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD85A18A79;
 Fri, 26 Mar 2021 14:41:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7235411327E1; Fri, 26 Mar 2021 15:41:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: lukasstraub2@web.de
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
References: <20210315170636.704201-1-zhlcindy@gmail.com>
Date: Fri, 26 Mar 2021 15:41:11 +0100
In-Reply-To: <20210315170636.704201-1-zhlcindy@gmail.com> (Li Zhang's message
 of "Mon, 15 Mar 2021 18:06:35 +0100")
Message-ID: <87sg4ihta0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alexandr.iarygin@profitbricks.com, qemu-devel@nongnu.org,
 Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 Li Zhang <zhlcindy@gmail.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like a bug fix.  Lukas, can you take care of it in time for 6.0?

Li Zhang <zhlcindy@gmail.com> writes:

> From: Li Zhang <li.zhang@cloud.ionos.com>
>
> When executing the QMP commands "chardev-change" to change the
> backend device to socket, it will cause a segment fault because
> it assumes chr->label as non-NULL in function yank_register_instance.
> The function qmp_chardev_change calls chardev_new, which label
> is NULL when creating a new chardev. The label will be passed to
> yank_register_instance which causes a segment fault. The callchain
> is as the following:
>         chardev_new ->
>             qemu_char_open ->
>                 cc->open ->
>                 qmp_chardev_open_socket ->
>                     yank_register_instance
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> ---
>  chardev/char-socket.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index c8bced76b7..26d5172682 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>      }
>  
> -    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
> -        return;
> +    if (chr->label) {
> +        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
> +            return;
> +        }
> +        s->registered_yank = true;
>      }
> -    s->registered_yank = true;
>  
>      /* be isn't opened until we get a connection */
>      *be_opened = false;


