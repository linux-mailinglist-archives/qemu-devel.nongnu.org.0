Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138E387437
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:42:17 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livIt-0006SS-Sr
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFq-0003Xe-4T; Tue, 18 May 2021 04:39:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFo-00047C-D2; Tue, 18 May 2021 04:39:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p7so5494979wru.10;
 Tue, 18 May 2021 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UVNy9qZrdEj1hvWjeWPOJi0NspAIRfr+S0145n99q4=;
 b=VFaNV4qKbmn83Hs/E+schK9Wv/glED/4zAD+8KD8twlaY9zi6G9FD+gqfscepPQNK0
 ITq+g/2l8uOkilPX2IVqCw45iI4NKUqlSP8hM1LsY32TjrM1Bc6X86doDyMBfYf7ryRi
 rHvYYWLV6g18RAmu+j/+/IKseEiCVClbhPzN3+97ODZ92FYp2RhIOYgz/T31RFQ+rLeg
 bqkyxTZamhYmCY1fLmNDQKA0uOVhv1cHybqXVA0SsNsexBrjTu6UNDn0Q1Uouf4Tum0H
 iNUiGzWYYp/wpbNRJefkZO26bxqqyBn3FiD394YPD91evDfkFqNmVXI2JA7u2xCn4ZAv
 HZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5UVNy9qZrdEj1hvWjeWPOJi0NspAIRfr+S0145n99q4=;
 b=G95+w9UWQhSAOJ/eZFCP0oiY37CDPhSAtI9oYku3ysIO8fJT9cIN0bfd3iVt5LCb4t
 eeue986Bj9dGC1NVCkMeixM4a/7J+XEzI2nR+Q3TPqpJ2mOXq7b+thBK4RG8fIxfqU1K
 uFV3ThRqTBpfY04ac4VberUIMFDVugiBxnEeQ+8Rn7FgfGs6mmG2WB2C6NE2WYS/kPNQ
 oWt61m5+jTfM9WKJwG9YdKdjPN7FvJEahFUSgK+Mw5N2WLqmsTpIkiJMzZjdHAKqgOgn
 7AsChYm0BI4LO2/FXOZb37nIK1kC8wyB6l9x3axHQzkzX6JoCzH1NYhvFFPW2ybgJdsS
 6+AQ==
X-Gm-Message-State: AOAM533MSo08JGYyiS7NqT9KBUb70FmdaW7z+wFz9n4pXTzmowbsAOhl
 IOuXecg1SSyHYgwjI40RmSLLc+p/HPlGDw==
X-Google-Smtp-Source: ABdhPJzZ9CdvK6RT0PAST0Vv6mFratexhONF2Ywj1w57uffbY0g3GFXk8xXJWR8kpuxnYx1caJwz4A==
X-Received: by 2002:a5d:5508:: with SMTP id b8mr5190444wrv.278.1621327142197; 
 Tue, 18 May 2021 01:39:02 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y6sm70959wmy.23.2021.05.18.01.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:39:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] block: file-posix queue
Date: Tue, 18 May 2021 10:38:56 +0200
Message-Id: <20210518083901.97369-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Max/Kevin,

this is a combination of two series that both affect host block device
support in block/file-posix.c.  I suspect both of them evaded your radar,
so I'm grouping them together and sending them out again.

Joelle van Dyne (3):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use

Paolo Bonzini (2):
  file-posix: try BLKSECTGET on block devices too, do not round to power
    of 2
  file-posix: fix max_iov for /dev/sg devices

 block.c              |   2 +-
 block/file-posix.c   | 101 ++++++++++++++++++++++++++-----------------
 meson.build          |   7 ++-
 qapi/block-core.json |  10 +++--
 4 files changed, 76 insertions(+), 44 deletions(-)

-- 
2.31.1


