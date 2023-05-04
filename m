Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A46F58EC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:21:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCOI-0005Yv-Dd; Wed, 03 May 2023 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puCOF-0005YL-Uc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:27 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puCOD-0006p8-SC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pvP1ktDY/JILDLI4mLUyBCgNeMkRZZez8PAk1Mv8Cwc=; b=FzkzTxR5rlmS2GgtZhek6N3OS6
 RZYlt9Axrgbv87LZ+GvDae2/1xj7R5iTZyLMSgpFrPZbaBiSQF7jcQ60TWUBY4GAtd/JXNgxJT/U+
 jLEWdL4cA1p1uvT8PPL6VcflXHkACaHbgpMy7OQhwrw9/a3DwfKk9RfJjr6+/8H4pIYw=;
Message-ID: <49758437-b184-f309-5500-32920056a5ce@rev.ng>
Date: Wed, 3 May 2023 15:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 7/9] target/sparc: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, laurent@vivier.eu, philmd@linaro.org, jiaxun.yang@flygoat.com,
 david@redhat.com, iii@linux.ibm.com, thuth@redhat.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com, jcmvbkbc@gmail.com
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-8-richard.henderson@linaro.org>
Organization: rev.ng
In-Reply-To: <20230502135741.1158035-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 5/2/23 15:57, Richard Henderson wrote:
> Convert away from the old interface with the implicit
> MemOp argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 43 ++++++++++++++++++++++++++--------------
>   1 file changed, 28 insertions(+), 15 deletions(-)
>
Reviewed-by: Anton Johansson <anjo@rev.ng>

