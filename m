Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE66F5704
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 13:15:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puAQq-0004MG-AW; Wed, 03 May 2023 07:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1puAQo-0004Lw-A1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:13:58 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1puAQm-0000fc-Qu
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:13:58 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 52D542267B;
 Wed,  3 May 2023 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683112435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RpubMwQV6+X5B0u2uHGTnW/SXNHmam6OZJwn+QZxoIY=;
 b=X+M4EDwLIQ+zifXv9zsXnr5jwaiaO1TSp9ors/oWFjnsjQv2WSxd4r6FhcxkE6+WepaHxD
 ST6pNZaztC1nuUbvgPqNKcFAWbRTOnYQ+h4z4EATs+j0KRRtu//OgguOiQ5aJc64pxqH+A
 SmeomIybPdmf/XY07SQ9r+nbLzT0EDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683112435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RpubMwQV6+X5B0u2uHGTnW/SXNHmam6OZJwn+QZxoIY=;
 b=E2t5icuA3wSIukzJTnvrM8bWpbCu44pTDxuOllCuxMoL/GEnycs/FQPia6bLpClOVedZ8o
 TSJM6b01zlafLDAA==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 358522C141;
 Wed,  3 May 2023 11:13:55 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 26EB04AAD8C; Wed,  3 May 2023 13:13:55 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: laurent@vivier.eu,  qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: Add /proc/cpuinfo handler for RISC-V
In-Reply-To: <mvmttwu4tw7.fsf@suse.de> (Andreas Schwab's message of "Tue, 02
 May 2023 17:47:52 +0200")
References: <mhng-387c6a65-31c0-4fcd-bf29-bd798c2a47f6@palmer-ri-x1c9>
 <mvmttwu4tw7.fsf@suse.de>
X-Yow: I've got a COUSIN who works in the GARMENT DISTRICT...
Date: Wed, 03 May 2023 13:13:55 +0200
Message-ID: <mvm354d4qh8.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=schwab@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mai 02 2023, Andreas Schwab wrote:

> None of the currently defined cpus are non-GC cpus (except sifive_e, but
> that is not suitable for user-space anyway), and there doesn't appear to
> be any properties defined for changing the supported extensions.

Actually, modifying the extensions is possible for the base cpus (rv32
and rv64).

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

