Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126D699B35
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShz0-0008Vs-WB; Thu, 16 Feb 2023 12:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pShyy-0008Us-3h; Thu, 16 Feb 2023 12:23:44 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pShyw-0003Ty-MV; Thu, 16 Feb 2023 12:23:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EF0361E60;
 Thu, 16 Feb 2023 17:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE7C4339B;
 Thu, 16 Feb 2023 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676568219;
 bh=nUeyq2HgyKu6/w5PwEkV0wePKGLbAtXKaYyFiT9Zhww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDwSpIbWd43qkbn9i6pCZqJti27wo2Yly+oMgPSfeDQWUGwyEEKrGFrUG5upO2QFA
 RE+/TJLNuNZMwFScDcV+m/qX7hdJ0fNg9OExbjMB1g3W/IQZZClUDfRxEmYt108qZs
 YAi1uRe0FnElhvr15WDVbYSkTy/AQ8jhhMz84KKnxuF+lt0sezdaHjrBUZahBAe6zy
 ldeDoq69R0VrlJSBTYNebUN86USpM794ysI1YZTRfLMaDTXq5GY/m4e5vnNsg4r7Rv
 UTbr9iV9/S04yx0MjWIez0/WmiWEy8F5Ie1PzPDCKOcuYIi/6MiHjVhrxM+V3JkM8K
 YHm0Nsxsam92g==
Date: Thu, 16 Feb 2023 10:23:35 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jesper Devantier <jwd@defmacro.it>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 4/5] hw/nvme: basic directives support
Message-ID: <Y+5ml5+YGC+kpU86@kbusch-mbp>
References: <20230216164806.233533-1-jwd@defmacro.it>
 <20230216164806.233533-5-jwd@defmacro.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216164806.233533-5-jwd@defmacro.it>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 05:48:05PM +0100, Jesper Devantier wrote:
> +enum NvmeDirective {
> +    NVME_DIRECTIVE_SUPPORTED = 0x0,
> +    NVME_DIRECTIVE_ENABLED   = 0x1,
> +};

What's this?

