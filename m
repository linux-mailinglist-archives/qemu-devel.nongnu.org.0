Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC033B3087
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 15:52:44 +0200 (CEST)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwPmd-0005pz-Ke
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 09:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lwPlk-000593-6D
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 09:51:48 -0400
Received: from rev.ng ([5.9.113.41]:49095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lwPli-0001Gd-7x
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 09:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ybpSyg5v4jxa3vDDoPgyvIRimcGYoj776w4LUX26Aw=; b=dHHjBtRXQRPle93hhO3PsDhr3n
 GOLW6O4hwZ4sNgG/tl8/5OKmnvHlpSGI64rWEwhnDY9DU3TQe710m6HI0OogABm7vVHU82yOouSYs
 jqaJCXPsFrCfdsmJjWPgkckdgYx4TbnFjff6gFArHastRf7wbK9jGDadVyzDR9p3mYOU=;
Date: Thu, 24 Jun 2021 15:51:31 +0200
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Brian Cain
 <bcain@quicinc.com>, "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng"
 <nizzo@rev.ng>, "philmd@redhat.com" <philmd@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 03/14] target/hexagon: import README for idef-parser
Message-ID: <20210624155131.0523ab28@orange>
In-Reply-To: <BYAPR02MB4886DE05AED7A197547EE290DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-4-ale.qemu@rev.ng>
 <BYAPR02MB4886DE05AED7A197547EE290DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
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

On Wed, 23 Jun 2021 15:46:22 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> The output isn't actually indented, but it would be great if it were.
>  This is especially true for instructions where an "if" or "for" show
> up in the emitted code.

Emitting whitespaces in the parser is a bit annoying and fragile, but
it can be done.

We post-process the parser output with `indent` internally. We could
run it after the output is produced, but that would mean a new
dependency.

I'd go for opportunistic indentation through `indent` if installed.

> Is there a way to force the parser not to emit a particular
> instruction (i.e., fall back on the reference implementation)?

Yes, see `gen_idef_parser_funcs.py`.

-- 
Alessandro Di Federico
rev.ng

