Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05D031AD43
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:51:57 +0100 (CET)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAy9E-0000JW-PG
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAy7x-0008Go-FP
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:50:37 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:32927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAy7u-0003cv-NC
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:50:37 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDgtl-1l486i1rcd-00ArEF; Sat, 13 Feb 2021 17:50:31 +0100
Subject: Re: [PATCH] linux-user/mmap: Avoid asserts for out of range mremap
 calls
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e557c19b-c2a5-bb07-a700-ff7fc1de49d6@vivier.eu>
Date: Sat, 13 Feb 2021 17:50:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RCt5ClYvL4yRvGRwqjSTe/EycvpusLg1zXUw2L3xCiQmURryURt
 arVUuAgYd4Cpzh4JvddedjSmJyeXYrlQxuebB9JaVWQZAuLPPPOK+J1FUBic5WfsUpN+00e
 PxhZ5KbCSqgP8J7NJAr3mfoNJjcyCS+bpIpHfS+oSQYrisQp9ZRRbPFvbFAvwrcYBvPnLPS
 VkZljhTHNxV7LrayElBoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+9kbnysX1HA=:uWfL1KxWcUBRXTO4FQEexd
 xoZQCnrBMXDnCx5QnBNFksJ0C2jFUrO2hMB4w8YeWaRX2ZJuZeCmftrGXJPScIDDGB+UL3RMH
 gAussv0vxYQag4HDVCTlcGBNsJf56aj6Oplz8IgJPhgFNbGwJRom3/ePD/0rB9QJlHJXeFmNM
 QTJqHOrm9Wdy8n1LVfgAJ4CHunnimPvnF3bWV3QS457SO9RS0qGzQfZ3mMSqcnaGqxrD2LI8t
 NzIlrSN1tJ9GiS9GfqDVEcS1WqjcDZ7rf/n+TBhlJCZswjm1ry6B+cP81dVqufhl4lWXF8UwQ
 4//wKneg9h4hydHx7f7IVzgreUA8naOZzeJIIauBfddRZLNY1D9S9K61U4QvaAtTTZRad+a+g
 vDuhW6qCvz8ch82pA421GasgUOjDrL74nV4L/nAqJZJz4mwnCKgQdbYLasqumnM/9BBLjVb4e
 pyUgTHHShA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/01/2021 à 18:42, Richard Purdie a écrit :
> If mremap() is called without the MREMAP_MAYMOVE flag with a start address
> just before the end of memory (reserved_va) where new_size would exceed 
> it (and GUEST_ADDR_MAX), the assert(end - 1 <= GUEST_ADDR_MAX) in 
> page_set_flags() would trigger.
> 
> Add an extra guard to the guest_range_valid() checks to prevent this and
> avoid asserting binaries when reserved_va is set.
> 
> This meant a bug I was seeing locally now gives the same behaviour 
> regardless of whether reserved_va is set or not.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> 
> Index: qemu-5.2.0/linux-user/mmap.c
> ===================================================================
> --- qemu-5.2.0.orig/linux-user/mmap.c
> +++ qemu-5.2.0/linux-user/mmap.c
> @@ -727,7 +727,9 @@ abi_long target_mremap(abi_ulong old_add
>  
>      if (!guest_range_valid(old_addr, old_size) ||
>          ((flags & MREMAP_FIXED) &&
> -         !guest_range_valid(new_addr, new_size))) {
> +         !guest_range_valid(new_addr, new_size)) ||
> +        ((flags & MREMAP_MAYMOVE) == 0 &&
> +         !guest_range_valid(old_addr, new_size))) {
>          errno = ENOMEM;
>          return -1;
>      }
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

