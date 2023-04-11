Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE846DDA41
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:07:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCl9-0003SH-58; Tue, 11 Apr 2023 08:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pmCl4-0003Rn-Bl
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:05:59 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pmCl1-0003k3-MX
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V87R4ubnJJnBH59e58FxMaj0xVFo43ozOG0k4F70aAU=; b=owClqybE89HV3c3zfyJ8YGJbf6
 OyiqTt8PBG4N9h46qm6H5+P71SEIbhreV0fWbzqXgzQLQME7b/gnJFQ0HT9GUBLgdbkZF1GTvtw23
 mdL33DXSJs9q8nM3sIRC5h3yw6dDCG+IvlndPqwnq29LavzAm/Ik2YI/wmVmYwNdjchg=;
Message-ID: <3fc3db98-9b39-7227-3125-f5956c12fabc@rev.ng>
Date: Tue, 11 Apr 2023 14:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Additional instructions handled
 by idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230407205246.395196-1-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230407205246.395196-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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


On 4/7/23 22:52, Taylor Simpson wrote:
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
>
> Test cases added to tests/tcg/hexagon/fpstuff.c
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 16 +++---
>   tests/tcg/hexagon/fpstuff.c                 | 54 +++++++++++++++++++++
>   target/hexagon/gen_idef_parser_funcs.py     | 10 +++-
>   3 files changed, 72 insertions(+), 8 deletions(-)

This patch looks good, nice catch on the bugs!

Reviewed-by: Anton Johansson <anjo@rev.ng>
Tested-by: Anton Johansson <anjo@rev.ng>


