Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF93265A8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:38:37 +0100 (CET)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFg8S-0000oI-IT
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3V-0004lu-I7; Fri, 26 Feb 2021 11:33:29 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3P-0007il-D2; Fri, 26 Feb 2021 11:33:29 -0500
Received: by mail-qk1-x72d.google.com with SMTP id n28so8116939qkk.4;
 Fri, 26 Feb 2021 08:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tEKRCBvA/zNhEnfFszKVbRaOw2Z4MIKSxnCdgMhNgo0=;
 b=NbOv9aclTI+yrPCG5ooznGg1GxNEjw+/lQrK2e0K5D8CqzzxUd05ugu7+jEM8iq70P
 m4NRXXoovwk9EG4559Gff63AeMHBb/MIy5iwkMmLNqkrGuh1qmCRwC4qwEGUPxUBJx7o
 VJ6wnnIWgMJmvLgyxq2BeLCqVGmhFYhxOLyAlsKgUUzOdnGlJL+i0w3XWnxwu+kht1/L
 FULIemPlNVZcSgFl/9s3Q00uyMz/mRK0nozKHF8GpAljvzp3iL82+iZwTPGFJYFgXQUs
 987tgRsVg7wLA5dnles4gzUO3RRHvDFTUME5ZKkcTaEo9g36pLavbCmTg41BZiuXskHT
 XZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tEKRCBvA/zNhEnfFszKVbRaOw2Z4MIKSxnCdgMhNgo0=;
 b=r6u01WCT4bxqVp1ofjH2TGbOm4o9VzVtL2ttNeM0sU6bYR0IjvTVd/a77wIAmhxXZd
 CV9n8SwnVrF6bw6+Pn2QPRhLelItcdyP/wXMszKLRPiYzpZR2JOlaHOu8it1uVN1WOOQ
 el6oD2oi2gzvEa3KF0nLvbmbEeLNHcPrn0PPxA9Q16yvYVo/yEWcK3SQYFUuPRMfNjuH
 soyWcl20t9XLOPTe8/4n5/hNb8kV5jzXaf54P44eRqWxvN0eynVhcklDD6/wZ5qb31oB
 OtYopsYnUDctMhgK1ifU6j0ko8AeFmYmH/yZ0Yt3DWYaHNGZQlBv0vKHY6C65pUKSp1H
 G38w==
X-Gm-Message-State: AOAM531WP6J2th9TzZGrB5GX+0GCzmHYY/7Yx1VvxqA1EVsh112mh1b6
 3t8DsWz/p/Gm0Up8r2aV3PdKTleLVNIXhA==
X-Google-Smtp-Source: ABdhPJzv3C+l3+L8E1VWWc3clxLvorMdhlCWqnurlQMjKM02O2BGCwwwnIL4yQxit4yPceSLWRn+ug==
X-Received: by 2002:a05:620a:200b:: with SMTP id
 c11mr1524492qka.481.1614357196165; 
 Fri, 26 Feb 2021 08:33:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t33sm731116qtd.13.2021.02.26.08.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] send QAPI_EVENT_MEM_UNPLUG_ERROR for ppc64 unplugs
Date: Fri, 26 Feb 2021 13:32:56 -0300
Message-Id: <20210226163301.419727-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
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

This series is a follow-up of the existing change in ppc-for-6.0
branch in David's tree, where the pSeries machine is now detecting
one case in which the memory hotunplug is rejected by the guest kernel.

Initially I would like to also add a QAPI event to report a CPU unplug
error, but we don't have this event available yet. Next time.



Daniel Henrique Barboza (5):
  spapr.c: assert first DRC LMB earlier in spapr_memory_unplug_request()
  spapr.c: check unplug_request flag in spapr_memory_unplug_request()
  spapr.c: add 'unplug already in progress' message for PHB unplug
  spapr_pci.c: add 'unplug already in progress' message for PCI unplug
  spapr.c: send QAPI event when memory hotunplug fails

 hw/ppc/spapr.c         | 37 +++++++++++++++++++++++--------------
 hw/ppc/spapr_drc.c     |  5 ++---
 hw/ppc/spapr_pci.c     |  4 ++++
 include/hw/ppc/spapr.h |  3 +--
 4 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.29.2


