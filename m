Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21A3F2DF3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:22:14 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5PR-0005sa-0C
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jn-00053b-JM
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jk-0000pz-Ow
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:23 -0400
Received: by mail-wm1-x32e.google.com with SMTP id u15so6063115wmj.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg6+KpJbnguAJ/gNGg9PINyByK29TuOzCc8uKqHAZlM=;
 b=fBBPEmw4ASF5bB/71kjwyFN27D19doG6OoRvS0BIHXrnkjw4rVIr27tVcMOHGuQT2a
 t/LSrXozJ8v3csqJ8eeI7+Ms8N5suYJAZy2+NfwnQedjZt0bwDTfVOVFLieraLTe0Mqz
 889jn0vio/0zAX9ziCRjwD12qO35AJtazvpghpnxVv6vZd8EBeyWhbrnravpGrjIyC0R
 Sa7lvAueJljvL4cjpkPsBiW2FmSg6yAOwqGLdsDNFqIkiJhqT5SjuwxX+QQzot60Wv8E
 vds6GfkqJKvKqgg+k2BZ8W4KMGw5jY0gbEd9EoIjp9NSCnbdM7JTcajsIaF5cEzir/q5
 Vw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg6+KpJbnguAJ/gNGg9PINyByK29TuOzCc8uKqHAZlM=;
 b=tPsNZXayIrGiW6xLzG3s5B2BdHoYMjA/X0hSCUmBPfCsLgMgHu+xvWVyTydDlP9Qtp
 j2QsBUk+a/mpFGzpzIefhNPniX7rrZnENbQkmiJxB3XjTFra27FlqXpQ4Fj1UXgFnzT/
 25vgUk+E6mlLuGsPSluylPEH49U25Mmv4WExyDWafIN/nFxmOPu8fcqinZZ1bi9BONh4
 sRjgbKVF4mjtSL3WQ4LtKtJzDJVsT03WpALoz6yu2SctJbc9HUi08tkH8Ha2DDUpY70G
 VbhOovdwboaSiFVuOGAwBLxvGU3tMKqDtpSNpkLz7uwJWLhE5xaZcmTZnSFbDvTay85j
 AIkA==
X-Gm-Message-State: AOAM533s/t6B+3XtHNCx9Jj0O37CR7Z4XVKlmcLNN7oyb9LpM+u0ttt9
 X+v818ID1TPzuiJvnvE3DZJsQoBT/CPi+g==
X-Google-Smtp-Source: ABdhPJz3RQDvVSzppvgtjd0t6bcGbss4Ujifl/Jnf7OYQ4KmyeVnBuLCvFFk2BkJgSmsAWLaNMh0Rg==
X-Received: by 2002:a05:600c:364b:: with SMTP id
 y11mr4207893wmq.11.1629468978041; 
 Fri, 20 Aug 2021 07:16:18 -0700 (PDT)
Received: from laral.fritz.box
 (dslb-088-066-221-248.088.066.pools.vodafone-ip.de. [88.66.221.248])
 by smtp.gmail.com with ESMTPSA id a133sm10578968wme.5.2021.08.20.07.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 07:16:17 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/i386: V_IRQ masking and V_TPR fixes
Date: Fri, 20 Aug 2021 16:15:54 +0200
Message-Id: <20210820141558.9031-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 2 adds VGIF capability to mask virtual interrupts.
Patches 3 and 4 fix bugs related to vTPR, while patch 1 refactors
int_ctl into the state structure to simplify the fixes in the
following patches.

Lara Lazier (4):
  target/i386: Moved int_ctl into CPUX86State structure
  target/i386: Added VGIF V_IRQ masking capability
  target/i386: Added ignore TPR check in ctl_has_irq
  target/i386: Added changed priority check for VIRQ

 slirp                                |  2 +-
 target/i386/cpu.c                    |  9 ++--
 target/i386/cpu.h                    | 18 ++++++++
 target/i386/machine.c                | 22 +++++++++-
 target/i386/tcg/seg_helper.c         |  2 +-
 target/i386/tcg/sysemu/misc_helper.c | 11 ++++-
 target/i386/tcg/sysemu/svm_helper.c  | 62 +++++++++++-----------------
 7 files changed, 79 insertions(+), 47 deletions(-)

-- 
2.25.1


