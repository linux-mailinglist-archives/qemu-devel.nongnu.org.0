Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B16E22CD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 14:05:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnIAI-0008NE-V5; Fri, 14 Apr 2023 08:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnIAC-0008MH-IS; Fri, 14 Apr 2023 08:04:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnI9z-0007aa-N0; Fri, 14 Apr 2023 08:04:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50DBD219CC;
 Fri, 14 Apr 2023 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681473847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qUZM6dGZ6DNJO98SfNpiFkGEe+ZICwJCfBihUGkS1xY=;
 b=QD6zYZYVtRp0lLjdVz1WLfWBUHu5Wnnz6Q3Y7Pmt838rAAiKTyaCvZyYP0TPW3itTn/hkK
 riP0Npk80A5Sf1OJG//04dl8qPulC452yFwvfs+Ip67e09x5rkaGWLewCn0NmHKrZqk/iG
 S/fcwqdztnnavnzSLijqyTfSe6WrFnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681473847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qUZM6dGZ6DNJO98SfNpiFkGEe+ZICwJCfBihUGkS1xY=;
 b=bNQMcl6pN2K5WI9fXcLVGEgueuthq4+GQGjsemj4+Og9cD2xPC+L1CoNJJcNThe14uvIqW
 CTA+4NOLH5PWeGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C79C413498;
 Fri, 14 Apr 2023 12:04:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XtaqIzZBOWTkWgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 14 Apr 2023 12:04:06 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: Re: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
In-Reply-To: <20230331065344.112341-1-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
Date: Fri, 14 Apr 2023 09:04:04 -0300
Message-ID: <87mt3aisaz.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

Harsh Prateek Bora <harshpb@linux.ibm.com> writes:

> This patchset introduces helper routines to enable (and does) cleaning
> up of h_enter_nested() and spapr_exit_nested() routines in existing api
> for nested virtualization on Power/SPAPR for better code readability / 
> maintenance. No functional changes intended with this patchset.

Do we have tests for this nested virtual hypervisor code? It would be
good to have at least a smoke test. I remember someone started adding
support to qemu-ppc-boot, probably Murilo. I suggest you take a look
around and maybe see what it takes to add it.

Just a L0 TCG with a small-ish qemu inside of it and a script to start
an L2.

>
> Harsh Prateek Bora (5):
>   ppc: spapr: cleanup cr get/store with helper routines.
>   ppc: spapr: cleanup h_enter_nested() with helper routines.
>   ppc: spapr: assert early rather late in h_enter_nested()
>   ppc: spapr: cleanup spapr_exit_nested() with helper routines.
>   MAINTAINERS: Adding myself in the list for ppc/spapr
>
>  MAINTAINERS          |   1 +
>  hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++-------------------
>  target/ppc/cpu.c     |  17 +++
>  target/ppc/cpu.h     |   2 +
>  4 files changed, 161 insertions(+), 110 deletions(-)

