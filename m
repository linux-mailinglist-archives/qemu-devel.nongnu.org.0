Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4165F1EF1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 21:09:11 +0200 (CEST)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oehrK-0004hf-5U
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 15:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=SdrU=2C=zx2c4.com=Jason@kernel.org>)
 id 1oehpK-0003CE-VW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:07:07 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:49264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=SdrU=2C=zx2c4.com=Jason@kernel.org>)
 id 1oehpI-0003FK-3t
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:07:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3276B8076C;
 Sat,  1 Oct 2022 19:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE40C433D6;
 Sat,  1 Oct 2022 19:06:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="djC69XvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664651210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QA7zGuQENk3BtqiO1ewrxq6jDrOsMoeud+ZCWa/6X7A=;
 b=djC69XvFHgJ7XreoEuHy083/puuBsioylXHlHvkK/8lFprs604kRGIGSZNIsYI6glpZmvs
 zocKWloOEL0G+rCFpKqLeZm63nB9WHqclacAlzHRl9pbnupGuAsVhR2kCs7qXUSf8TNxVh
 47HcvMtD9srlGebMq1x2jaTc5/WUgs4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8fb22790
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 1 Oct 2022 19:06:50 +0000 (UTC)
Date: Sat, 1 Oct 2022 21:06:48 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: f4bug@amsat.org, aurelien@aurel32.net, qemu-devel@nongnu.org
Subject: Re: [PATCH qemu] mips/malta: pass RNG seed to to kernel via env var
Message-ID: <YziPyCqwl5KIE2cf@zx2c4.com>
References: <20220930140520.576374-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220930140520.576374-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=SdrU=2C=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 04:05:20PM +0200, Jason A. Donenfeld wrote:
> With the kernel patch linked below, Linux ingests a RNG seed
> passed from the hypervisor. So, pass this for the Malta platform, and
> reinitialize it on reboot too, so that it's always fresh.
> 
> Link: https://lore.kernel.org/linux-mips/20220930140138.575751-1-Jason@zx2c4.com/

The kernel side of this has now landed, so we can move ahead on the QEMU
side:
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=056a68cea01edfa78b3474af1bfa39cc6bcc7bee

