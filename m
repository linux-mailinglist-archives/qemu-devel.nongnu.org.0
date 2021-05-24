Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351638F1C5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:50:15 +0200 (CEST)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDmQ-0005fv-8o
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZT-00075Z-6V; Mon, 24 May 2021 12:36:51 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZR-0002kr-Fr; Mon, 24 May 2021 12:36:50 -0400
Received: by mail-ej1-x631.google.com with SMTP id b9so7564610ejc.13;
 Mon, 24 May 2021 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8iEpSdTisbtTa0qLLHhaKntpz1jIOuP2OnvbQu1xqg4=;
 b=g95zyk1+m7HId24Hg4CP2jaVkHv3F/Gmm1YcULEza5HwLWg+8+xZAYXaaHbx8wp9eY
 fBLGABWds6SK83YA2bGMB3Z1AgogUNQi6Gl4laHV6MOOu0xLJMoTayJB46yrjvjXyQM5
 VPLnZ2yS8Liqwrw5tTxs9xs87n0PowaOV+UTqct7+j7tMw8GDYrspI1oJOz0qrs/vVXc
 4tJzLvWEEruhCrIIqI2rAXbhdRvc7yv+302V7JO57Fyb/9K7DGJ/5A5iz4yD7Me1otOA
 7CFD8V+FKQ1KxWDBLkiUFn/c614bW/TY2nr9Z0/4V0nhOAtmZDfln4UkdsuEdadjraZl
 WnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8iEpSdTisbtTa0qLLHhaKntpz1jIOuP2OnvbQu1xqg4=;
 b=njaFsz6kR1A2d+vGpNCPbL958Gn9JsW/WTF1HaMiwVenzO/W5ALXr9GW/gzw7fJXra
 QCE0fnVEeP1EzG/TfhwoJRvtUQ46J/yQUkFMVHBWeSEyaWpbe0lNYvI+o84Cz1LXIWSE
 IXfgcpc4pZNAwu4dDdFl3CNG6I+YcfPH9gK4cr2PciIoiaDcP//+RyAW25InR/91GxK9
 JIxgwIdyUdEFWXBBFW42JPf60Z5jOszm7EEDskwLZafEEacQBmO1XpgHObUIqK6ra+ar
 ThJ9JU5TzEW1+8iG7CvbJF9JP3zL3fiBrzBk2R4RDBZ2HVniY/cJTjbXojySstcPoGIZ
 Kbcg==
X-Gm-Message-State: AOAM532s0JYdZOsYc+LN7F/WaY6MZzWvReZPcqp6nvKmI+ExCRlUqKGc
 3yUfx0M4uqPQvLYpJTmP0R6WpirwXmFV2w==
X-Google-Smtp-Source: ABdhPJwaJjKPecgN3zMG197T7J4RPvo5c1xKprGeD9L/SnDMx08vU7ri0IuxQyjN3Lcuo4gF7ALFuQ==
X-Received: by 2002:a17:906:4a19:: with SMTP id
 w25mr23930785eju.500.1621874206786; 
 Mon, 24 May 2021 09:36:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n8sm7967684ejl.0.2021.05.24.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:36:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] block: file-posix queue
Date: Mon, 24 May 2021 18:36:39 +0200
Message-Id: <20210524163645.382940-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

v1->v2: add missing patch

Joelle van Dyne (3):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use

Paolo Bonzini (3):
  scsi-generic: pass max_segments via max_iov field in BlockLimits
  file-posix: try BLKSECTGET on block devices too, do not round to power
    of 2
  file-posix: fix max_iov for /dev/sg devices

 block.c                |   2 +-
 block/file-posix.c     | 104 +++++++++++++++++++++++++----------------
 hw/scsi/scsi-generic.c |   6 ++-
 meson.build            |   7 ++-
 qapi/block-core.json   |  10 ++--
 5 files changed, 81 insertions(+), 48 deletions(-)

-- 
2.31.1


