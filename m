Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991B1871D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:06:42 +0100 (CET)
Received: from localhost ([::1]:45268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDu8P-0003QT-Js
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jDtdG-0004q7-Jt
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jDtdF-0003yO-I9
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:34:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:39448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jDtdF-0003nR-Ca
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584380068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKoRC0FoWda/aLff2z5S2mOd3qHa6tcIlZ0wW+dCcTA=;
 b=L0q2PuGQfhCKfTCabkF8fBk5xuAEi8LcmXRyQgsLX6/PnhceycvFC7VtjEFrc4LN1g/1ih
 cuImyUNQKcEgf1gx/bhX9rV/UCc508q213aDMSHpSf7nGBBlu7GM88N2On0qvOFRdEq1Up
 B59v/f60F2bmnQNix4zFTNOsZI67NZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-HHgk4NnGObCyLYqUJ6q3rQ-1; Mon, 16 Mar 2020 13:34:09 -0400
X-MC-Unique: HHgk4NnGObCyLYqUJ6q3rQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250611D9D5E;
 Mon, 16 Mar 2020 17:18:57 +0000 (UTC)
Received: from [10.3.118.63] (ovpn-118-63.phx2.redhat.com [10.3.118.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF97393537;
 Mon, 16 Mar 2020 17:18:56 +0000 (UTC)
Subject: Re: [PATCH v3 06/34] tests/test-qmp-cmds: Check responses more
 thoroughly
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-7-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2cc67b3e-49ee-e949-e1c6-4fe1d87ecc59@redhat.com>
Date: Mon, 16 Mar 2020 12:18:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200315144653.22660-7-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/20 9:46 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/test-qmp-cmds.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 

> @@ -163,9 +164,17 @@ static QObject *do_qmp_dispatch(QDict *req, bool allow_oob)
>   static void do_qmp_dispatch_error(QDict *req, bool allow_oob, ErrorClass cls)
>   {
>       QDict *resp;
> +    QDict *error;
>   
>       resp = qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
> -    g_assert(resp && qdict_haskey(resp, "error"));
> +    g_assert(resp);
> +    error = qdict_get_qdict(resp, "error");
> +    g_assert(error);
> +    g_assert_cmpstr(qdict_get_try_str(error, "class"),
> +                    ==, QapiErrorClass_str(cls));

Yep, this answers my question from 5/34.

> +    g_assert(qdict_get_try_str(error, "desc"));
> +    g_assert(qdict_size(error) == 2);
> +    g_assert(qdict_size(resp) == 1);
>   
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


