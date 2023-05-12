Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F93700E55
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 20:03:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxX5Y-0007Ae-LI; Fri, 12 May 2023 14:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pxX5W-0007AO-6u
 for qemu-devel@nongnu.org; Fri, 12 May 2023 14:01:54 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pxX5U-0006Cr-Oi
 for qemu-devel@nongnu.org; Fri, 12 May 2023 14:01:53 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9C4A22955;
 Fri, 12 May 2023 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683914506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=J4kC9ttl9eqs80Kr4fRioA9enQdohb37UIg55Lz2a1A=;
 b=KaxdwkB0gdlFlrF/e/YAuHVLjrU9nuYigvEY1uLuHyQ8iA2XK0H834siwyO65jyAnRGUwS
 yimWez5mih1WplrNp5nLknqTtn8xkX0PNorRFt01QqVLAxdINm3cxHBrLYV5bbUpsrVCmC
 Z1L4Q0Y6bFGOOF4Heg/3p4PKcEKLSP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683914506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=J4kC9ttl9eqs80Kr4fRioA9enQdohb37UIg55Lz2a1A=;
 b=5S7mHvTPc0cEnd09igv2hsZwcm1KCIt8GF1y7WiXEhhYaPqUU908nIKFxv+vucrSv2ZgBE
 ZvjhMRQSYr1gAiBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EFA013499;
 Fri, 12 May 2023 18:01:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oLl/DQp/XmQ7QAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 12 May 2023 18:01:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org, kwolf@redhat.com, armbru@redhat.com,
 eesposit@redhat.com, vsementsov@yandex-team.ru
Subject: Question about QMP and BQL
Date: Fri, 12 May 2023 15:01:43 -0300
Message-ID: <87h6sh2zug.fsf@suse.de>
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

Is there a way to execute a long-standing QMP command outside of the
BQL?

The situation we're seeing is a slow query-block due to a slow system
call (fstat over NFS) causing the main thread to spend too long
holding the global mutex and locking up the vcpu thread when it goes
out of the guest for MMIO.

The call chain for QMP is:

qmp_query_block
bdrv_query_info
bdrv_block_device_info
bdrv_query_image_info
bdrv_do_query_node_info
bdrv_get_allocated_file_size
bdrv_poll_co <- Waiting with qemu_global_mutex locked

[coroutine] bdrv_co_get_allocated_file_size_entry
bdrv_co_get_allocated_file_size
raw_co_get_allocated_file_size
fstat <- SLOW!

The closest I got was moving the coroutine into a separate iothread,
unlocking the global mutex and releasing the bdrv aio_context around
aio_poll. It feels wrong though because we're technically still
operating on the block state but not holding the context.

Is there a more standard way if doing this? Is it possible at all?

Thanks

