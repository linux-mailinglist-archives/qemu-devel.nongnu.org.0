Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E239F791
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:19:03 +0200 (CEST)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbdG-0002Mq-3K
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbax-00082x-Up; Tue, 08 Jun 2021 09:16:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbav-0001uF-Sd; Tue, 08 Jun 2021 09:16:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id r9so4846957wrz.10;
 Tue, 08 Jun 2021 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vp7lwt0C0uptnv9pXmO0RhnS9+t2fMrAroj0oOL2e/E=;
 b=Tu4iYz2XAVdjPnYWvFvEvg4WCPxJEopFO+vXEJ6RjhQbtGScbmVaguL7wJlLOmGoGl
 3dCK9E+yUhjjlxh8pVarap0L6yXSRT/vlCx+gVjrOese/vcMAKJfqORFiFWle7hfI5j1
 3rfoImbfl0ShV2eS3pPFBp0XySoDKSGwi2kumF2x0JngTV0WearLhSaPeLBP8hVXP7Xs
 WcsDlh+0Y9B7fnAcKdCKNHiaNcZWg/aXjsAB/VXq9j2L3P0DSlHr3pFq9mLFgGwnkSiD
 Y2HtJ9X+FDz4nQf4G00C1DPXJuI9AkfyeXz+MK1OyWHsd36hl1jihg272awqcbCwYT3O
 6tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vp7lwt0C0uptnv9pXmO0RhnS9+t2fMrAroj0oOL2e/E=;
 b=kE34bXA9+kWwimVXubzz4ciAuGn4Dgo1qbX5VvJVEfT8IdY8TpFzEB0zDXtGsclstf
 t01s/qizMmIrtk6InjbaOgwzl4Qrj7gZFSrZMEAkiiXbNTD1jKlhFCYu6ISeFKHO6X+9
 bDNr/0/LWHo2fa09PUcV4j80dgx5GSfiXvcNmU7Gp0wNGhvmLZlmSz9vrSbBNlmNcZnt
 pbtaoaOcBBb2fZhaqjnNMcJBzEuXEOb8Ht8zKUl0JIK/TpnfoVfdAWumGrqTeKrbhYat
 5PpeRAJunm36HxTbJzVXG+UpspXq4zt9nNPjJKk8h3G3NMzPw1JCBOh+xk9eynClHs2I
 5/vw==
X-Gm-Message-State: AOAM531Fte6/X/TvkhpCMFUVrGjKH8b0F8xju6AHC4RUgvfjApnMhtwV
 JesFjt5KCjUifg1YHkkMAh0n6/eBKzOLTQ==
X-Google-Smtp-Source: ABdhPJwZLwdzPckKvmzoXO9hzPjxcMVxbeT7doWKchLfxE5JaO4xb6E8E+LwSA4SpzbxH2qi3O7tCQ==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr22093537wrn.64.1623158196283; 
 Tue, 08 Jun 2021 06:16:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] block: file-posix queue
Date: Tue,  8 Jun 2021 15:16:27 +0200
Message-Id: <20210608131634.423904-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

this is a combination of two series that both affect host block device
support in block/file-posix.c.  Joelle's series is unchanged, while
mine was adjusted according to your review of v2.

v1->v2: add missing patch

v2->v3: add max_hw_transfer to BlockLimits

v3->v4: fix compilation after patch 1, tweak commit messages according
        to Vladimir's review

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


