Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283496F8521
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwtk-00028b-Ml; Fri, 05 May 2023 10:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puwti-000279-D6
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:59:02 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puwtg-00050f-Gx
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3g668UQ5JOwa1C/lhnvoL55LqS7iX4bhKVtmlivZ5qg=; b=NQIvq8mmgQIR0A5yhDdtZ3Zo9S
 /JTrqS00FAFaSWfjS1uaj/DJNBadJwuuqHgOQYRtJ60FHVmppD53F6W+NSFcYFIu55rJqQBWuTys9
 Xm4MOxheeFxb/rM/4QXBClZbhiCNb2Qs+8GZRssL/FMCUlnr/cyUChMiJfJdoC6qd6TY=;
Message-ID: <22135f73-9b0d-94d8-c91f-8e4d211f13a8@rev.ng>
Date: Fri, 5 May 2023 16:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] Hexagon (target/hexagon/*.py): raise exception on reg
 parsing error
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com
References: <1f5dbd92f68fdd89e2647e4ba527a2c32cf0f070.1683217043.git.quic_mathbern@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <1f5dbd92f68fdd89e2647e4ba527a2c32cf0f070.1683217043.git.quic_mathbern@quicinc.com>
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


On 5/4/23 18:17, Matheus Tavares Bernardino wrote:
> Currently, the python scripts used for the hexagon building will not
> abort the compilation when there is an error parsing a register. Let's
> make the compilation properly fail in such cases by rasing an exception
> instead of just printing a warning message, which might get lost in the
> output.
>
> This patch was generated with:
>
>   git grep -l "Bad register" *hexagon* | \
>   xargs sed -i "" -e 's/print("Bad register parse: "[, ]*\([^)]*\))/hex_common.bad_register(\1)/g'
>
> Plus the bad_register() helper added to hex_common.py.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/gen_analyze_funcs.py     | 30 +++++-----
>   target/hexagon/gen_helper_funcs.py      | 14 ++---
>   target/hexagon/gen_helper_protos.py     |  2 +-
>   target/hexagon/gen_idef_parser_funcs.py |  2 +-
>   target/hexagon/gen_tcg_funcs.py         | 78 ++++++++++++-------------
>   target/hexagon/hex_common.py            |  3 +
>   6 files changed, 66 insertions(+), 63 deletions(-)
Reviewed-by: Anton Johansson <anjo@rev.ng>

