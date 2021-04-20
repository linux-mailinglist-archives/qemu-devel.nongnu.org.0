Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2B365271
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 08:41:35 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYk4i-0000M9-Nk
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 02:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lYk3F-0008Fg-LK
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:40:01 -0400
Received: from rev.ng ([5.9.113.41]:35071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lYk3A-0004Pm-Cg
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZBbI+1i/DR2w9q0qZmigGRiy/QwmoAJAG2AtLTsWVcY=; b=h0G6nAew1bK0y6oOHBcLqlMIkO
 qt6qScMgOC30ipVYsGkrfgKHVvgSMbOZGcbCHEAF5u7h4HW7OvrEpz+5yLMD4aV81+4fVZlzxkSsV
 I7Vklk2TOU9zmG3gPckydG2suSBXg6d6JrG2igHz0PtPV5hboqV6zFDTHbrjsRpvssEY=;
Date: Tue, 20 Apr 2021 08:39:38 +0200
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Brian Cain
 <bcain@quicinc.com>, "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng"
 <nizzo@rev.ng>, "philmd@redhat.com" <philmd@redhat.com>
Subject: Re: [PATCH v4 06/12] target/hexagon: introduce new helper functions
Message-ID: <20210420083938.4edd565c@orange>
In-Reply-To: <BYAPR02MB4886545B4B093744B7B4885DDE499@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-7-ale.qemu@rev.ng>
 <b36337c6-f6d0-45b1-be11-b998d8579c4c@linaro.org>
 <BYAPR02MB4886545B4B093744B7B4885DDE499@BYAPR02MB4886.namprd02.prod.outlook.com>
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

On Mon, 19 Apr 2021 15:00:17 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> Once this patch series is merged, many load/store instructions will
> have manual overrides.  I can easily provide overrides for the
> remainder.  Then, we could skip them in the idef-parser.  At a
> minimum, you should skip the ones that are part of that series
> - circular addressing
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01355.html
> - bit reverse addressing
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01354.html
> - load and unpack bytes
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01353.html
> 			
> - load into shifted register
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01359.html
> 
> Alessandro, what do you think?

If, for an instruction, all idef-parse does is calling an helper, yeah,
it makes sense to exclude them.

I'll look into this again once your patchset is in.

-- 
Alessandro Di Federico
rev.ng

