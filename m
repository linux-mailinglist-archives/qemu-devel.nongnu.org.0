Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD9834070B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:41:15 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMstl-0002yb-V4
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMspb-0007Pl-8F
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMspY-0007EK-DP
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616074611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gK2lOX/+MCNvIrHhMUUxp4dfVhEiXygZYz5W4HBfKp8=;
 b=cJkWu65MZUjLOc+vz2knXsnGQa9LWiXWMk7H0hYL9uySsyk4cHntR/wZGLiw1ZqGLcO/M+
 KYGtG4JEnrFzlWzF1FYDqPavpzNG3qqx6uQlHbWsczIb08v2sq2GEqN6LEvk1RzJgvyDNp
 /4X3Pl4OkbTh4KQrQjfBNdiv6bqPSBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-PKnLwzGgNcKN1WzWocaX0g-1; Thu, 18 Mar 2021 09:36:47 -0400
X-MC-Unique: PKnLwzGgNcKN1WzWocaX0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70FFB911EB;
 Thu, 18 Mar 2021 13:36:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 283D65B4A6;
 Thu, 18 Mar 2021 13:36:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 946F611386A7; Thu, 18 Mar 2021 14:36:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v6 02/10] qapi: Implement deprecated-output=hide for QMP
 command results
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-3-armbru@redhat.com>
Date: Thu, 18 Mar 2021 14:36:43 +0100
In-Reply-To: <20210312153210.2810514-3-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 12 Mar 2021 16:32:02 +0100")
Message-ID: <87pmzwinx0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> This policy suppresses deprecated bits in output, and thus permits
> "testing the future".  Implement it for QMP command results.  Example:
> when QEMU is run with -compat deprecated-output=hide, then
>
>     {"execute": "query-cpus-fast"}
>
> yields
>
>     {"return": [{"thread-id": 9805, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}
>
> instead of
>
>     {"return": [{"arch": "x86", "thread-id": 22436, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}
>
> Note the suppression of deprecated member "arch".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
[...]
> diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
> index ba6f6ac8a7..5c4aa0f64d 100644
> --- a/qapi/qobject-output-visitor.c
> +++ b/qapi/qobject-output-visitor.c
[...]
> @@ -264,3 +275,11 @@ Visitor *qobject_output_visitor_new(QObject **result)
>  
>      return &v->visitor;
>  }
> +
> +Visitor *qobject_output_visitor_new_qmp(QObject **result)
> +{
> +    QObjectOutputVisitor *v = to_qov(qobject_output_visitor_new(result));
> +
> +    v->deprecated_policy = compat_policy.deprecated_output;
> +    return &v->visitor;
> +}

Linking fail when we link qapi/qobject-output-visitor.o (which uses
@compat_policy), but not qapi/qmp-dispatch.o (which defines it).

Fails for me when I configure --disable-system --disable-tools.

Minimally invasive fix: move the function to qmp-dispatch.c.

Same for qobject_input_visitor_new_qmp() in PATCH 09.

[...]


