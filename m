Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF21659C9D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 23:00:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBNQE-0005fW-BG; Fri, 30 Dec 2022 17:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBNQ2-0005eQ-Iy
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:00:05 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBNPz-0004pP-Fx
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:00:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A4AD61C2A;
 Fri, 30 Dec 2022 21:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607C6C433EF;
 Fri, 30 Dec 2022 21:59:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="A9NOIL6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672437593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lt8RccqW0EZGdcsp4V34geQbTFJgnELz8Rhyk+5m6GU=;
 b=A9NOIL6GumZlZuuJSvm/ukN5gXjRMFRJ8nI5syRESrj3smE5vsP1yiFDnW1Bg2c1c8A6tq
 opxkL3iQhoNYF9aXaoi8j73Iq0Zu5M66COrEPPC/Vbk8/4PsQbZAg00VfABM6cc+HNzYST
 2hhOJkykZcSSV4ZgVvuFTKIKzUzxg60=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fdaa9073
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 30 Dec 2022 21:59:53 +0000 (UTC)
Date: Fri, 30 Dec 2022 22:59:46 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 ardb@kernel.org, kraxel@redhat.com, hpa@zytor.com, bp@alien8.de,
 philmd@linaro.org
Subject: Re: [PATCH qemu v2] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y69fUstLKNv/RLd7@zx2c4.com>
References: <20221230183819.604388-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221230183819.604388-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=ek1s=44=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 30, 2022 at 07:38:19PM +0100, Jason A. Donenfeld wrote:
> The microvm machine has a gross hack where it fiddles with fw_cfg data
> after the fact. So this hack is updated to account for this appending,
> by reserving some bytes.

This is a little derpy. I'll send a v3 in a second to clean this up.

