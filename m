Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1AF6F06BF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:37:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1nv-0008EZ-3G; Thu, 27 Apr 2023 09:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps1np-0008C2-Ph
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:36:53 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps1no-0006Cr-Ea
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ndzcv46gcz0JPBGLJkLi/1vIhoSFN1HZvMTZLB7F7yQ=; b=oyQPu4wKFnkSp4ZoV7qsbnCGOF
 DL6ebIo8D5y6+8UX8dRmPtA1t+yvQe8bIZAf6QclEL4Vkz957HrGR1Dl1PFJ/Pr/p97DnuG9M3GMF
 FqTfafgmGA4My6jBMgk43WuNH9TgS6ZmAT80R2AgmSHymmdmrC0KhQIPgzwkx1b9Ks54=;
Message-ID: <4f8e27c5-5731-3f51-71ab-b9354920f1d9@rev.ng>
Date: Thu, 27 Apr 2023 15:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 4/9] Hexagon (target/hexagon) Add v68 HVX instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-5-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230426023018.1742266-5-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 4/26/23 04:30, Taylor Simpson wrote:
> The following instructions are added
>      V6_v6mpyvubs10_vxx
>      V6_v6mpyhubs10_vxx
>      V6_v6mpyvubs10
>      V6_v6mpyhubs10
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/mmvec/macros.h                |   9 +-
>   target/hexagon/imported/mmvec/encode_ext.def |   8 +-
>   target/hexagon/imported/mmvec/ext.idef       | 281 ++++++++++++++++++-
>   3 files changed, 295 insertions(+), 3 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>


