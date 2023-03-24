Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132996C81F6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfeFv-0005Yw-7W; Fri, 24 Mar 2023 06:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfeFt-0005Yk-2X
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:02:41 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfeFb-0004vS-Lf
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:02:40 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-544b959a971so24190547b3.3
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679652122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WqHMJseoGUL0AoeVeqV46ujzSh/6ctH7NnnsGiwh/r0=;
 b=GkwJQmKbbQ4DRf7DCEH1sCE7TkXDzPoMOGA8T3URjEurQ1Z7eSQXIlfJP/f8CtDlay
 AhbkGmWKeELh9Bx/APOpYvp3xnpepB/8p+Hw6ivL6HlNvHhwqhwqKQeEbMeZQ0ZP17HE
 PNmJF4SmW2BQzsZ944O3PeGvOH+MiLwTlcLN/ovmqvo1x0zdAJBrcqzrFpivW/QjO9L7
 Q4feVUDA+7dEidRDah9INUFVoBG31eUS/jQUwgb2T4frZr9gPcy4HNl1q4Ktucg0P6+z
 q++lRlntUqjtgTLg/URF2KsMufcFHyXJbrA4XrjH+P4GuheiXgg5qRXrPPY938CGgzJW
 b09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679652122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WqHMJseoGUL0AoeVeqV46ujzSh/6ctH7NnnsGiwh/r0=;
 b=rCCpuZnAKp6yqtusKIPWv9BRzOQ/3ZpsqLOQH9nwytp/UVXu/TC4iC7M6SBxK91ZoJ
 MW0gC8ZSor+ymn/ISpFeZ6f6inrX+UbHfiD9IF9hK58hXq0phbYLqUY85tQJnKVyMX9J
 MpKIA81nJUFYMZC7X4t6onj3WRUM22t4EdfbZBw5+iR1cqKYe8ltPr3iHJ1AQD3oLp8d
 qKazBuex8XEGo6TIbv7DWWxLA/Mc3uFp+GLosmQ8ybfrJqmOA+VaV5PLz4DuPbrN6W2L
 roABYpBcGJJmVTnJsySdzeKDrAD0Ed5AwEh5QI2Z1wr72hkMqiaGter9lVUh0eeWSpAB
 gAXQ==
X-Gm-Message-State: AAQBX9c4f2je6dXwXVNBeZqV7ngkfMUjzLAx31RXrAmxNKmacpOezYVD
 XnafVAGBHqO9vZwYNkkUQgpAvezbsL556+WqmO0fLw==
X-Google-Smtp-Source: AKy350Y2UCGj59Eei/COY3AX0PCCqUGPXYYeGjtmBGmVu7scaU+IgO3345E63VkPQt8/ttA3dk4n4Q==
X-Received: by 2002:a17:90a:3:b0:23d:3931:7b49 with SMTP id
 3-20020a17090a000300b0023d39317b49mr1827653pja.35.1679651699619; 
 Fri, 24 Mar 2023 02:54:59 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902748500b001963bc7bdb8sm13785614pll.274.2023.03.24.02.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:54:59 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 0/4] igb fixes for 8.0
Date: Fri, 24 Mar 2023 18:54:30 +0900
Message-Id: <20230324095434.44973-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::112b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This series have several fixes igb for 8.0 release.

Akihiko Odaki (4):
  igb: Save more Tx states
  igb: Fix DMA requester specification for Tx packet
  hw/net/net_tx_pkt: Ignore ECN bit
  hw/net/net_tx_pkt: Align l3_hdr

 hw/net/e1000e_core.c |  6 ++---
 hw/net/igb.c         | 26 ++++++++++++++++------
 hw/net/igb_core.c    | 52 +++++++++++++++++++++++---------------------
 hw/net/igb_core.h    |  8 +++----
 hw/net/net_tx_pkt.c  | 30 ++++++++++++++-----------
 hw/net/net_tx_pkt.h  |  3 ++-
 hw/net/vmxnet3.c     |  4 ++--
 7 files changed, 73 insertions(+), 56 deletions(-)

-- 
2.39.2


