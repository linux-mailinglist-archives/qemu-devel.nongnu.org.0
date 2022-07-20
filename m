Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41457B6FD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:06:43 +0200 (CEST)
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9PV-0005nb-Kj
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE9Mg-0003dx-26
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:03:46 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:44300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE9Md-0005MU-Ah
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:03:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36847617E1;
 Wed, 20 Jul 2022 13:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C502C3411E;
 Wed, 20 Jul 2022 13:03:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="O09wV/Q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658322218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exaufL3xHDuHnrF89Kd694SlHv/Ot+ugMLyjKTTzZ9o=;
 b=O09wV/Q6kO+NBusEz+sWMIBHcu5o6oFl/xB7RpdLIpwIDQMkuU0ac9mWnkYkJOEP5T25NJ
 +lKhS8hEOsFAIIHc0V0MVRehRy5hyp5ZqsOgf8SW1ZV74a35XWV3voTk8oV1AQUlLXCt19
 rjXU9kkROe7erpruqwtM0QuHTsVZg6c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b6136da
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 20 Jul 2022 13:03:38 +0000 (UTC)
Date: Wed, 20 Jul 2022 15:03:37 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH resend v3] hw/i386: pass RNG seed via setup_data entry
Message-ID: <Ytf9KVQNOZBI5u8f@zx2c4.com>
References: <20220711145432.56704-1-Jason@zx2c4.com>
 <20220719115300.104095-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719115300.104095-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

Hi Paolo,

On Tue, Jul 19, 2022 at 01:53:00PM +0200, Jason A. Donenfeld wrote:
> Tiny machines optimized for fast boot time generally don't use EFI,
> which means a random seed has to be supplied some other way. For this
> purpose, Linux (≥5.20) supports passing a seed in the setup_data table
> with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> specialized bootloaders. The linked commit shows the upstream kernel
> implementation.

Having received your message in the other thread hinting, "I think
there are some issues with migration compatibility of setup_data and
they snowball a bit, so I'll reply there," and being a bit eager to get
this moving, I thought I'd preempt that discussion by trying to guess
what you have in mind and replying to it. Speculative email execution...

The SETUP_RNG_SEED parameter is used only during boot, and Linux takes
pains to zero out its content after using. If a VM is migrated or
copied, the RNG state is also migrated, just as is the case before
SETUP_RNG_SEED. For that reason, Linux also has a "vmgenid" driver,
which QEMU supports via `-device vmgenid,guid=auto`, which is an ACPI
mechanism for telling the RNG to reseed under various migration
circumstances. But this is merely complementary to SETUP_RNG_SEED, which
is intended as a very simple mechanism for passing a seed at the
earliest moment in boot, akin to DT's "rng-seed" node.

Hopefully this answers what I think you were going to ask, and sorry if
it's a total non-sequitur.

Regards,
Jason

