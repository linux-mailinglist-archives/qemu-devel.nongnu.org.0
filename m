Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BBD6F0448
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:38:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryzV-0008Cz-5Z; Thu, 27 Apr 2023 06:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pryzP-0008CG-2J
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:36:39 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pryzM-0000Vg-Gy
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DuBCEA6rMGYyxiZsF+IsR/Agx2B5U8IBq8x9K4fy9CE=; b=T1cP2jtuPFhR9WNsUVurL/aqqb
 OPZrqb6we6s1mW4Sz1zXbefeOY1dlDTJWvBXzjcJ9C8W4JvtJmv7oIX9B6JZOHRp+M9pl3nv5KXg9
 AlctLX2BY2Z3kmpfCFp8wGQcuCMzw3HBVlrOAmLkQbEc9TaYwTOEHr8vm/sHmIJUPXOQ=;
Message-ID: <dba8a799-2e60-dc45-2384-e59ec12d14fe@rev.ng>
Date: Thu, 27 Apr 2023 12:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/9] Hexagon (target/hexagon) Add v68 scalar instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-3-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230426023018.1742266-3-tsimpson@quicinc.com>
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
>      L2_loadw_aq
>      L4_loadd_aq
>      R6_release_at_vi
>      R6_release_st_vi
>      S2_storew_rl_at_vi
>      S4_stored_rl_at_vi
>      S2_storew_rl_st_vi
>      S4_stored_rl_st_vi
>
> The release instructions are nop's in qemu.  The others behave as
>   loads/stores.
>
> The encodings for these instructions changed some "don't care" bits
>      L2_loadw_locked
>      L4_loadd_locked
>      S2_storew_locked
>      S4_stored_locked
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h                | 18 ++++++++++++++++++
>   target/hexagon/attribs_def.h.inc        |  7 +++++++
>   target/hexagon/translate.c              |  3 +++
>   target/hexagon/gen_idef_parser_funcs.py |  2 ++
>   target/hexagon/imported/encode_pp.def   | 19 ++++++++++++++-----
>   target/hexagon/imported/ldst.idef       | 20 +++++++++++++++++++-
>   6 files changed, 63 insertions(+), 6 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>


