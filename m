Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DE5885D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 04:38:17 +0200 (CEST)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ4H2-0002OA-2X
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 22:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oJ4FG-0000iq-Bu; Tue, 02 Aug 2022 22:36:27 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:44456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oJ4FE-0000LY-EP; Tue, 02 Aug 2022 22:36:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBF8FB82140;
 Wed,  3 Aug 2022 02:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FBEC433C1;
 Wed,  3 Aug 2022 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659494176;
 bh=1aI/h++KSVvFqimn/80/tgRdiPN9Tf+9n9go/dmsdPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWxAtw9ONyIQIbCS6jT1Dr6KVNoQdr3QXfZQnmA73ZktY5JV6fYwEVTfuuCmWX4x1
 fU9b3wxy9MyQXxzFC9H/IB6Pj2uSki6bXsdHheaPfUR5L5sUxDhdfTGbKbp77Yfg4o
 YGxBengfqCg3mvb7YeelK8XQEzLGiJt5IbpBo2iltYvEV1jMpO2rKPm72gt9d6smHC
 oVX7Abu8MZjL5dZtVFGQ2VqW9Eqq2T+I3BWrp9R50uAjqqsxAMdXra5AteG/uA0MjW
 xdjvz74SBhK7Sg2YqCaThyQvMYwYZVJfVTcZeaptPAQYzwvHgrWWdmig63WE7EvhVB
 8ANxKBDEvsVTA==
Date: Tue, 2 Aug 2022 20:36:12 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-devel <qemu-devel@nongnu.org>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH] hw/nvme: Add helper functions for qid-db conversion
Message-ID: <YunfHJJ1Ig/fpm8D@kbusch-mbp.dhcp.thefacebook.com>
References: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
 <Yui+B7yEikNGACgq@apples>
 <46762954-5440-4C96-B39B-BCAA6C86589C@ict.ac.cn>
 <YujmUfXpFXSO8eU5@apples>
 <07B010D2-FF6F-4FE3-A1E2-2299F2A1BA29@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07B010D2-FF6F-4FE3-A1E2-2299F2A1BA29@ict.ac.cn>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03, 2022 at 09:46:05AM +0800, Jinhao Fan wrote:
> at 4:54 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> 
> > I am unsure if the compiler will transform that division into the shift
> > if it can infer that the divisor is a power of two (it most likely
> > will be able to).
> > 
> > But I see no reason to have a potential division here when we can do
> > without and to me it is just as readable when you know the definition of
> > DSTRD is `2 ^ (2 + DSTRD)`.
> 
> OK. I will send a new patch with shifts instead of divisions. BTW, why do we
> want to avoid divisions?

Integer division is at least an order of magnitude more CPU cycles than a
shift. Some archs are worse than others, but historically we go out of the way
to avoid them in a hot path, so shifting is a more familiar coding pattern.

Compilers typically implement division as a shift if you're dividing by a a
power of two integer constant expression (ICE).

This example here isn't an ICE, but it is a shifted constant power-of-two. I
wrote up a simple test to see what my compiler does with that, and it looks
like gcc will properly optimize it, but only if compiled with '-O3'.

