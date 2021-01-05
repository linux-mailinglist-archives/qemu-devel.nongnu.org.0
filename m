Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0A2EA7E0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:49:43 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwiyD-0005l0-TF
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kwivm-0004yW-CK
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kwivi-0001X8-9B
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609840024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNlWjD1Myo3kNfag1awpy32y7yVD77Njl+kNCjHI02w=;
 b=i4P00NPDJH+q4BKBa09lZo/6/NPHlqk5NQDxt4nBbgTqB3O7cOPwMl0Gh8Bi+CG61lOM8V
 0pD+2EPAaSHfXeD5ADlcrhiwLsD2a8c9t1U6mAoMdxY/1HCKu7CIeeHqpnk5sW8K2sR5Ul
 7gILKErLLpD0+NmKTJRDDohrP9ozHZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-fRBEjUWwM26ntjruqEzKjg-1; Tue, 05 Jan 2021 04:47:01 -0500
X-MC-Unique: fRBEjUWwM26ntjruqEzKjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB532801817;
 Tue,  5 Jan 2021 09:46:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A583F669FC;
 Tue,  5 Jan 2021 09:46:56 +0000 (UTC)
Subject: Re: [PATCH] qtest/libqtest.c: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210104141025.496193-1-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b0426ff0-f33b-dd64-66e5-4937bc3a1be1@redhat.com>
Date: Tue, 5 Jan 2021 10:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210104141025.496193-1-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, kuhn.chenqun@huawei.com,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/2021 15.10, Gan Qixin wrote:
> When the length of mname is less than 5, memcpy ("xenfv", mname, 5) will cause
> heap buffer overflow. Therefore, use strcmp to avoid this problem.
> 
> The asan showed stack:
> 
> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60200000f2f4 at
> pc 0x7f65d8cc2225 bp 0x7ffe93cc5a60 sp 0x7ffe93cc5208 READ of size 5 at
> 0x60200000f2f4 thread T0
>      #0 0x7f65d8cc2224 in memcmp (/lib64/libasan.so.5+0xdf224)
>      #1 0x5632c20be95b in qtest_cb_for_every_machine tests/qtest/libqtest.c:1282
>      #2 0x5632c20b7995 in main tests/qtest/test-hmp.c:160
>      #3 0x7f65d88fed42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
>      #4 0x5632c20b72cd in _start (build/tests/qtest/test-hmp+0x542cd)
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/libqtest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index e49f3a1e45..e8179a3509 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1281,7 +1281,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>           g_assert(qstr);
>           mname = qstring_get_str(qstr);
>           /* Ignore machines that cannot be used for qtests */
> -        if (!memcmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
> +        if (!strcmp("xenfv", mname) || g_str_equal("xenpv", mname)) {

Using strcmp() is likely wrong here, since we're talking about strings like 
"xenfv-4.2" here ... so I guess strncmp(..., 5) would be the right way to go?

  Thomas


