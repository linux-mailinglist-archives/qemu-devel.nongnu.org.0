Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C5C3BC1D5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:53:54 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Rqz-0000H2-FT
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m0Ro7-0004gu-N8
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:50:55 -0400
Received: from rev.ng ([5.9.113.41]:41109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m0Ro3-0001Kp-36
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j7kyhlUtH5DIvIVCASaVPREs1QRF9GGV3y3S3uhZJxI=; b=kkPamk44zdfG4A3wxMwNjjhf9R
 Oq8hzJZmhihUx6LEAFCyTBm8J1dvI3ssg42RPoQarAW1ERyx0cYW8TYLwhIdDXFWqkIqiArtEsBVA
 ONl0b0kI+lqe5BCiQUEjnbh8sNGW+fHfjqTt24Vvv7Y2Ir9ybL9VJeD8qtMr0WGq0A+M=;
Date: Mon, 5 Jul 2021 18:47:41 +0200
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>, "babush@rev.ng"
 <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>, "philmd@redhat.com"
 <philmd@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
Message-ID: <20210705184741.5b2aae78@orange>
In-Reply-To: <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-11-ale.qemu@rev.ng>
 <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
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

On Thu, 24 Jun 2021 03:55:35 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> > +void gen_deposit_op(Context *c,
> > +                    YYLTYPE *locp,
> > +                    HexValue *dest,
> > +                    HexValue *value,
> > +                    HexValue *index,
> > +                    HexCast *cast)  
> 
> What's the difference between this and the gen_rdeposit_op above?

`gen_deposit_op` expects index and width (cast) to be immediates, while
`gen_rdeposit_op` does not.
We could merge them together, but it would just be a big "if" over the
whole function.

> > +HexValue gen_rextract_op(Context *c,
> > +                         YYLTYPE *locp,
> > +                         HexValue *source,
> > +                         int begin,
> > +                         int width) {
> > +
> > +HexValue gen_extract_op(Context *c,
> > +                        YYLTYPE *locp,
> > +                        HexValue *source,
> > +                        HexValue *index,
> > +                        HexExtract *extract) {  
> 
> What's the difference between this ant the gen_rextract_op above?

As before.

-- 
Alessandro Di Federico
rev.ng

