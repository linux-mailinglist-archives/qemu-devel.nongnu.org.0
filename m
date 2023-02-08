Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5F68EF5C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:54:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjy2-0003UP-QT; Wed, 08 Feb 2023 07:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPjy0-0003U0-Ef
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:54:28 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPjxy-0005Ar-SG
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LbpphKUUiazgZY0zcEaBaoTxEOzZ+SteGccS5t2ZMXQ=; b=AECsrfe29x6iFkhxLljnb7CAbB
 6JNs1eFVjOcnu9Zcm4CFHjtN4kICfZ9qf/27egRLruG8doMiBPKMBDvOoLtZ4M+DEDQDb7HLt1v0+
 A5j1CVfi7nFhjSWnEAqKcUALnEY5dv5mnjzgmGxZpbl5CLUgNLV07nrs5lY5GWLSieZs=;
Message-ID: <591bba23-012c-84d4-b9b7-69f355da9a93@rev.ng>
Date: Wed, 8 Feb 2023 13:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-11-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230131225647.25274-11-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/31/23 23:56, Taylor Simpson wrote:
> +HEX_TESTS += hvx_histogram
>   
>   HEX_TESTS += test_abs
>   HEX_TESTS += test_bitcnt
> @@ -78,3 +82,10 @@ TESTS += $(HEX_TESTS)
>   usr: usr.c
>   	$(CC) $(CFLAGS) -mv67t -O2 -Wno-inline-asm -Wno-expansion-to-defined $< -o $@ $(LDFLAGS)
>   
> +scatter_gather: CFLAGS += -mhvx
> +vector_add_int: CFLAGS += -mhvx -fvectorize
> +hvx_misc: CFLAGS += -mhvx
> +hvx_histogram: CFLAGS += -mhvx -Wno-gnu-folding-constant
> +
> +hvx_histogram: hvx_histogram.c hvx_histogram_row.S
> +	$(CC) $(CFLAGS) $(CROSS_CC_GUEST_CFLAGS) $^ -o $@

I am not able to run check-tcg locally, hvx_histogram fails due to 
missing ld-musl-hexagon

     TEST    hvx_histogram on hexagon
   qemu-hexagon: Could not open '/lib/ld-musl-hexagon.so.1': No such 
file or directory

-- 
Anton Johansson,
rev.ng Labs Srl.


