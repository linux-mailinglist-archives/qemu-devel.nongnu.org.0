Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B4322073
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:48:31 +0100 (CET)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHC2-00079x-DN
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9R-0005Nz-0z; Mon, 22 Feb 2021 14:45:49 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9P-0004D7-23; Mon, 22 Feb 2021 14:45:48 -0500
Received: by mail-qk1-x732.google.com with SMTP id b14so13902520qkk.0;
 Mon, 22 Feb 2021 11:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9SoM1pcAeb3j3z9cIeQrgXO5n6NWQBk3E28Xq1g124I=;
 b=gnh5dQWCQ9lZwL83kyFlJa1C6kUYLl3mMtz+i099qqEuC/vSjqaIcxTzvfs08SdSlI
 9RIwlUXbunPzr+cotv0u9a3jA911b0FvL4RFHKixAbOXN8ENjw7aUU4cUvTCppuZtFjN
 cgnxJFo+4aigy6KNJLQIU6JVYbY9aSIEN2LVw8C89pA+nUtRDom9GaiTgnhgcsc7abC4
 uZAKtJ77gc59m90ENI+NXD6VeggsY+zb9sPBcmk2pp3M9j9vQQdImOuTkp4VtXhJfEEg
 CFi+liXwIvPnfs8kOtwSKcMF513wUvBLGZnuU5sZvtaEkxPsdYpYObkGhayf2Ivpty6O
 ACpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9SoM1pcAeb3j3z9cIeQrgXO5n6NWQBk3E28Xq1g124I=;
 b=PQmUGTxvdsQ7JOuMEKefOBuSiQYi2YFKztrtieDyDlfZvVBO7NSzEPd3YqRWndpFPM
 b9hYvgofYVCkTe5mqZDdaQlW0vlZ2cPvDMC7w9h6hl2xv/OeAkNPNUJ2tar69JBUpR2T
 1M+4iLS0dsEDzZRHtykZzPgRRKGY/ssJEkoEyzP2DpsfW/yypbEeJsc+B8yHlcGj9xS6
 PlybKcbW3Y9Ph2gAgxuVJAdF29dwCb7M51e3VKRSkkX7UTJpeNMjUMvf3Bdv+/J4fhg/
 dL//MVZ7eaQN84/fqYOdi34cH/r3GyHJNyTa0eweu6QF3CC8ouaB1NNOTegxCAUI/0hm
 h0Gg==
X-Gm-Message-State: AOAM532zfmA1Mx6u/QGSF6YA8EbJGULM0Qyjd8uppNMQxBffreMsR190
 CMZ8f4PDpLnhMCxWmWxGcYvhQvYEq2fVvQ==
X-Google-Smtp-Source: ABdhPJwXI5oJEuTcbb+D9ap1To4Q8D8CrSbw76uzarJyuiJBdc7QRp9t/sC8zIUvSbx6D0UWiUNOEQ==
X-Received: by 2002:a05:620a:21da:: with SMTP id
 h26mr7224035qka.81.1614023143856; 
 Mon, 22 Feb 2021 11:45:43 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id 82sm13483178qkd.48.2021.02.22.11.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:45:43 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] CPU unplug timeout/LMB unplug cleanup in DRC
 reconfiguration
Date: Mon, 22 Feb 2021 16:45:26 -0300
Message-Id: <20210222194531.62717-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains fixes proposed during the review of v3.
Patches were rebased on top of David's ppc-for-6.0.


changes from v3:
- former patch 1: already pushed to ppc-for-6.0
- former patch 2: dropped
- all patches: commit message trimmed to < 76 chars per line
- all patches: added R-bs from previous review
- patch 3:
    * removed the migratable state of the unplug timer
    * added a 'spapr_drc_start_unplug_timeout_timer()' helper to start the timer
    * added a .post_load implementation to vmstate_spapr_drc, pointed to
      a new spapr_drc_post_load() function
    * spapr_drc_post_load() starts the DRC unplug timer from the beginning using
      spapr_drc_start_unplug_timeout_timer()

- patch 4:
    * use spapr_drc_start_unplug_timeout_timer() to start the timer in spapr_drc_unplug_request()
    (To David: I kept your Reviewed-by in this patch despite this change - feel free
     to review it again)

- patch 5:
    * removed the 'DIMM' wording when referring to kernel internals
    * move the g_assert() to spapr_clear_pending_dimm_unplug_state()
    * do not g_assert(dev), but g_assert(ds) if dev != NULL inside
      spapr_clear_pending_dimm_unplug_state()

- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg04196.html

Daniel Henrique Barboza (5):
  spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unusable
  spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
  spapr_drc.c: introduce unplug_timeout_timer
  spapr_drc.c: add hotunplug timeout for CPUs
  spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state

 hw/ppc/spapr.c             | 53 ++++++++++++++++++--
 hw/ppc/spapr_drc.c         | 99 +++++++++++++++++++++++++++++++-------
 hw/ppc/spapr_pci.c         |  4 +-
 hw/ppc/trace-events        |  2 +-
 include/hw/ppc/spapr.h     |  2 +
 include/hw/ppc/spapr_drc.h |  7 ++-
 6 files changed, 142 insertions(+), 25 deletions(-)

-- 
2.29.2


