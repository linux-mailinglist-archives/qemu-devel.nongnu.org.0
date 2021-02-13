Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E631AD69
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 18:43:27 +0100 (CET)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAyx4-0001Ij-Iw
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 12:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAyvx-0000pT-Qz
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 12:42:17 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAyvw-00021c-8x
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 12:42:17 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MzQXu-1m6OyD2FqC-00vQXI; Sat, 13 Feb 2021 18:42:13 +0100
Subject: Re: [PATCH] linux-user/mmap: Avoid asserts for out of range mremap
 calls
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2e9e378a-6b67-aae8-4531-a74bdcf06086@vivier.eu>
Date: Sat, 13 Feb 2021 18:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ie3D0QSCvAD2WHKYfxyT5dsgg+hKP7XerBcAR7qnKc4yWP1b2Mh
 9KxyvksH41+JfouOQuYRtFfatCoopmtDxpgmnWKKtcm0UCucgna2kd0iad+choqhQ5v7Hdz
 OpBcsolTpFPsGeH02YRJJnjV/toPfv69DBFq0rPk3ltm84D8Q6e+VDntIzxW0Ja0bk7x950
 /+Z+OBJq4C/c2Sda8ipLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9AuBoH0o6Wg=:qEOaEPlGyOYorrZONQMvQq
 hVLsuRLei6omDaxJDthcMkH4ukCi5YNPY+dcw1elqwBOyvQ/xlP7VYw7wUCtl4T/6yUYz3W1m
 ANmmELKp2Tjf0yPflUNzjrFGqoeYBO/R3Xrj6vewWoRNz1jDuQnMuvumdawaq9rWyUtX1EEw8
 RzdYoLboKTrxbfXuPQQBV3PQ0JIEL9BC1qb5Ui0tYNobH1blBv+t1zWWgbr4mJnmSjFQE2HM9
 iNI5io54ZMImDjhgYsMeNVfZav6RA3Lqy59z+XNj2vHHPgIcAhANxQi82Aj4h1g/KDsFbctV9
 SdxXvCUV2M380qWSSQFs019FbqdeVjaB8N9SLdu0gZhHA6cw5vKhOxRSwtYjRKzs4rtxrRk/4
 8sfWvfT9veS3OUr8pGeY8u2gPoYo/lWtPlE7ShDupa2bon8nB//5I8r9eSGg0/hmDihNMJiBW
 k2lF4uy+JQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent



