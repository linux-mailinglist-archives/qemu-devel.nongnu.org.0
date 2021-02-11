Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08E319616
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:56:04 +0100 (CET)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKsU-0002cf-GI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpb-00011a-3J; Thu, 11 Feb 2021 17:53:03 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpZ-0002SV-3M; Thu, 11 Feb 2021 17:53:02 -0500
Received: by mail-qk1-x733.google.com with SMTP id h8so7043023qkk.6;
 Thu, 11 Feb 2021 14:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XfVapTWODDGhMyHFRjKTqbed3z9yjoFHAUyuRdM/FPg=;
 b=U6jUVhDXKT/K/UGejCEAVxdRIlTrBK4KBsdMIYARxqEDFklumOHhwki46jrFy6dmJl
 /v4L0Vpl5fd/8XOxvJyv2kQQXVVBl1QivWg+aqpa3O912H7qXTmYVojpQV9xkrb0Z+Tr
 F5zsnUHC9c/xaa8UdaNUBrZ7hiLuwIndf9kPZiMLYaBNLDN+coYas9kXB8ZfHdn13QQ8
 qjpM0RV7bB7OEkFYSykieGoKO9rR5W8gIyu/tWmTJvVXY6CGRQ67D3m9CVY8JOMI6vEX
 c9T3C6Vp7rithveBZoQFBYH9/74DOKQOLsFYaJNUOFiZSTiqUn9tBqVehyj+ETf6jRX8
 bt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XfVapTWODDGhMyHFRjKTqbed3z9yjoFHAUyuRdM/FPg=;
 b=JazBqveonv9Dw8soj3Z4vqiDq86x3cPVN0dInaLRawCegPdFqZgFnDtR1tGKRol+a4
 ebvdBO66aqMfgaPF7tOv0YSAW9HKgHBv8VxFSFigcD+2bw6p9OMJ9Z7tF5/RPJ+MwWcI
 bpk1KcrX+yaOiHVZDhR8iUvhdlNNL5SLMCWdsnk+k+8kmzhkChdJ/b4Qh1uNb9OTG4SD
 my15rAz14R3UIMAMI9WPqjTgJHkzqizL6Srg3W6vRUELuAQOQOdhoo4gdyY5M+pFMHnr
 8pfC8tMii3uPOJefODtfLEFd3c3EGNQDNHdyeQKlxW9UkfpZlfrJDD/r4Z55k3L7twd1
 DzeA==
X-Gm-Message-State: AOAM531A/qTdyJ2+KTDUVmEQgDT+iI49G/gT/uztQG4fNBN6TaXpgzPR
 to6y2WbENMwZto/EmXD8+gJk7Fe68NLlIg==
X-Google-Smtp-Source: ABdhPJxNR5XL1mudqtl7vpuSLkHpJrg1OcUioWHQKmJ0p7oqizImqjmFyTejWbhVJUccTwdb/hbG6w==
X-Received: by 2002:ae9:e314:: with SMTP id v20mr106098qkf.66.1613083978364;
 Thu, 11 Feb 2021 14:52:58 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:52:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] CPU unplug timeout/LMB unplug cleanup in DRC
 reconfiguration
Date: Thu, 11 Feb 2021 19:52:39 -0300
Message-Id: <20210211225246.17315-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
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

This is marked as a v3 as it started as a result of discussions that
followed the v2 [1]. 

The idea with this series is to add CPU hotunplug timeout to avoid the
situations where the kernel refuses to release the CPU. The reasoning
for a timeout approach is described in patch 05.

While investigating putting a timeout in memory hotunplug, I have found
out that we have a way to determine, at least in some cases, when the kernel
refuses to release the DIMM during a memory hotunplug. This alleviate one
of the most common issues (at least AFAIK) with memory hotunplug and it
made me gave up attempting to put a timeout in memory hotunplug altogether.

At this point I didn't add timeouts for PCI hotunplug operations, but it
is trivial to do so if desirable.

The series goes as follows:

- Patches 1-4: DRC simplifications/cleanups. The idea with these
  cleanups were to trim the spapr_drc_detach use as much as possible,
  since the function would be used to start the timeout timer

- Patch 5: timeout timer infrastructure

- Patch 6: add cpu unplug timeout

- Patch 7: reset DIMM unplug state when the kernel reconfigures the DRC
  connector



v2 link: [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04400.html


Daniel Henrique Barboza (7):
  spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logical()
  spapr_pci.c: simplify spapr_pci_unplug_request() function handling
  spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unusable
  spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
  spapr_drc.c: introduce unplug_timeout_timer
  spapr_drc.c: add hotunplug timeout for CPUs
  spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state

 hw/ppc/spapr.c             |  40 ++++++++++++-
 hw/ppc/spapr_drc.c         | 116 +++++++++++++++++++++++++++----------
 hw/ppc/spapr_pci.c         |  44 +++++---------
 hw/ppc/trace-events        |   2 +-
 include/hw/ppc/spapr.h     |   2 +
 include/hw/ppc/spapr_drc.h |   7 ++-
 6 files changed, 147 insertions(+), 64 deletions(-)

-- 
2.29.2


