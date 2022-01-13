Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474248DB39
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:05:13 +0100 (CET)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82b9-0007EQ-I1
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:05:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81t7-0007A4-PJ; Thu, 13 Jan 2022 10:19:41 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81t6-0006hs-9N; Thu, 13 Jan 2022 10:19:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16A0E210EC;
 Thu, 13 Jan 2022 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642087177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYQjtCr+5dTwNm0r1J0q48aNyuOqDigZ1BF1YTDklTI=;
 b=dwR6Jtuu9q3xFY0r1yQkfTC0+slcbu+FjPsys+B6XO1YqAqXHGMd46LdQ4sbFMUruNHJVr
 9Lm1Aa7SMvFrUHQJ3rYhLqwhcw6IQZijnsF5aZO8P6XNPTsSQpuBXY0aUUmTwKxDGrPOFO
 +R5d2Y3NsClVZldUZkKmePNDRGfj4R0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642087177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYQjtCr+5dTwNm0r1J0q48aNyuOqDigZ1BF1YTDklTI=;
 b=0FVPD0vwrQyvskf2he7t1RvhO6xB8fKtWLJlfupgOZ9yJa0c0Z6rcOdIimBNQUd+Ws0IaG
 rtrGTgArNi+B9tAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC95813DD1;
 Thu, 13 Jan 2022 15:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0zciOQhD4GEwFAAAMHmgww
 (envelope-from <ppavlu@suse.cz>); Thu, 13 Jan 2022 15:19:36 +0000
From: Petr Pavlu <ppavlu@suse.cz>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/intc/arm_gic: Allow reset of the running priority
Date: Thu, 13 Jan 2022 16:19:14 +0100
Message-Id: <20220113151916.17978-1-ppavlu@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=ppavlu@suse.cz;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 10:59:52 -0500
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
Cc: petr.pavlu@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you Peter for review of the first version of the patch. v2 splits
the changes into two commits and updates the code as suggested.



