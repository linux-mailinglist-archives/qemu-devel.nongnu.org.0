Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE3394B39
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 11:14:16 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmv2s-0004FL-PJ
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 05:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lmv20-0002ux-QJ
 for qemu-devel@nongnu.org; Sat, 29 May 2021 05:13:20 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lmv1z-0000c5-7X
 for qemu-devel@nongnu.org; Sat, 29 May 2021 05:13:20 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B9051FD2E;
 Sat, 29 May 2021 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622279596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gPpdHYqexkhpJFPtrzISl3ZCy+/VkvXUx1iUIIDxOXU=;
 b=yR+GnwjsEP5S2mMaWNKRE72b8cZO/yLRgVslrxi7s0XuLVWP+zDiznJX25lY+g/tC3Jzou
 yCBOve0M+zmzvxPY6m8SKJd1ENdzBM1KbnLOgsQC0dCDWEcsIF7/ixeb6AgvHIa456ar6K
 D52o2IoeD58yHvIjKJITa8bEVkeWZ8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622279596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gPpdHYqexkhpJFPtrzISl3ZCy+/VkvXUx1iUIIDxOXU=;
 b=if68VALKHVsXGXOK5ONp0YH12ivWQRLfkZYQg18UodmQ50cCHfsZqJyxlTgL7/3JZr1n0J
 uEnliR5KY744vtBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 94043118DD;
 Sat, 29 May 2021 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622279596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gPpdHYqexkhpJFPtrzISl3ZCy+/VkvXUx1iUIIDxOXU=;
 b=yR+GnwjsEP5S2mMaWNKRE72b8cZO/yLRgVslrxi7s0XuLVWP+zDiznJX25lY+g/tC3Jzou
 yCBOve0M+zmzvxPY6m8SKJd1ENdzBM1KbnLOgsQC0dCDWEcsIF7/ixeb6AgvHIa456ar6K
 D52o2IoeD58yHvIjKJITa8bEVkeWZ8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622279596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gPpdHYqexkhpJFPtrzISl3ZCy+/VkvXUx1iUIIDxOXU=;
 b=if68VALKHVsXGXOK5ONp0YH12ivWQRLfkZYQg18UodmQ50cCHfsZqJyxlTgL7/3JZr1n0J
 uEnliR5KY744vtBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Y3i9IasFsmCbEwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Sat, 29 May 2021 09:13:15 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Siddharth Chandrasekaran <sidcha@amazon.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/2] Fixes for broken commit 48afe6e4eabf,
 Windows fails to boot
Date: Sat, 29 May 2021 11:13:11 +0200
Message-Id: <20210529091313.16708-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 5.00
X-Spamd-Result: default: False [5.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_CONTAINS_FROM(1.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2]
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit ("i386: split cpu accelerators from cpu.c, using AccelCPUClass")
introduced two bugs that break cpu max and host in the refactoring,
by running initializations in the wrong order.

This small series of two patches is an attempt to correct the situation.

Please provide your test results and feedback, thanks!

Claudio

Claudio Fontana (2):
  i386: reorder call to cpu_exec_realizefn in x86_cpu_realizefn
  i386: run accel_cpu_instance_init as instance_post_init

 target/i386/cpu.c | 66 +++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

-- 
2.26.2


