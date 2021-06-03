Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061C39A257
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:39:05 +0200 (CEST)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonYu-0005Cs-7v
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXT-0002vg-RY; Thu, 03 Jun 2021 09:37:35 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXR-0008WH-Am; Thu, 03 Jun 2021 09:37:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id a11so8579999ejf.3;
 Thu, 03 Jun 2021 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+JC8B5thZ4rgtNZrSk5/HNOHlMRKa+FNRueQW+DX6s=;
 b=ddUqwOl36DJgFSAVzu2mNRrrq4OqdGPwXGGRdZWDm9fiaFFZdAV35z5CIdm+PTza/+
 V97vHhx2rKzDtAMUY5a/6IQM5BfJf84hOzxvzsSw3xwpyNIF4NJjwUUTjK45lzZvGM8P
 ui9kt6XteOQMKZPl/fNj0guj104oV87eZawtbR6WSYyMpxvYIxNEAppEh/eUw3ZR0Bih
 4riLC/I313YQkqqJ9VOmhMTsJTl+W4BAK7/dnYiTVs2bSfun8d4//N484GLMGTZwLl0f
 +U0Lox2rIIa1rZhWK9fUtIVrRwwUjGfnrdc5fA4W3fy8jO6Fr67f7kg417+mludtyBeu
 jwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2+JC8B5thZ4rgtNZrSk5/HNOHlMRKa+FNRueQW+DX6s=;
 b=KHMn940CexJPKuLRDjEdxq8vUYFVZzUwWyHWnv8bJQyoReZBNBRpYjKfcbXwpkQ76+
 SLMNBiVjkVefJcVtsWFCKJS5eiqbyr+sDmaAha3gYO2+cxGqZyAP/vChYPe9mIWaEa0d
 V+QZGNofH2pt8KGpCMPGGV0aTmTZHIC8QXhHXSqJYx1Ecy54dIyxb+2WIgeHZ0XyJQVT
 W2F9NfY4axgC/JJXev0+3DnqvHs7tyvYRkkjUOV261Uda6Qb/O1ybK4cIKUgWTBZf6Ap
 bR3A16pwr2kyi0hlDK/FFYKXpZYXsRJPch3O9ipVrkUHXxMUezBarQ77OWLnQzTyZNGW
 EfRA==
X-Gm-Message-State: AOAM530Evk1puPN7VQxhnmypPqQ6eKRR+WpXH4D2F0qZplx/kwTPhYkS
 LjuDmdKOv16+bJu4FAyQokGD3qplvBPOuw==
X-Google-Smtp-Source: ABdhPJxmgwCgYIstlyr05Iyj+AlHiE3WfsDAfNqVIa1l4ccg3LDVnvwWphwrnIUaxGvi17KCP5Vn7A==
X-Received: by 2002:a17:906:b4b:: with SMTP id
 v11mr16225857ejg.359.1622727451332; 
 Thu, 03 Jun 2021 06:37:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] block: file-posix queue
Date: Thu,  3 Jun 2021 15:37:15 +0200
Message-Id: <20210603133722.218465-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

this is a combination of two series that both affect host block device
support in block/file-posix.c.  Joelle's series is unchanged, while
mine was adjusted according to your review of v2.

v1->v2: add missing patch

v2->v3: add max_hw_transfer to BlockLimits


Joelle van Dyne (3):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use

Paolo Bonzini (4):
  file-posix: fix max_iov for /dev/sg devices
  scsi-generic: pass max_segments via max_iov field in BlockLimits
  block: add max_hw_transfer to BlockLimits
  file-posix: try BLKSECTGET on block devices too, do not round to power
    of 2

 block.c                        |   2 +-
 block/block-backend.c          |  12 ++++
 block/file-posix.c             | 104 ++++++++++++++++++++-------------
 block/io.c                     |   1 +
 hw/scsi/scsi-generic.c         |   6 +-
 include/block/block_int.h      |   7 +++
 include/sysemu/block-backend.h |   1 +
 meson.build                    |   7 ++-
 qapi/block-core.json           |  10 +++-
 9 files changed, 102 insertions(+), 48 deletions(-)

-- 
2.31.1


