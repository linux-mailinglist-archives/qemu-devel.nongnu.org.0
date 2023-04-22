Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF7A6EB8B9
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 13:04:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqB10-0000xP-Ii; Sat, 22 Apr 2023 07:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>)
 id 1pqB0q-0000u9-6I; Sat, 22 Apr 2023 07:02:43 -0400
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>)
 id 1pqB0k-0005r1-Ks; Sat, 22 Apr 2023 07:02:36 -0400
Date: Sat, 22 Apr 2023 13:02:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682161346; bh=8rWexShuHXdaF1p3bA8iddt2kxDRA32NDe6W8mhrUtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+lFkSJI0Ifq9FbrQeILwtzYEnk5SggWKDmhLu9fiGQLMDlXlKemRHg4JmP+5RqLp
 a10tUDLJBL1UAXkkUdP99gG+llBoeBM42g9Sw5aX9aREfgAwcIaau0ooHh9N5mQWbs
 sjcc0HoPW2tiO+BdgNDLSrd6/zkHW2159jpTCiGM=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/2] tests/tcg/multiarch: Make the system memory test
 work on big-endian
Message-ID: <d3aa2548-cf1f-4cd0-8be8-80d376981969@t-8ch.de>
References: <20230422005808.1773015-1-iii@linux.ibm.com>
 <20230422005808.1773015-2-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422005808.1773015-2-iii@linux.ibm.com>
Received-SPF: pass client-ip=2a01:4f8:c010:41de::1;
 envelope-from=thomas@t-8ch.de; helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023-04-22 02:58:07+0200, Ilya Leoshkevich wrote:
> Make sure values are stored in memory as little-endian regardless of
> the host endianness.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/multiarch/system/memory.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
> index 214f7d4f54b..8ef6666b440 100644
> --- a/tests/tcg/multiarch/system/memory.c
> +++ b/tests/tcg/multiarch/system/memory.c
> @@ -121,6 +121,9 @@ static void init_test_data_u16(int offset)
>      for (i = 0; i < max; i++) {
>          uint8_t low = count++, high = count++;
>          word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +        word = __builtin_bswap16(word);
> +#endif

These looks like a usecase for cpu_to_le16() and friends.

>          *ptr++ = word;
>          pdot(i);
>      }
> @@ -142,6 +145,9 @@ static void init_test_data_u32(int offset)
>          uint8_t b4 = count++, b3 = count++;
>          uint8_t b2 = count++, b1 = count++;
>          word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) | b4;
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +        word = __builtin_bswap32(word);
> +#endif
>          *ptr++ = word;
>          pdot(i);
>      }
> [..]

