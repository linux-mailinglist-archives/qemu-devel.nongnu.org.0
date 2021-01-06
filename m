Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D52EBD2C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 12:31:08 +0100 (CET)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx71v-0002T9-Qk
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 06:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx70Z-0001uf-JI
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx70W-0001pB-JB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609932579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4yDzA9+oFweVTl7rciV/WcdxERstVRrirWNnHRQErM=;
 b=Z/oh98czXJreVmrLY1taLXxqzxE84mupj1JDw1h2wO1aOJjKTgThtoiG+ap/kpLx1bzIOv
 KLQDZHplioxJz9UzSp82NkIMvms4W39UXQTTGodC0684sP/hAokky8LsAeMH6UJxPuJRON
 +/952GzkU1P5o1OQOFQpWDH7/e/q1G0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-uwDOeKvmM7aZvxCmLeDiMg-1; Wed, 06 Jan 2021 06:29:36 -0500
X-MC-Unique: uwDOeKvmM7aZvxCmLeDiMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B955C18C89CF;
 Wed,  6 Jan 2021 11:29:34 +0000 (UTC)
Received: from [10.36.113.101] (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCE9669FC;
 Wed,  6 Jan 2021 11:29:32 +0000 (UTC)
Subject: Re: [PATCH v2] qtest/libqtest: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210106050625.518041-1-ganqixin@huawei.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <de10267c-d94e-138a-97a6-323aa97eef5c@redhat.com>
Date: Wed, 6 Jan 2021 12:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106050625.518041-1-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kuhn.chenqun@huawei.com, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2021 06:06, Gan Qixin wrote:
> When the length of mname is less than 5, memcpy("xenfv", mname, 5) will cause
> heap buffer overflow. Therefore, use strncmp to avoid this problem.
> 
> The asan showed stack:
> 
> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60200000f2f4 at
> pc 0x7f65d8cc2225 bp 0x7ffe93cc5a60 sp 0x7ffe93cc5208 READ of size 5 at
> 0x60200000f2f4 thread T0
>     #0 0x7f65d8cc2224 in memcmp (/lib64/libasan.so.5+0xdf224)
>     #1 0x5632c20be95b in qtest_cb_for_every_machine tests/qtest/libqtest.c:1282
>     #2 0x5632c20b7995 in main tests/qtest/test-hmp.c:160
>     #3 0x7f65d88fed42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
>     #4 0x5632c20b72cd in _start (build/tests/qtest/test-hmp+0x542cd)
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> 
> v2:
> Changes suggested by Thomas Huth:
>     Replace memcmp(..., 5) with strncmp(..., 5).
> ---
>  tests/qtest/libqtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index e49f3a1e45..e93424ffdd 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1281,7 +1281,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>          g_assert(qstr);
>          mname = qstring_get_str(qstr);
>          /* Ignore machines that cannot be used for qtests */
> -        if (!memcmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
> +        if (!strncmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
>              continue;
>          }
>          if (!skip_old_versioned || !qtest_is_old_versioned_machine(mname)) {
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

Problem seem to have been introduced originally by
9a709f06c870 ("piix: fix xenfv regression, add compat machine xenfv-4.2")

Moved here by:
51b3ca975929 ("tests/qtest: Unify the test for the xenfv and xenpv machines"

Thanks,
Laurent


