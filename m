Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30339C104
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:06:18 +0200 (CEST)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpG5A-0007BB-B5
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lpG3B-0005BU-F4; Fri, 04 Jun 2021 16:04:13 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lpG38-0000QD-GY; Fri, 04 Jun 2021 16:04:13 -0400
Received: by mail-qk1-x730.google.com with SMTP id i67so10549895qkc.4;
 Fri, 04 Jun 2021 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RamYTzYhu0hHqyIkvDaFyKW1nsen8fHaME1rQ27zNE=;
 b=qm+aXaYNdmBNrvoZd3iIR98aD4Zu+1PgusSz10WBs29HszA2ipTYSuwA+2zwK4tF3P
 jmZckUigITMt/iJd0zbRthgkN2ouBCY+BzAv/lnyH6IYrNN9mqyY/6VyuqFFXxu0A/Da
 g1/gm71yDImMzkb1IJVkOohWbDqp1VrsSUW5HUMajTTfOIRuZZ3hU2W5FLhjTeVKNZkg
 wwXHWGQCXoKiM1ync6z5PnLHjrSbnqUPDoiUBsNvUJrj5IBM91N5BcOqWff5fAGyjsIG
 WaSA2kMAqzVpQcXuUy8S+2IF7rB1bw4DhGxCX7gatFllJMxqhCMB4DAo8HVOaqs8pm97
 fBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RamYTzYhu0hHqyIkvDaFyKW1nsen8fHaME1rQ27zNE=;
 b=CsYUoKlcqxn8F2bheRPsoL9Qjwu7+BnKgJWpt4IuXZBGxhsY0wgm4jZnkcpJ643RbZ
 NFdEZwEuNw/k488qj9N1txiRrU59Gn+wN4VA8T1bdTcdm4r4kDgHpTNigZCCDnqJKe7A
 OzVDnIUXSuYtkHw5Jp8b8xtG65Q6JY9odtn0I9SlwSOsfgmd/zVLftSF6utOMFNoE02Z
 0ty3OxvdRIiFhhOkOcaQyxb8O2wfwwftZiqUgLlPQPhTuqYC+/7ZTUgUltbMEX2kV1MR
 87FvRGy+mxIXnK9xD0B14mbti0G7yOMA4vzKURFSlJ6hIZTiT/p4QjYAvwvZJOaG5rXY
 NTiA==
X-Gm-Message-State: AOAM531S5WKu9gqSe0V+W9vOv1ZCJsJhb59Ep1xklOCFydqFY8fhQ4bY
 7ID+4FwhIsqKHH1CZu+UAq2HPfaWhws=
X-Google-Smtp-Source: ABdhPJyDFLM7a2e1KbLuxEZIxPnnCtkGsKsC/hKftCJNCjK3HuM7mXcsInpT7AA12AXp7DaiS2tQbQ==
X-Received: by 2002:ae9:e40f:: with SMTP id q15mr6088508qkc.125.1622837048284; 
 Fri, 04 Jun 2021 13:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:b390:9cad:b272:426b:6a0])
 by smtp.gmail.com with ESMTPSA id
 f19sm4765011qkg.70.2021.06.04.13.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:04:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] DEVICE_UNPLUG_ERROR QAPI event
Date: Fri,  4 Jun 2021 17:03:51 -0300
Message-Id: <20210604200353.1206897-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the v2 of a series that started with 2 events,
DEVICE_UNPLUG_ERROR and DEVICE_NOT_DELETED [1]. After discussions in v1
we reached the conclussion that the DEVICE_NOT_DELETED wasn't doing much
of anything. It was an event that was trying to say 'I think something
happen, but I'm not sure', forcing the QAPI listener to inspect the
guest itself to see what went wrong, or just wait for some sort of
internal timeout (as Libvirt will do) and fail the operation regardless.

During this period between v1 and this v2 the PowerPC kernel was changed
to add a reliable error report mechanism in the device_removal path of
CPUs, which in turn gave QEMU the opportunity to do the same. This made
the DEVICE_UNPLUG_ERROR more relevant because now we can report CPU and
DIMM hotunplug errors.


changes from v1:
- former patches 1 and 2: dropped
- patch 1 (former 3): changed the version to '6.1'
- patch 2 (former 4): add a DEVICE_UNPLUG_ERROR event in the device
  unplug error path of CPUs and DIMMs

[1] v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04682.html



Daniel Henrique Barboza (2):
  qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI event
  spapr: use DEVICE_UNPLUG_ERROR to report unplug errors

 hw/ppc/spapr.c     |  2 +-
 hw/ppc/spapr_drc.c | 15 +++++++++------
 qapi/machine.json  | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+), 7 deletions(-)

-- 
2.31.1


