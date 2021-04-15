Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B43603F3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:12:24 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWx6t-0002sP-VK
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lWx5d-0001k6-QU; Thu, 15 Apr 2021 04:11:06 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lWx5a-0004RM-DY; Thu, 15 Apr 2021 04:11:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618474236; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=bHqFLL/VwWUuNCfCYmwyBOKLOHpAvHtUslAoPXqzu1IGjqiWZGB3JuGpx3ddPldZqo/gjw403lNetK/58Lb+QXDOkn9SZMJXIYHvxfB/YZbt9jGyT85WLw0vTPbjUBa37qLUH5JYLMEOUtROl5wGb8Dpqs1bsO/tbjbxR29Ob/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1618474236;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Sf0YNWGK0IYdwTqDVu3dWpyzCzBpBfU6Mr/JOJdwZVQ=; 
 b=DPd6dtxDAaGEePig1xdOhu90n9IAfa3WlqiVyaZ+8mPCU6s5/UPSK3u1/dJiDbDXE/lyCONlmKc64xm6VvbfuSry3VmkVlhzzyWRJi0ueU3icRfVeD+Mdn7ibP6T47Ye63169XT+fMnKc5Ks1pFjqN3gCI3l7I0UVmjRfCQN2o0=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1618474236; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=Sf0YNWGK0IYdwTqDVu3dWpyzCzBpBfU6Mr/JOJdwZVQ=;
 b=BLHDGH2KDbURdmd3mNCYG8spPKcsk4ALP4EArliRbxEosnk8xtWS7H8vy91YCLRv
 Wyx7Qtx7lU5K0AA4wrSE9o5q5lQGS9lTvMmkfj1Ey/CLW2HH1LzfqOFc2pk8pK9fgDw
 7X5swBD8x1lC0bUtY5PMSpd5j3jNcm1dV7k429bc=
Received: from localhost (139.59.189.172 [139.59.189.172]) by mx.zoho.com.cn
 with SMTPS id 1618474234417895.2208322351457;
 Thu, 15 Apr 2021 16:10:34 +0800 (CST)
Date: Thu, 15 Apr 2021 08:09:30 +0000
From: Fam Zheng <fam@euphon.net>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] util/async: print leaked BH name when AioContext
 finalizes
Message-ID: <20210415080930.GA2259808@do.euphon.net>
References: <20210414200247.917496-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414200247.917496-1-stefanha@redhat.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 eric.g.ernst@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-04-14 21:02, Stefan Hajnoczi wrote:
> Eric Ernst and I debugged a BH leak and it was more involved than it should be.
> The problem is that BHs don't have a human-readable identifier, so low-level
> debugging techniques and inferences about the code are required to figure out
> which BH was leaked in production environments without easy debug access.
> 
> The leak ended up already being fixed upstream but let's improve diagnostics
> for leaked BHs so that this becomes quick and easy in the future.
> 
> Stefan Hajnoczi (2):
>   util/async: add a human-readable name to BHs for debugging
>   util/async: print leaked BH name when AioContext finalizes
> 
>  include/block/aio.h            | 31 ++++++++++++++++++++++++++++---
>  include/qemu/main-loop.h       |  4 +++-
>  tests/unit/ptimer-test-stubs.c |  2 +-
>  util/async.c                   | 25 +++++++++++++++++++++----
>  util/main-loop.c               |  4 ++--
>  5 files changed, 55 insertions(+), 11 deletions(-)
> 
> -- 
> 2.30.2
> 

Reviewed-by: Fam Zheng <fam@euphon.net>

