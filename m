Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911963BBDA6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:45:33 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Oui-0002lW-81
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0OrG-0002y0-Q0
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0OrF-00027u-81
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625492516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDFZv1Tj25fJgmMf/heVEGEg9R4KxJ/Y+FQCw2gpecA=;
 b=VTzsDUAcU8jtqkz7TgLTZgGBFX0Tf1Xv61bEdslrM16U9HnOPB1/EKYThZgisQhYwpdMqY
 WDQO/VXl0SnmUpl8iZ3BDao2/3Pvv9XoETamaHnBr1JXHc95YuUf4yp/KGUzOTxyP/n2jx
 fdt1VB4O+aKoWocWTL5iwNHAkhT/rA8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-ZrSJW_tJOAWlg8MKJwxOwQ-1; Mon, 05 Jul 2021 09:41:55 -0400
X-MC-Unique: ZrSJW_tJOAWlg8MKJwxOwQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j1-20020adfb3010000b02901232ed22e14so6230610wrd.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yDFZv1Tj25fJgmMf/heVEGEg9R4KxJ/Y+FQCw2gpecA=;
 b=M3RJjJFE5ySzJAU8pFTCPk15eAovWmjdWkuaAGHf/uSoG+Akh3lvN1nQOa1Wcj1lKw
 m8/N9M6VhVayICf7VnpNTq3yrWYnZSyso7++AQF6AI9tyKUOfcpW1gBITpshKK+Kehsx
 0dcLbFnu6TGhToJi2M1MV6mG+BEJlNS4cPbs2DfUMG9t2XqU4hS65VxnYEnSaQNoFfLj
 S9zMK5r7dhQwGDFnhlk513xBxOxGaND7U41HMA3mE7lYhdCLRDlHXQRvcYqtPKLPafl0
 uHOqBPpC5YP5gchAr1nwRu8+JpbEcqANk00uCH5L8MlUd6Cy5J4oI4W3SglQAj7es1lX
 tE2g==
X-Gm-Message-State: AOAM531V/B5jOco7I6uZna39lXH86rcGYhBgMvlkOLWYDYeroii5qfwv
 03hWnckJ/kdbY08LR5TjXSj6+FoukavGIJhH9D7U/c1+rW5qWw7XFYxX6HK/JJWvzE3JzQCsp8e
 B1SVoQ/+LNliO4JE=
X-Received: by 2002:a1c:1dc6:: with SMTP id
 d189mr15180047wmd.154.1625492514246; 
 Mon, 05 Jul 2021 06:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3WFpKT//4MXm/JWb1uomPUPlUx2qFEe/J3wOLxFWQx5AgmBEO+SwbkNL79HuxpC2ySXUz9Q==
X-Received: by 2002:a1c:1dc6:: with SMTP id
 d189mr15180019wmd.154.1625492514037; 
 Mon, 05 Jul 2021 06:41:54 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id x187sm3521826wmb.47.2021.07.05.06.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 06:41:53 -0700 (PDT)
To: "Wang, Wei W" <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
Date: Mon, 5 Jul 2021 15:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <562b42cbd5674853af21be3297fbaada@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.07.21 04:53, Wang, Wei W wrote:
> On Friday, July 2, 2021 3:07 PM, David Hildenbrand wrote:
>> On 02.07.21 04:48, Wang, Wei W wrote:
>>> On Thursday, July 1, 2021 10:22 PM, David Hildenbrand wrote:
>>>> On 01.07.21 14:51, Peter Xu wrote:
>>
>> I think that clearly shows the issue.
>>
>> My theory I did not verify yet: Assume we have 1GB chunks in the clear bmap.
>> Assume the VM reports all pages within a 1GB chunk as free (easy with a fresh
>> VM). While processing hints, we will clear the bits from the dirty bmap in the
>> RAMBlock. As we will never migrate any page of that 1GB chunk, we will not
>> actually clear the dirty bitmap of the memory region. When re-syncing, we will
>> set all bits bits in the dirty bmap again from the dirty bitmap in the memory
>> region. Thus, many of our hints end up being mostly ignored. The smaller the
>> clear bmap chunk, the more extreme the issue.
> 
> OK, that looks possible. We need to clear the related bits from the memory region
> bitmap before skipping the free pages. Could you try with below patch:

I did a quick test (with the memhog example) and it seems like it mostly 
works. However, we're now doing the bitmap clearing from another, racing 
with the migration thread. Especially:

1. Racing with clear_bmap_set() via cpu_physical_memory_sync_dirty_bitmap()
2. Racing with migration_bitmap_clear_dirty()

So that might need some thought, if I'm not wrong.

The simplest approach would be removing/freeing the clear_bmap via 
PRECOPY_NOTIFY_SETUP(), similar to 
precopy_enable_free_page_optimization() we had before. Of course, this 
will skip the clear_bmap optimization.

-- 
Thanks,

David / dhildenb


