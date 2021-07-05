Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F13BC1CC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:52:23 +0200 (CEST)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RpW-0005aF-NA
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m0Ro1-0004ZT-Vy
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:50:50 -0400
Received: from rev.ng ([5.9.113.41]:45461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m0Rnz-0001Hm-PO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0UiU2wkAztsZw4EQV4lRAOHZk6OxpSEDogjtsCWp+l4=; b=S0Rshek3g6tguBM/BAI1kxpqg/
 kPpJlINU3ApYhiVG6zws0KCHsgoknx9fXTGSBdKVxbzLEnYJsuN8996Q2HW/tJE9mM7UDkpKEIG3i
 C1cN7Dxh2o3UIxRtJ4JQC5yT4BzKOGPq6C6U9ZZZgpiZ+AO64zY8/dxN8cUq3BQMkOQw=;
Date: Mon, 5 Jul 2021 18:50:25 +0200
To: Taylor Simpson <taylor.qemu@gmail.com>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org,
 tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org
Subject: Re: [PATCH v5 13/14] target/hexagon: import additional tests
Message-ID: <20210705185025.3c430550@orange>
In-Reply-To: <CANji28b-AWkJ0C-Co5dYop2ykKgjjR96bw6e+MoaYtukUXKWEg@mail.gmail.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-14-ale.qemu@rev.ng>
 <CANji28b-AWkJ0C-Co5dYop2ykKgjjR96bw6e+MoaYtukUXKWEg@mail.gmail.com>
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

On Fri, 25 Jun 2021 18:56:57 -0500
Taylor Simpson <taylor.qemu@gmail.com> wrote:

> Each of these are very small, so I recommend putting them into misc.c
> or combine all the assembly into a small number of executables.

These tests are designed to run without libc and test in isolation very
specific functionality making as little assumptions as possible about
what instructions are working correctly.

Now that we are mature enough it might not make much sense this
approach, but starting from scratch (and also considering phase 2) they
might be helpful.

With some refactoring and ".include" directives I can probably make a
single executable out of them, but it's not superelegant.

For the rest, I've dropped several outdated comments and superflous
tests.

Thanks for looking into this.

-- 
Alessandro Di Federico
rev.ng

