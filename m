Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1B6775DC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:56:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrfv-0003wI-73; Mon, 23 Jan 2023 02:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJrfp-0003uQ-Du
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJrfn-0004XX-Cj
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674460521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZbLIvdq+jFGla8r5E9rjvW/zCpYemsZXz/7OZ2n4Yc=;
 b=SLSyGZLSrWJeVKcuHwaO14RfgWRQmq3/d6T0URw62C37x9dwY3OWUWQsxvsZR9svkHhnpQ
 3FdqSoqSDuOkVmA6qTBbDi+pTOjzJ8z/O8jW+shc41nc/zQrfhApAm+fEQCNelrlWt+sei
 ZRu+2BZ38sn/S51JI30xdeZqT6gb5ns=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-eEK7SRhfN9CkCk-geuHlYg-1; Mon, 23 Jan 2023 02:55:20 -0500
X-MC-Unique: eEK7SRhfN9CkCk-geuHlYg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bm30-20020a05620a199e00b007090f3c5ec0so6629166qkb.21
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dZbLIvdq+jFGla8r5E9rjvW/zCpYemsZXz/7OZ2n4Yc=;
 b=KkzZcStbC93yLniFGUgz4TlMowTxEVUGnzFT7nKzocnKpyvH3RhkLs2Jd5ESVfgBcE
 hitxPtsd2BR7mZ7F9HRsQ2RrMDqcveBqiIWAfnh6XvW7IpO73XMoxDUbiFz62clcpBhW
 B5nUiYlQWPyvQwP0gmswtpBp2AM5ycqvBPiEOHl/ZsLWQIurwuhCiw+IMPkitKdNuz+X
 hEVxZLvXw5He53tjMwosVcv5ynnjliC4YnJiDykTdBw4/XKbjzdlVrCR6qSiqQMeyBmD
 NK2FqkT5WzGu2O3gpUWZSjzrbk2H9NAKDFaRJyP9kTaIoUUzsLQbTY+F88iGDWjb9/Vk
 zjIQ==
X-Gm-Message-State: AFqh2krDOeJwAnQ+qNZkYiNDm8SYdrVm+mSGBXoqiR48a5PuLhgHVeNC
 Q6C64gBTAIdaqAJMqaNKiihPRsxjBcO/L9F8hwFY/UGKyDeusN9CuKR7jvZGKtx68R+aCQvewgX
 mmcsyq3w9v5epkOc=
X-Received: by 2002:ac8:6743:0:b0:3b6:3995:54f0 with SMTP id
 n3-20020ac86743000000b003b6399554f0mr32710248qtp.54.1674460519695; 
 Sun, 22 Jan 2023 23:55:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgfOvzwnT28QL6ZV6OMqNPyjFbt//3DRhIVNB8Sw/tRIlbQ8m49jSBiXhoy0XI3s7IaapLpQ==
X-Received: by 2002:ac8:6743:0:b0:3b6:3995:54f0 with SMTP id
 n3-20020ac86743000000b003b6399554f0mr32710231qtp.54.1674460519421; 
 Sun, 22 Jan 2023 23:55:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-90.web.vodafone.de.
 [109.43.178.90]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac85154000000b003b69b37e036sm4713786qtn.81.2023.01.22.23.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:55:18 -0800 (PST)
Message-ID: <77fcbf0a-0f9a-d3bc-c1cf-0ec3e21399c9@redhat.com>
Date: Mon, 23 Jan 2023 08:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230120194435.29796-1-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230120194435.29796-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/01/2023 20.44, Fabiano Rosas wrote:
> These leaks can be avoided:
> 
>   759 bytes in 61 blocks are still reachable in loss record 56 of 60
>      at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>      by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>      by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
>      by 0x12083E: qtest_get_machines (libqtest.c:1323)
>      by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>      by 0x11556C: main (test-hmp.c:160)
> 
>   992 bytes in 1 blocks are still reachable in loss record 57 of 60
>      at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>      by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>      by 0x120725: qtest_get_machines (libqtest.c:1313)
>      by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>      by 0x11556C: main (test-hmp.c:160)
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/libqtest.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 6b2216cb20..65abac5029 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1285,6 +1285,18 @@ struct MachInfo {
>       char *alias;
>   };
>   
> +static void qtest_free_machine_info(gpointer data)
> +{
> +    struct MachInfo *machines = data;
> +    int i;
> +
> +    for (i = 0; machines[i].name != NULL; i++) {
> +        g_free((void *)machines[i].name); > +        g_free((void *)machines[i].alias);

I'd suggest setting .name and .alias to NULL after freeing them, to avoid 
that danling pointers are left behind.

> +    }
> +    g_free(machines);
> +}
> +
>   /*
>    * Returns an array with pointers to the available machine names.
>    * The terminating entry has the name set to NULL.
> @@ -1336,6 +1348,8 @@ static struct MachInfo *qtest_get_machines(void)
>       qobject_unref(response);
>   
>       memset(&machines[idx], 0, sizeof(struct MachInfo)); /* Terminating entry */
> +    g_test_queue_destroy(qtest_free_machine_info, machines);

So this frees the machines structure...

>       return machines;

... but here it gets returned, too? ... that looks wrong. Did you maybe 
rather want to free it at the end of qtest_cb_for_every_machine() and 
qtest_has_machine ?

  Thomas

>   }
>   


