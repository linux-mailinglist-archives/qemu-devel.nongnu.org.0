Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC668665C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:05:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCn2-0005OA-Qh; Wed, 01 Feb 2023 08:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNCn0-0005NZ-1H
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:04:38 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNCmy-00087y-1D
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YR2cFFU9FkxhVN9dfJQZcCAKYvwLJ/QDEHv0VrpTZjY=; b=I4IVcZOmnzoXo6iKrKFzYn8RyN
 hpL1UFM0kxyb4FnfrtE4rqKileh+EvUq4yd8W9q53UMPlFOAWxiXoAKlBIRBKT2wKui2uwI6nHzEX
 BTVBKSC5z3Hj/zn76EIykqpHe019gUamhEquxiAVxFaM08N0xMkOwZmd7N+lm9ZI/pvE=;
Message-ID: <7a297c72-c9da-9a8e-bb73-f9f684747558@rev.ng>
Date: Wed, 1 Feb 2023 14:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 04/14] Hexagon (target/hexagon) Add overrides for
 dealloc-return instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-5-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230131225647.25274-5-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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


> These instructions perform a deallocframe+return (jumpr r31)
>
> Add overrides for
>      L4_return
>      SL2_return
>      L4_return_t
>      L4_return_f
>      L4_return_tnew_pt
>      L4_return_fnew_pt
>      L4_return_tnew_pnt
>      L4_return_fnew_pnt
>      SL2_return_t
>      SL2_return_f
>      SL2_return_tnew
>      SL2_return_fnew
>
> This patch eliminates the last helper that uses write_new_pc, so we
> remove it from op_helper.c
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h   | 54 ++++++++++++++++++++++++
>   target/hexagon/genptr.c    | 86 ++++++++++++++++++++++++++++++++++++++
>   target/hexagon/op_helper.c | 26 +-----------
>   3 files changed, 141 insertions(+), 25 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>


