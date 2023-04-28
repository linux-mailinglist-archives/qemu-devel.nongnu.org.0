Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2B6F1C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:26:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psQus-0004PT-Pl; Fri, 28 Apr 2023 12:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1psQum-0004MZ-P7
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:25:44 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1psQuk-0001Fu-Mb
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h5+f9N77z8PQTo/3LAWem5hTr2PSiJrEF7f8q97lW4w=; b=wOi794lcKqalDzqxUwBlzuo1+A
 621ONZdIE9qReJw/MnpvwiAQKNjr8XZnSKoMinMbE9Ll9ujNQ97MBD/2e4Yih2CMIgWh1HOZpYghh
 2DcY8XVHtTasCt8+Zn6+Bethg5hcL2H7jxRmaon93mht3AQdZLrJXwPX4R8p2oyo2wsQ=;
Message-ID: <1e46223e-072b-9180-51aa-49a203ce6de3@rev.ng>
Date: Fri, 28 Apr 2023 18:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426173232.2227787-1-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230426173232.2227787-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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


On 4/26/23 19:32, Taylor Simpson wrote:
> **** Changes in v2 ****
> Fix bug in imm_print identified in clang build
>
> Currently, idef-parser skips all floating point instructions.  However,
> there are some floating point instructions that can be handled.
>
> The following instructions are now parsed
>      F2_sfimm_p
>      F2_sfimm_n
>      F2_dfimm_p
>      F2_dfimm_n
>      F2_dfmpyll
>      F2_dfmpylh
>
> To make these instructions work, we fix some bugs in parser-helpers.c
>      gen_rvalue_extend
>      gen_cast_op
>      imm_print
>
> Test cases added to tests/tcg/hexagon/fpstuff.c
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/idef-parser/parser-helpers.h |  2 +-
>   target/hexagon/idef-parser/parser-helpers.c | 37 ++++++++++----
>   tests/tcg/hexagon/fpstuff.c                 | 54 +++++++++++++++++++++
>   target/hexagon/gen_idef_parser_funcs.py     | 10 +++-
>   4 files changed, 91 insertions(+), 12 deletions(-)

I'm getting a harness failure on

     v65_Q6_R_mpy_RR_rnd.c

I'll take a deeper look at this next week.

diff:

  Intrinsic: ----------- Test Result Summary ---------- Word32 
Q6_R_mpy_RR_rnd(Word32 Rs, Word32 Rt)
-40000000 :  Q6_R_mpy_RR_rnd(INT32_MIN,INT32_MIN)
-1 :  Q6_R_mpy_RR_rnd(-1,INT32_MIN)
-0 :  Q6_R_mpy_RR_rnd(0,INT32_MIN)
-0 :  Q6_R_mpy_RR_rnd(1,INT32_MIN)
-c0000001 :  Q6_R_mpy_RR_rnd(INT32_MAX,INT32_MIN)
-1 :  Q6_R_mpy_RR_rnd(INT32_MIN,-1)
-0 :  Q6_R_mpy_RR_rnd(-1,-1)
-0 :  Q6_R_mpy_RR_rnd(0,-1)
-0 :  Q6_R_mpy_RR_rnd(1,-1)
-0 :  Q6_R_mpy_RR_rnd(INT32_MAX,-1)
-0 :  Q6_R_mpy_RR_rnd(INT32_MIN,0)
-0 :  Q6_R_mpy_RR_rnd(-1,0)
-0 :  Q6_R_mpy_RR_rnd(0,0)
-0 :  Q6_R_mpy_RR_rnd(1,0)
-0 :  Q6_R_mpy_RR_rnd(INT32_MAX,0)
-0 :  Q6_R_mpy_RR_rnd(INT32_MIN,1)
-0 :  Q6_R_mpy_RR_rnd(-1,1)
-0 :  Q6_R_mpy_RR_rnd(0,1)
-0 :  Q6_R_mpy_RR_rnd(1,1)
-0 :  Q6_R_mpy_RR_rnd(INT32_MAX,1)
-c0000001 :  Q6_R_mpy_RR_rnd(INT32_MIN,INT32_MAX)
-0 :  Q6_R_mpy_RR_rnd(-1,INT32_MAX)
-0 :  Q6_R_mpy_RR_rnd(0,INT32_MAX)
-0 :  Q6_R_mpy_RR_rnd(1,INT32_MAX)
-3fffffff :  Q6_R_mpy_RR_rnd(INT32_MAX,INT32_MAX)
+3fffffff :  Q6_R_mpy_RR_rnd(INT32_MIN,INT32_MIN)
+0 :  Q6_R_mpy_RR_rnd(-1,INT32_MIN)
+ffffffff :  Q6_R_mpy_RR_rnd(0,INT32_MIN)
+ffffffff :  Q6_R_mpy_RR_rnd(1,INT32_MIN)
+c0000000 :  Q6_R_mpy_RR_rnd(INT32_MAX,INT32_MIN)
+0 :  Q6_R_mpy_RR_rnd(INT32_MIN,-1)
+ffffffff :  Q6_R_mpy_RR_rnd(-1,-1)
+ffffffff :  Q6_R_mpy_RR_rnd(0,-1)
+ffffffff :  Q6_R_mpy_RR_rnd(1,-1)
+ffffffff :  Q6_R_mpy_RR_rnd(INT32_MAX,-1)
+ffffffff :  Q6_R_mpy_RR_rnd(INT32_MIN,0)
+ffffffff :  Q6_R_mpy_RR_rnd(-1,0)
+ffffffff :  Q6_R_mpy_RR_rnd(0,0)
+ffffffff :  Q6_R_mpy_RR_rnd(1,0)
+ffffffff :  Q6_R_mpy_RR_rnd(INT32_MAX,0)
+ffffffff :  Q6_R_mpy_RR_rnd(INT32_MIN,1)
+ffffffff :  Q6_R_mpy_RR_rnd(-1,1)
+ffffffff :  Q6_R_mpy_RR_rnd(0,1)
+ffffffff :  Q6_R_mpy_RR_rnd(1,1)
+ffffffff :  Q6_R_mpy_RR_rnd(INT32_MAX,1)
+c0000000 :  Q6_R_mpy_RR_rnd(INT32_MIN,INT32_MAX)
+ffffffff :  Q6_R_mpy_RR_rnd(-1,INT32_MAX)
+ffffffff :  Q6_R_mpy_RR_rnd(0,INT32_MAX)
+ffffffff :  Q6_R_mpy_RR_rnd(1,INT32_MAX)
+3ffffffe :  Q6_R_mpy_RR_rnd(INT32_MAX,INT32_MAX)

-- 
Anton Johansson,
rev.ng Labs Srl.


