Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA513366DC7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:11:18 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDZV-00038B-Lm
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZDY5-0002hh-If
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:09:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZDY4-0002vG-6f
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:09:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e5so12863702wrg.7
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgN1F0l1Q0bgQs/WSYjc1F1JwUeWXSq8c9XDOJjxdMw=;
 b=uC3mHn0UJ983dKpTX7gncUgTL9tmg9DDnMZpD3Pmb6maXjHOtVT76RxgtmFFq86T8k
 gkrfQwQgFWie6DWAxV08sv6dpbx/K1oyLNb2EqkKRXlyOJT/kM/tD2mnwlfjJCKu2+8x
 Rg0FYGcvdRHBPoE47zv17o289uE3Oslq5CtkCO3bo/SnLatgX+xsIuAfk2TxqCvmOh9Q
 LLvj2odyh3+NPo597VNTvOoygTdLYAK6eRCS12kzBWuDNzm9Jg5MzRzF3hHy1dotciHs
 qEn3CXhEpyCmU/e0TQ9PZMIth4ynPx9T8qmPhTv6DZ649uMjzgfrEOXjhfnUii3Ia/MP
 5WjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgN1F0l1Q0bgQs/WSYjc1F1JwUeWXSq8c9XDOJjxdMw=;
 b=iOG1EJKrAIiCl6+6t0VrQaLoow3H8ZiKwNTnFmnt3Vm5BIvhR9+ddPFBZcN8BwFqDx
 EK7AUp4ddrjGako7Ho3xbqtxJdIvvbWrFStRmdB3RMSPAoWBkj804dgI3wVLf10yxZE1
 1wjYXxFkGuAEmdeYA12WWYCx2qU0R1ZmGbBTyfq3CNq5C0BvXCbpfgzAqyD/qjw5INMF
 Tu77nCqOUgfPRoF1CIMZCx/LQBZEt5xo2B7m3c0JFch0WRf1+vBtYxS8h6I/u9MOKyNA
 gQ2JiYKk/ZI5gJPSrytahsVAK1L6wNcZq8i1liH4mp7uykIjj3YmJmGhkHG0H71i9L9C
 hRrw==
X-Gm-Message-State: AOAM5310qHFn1zhroIBVE/fduf+SRdCwPuyAeccy6YNx7ioYBJu4HvUk
 5V2taKz3W2qy5Tlyjcsk79J/4mbZlBw=
X-Google-Smtp-Source: ABdhPJwYwWiRkNZxOd7J9QPMP/liLpcZLTzp7OCL6onj5mizb9PBjoGhS+2SpvPQ98cACzOoi/t5gg==
X-Received: by 2002:adf:e483:: with SMTP id i3mr28315456wrm.286.1619014185954; 
 Wed, 21 Apr 2021 07:09:45 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id q5sm3273407wrv.17.2021.04.21.07.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 07:09:45 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] plugins: Freeing allocated values in hash tables.
Date: Wed, 21 Apr 2021 16:09:32 +0200
Message-Id: <20210421140934.7561-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42a.google.com
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

Mahmoud Mandour (2):
  plugins/hotblocks: Properly freed the hash table values
  plugins/hotpages: Properly freed the hash table values

 contrib/plugins/hotblocks.c | 3 ++-
 contrib/plugins/hotpages.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1


