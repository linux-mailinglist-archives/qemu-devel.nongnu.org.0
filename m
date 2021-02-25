Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD1325263
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:27:05 +0100 (CET)
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIXg-0004DL-Qa
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lFIVg-0002XA-8f
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:25:00 -0500
Received: from rev.ng ([5.9.113.41]:35751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lFIVe-0003PT-Pa
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jquf2iJW5jTdpV/+AfwurIUv+cTL14UOQMCpqJiCpwA=; b=mVuxcQsQt4RyIruTxDO+DF7n8K
 lS6AadaSCI7hjBFhvqQL4FKlP4NPKMfZxvN0XBJb0OhY0B9KrIdo3X53soOOJnhAHaAZFYQd3MZna
 /BOynZm6ghI402B2gjSvaIDEdY6YL6U5Ut+qoTsKR3yZ/ZP4oUt8mXjXfqN6UBusQx+0=;
Date: Thu, 25 Feb 2021 16:24:48 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org,
 babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng
Subject: Re: [RFC PATCH 00/10] target/hexagon: introduce idef-parser
Message-ID: <20210225162448.32061a7b@orange>
In-Reply-To: <517570b3-2e0f-3f3e-697b-5fa61754ba7e@linaro.org>
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <517570b3-2e0f-3f3e-697b-5fa61754ba7e@linaro.org>
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Sun, 14 Feb 2021 13:52:25 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> Well, first off, this fails to build with our gitlab CI.
> 
> There are several problems, apart from the new bison parse.error
> option previously reported:
> 
> (1) bison and flex not added to dockerfiles, so the packages are not
> available to CI.
> 
> (2) idef-parser program not marked with "native: true", so we get an
> early meson error about that.
> 
> (3) flex = generator() does not specify both output files, so the
> proper dependency on idef-parser.yy.h is not present.
> 
> (4) idef-parser.yy.h is placed in the wrong directory, because you
> used '%option header-file="xyz"' instead of the command-line
> '--headerfile=@OUTPUT1@'.  This results in an immediate compilation
> failure, because the file isn't found.
> 
> (5) There's an odd mismatch in file naming, in which you have
> idef-lexer.lex.yy.c but idef-parser.yy.h.  Not a bug, really, but it
> looks odd when fixing 3 & 4.

We've integrated the suggested changes and tested the v2 on the Gitlab
CI. It should now work properly.

-- 
Alessandro Di Federico
rev.ng

