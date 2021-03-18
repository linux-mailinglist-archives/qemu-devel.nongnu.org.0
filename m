Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89791340BDA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:29:29 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwSe-0000Us-Jm
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lMwQ9-0007dy-FY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:26:55 -0400
Received: from rev.ng ([5.9.113.41]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lMwQ7-0007Yb-BC
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AD70THabnrsdBeu7V+l8C/2H0hqEN6roInJ5rxOiQ38=; b=GqnIYhb/VCInAHrBuAWkvPn57e
 2jFUqHV/3g0cO196HK99yq5yhKZLXPw9blQOK20tKHojKZcylNPOhvlu05rYJxwh/ljyYi4t0QsbR
 yIpsmCPCe0w8m+NYJz6Z6x/ZRW4rMqhzY44JOlCf29MFuTDGlVFcatKb4ROPhSKM/zDE=;
Date: Thu, 18 Mar 2021 18:26:36 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Brian Cain
 <bcain@quicinc.com>, "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng"
 <nizzo@rev.ng>, "philmd@redhat.com" <philmd@redhat.com>
Subject: Re: [PATCH v2 02/10] target/hexagon: import README for idef-parser
Message-ID: <20210318182636.17c75866@orange>
In-Reply-To: <BYAPR02MB48867812389A9AE6031D7215DE919@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-3-ale.qemu@rev.ng>
 <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
 <BYAPR02MB48867812389A9AE6031D7215DE919@BYAPR02MB4886.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Wed, 10 Mar 2021 15:48:14 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> Which instructions require this?  There must be an attribute that we
> could check to see if it is needed before emitting the TCG.

The following should be an example of an instruction that requires
zero-initialization:

    /* S2_vsplatrh */
    void emit_S2_vsplatrh(DisasContext *ctx, Insn *insn, Packet *pkt,
                          TCGv_i64 RddV, TCGv_i32 RsV)
    /*  for (i=0;i<4;i++) { fSETHALF(i,RddV, fGETHALF(0,RsV)); } } */
    {
      tcg_gen_movi_i64(RddV, 0);
      for (int i = ((int64_t)0ULL); i < ((int64_t)4ULL); i++) {
        TCGv_i32 tmp_0 = tcg_temp_new_i32();
        tcg_gen_sextract_i32(tmp_0, RsV, ((int64_t)0ULL) * 16, 16);
        TCGv_i64 tmp_1 = tcg_temp_new_i64();
        tcg_gen_ext_i32_i64(tmp_1, tmp_0);
        tcg_temp_free_i32(tmp_0);
        tcg_gen_deposit_i64(RddV, RddV, tmp_1, i * 16, 16);
        tcg_temp_free_i64(tmp_1);
      }
    }

If we don't zero-initialize RddV, the deposit instruction will read
uninitialized data.

Note that, IIRC, `RddV` is not always a global variable, which could be
safely read, but it might be an uninitialized TCGv that will be
written to the CPU state in the commit phase.

-- 
Alessandro Di Federico
rev.ng

