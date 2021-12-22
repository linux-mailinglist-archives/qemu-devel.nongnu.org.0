Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982047D10A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:33:50 +0100 (CET)
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzsT-0007cO-24
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mzzqE-0005WQ-V2
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:31:30 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:57232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mzzqD-0006hc-6f
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:31:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F19D8212BA;
 Wed, 22 Dec 2021 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1640172686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1SCNs+eDU+1iH3rFIWpqaTA1xmxkr8lx/KFY7xwKM5Q=;
 b=mancpHrhyr7jO4L+xgiH1kVsOI2wnswBi1M3THmR2SEgg6QjbSizWJrRAkHWLCPJL0DiZk
 PMfF+i35NBZmosI0AtabiNOlVZCZ6QHN5B2RMrA6bq/BAZvynKppHAyO7Ptz9vv5d3F7hf
 yluoIEquIosqkhg4lZFM3wSsPBe3oB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1640172686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1SCNs+eDU+1iH3rFIWpqaTA1xmxkr8lx/KFY7xwKM5Q=;
 b=1NwsZsH2QqhQT2dlxFAGPgSTsNqFf4J2qlfFBaC2iRGjdAZj4UcBDipqFHCxPhYreR6Hmv
 WHPRdDZale6pt9Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B658913D10;
 Wed, 22 Dec 2021 11:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pQwMK40Mw2HBFQAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 22 Dec 2021 11:31:25 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] multifd: cleanup some source code
Date: Wed, 22 Dec 2021 12:30:47 +0100
Message-Id: <20211222113049.9326-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When looking into the multifd source code, some of them 
can be improved. This patchset is to cleanup the functions 
multifd_channel_connect and multfd_send_thead. 

The functions are tested without any errors.

Li Zhang (2):
  multifd: cleanup the function multifd_channel_connect
  multifd: cleanup the function multifd_send_thread

 migration/multifd.c | 131 ++++++++++++++++++++++----------------------
 1 file changed, 65 insertions(+), 66 deletions(-)

-- 
2.31.1


