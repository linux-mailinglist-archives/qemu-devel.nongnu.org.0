Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABD16E2287
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:46:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHor-0006Ly-TV; Fri, 14 Apr 2023 07:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnHnJ-0005Fy-FU; Fri, 14 Apr 2023 07:40:50 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnHnG-00022I-M2; Fri, 14 Apr 2023 07:40:44 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E508219DA;
 Fri, 14 Apr 2023 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681472440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5D/S8wUPYSaJyV+E530H2/P265W9H79yMNpZZWRSbS0=;
 b=t1nTX4kCO+pgt+qT37FF6G1QQ2bNi8BAdxPYcMapMhk4fuuBwcq4h3QFM76I+THCiMKeAT
 /isqsHkttUJ6dPQzKVxD/kNT2TtgePuLPhUGl/cTt9mWRtsoUgI+2wwUovWf6XmHa0gffc
 5+7s9mxePGF6SIeRy1IZLP2eAsP9hEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681472440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5D/S8wUPYSaJyV+E530H2/P265W9H79yMNpZZWRSbS0=;
 b=X/yAHIm/7FtjUPSoyRvrC/cKh2DDj+BtF1ord2PaUJiMrTdJlMJ9nl/zmAIkzFNP7lKII+
 9CiQ2l1xLPlCqTCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC18A13498;
 Fri, 14 Apr 2023 11:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r6OYJLc7OWQ/TgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 14 Apr 2023 11:40:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: Re: [PATCH 1/5] ppc: spapr: cleanup cr get/store with helper routines.
In-Reply-To: <20230331065344.112341-2-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-2-harshpb@linux.ibm.com>
Date: Fri, 14 Apr 2023 08:40:37 -0300
Message-ID: <87y1muite2.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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

A bit vague on the subject line. I would expect to see some mention to
nested at least.

> The bits in cr reg are grouped into eight 4-bit fields represented
> by env->crf[8] and the related calculations should be abstracted to
> keep the calling routines simpler to read. This is a step towards
> cleaning up the [h_enter|spapr_exit]_nested calls for better readability.
>
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

