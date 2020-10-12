Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AB28B40D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 13:47:29 +0200 (CEST)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRwIa-0001v9-9v
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 07:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kRwFn-0000Ow-Hm
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 07:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kRwFl-00089W-7B
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 07:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602503072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8Tykc6KsUxdLq8UdeSSUOuM12RlEJWbwGvm4L5gU1k=;
 b=MSw0Ak/RxxVvE5OM2XUvL5hULAfSEK6KkceKBltOLAkRwJ/4+6IR1+MNx6XkxIiYpw2xgM
 NTSSdbYR/ZEng/mfzw/I4vlld1fwn3Xh3OhfNwf/cfBb2wqOEm76cm5SF3GU3y74nCaabR
 cS81+rvYcVJ8iKqPYI2sDjSzGfLebFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-N-fpAbTTMD2WeX_iMHI-Pw-1; Mon, 12 Oct 2020 07:44:30 -0400
X-MC-Unique: N-fpAbTTMD2WeX_iMHI-Pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C371084C80;
 Mon, 12 Oct 2020 11:44:29 +0000 (UTC)
Received: from [10.3.112.62] (ovpn-112-62.phx2.redhat.com [10.3.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAB755760;
 Mon, 12 Oct 2020 11:44:28 +0000 (UTC)
Subject: Re: [PATCH v4 2/7] test-keyval: Demonstrate misparse of ',' with
 implied key
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201011073505.1185335-1-armbru@redhat.com>
 <20201011073505.1185335-3-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <eca63857-e2e4-4df7-db44-2eeefa9c2dc4@redhat.com>
Date: Mon, 12 Oct 2020 06:44:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201011073505.1185335-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 2:35 AM, Markus Armbruster wrote:
> Add a test for "val,,ue" with implied key.  Documentation says this
> should parse as implied key with value "val", then fail.  The code
> parses it as implied key with value "val,ue", then succeeds.  The next
> commit will fix it.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/test-keyval.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index e331a84149..f02bdf7029 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -182,6 +182,13 @@ static void test_keyval_parse(void)
>       error_free_or_abort(&err);
>       g_assert(!qdict);
>   
> +    /* Implied key's value can't have comma (qemu_opts_parse(): it can) */
> +    /* BUG: it can */
> +    qdict = keyval_parse("val,,ue", "implied", &error_abort);
> +    g_assert_cmpuint(qdict_size(qdict), ==, 1);
> +    g_assert_cmpstr(qdict_get_try_str(qdict, "implied"), ==, "val,ue");
> +    qobject_unref(qdict);
> +
>       /* Empty key is not an implied key */
>       qdict = keyval_parse("=val", "implied", &err);
>       error_free_or_abort(&err);
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


