Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E11367681
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 02:52:28 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZNZz-00053z-Cy
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 20:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZNYf-0004Xf-5A
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 20:51:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZNYb-0006Pv-NZ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 20:51:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id s7so42967047wru.6
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 17:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjJbFzvDUXaSWsH8wYXQ6N1QydRorcAJ1MHbnPDyhaU=;
 b=G+xK/VBgwoRZmAXc7rKsSSdDpICBcJ2qH2dxGcf7x63RtJsCcoTxJMRYKXUzjWWrHw
 wlN/ZtrZBHLlVQjWth/VXI9Nn/t0u6Xo5DHyGL9u/8dLJU5Y3/D1ezQp432q7Vhk4IoA
 AKt6obWMnUmONHZtNlBBfD9XFu6G8fr510zij8V3I8iXysuUzO+ROrJSeVOtYh9eHlVE
 nk4YEp1sX4NHH7aLF/BbDzDgXhiXLCvIS8pAu0WeHxntceryXKe5bqJ26r1RYDSjtaJ4
 9z3Lj8BHQkAvdIil9zXFAsKS10TRCVxgCmbDhLHE9K1+J7HU65MaWEGWFfjPs6ah4eAi
 RLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjJbFzvDUXaSWsH8wYXQ6N1QydRorcAJ1MHbnPDyhaU=;
 b=AKFBDuKxdrQAKlKa56FFBII9OrwFZt6oq91wDRrbEgpXbUWfXAsNYyaZ3rbmMUKw37
 Nbu9D+QMt9iY+b7RLL77Z9uqz9don5adrK7YOCNnm0hVgIfwhEpZOzI/pmrdzto5rsfC
 QmMpaM6xZCPOg8Y7PVnKRbBQLR/TCelM/urBxNj7MiEh3jZcmauLxTUAzAlOkh4+NqEc
 iYTpuPiFHZCRIx9LoYoq/8yZzYhuGJ0GJRBvf13qklgi0LHB8IHvIMuMIVd5UbUAG7XW
 6uFmrNyvScfIPC02EXurNSmWlI7zFQmTRn06zEbjCz081l+m5xIkTf2SBAzoZ1+zFS/j
 b4nw==
X-Gm-Message-State: AOAM5324gf3NbtOSKMC9AEvqbZmzNRAMGOiM/LOGT6X0HcE+2CVLz8Tj
 Rj2dig7W9ITQAKCgKY2b/EMLaUIIXQQ=
X-Google-Smtp-Source: ABdhPJwl2EpOCFomtX9KP8E2lbjjNE2HTb5vi8GotdPUqciDlklAF3P5wKumVlMsGdgDdJElYdjeUA==
X-Received: by 2002:a5d:4584:: with SMTP id p4mr772230wrq.383.1619052657243;
 Wed, 21 Apr 2021 17:50:57 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id 2sm3734607wmi.19.2021.04.21.17.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 17:50:56 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] plugins: Freeing allocated values in hash tables.
Date: Thu, 22 Apr 2021 02:50:41 +0200
Message-Id: <20210422005043.3569-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A hash table made using ``g_hash_table_new`` requires manually
freeing any dynamically allocated keys/values. The two patches
in this series fixes this issue in hotblocks and hotpages plugins.

v1 -> v2: Added a freeing function to hotpages instead of freeing
    the sorted list. That's probably better because the sorted list
    is only made on having ``counts != NULL`` and ``counts`` has a next
    pointer so essentially at least 2 elements in the list.

Mahmoud Mandour (2):
  plugins/hotblocks: Properly freed the hash table values
  plugins/hotpages: Properly freed the hash table values

 contrib/plugins/hotblocks.c | 3 ++-
 contrib/plugins/hotpages.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1


