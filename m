Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C02B9DDF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:56:43 +0100 (CET)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsr4-000086-Lg
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kfsoU-0006q1-10
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:54:02 -0500
Received: from rev.ng ([5.9.113.41]:40439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kfsoS-0004rm-Lc
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxwoFS2LPnXpRrHMIY+psTDZdJAS2Yak7+GjAsPpqRE=; b=wSLkv+9YuVVvbrgTe+biuY+U2d
 uPJXI5r00Z2ynuPxW2+KgNucIRJIeELuUsWJtELV3C3DjL/AqHxCWwE8WOtxUny3PD+gTcfSXFi97
 UTw+MP3K0VXBgDtwBvff9QvJVKl+7J1wf7Eym2riy0+ynWIeNJ61z5P5A7FmTx6tXKm8=;
Date: Thu, 19 Nov 2020 23:53:41 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 at.org@qualcomm.com, laurent@vivier.eu, bcain@quicinc.com
Subject: Re: [RFC PATCH v5 18/33] Hexagon (target/hexagon/imported) arch import
Message-ID: <20201119235341.0614922c@orange>
In-Reply-To: <1604016519-28065-19-git-send-email-tsimpson@quicinc.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-19-git-send-email-tsimpson@quicinc.com>
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

On Thu, 29 Oct 2020 19:08:24 -0500
Taylor Simpson <tsimpson@quicinc.com> wrote:

> +Q6INSN(C2_any8,"Pd4=any8(Ps4)",ATTRIBS(A_CRSLOT23),
> +"Logical ANY of low 8 predicate bits",
> +{ PsV ? (PdV=0xff) : (PdV=0x00); })

I understand these files are supposed to stay unchanged, but handling
assignments as expressions as opposed to statements would complicate
our parser in a non-negligible way.

Would it be possible to turn this (and other similar situations) into:

    { PdV = PsV ? (0xff) : (0x00); }

You can easily spot these situations with a shot of:

    git grep -E '\?[^:]*=' target/hexagon/

They are all like this, the left-hand side of the assignment is always
the same in both the true and false branch of the ternary operator.

-- 
Alessandro Di Federico
rev.ng

