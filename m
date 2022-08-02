Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F9558815F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 19:56:47 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIw8M-0000XO-JN
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 13:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIw7E-0007Yt-Dd; Tue, 02 Aug 2022 13:55:36 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:48728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIw7C-0003Cx-7l; Tue, 02 Aug 2022 13:55:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40158B81FE0;
 Tue,  2 Aug 2022 17:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0041CC433C1;
 Tue,  2 Aug 2022 17:55:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bwuUV/vY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659462924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HZj+98GA/bHfAbgsU5395XchKU71TwCtrL43ApOJPxg=;
 b=bwuUV/vY+9fTEDp6EQPnPzIrHWJI7LltlbH9sv3tv40oNm8tqOIIRVceBgsy6jqWdmHqW1
 YNoboEGPJfdCqpaKdgJgr/NWMxx7iECSLb/Svqm2y0DaUU7Om2LBcidCDjbwpoV+KoGtr4
 Y6/jqP+uFf0qM3ds9kOC3jNAc1aIsEY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2c2eeb9d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 2 Aug 2022 17:55:23 +0000 (UTC)
Date: Tue, 2 Aug 2022 19:55:18 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: david@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Message-ID: <YullBrBTxuDB2lEd@zx2c4.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220720120859.339788-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Wed, Jul 20, 2022 at 02:08:59PM +0200, Jason A. Donenfeld wrote:
> +    case 114:
> +        if (r1 & 1 || !r1 || r2 & 1 || !r2)
> +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);

This is already handled in op_msa. I'm going to remove it for v4.

