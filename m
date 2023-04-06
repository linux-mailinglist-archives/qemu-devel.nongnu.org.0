Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CDF6DA485
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 23:13:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkWtw-0001R9-Af; Thu, 06 Apr 2023 17:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pkWtu-0001Ql-5Z
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 17:12:10 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pkWts-0005dI-8A
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 17:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nbY+eM+v0cUj1d80Azuz/IFktc7dSgjRx+19HdVpyvE=; b=rhk8Z1/A8Hf6uMfyhrgs2BOpYL
 Q4LB9QIcoBScwcXr2/rE5Lj55D0XxZ2edDqCWonBD6RKKgAOUv3NZEQNvknGiFLpFOpwcLFcQBF+N
 3SHZrd9zSg/yY/suLVVBYLdCcCfk9kFYiCPq14A0/KVqbkICavt6eARQBA5xKSuqL8Nk=;
Message-ID: <12cf67c1-dc86-5159-a8a1-bcd95b40500f@rev.ng>
Date: Thu, 6 Apr 2023 23:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Updates to USR should use
 get_result_gpr
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230405164211.30015-1-tsimpson@quicinc.com>
 <20230405164211.30015-3-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230405164211.30015-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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


On 4/5/23 18:42, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h                    |  4 +-
>   target/hexagon/genptr.h                     | 10 ++---
>   target/hexagon/macros.h                     |  8 ----
>   target/hexagon/genptr.c                     | 49 ++++++++++-----------
>   target/hexagon/idef-parser/parser-helpers.c |  5 ++-
>   target/hexagon/idef-parser/idef-parser.y    |  2 +-
>   6 files changed, 34 insertions(+), 44 deletions(-)
Reviewed-by: Anton Johansson <anjo@rev.ng>

