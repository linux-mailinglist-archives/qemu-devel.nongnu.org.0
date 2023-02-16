Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A846994B5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdfG-00073e-O4; Thu, 16 Feb 2023 07:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pSdfD-00072G-Nw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:47:03 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pSdfB-0003Mk-Sx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EeJMUoAB6Zlt4qeAxlLKSwUUdU3iMTmz6JMVjVaEaRM=; b=obHnyZHYLB/9kxJRJ2ekpsxDaQ
 X33YvtQucD0wvZGlYslfi40S/NYgwxBi65yCW5cbhVBENBPf+QN/F6+2hsLyIGnbRaQsikZ+BGWNL
 +asLDILQjCQIS9H6bOgBS8R8nbHUBEUZKzi3xUYKstJOpxTneajG+/nLz4eijCZJJKHY=;
Message-ID: <9904337c-c4ae-6122-ef3a-bfb01aaea66d@rev.ng>
Date: Thu, 16 Feb 2023 13:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 06/14] Hexagon (target/hexagon) Don't set
 pkt_has_store_s1 when not needed
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-7-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230131225647.25274-7-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
> The pkt_has_store_s1 field in CPUHexagonState is only needed in generated
> helpers for scalar load instructions.  See check_noshuf and mem_load[1248]
> in op_helper.c.
>
> We add logic in gen_analyze_funcs.py to set need_pkt_has_store_s1 in
> DisasContext when it is needed at runtime.
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.h          | 1 +
>   target/hexagon/attribs_def.h.inc    | 1 +
>   target/hexagon/translate.c          | 6 +++++-
>   target/hexagon/gen_analyze_funcs.py | 5 +++++
>   target/hexagon/hex_common.py        | 1 +
>   5 files changed, 13 insertions(+), 1 deletion(-)
Reviewed-by: Anton Johansson <anjo@rev.ng>

