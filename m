Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABFC5F9DF9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 13:52:44 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohrKs-0003AV-Qr
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 07:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ohrIA-0001S2-0t
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 07:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ohrI7-0003HO-2x
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 07:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665402590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKpANNFDmGg0Ni9qpwDAtLylPLlBd4oQwnluqxbh0L4=;
 b=CDW51pqWuupyMFywMxlUzyumhuA1PMwxpbXORSD0ABd0hRTrKALtZhvuKrBwrtksVcWJ22
 o8i+fAwJmB5ZRIebmnnoDmZP+0eEhp3Nttg7doJGm/bipXlRd5TUACkv6pOcKgR5f7gdH5
 nr0lmCw6No1Ke2604+wY3e3ItHkcEGg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-LKhgOJpnOMe5PLjpgqvOMQ-1; Mon, 10 Oct 2022 07:49:49 -0400
X-MC-Unique: LKhgOJpnOMe5PLjpgqvOMQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so2636513wrg.16
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 04:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKpANNFDmGg0Ni9qpwDAtLylPLlBd4oQwnluqxbh0L4=;
 b=v6jylImq0VMWB6TLSXNKhsCLd8H5gcoUaBOuBTOiWNO+SWdm85WOB4kWO9ejZ7whgJ
 uzOeYXWhyOPSz/o39mR8zhW5rgYFvsCQkxVQQ1EB35QRFAidL+m6LGqtQQBE8Rcew3KW
 LWQazJBGQtJKSPFiZBceW4xdb/kClL8TWBlpOzpJ8OXYX9Q1Qu1E4LBFeU7BpR+eZhDQ
 DdGtTm09eWTwwYFy/oWJltCbGsP0r0ycvMrlhNRCM8fyL/2El9pUzbrnO84CQl23mIcc
 9ICJtB7a3PA39Ip2yIVNbo3uKSjg8+dUYvkLT/MMaaTtQM3AeXqWj6w+Cl3oQdNhCYq7
 C7dw==
X-Gm-Message-State: ACrzQf11iwOpDMdQzBcqnFtmBvm20MfQ/be5nkZENZAmmI184qhpKHvk
 Sh8QetTc8twF6zvEWYGhgATw9AYKFDXu18TabbbESSdZhgPdI3p/K8kZVDeAjPl03mRQPN9CEgN
 zB/L+vppc+Jju+Ik=
X-Received: by 2002:a05:600c:1e88:b0:3c3:ecf:ce3e with SMTP id
 be8-20020a05600c1e8800b003c30ecfce3emr11133172wmb.15.1665402588264; 
 Mon, 10 Oct 2022 04:49:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YzlALb88CqAihmqFhAFr3qxXEtDmgfWLAae+ZMuhkV/UgzpJzLdymIrKs+YXZHtMcbvBWZA==
X-Received: by 2002:a05:600c:1e88:b0:3c3:ecf:ce3e with SMTP id
 be8-20020a05600c1e8800b003c30ecfce3emr11133127wmb.15.1665402587922; 
 Mon, 10 Oct 2022 04:49:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:e600:3a4a:f000:b085:4839?
 (p200300cbc704e6003a4af000b0854839.dip0.t-ipconnect.de.
 [2003:cb:c704:e600:3a4a:f000:b085:4839])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1cf718000000b003a6125562e1sm9643031wmh.46.2022.10.10.04.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 04:49:47 -0700 (PDT)
Message-ID: <bdc5092b-49e1-f3d8-e08a-71f2fa8c82d3@redhat.com>
Date: Mon, 10 Oct 2022 13:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 08/13] numa: use QLIST_FOREACH_SAFE() for RAM block
 notifiers
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Xu <peterx@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-9-stefanha@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221006213507.645402-9-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.007, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.10.22 23:35, Stefan Hajnoczi wrote:
> Make list traversal work when a callback removes a notifier
> mid-traversal. This is a cleanup to prevent bugs in the future.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/core/numa.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 31e6fe1caa..ea24a5fa8c 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -857,8 +857,9 @@ void ram_block_notifier_remove(RAMBlockNotifier *n)
>   void ram_block_notify_add(void *host, size_t size, size_t max_size)
>   {
>       RAMBlockNotifier *notifier;
> +    RAMBlockNotifier *next;
>   
> -    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
> +    QLIST_FOREACH_SAFE(notifier, &ram_list.ramblock_notifiers, next, next) {
>           if (notifier->ram_block_added) {
>               notifier->ram_block_added(notifier, host, size, max_size);
>           }
> @@ -868,8 +869,9 @@ void ram_block_notify_add(void *host, size_t size, size_t max_size)
>   void ram_block_notify_remove(void *host, size_t size, size_t max_size)
>   {
>       RAMBlockNotifier *notifier;
> +    RAMBlockNotifier *next;
>   
> -    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
> +    QLIST_FOREACH_SAFE(notifier, &ram_list.ramblock_notifiers, next, next) {
>           if (notifier->ram_block_removed) {
>               notifier->ram_block_removed(notifier, host, size, max_size);
>           }
> @@ -879,8 +881,9 @@ void ram_block_notify_remove(void *host, size_t size, size_t max_size)
>   void ram_block_notify_resize(void *host, size_t old_size, size_t new_size)
>   {
>       RAMBlockNotifier *notifier;
> +    RAMBlockNotifier *next;
>   
> -    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
> +    QLIST_FOREACH_SAFE(notifier, &ram_list.ramblock_notifiers, next, next) {
>           if (notifier->ram_block_resized) {
>               notifier->ram_block_resized(notifier, host, old_size, new_size);
>           }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


