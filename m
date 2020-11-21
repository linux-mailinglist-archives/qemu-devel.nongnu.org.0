Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3A2BBE48
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 10:51:17 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgPY3-0004TB-NJ
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 04:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kgPWu-0003wV-KS
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 04:50:04 -0500
Received: from rev.ng ([5.9.113.41]:56767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kgPWs-00069H-PW
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 04:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WO9YkskWbmY0tD2N236wZdpdgDywwTa7Q58tR8pMPVE=; b=fXqyocjZYEl0cUapZevHnmAMnx
 xhUg0iOog71gVwMI6AElQGUCYCtKS5lIFXrtxWs0b/HBq3TDqvBLcxV+v5gLQaekagSIyCp7PiJ5d
 ycRoAZtlAPftghCc/JIxFDG0IU7iqC/BuhO8CV/rSkH/wJhem8Uydm+idCOlDgvFDDI4=;
Date: Sat, 21 Nov 2020 10:49:46 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, bcain@quicinc.com, richard.henderson@linaro.org,
 at.org@qualcomm.com, laurent@vivier.eu
Subject: Re: [RFC PATCH v5 20/33] Hexagon (target/hexagon) generator phase 2
 - generate header files
Message-ID: <20201121104946.7cd52d49@orange>
In-Reply-To: <1604016519-28065-21-git-send-email-tsimpson@quicinc.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-21-git-send-email-tsimpson@quicinc.com>
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
Reply-to: Alessandro Di Federico <ale.qemu@rev.ng>
From: Alessandro Di Federico via <qemu-devel@nongnu.org>

On Thu, 29 Oct 2020 19:08:26 -0500
Taylor Simpson <tsimpson@quicinc.com> wrote:

> +def genptr_decl_new(f,regtype,regid,regno):
> +    if (regtype == "N"):
> +        if (regid in {"s", "t"}):
> +            f.write("    const int %s%sX = insn->regno[%d];\n" % \
> +                (regtype, regid, regno))
> +            f.write("    TCGv %s%sN = tcg_const_tl(%s%sX);\n" % \
> +                (regtype, regid, regtype, regid))

This part is a bit incoherent with all the rest.
You're creating a TCGv containing a constant representing the register
number. Why not just create a TCGv with the value of the register
itself as you usually do?

-- 
Alessandro Di Federico
rev.ng

