Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EE328171
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:54:37 +0100 (CET)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjwR-0007sB-Lq
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGjsj-0003oE-2V
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:50:45 -0500
Received: from rev.ng ([5.9.113.41]:50869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGjsh-0000MA-BP
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ps1w5mzplZ1XtZef/+95wENGOnzXhAyftWEPpbAmo5o=; b=ONwgBO3sV5iW0nIA8gT+Welslr
 dQA3tv3q3kcwBwsYcPxdiQalFu0Elo2s9n3KHAfCQjv2zoCjlZ/sj5vV7ysG5zXK6zpRw5Siu19OV
 Uc5vGo75xBnV9WpX256HdGtNHtaH2OpKhcKAMPS0HSKMo5Wa16HiAOquWEh25r5GekAk=;
Date: Mon, 1 Mar 2021 15:50:35 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org,
 tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com
Subject: Re: [PATCH v2 02/10] target/hexagon: import README for idef-parser
Message-ID: <20210301155035.2a7360e8@orange>
In-Reply-To: <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-3-ale.qemu@rev.ng>
 <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
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

On Thu, 25 Feb 2021 12:20:53 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:
> This is odd, as is the description of why.  Yes, if RdV is read
> without initialization, TCG middle-end will abort (at least with
> --enable-debug-tcg enabling the assertions).  But you've just said
> that "no reading" was found.

When we say that no reading was found, we mean that it was not
initialized by the caller. The term "reading" is a leftover from how
the parser input was organized in the first iterations of the base
patchset.

I'll rephrase that.

> So why did you perform this dummy initialization, which will be
> eliminated later?

The initialization is redundant in this specific example, but, in
general, non-initialized values are assumed to be zero-initialized.
For instance when you're writing a 64-bit integer piecewise, by OR-ing
two 32-bit integers, it matters.

In short: useless in this case (but DCE'd by the mid-end), important in
general.
 
> So, I take it from this that you're emitting tcg directly from within
> the parser, and not generating any kind of abstract syntax tree?

Yes. There a few spots where an AST would have been beneficial, but
overall we deem it would increase the complexity of the parser with
limited return.

-- 
Alessandro Di Federico
rev.ng

