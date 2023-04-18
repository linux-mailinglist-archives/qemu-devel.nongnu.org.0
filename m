Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539806E65BC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:22:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polH7-0006yZ-VK; Tue, 18 Apr 2023 09:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pokz5-0000fc-AK
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:02:59 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pokz3-0003p2-8W
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:02:58 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b78b344d5so1344498b3a.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681822975; x=1684414975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsgYWMHtIgJ7Il8+rOoOnD8ddnn4kgbrVmyxNbu3Z5M=;
 b=cpNzzWk1xepuqyJRf7+VYS/tnHmyVN+2rIYt92m7BfjbF9bIkfG3yMC0Rooipkz7mW
 q/fk1dZ102AIqGnS+shfgq4TJMYVBtTgZpboP9rd7ntohAVAMElwbAPZFHuU1N1csqRY
 5cGCKEFKJi+Qe5iY2pA4zxAKW9hxSqmqqqfTN+rqAGKqYV/YLrxNkPcThDzPh2zP0o4D
 9DcyfVx9mWCj7OA8FRj9HBJ8ebJnyc9UGfm4clD7wnjncTBnkXT6AyWeL1QYMyQEK2ey
 K3LUVUT8EiQurBQfStE49goF6pJpKCwwPUyyI0J/PDeOdmwPZ+iKWBI9mzgE30l83Eu1
 ulyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681822975; x=1684414975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsgYWMHtIgJ7Il8+rOoOnD8ddnn4kgbrVmyxNbu3Z5M=;
 b=AM8RHovGf/vZFMO8VUw0AFIwVGCMY6nzPQ+LDSyzyEbGaAbdYh5UPPtDsHLZLI45BD
 wRMffjbzGM9mBtnv7TrO+igKTYhQUmEulapMpy1LO1Ulrcr+WpmvwL1E9agdLQEySPhx
 6lTnqO1JUpR2V4bZahZCErLsktJ52g5fffgljc2NJZmSD4Yd19jm9EUTftKiMBmMiBFH
 xuF8ndXJBEj2auSdmJbOodtf9dCwSOuufDQWQEM+T6wa/VMSKqiowMjmI6OTJoigOlIj
 rZf3q3vViQ00vQ7XscPRw7Rmy56HTGzRLEgjD5NVcKZMkYaRPFoj3n4Zvv8gAmj97MyL
 YJ/g==
X-Gm-Message-State: AAQBX9drr8Qq2pnxTQ2+3F/slp4VDYrOfr7sXnscJX7Kh/8UWWgCq7p2
 7YtS+zQOznc+cdPkrtuF5sM=
X-Google-Smtp-Source: AKy350ayYcwjAD1gtGRyARZoszJMBpCpQ0Bk75Eox8rwu5AFn07nCY3ZlOo9T56AOU919/HRZo87+g==
X-Received: by 2002:a05:6a00:1794:b0:63b:877f:ee53 with SMTP id
 s20-20020a056a00179400b0063b877fee53mr13355345pfg.17.1681822975271; 
 Tue, 18 Apr 2023 06:02:55 -0700 (PDT)
Received: from localhost.localdomain
 (2001-b011-e009-51d6-c0ea-8cf7-d394-c0ac.dynamic-ip6.hinet.net.
 [2001:b011:e009:51d6:c0ea:8cf7:d394:c0ac])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7851a000000b00637b0c719c5sm9287275pfn.201.2023.04.18.06.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 06:02:54 -0700 (PDT)
From: Shao-Chien Chiang <ray90514@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,
	Shao-Chien Chiang <ray90514@gmail.com>
Subject: [RFC PATCH v1 0/2] vhost-vdpa: cache Virtio states
Date: Tue, 18 Apr 2023 21:01:05 +0800
Message-Id: <cover.1681819697.git.ray90514@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414025721.10219-1-ray90514@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ray90514@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Apr 2023 09:21:36 -0400
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

Repetitive ioctls makes vdpa devices initialization and startup slow.
This patch series is to cache Virtio status, features, and config.
For each latency test, I use vdpa-sim-net as my vdpa device.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1579

Shao-Chien Chiang (2):
  vhost-vdpa: cache device status and features
  vhost-vdpa: cache device config

 hw/virtio/vhost-vdpa.c         | 60 ++++++++++++++++++++++++++--------
 include/hw/virtio/vhost-vdpa.h |  4 +++
 2 files changed, 50 insertions(+), 14 deletions(-)

-- 
2.25.1


