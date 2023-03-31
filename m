Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AFF6D29F3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 23:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piMFr-0000bL-AR; Fri, 31 Mar 2023 17:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1piMFZ-0000Vl-Q6; Fri, 31 Mar 2023 17:25:38 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1piMFX-0005Q9-Eu; Fri, 31 Mar 2023 17:25:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 567C91FDE6;
 Fri, 31 Mar 2023 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680297929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BMlDsM1D+ez8VuWKjZmV2YQd6UyYiK/RU+lypXVu7Vg=;
 b=Kszt4P0UcfhHCFGR6tRRlG4c8ImcNAeh7oeYTgatbJ2RcF9hnMJRwdi2BAchmM4131Vz+J
 7LpQyNadHDLsRcBfkJw9kAK0DYQqUZSDRjYsALWORWfT2WZ4DFSLPIYnvDX6LWedlNZO2y
 ATLJwbP830pkL4d2KGTFGGu9Q531w+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680297929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BMlDsM1D+ez8VuWKjZmV2YQd6UyYiK/RU+lypXVu7Vg=;
 b=VkCszlEJ0PzEyq82xAfov6zCqZ9ecl+NYDQSz4PDns47+R6ZLMYpcP824FULCzDbnXCf5n
 uT/mQ+oHl+VhISAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D429B134F7;
 Fri, 31 Mar 2023 21:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +OedJshPJ2Q9IwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 31 Mar 2023 21:25:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 4/6] target/ppc: Alignment faults do not set DSISR in
 ISA v3.0 onward
In-Reply-To: <20230327131218.2721044-4-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
 <20230327131218.2721044-4-npiggin@gmail.com>
Date: Fri, 31 Mar 2023 18:25:26 -0300
Message-ID: <87h6u0zk8p.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Nicholas Piggin <npiggin@gmail.com> writes:

> This optional behavior was removed from the ISA in v3.0, see
> Summary of Changes preface:
>
>   Data Storage Interrupt Status Register for Alignment Interrupt:
>   Simplifies the Alignment interrupt by remov- ing the Data Storage
>   Interrupt Status Register (DSISR) from the set of registers modified
>   by the Alignment interrupt.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

