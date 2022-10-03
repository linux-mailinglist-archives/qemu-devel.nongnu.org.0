Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2D5F35BF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 20:42:21 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofQOS-0003l8-Gj
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 14:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofQ6V-0001Wt-FW
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 14:23:47 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:55046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofQ6S-0001ns-Er
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 14:23:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAA5E611A7;
 Mon,  3 Oct 2022 18:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29B9C433D7;
 Mon,  3 Oct 2022 18:23:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="puD4eKgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664821419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i/umX2EJd/151OJUq0Qkx0SBKKTk9wuga1ldEd6mcVU=;
 b=puD4eKgusNAMMFZTnGpkdQGaClz/aHnHmfrFDjlYxwNEOvYcubfXh8f2aEbpXUMozo9laM
 poTCt9e91g/jEeYqdi5WcC9ny7xZGCFJxomQnnMoMQ2gl3OvOwYcUGzVZN6suBmtY4Z1eW
 Zze5hlq2eLhAhoUQ6CLjOTUFaAsIw3c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d7b91f03
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 3 Oct 2022 18:23:39 +0000 (UTC)
Date: Mon, 3 Oct 2022 20:23:36 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
Message-ID: <YzsoqHcSQ6kd+QD2@zx2c4.com>
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003103627.947985-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

On Mon, Oct 03, 2022 at 12:36:27PM +0200, Jason A. Donenfeld wrote:
> As of the kernel commit linked below, Linux ingests an RNG seed
> passed from the hypervisor. So, pass this for the Malta platform, and
> reinitialize it on reboot too, so that it's always fresh.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Link: https://git.kernel.org/mips/c/056a68cea01

FYI, the kernel side of things has now been merged to Linus' tree and
will be in 6.1-rc1: https://git.kernel.org/torvalds/c/056a68cea01 (Still
waiting on this QEMU patch obviously).

Jason

