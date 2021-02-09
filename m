Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4687631524A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:02:39 +0100 (CET)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UXF-00075g-MZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9USs-00037d-Bf
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:58:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9USp-0007xJ-Ri
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:58:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id 190so3460245wmz.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gn1txDWD9mU5R4XO3DQ7vkS5YJztJbDu0zSzVw5gSQU=;
 b=ao1iYrR2zX5M6JOHS2XcEaVabR30q8WPVmTQeiiJ6xcyP4kQax4dKNbBZlzkScNYAk
 jwm5pApoEmdbmtlB4j/2F73wRLVgrMsg1ztKyQhmYhQ97DmSpKxYK1pyo8rxD7xcpMen
 40es+coS1/9W4XcNxNwUT9/XYdUb79wAgOCL/CqfAps8Hi++ebsriNcU/RKqCC8xjVDw
 STUvKFoS4PXbmHMB5bKMH+8Afmd9o14oy1M2FnOoPV1PWSX3RZgL9o/H9hM7TKPtJIFj
 I2pCSQ/P7+ApzlOepI18RO1m91HbiXzWhjDvMavqkB6bw/plH+8QQcLQStFX3QB+m6Jf
 ZBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gn1txDWD9mU5R4XO3DQ7vkS5YJztJbDu0zSzVw5gSQU=;
 b=Iwo8vFgrrX57Xxkft2un77DjXA5afoXj5MhH6m77NZ/lYpHWcnKGpG20vXzDofJxjh
 rMcsvFGOJBfQgqwY7nN6ezulw0sklTZATn3YFzRVUAl8GyYTlrHNfkFzhYdmwhIrT3C1
 IyzPns/KBxlh2go7vfeerqjY4yxmiWQaA+YWPZI4r27lWXxHCaOI4ZaVkHTEGUa/d9zD
 IqT2UfjeOzy4Al++8s3M7oOuE2eLtkY4kMi0NhGdDO8hNwkmbEYGEh0vnrm09Nw1q+GI
 dqdCyFSwH33I2EVc0luhZkM4vgvr9GlKSbEXX/JC0B4zyCYWKdy8YQ7bTI2SXweVZDt4
 zutg==
X-Gm-Message-State: AOAM532UvlTHccl4/Z8FN42xfFYX/ZI7f38gQGPvEK+wkdaJjVxtzSO3
 5F6gi9RCIfaz3K3uErQIXYtN7scyzl4yOQ==
X-Google-Smtp-Source: ABdhPJy1i/EO8G0nHKcDbc8MLeAZBBMDDwoO99zjjqgDbXkUEfArFo7t/gGzfZUoQpamldDwTRznHA==
X-Received: by 2002:a05:600c:4784:: with SMTP id
 k4mr3692385wmo.56.1612882682487; 
 Tue, 09 Feb 2021 06:58:02 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h207sm5304061wme.18.2021.02.09.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:58:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] trace: fix "-trace file=...."
Date: Tue,  9 Feb 2021 15:57:57 +0100
Message-Id: <20210209145759.141231-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series contains two fixes for "-trace file=...".  The first applies
to all backends, while the second only applies to the log backend.

Paolo Bonzini (2):
  trace: fix "-trace file=..."
  trace: skip qemu_set_log_filename if no "-D" option was passed

 softmmu/vl.c    |  4 +++-
 trace/control.c | 13 +++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.29.2


