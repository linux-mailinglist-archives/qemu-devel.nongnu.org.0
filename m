Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D826A1D74
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZ6d-00034U-2O; Fri, 24 Feb 2023 09:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVZ6O-0002tM-Kg
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:31:14 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVZ6K-0004Ya-GS
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zpXQcdc6cGn9ektdz90MLgHiO/gJho6fooI0ptA0lyo=; b=tB36lPHHsZNuUadJ/JpRp87TSX
 hpjFy15VktZqzfnJ6FlGn3f04y0nNb2oXLv6daYUmRkqHtwDYQV0V2MW2hEqgHYWY0tHzN/SRPinr
 mfYLNQJ5gPwY87IEAhMuD4ng4mkEfCJ7q8lp0drKJmUB178QyAZgITUAY026jjWXG9b4=;
Message-ID: <2c7336be-038a-5882-a879-5d3399644c11@rev.ng>
Date: Fri, 24 Feb 2023 15:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 14/14] Hexagon (target/hexagon) Improve code gen for
 predicated HVX instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-15-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230131225647.25274-15-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
> The following improvements are made for predicated HVX instructions
>      During gen_commit_hvx, unconditionally move the "new" value into
>          the dest
>      Don't set slot_cancelled
>      Remove runtime bookkeeping of which registers were updated
>      Reduce the cases where gen_log_vreg_write[_pair] is called
>          It's only needed for special operands VxxV and VyV
>      Remove gen_log_qreg_write
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h                |  5 +--
>   target/hexagon/gen_tcg_hvx.h        | 17 +-------
>   target/hexagon/translate.h          | 16 +++-----
>   target/hexagon/genptr.c             | 50 +++---------------------
>   target/hexagon/translate.c          | 60 +++--------------------------
>   target/hexagon/README               | 28 ++++----------
>   target/hexagon/gen_analyze_funcs.py |  3 +-
>   target/hexagon/gen_tcg_funcs.py     | 35 ++++-------------
>   8 files changed, 37 insertions(+), 177 deletions(-)
Reviewed-by: Anton Johansson <anjo@rev.ng>

