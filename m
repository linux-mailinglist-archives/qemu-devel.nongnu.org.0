Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA5328172
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:54:56 +0100 (CET)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjwl-00084b-83
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGjt1-00048h-Mo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:51:04 -0500
Received: from rev.ng ([5.9.113.41]:57271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGjsy-0000Sb-9o
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X1E25+6yroUo3fh5+SnUEr2lAPV+Xat+DouPq1c+cdA=; b=cAfOnuiWGaDxhH0l8rxaVTkq5M
 KhP5BWCmw+9McW8wz5f3L3tBxwsWaQ+yeHYIHYLsnsJyKByjYah7K7kUBVDLChbxkMMTKxbr9A3B8
 5v6as+QvRRLUk75P3W4h3AXa/NObFCzVQYF1MAgq7ZnDFV/w165K13oNJVr73dnMRf6Q=;
Date: Mon, 1 Mar 2021 15:50:52 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org,
 tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com
Subject: Re: [PATCH v2 08/10] target/hexagon: import parser for idef-parser
Message-ID: <20210301155052.2e70eaf1@orange>
In-Reply-To: <d4290039-5604-62d3-c8b2-f960d5717059@linaro.org>
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-9-ale.qemu@rev.ng>
 <d4290039-5604-62d3-c8b2-f960d5717059@linaro.org>
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

On Thu, 25 Feb 2021 19:30:14 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> > +    }
> > +}
> > +code
> > +{
> > +    if (c->inst.error_count != 0) {
> > +        fprintf(stderr,
> > +                "Parsing of instruction %s generated %d errors!\n",
> > +                c->inst.name,
> > +                c->inst.error_count);
> > +        EMIT(c, "assert(false && \"This instruction is not
> > implemented!\");");  
> 
> What's the point of assert(false) above abort()?
> 
> Is there any point in emitting anything at all, since I assume the
> idef-parser program itself will exit with error, stopping the build
> process?

This is a leftover, that string will never be written to disk (`commit`
is not invoked).

> > +| pre ASSIGN rvalue
> > +{
> > +    @1.last_column = @3.last_column;  
> 
> Do you really find any value in this column manipulation, given that
> the input is not the original file, but the output of cpp?

The output of `cpp` is quite readable. We use it a lot for debugging
and it's very helpful.

> IMO this is another reason to *not* preprocess with macros.inc, nor
> sed the output as a workaround for your parsing troubles.

Yes, `sed` is a workaround I really don't like too. But preprocessing
with `cpp` saves us from having to handle a larger, redundant language.
After all, the input language is designed to be expanded through the
preprocessor, although with a different set of macros. I'd keep that
part.

-- 
Alessandro Di Federico
rev.ng

