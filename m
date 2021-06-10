Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978E3A2D34
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:37:32 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKsF-0004Fu-Dn
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqY-0001aw-0c
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqV-0005cE-Uo
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id c5so2348839wrq.9
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jdn3piv5JTWKxm1otWmxaFi1BOq/Htpk7aFeR7GDeDs=;
 b=G/QcpYIarsPftlNl0IJNJNFvNFquTGRieq9/nRk2zmHpQUCc9lTcZF1zFm4n+F908K
 uV/xcd211zQbDDLuWsLjcqOMnPO6wuSx+vZIUupfzFKWfPVriJAPhwdtP3Lf2t7CSTvl
 CwFsdjLkDzBYDijabPla5ov8cAFhvQ5W0PvM1kKWsOXx5u4zOtv8FRIBp2ARCbAYrF8M
 Cb4tWgS4tTZZ4s5LRye5fwXcmZlyhjSMlReM8MlLjHNDXWGnZVLIG8JC8ATMCSRNAA4U
 /JVyKPZhkeDXb0y/MjWkPd8dYB4pw8OLoDrlbE/2ENU/4JGFct+2o+Lp7qbI8W6QQWGK
 C7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Jdn3piv5JTWKxm1otWmxaFi1BOq/Htpk7aFeR7GDeDs=;
 b=hZVAELOuH6qsl66pLd0cDIIpg18UdEnr5ljRVSwp/THI2KhfQnOmpsEcYFdEMGKGZG
 0ICMySaXVAYYDuzhb6X5gFPZDb8HusI70DZF3j6tF6bhRN8ZHyD6LdWnEmhndFQbo/mB
 ZyZHMvoS8KkFgrTPDChHH6CCy3XCWddwEpQh+Vd0m/OIqrJSei2GED4s3WTL+KexYroF
 nGCbr4Gh8P0F9zhWT3Y5Mkwboq0R3sBQlCL6pTx4A7UcsHwAbZFHEDTsPYGA8kYdQMre
 Z0Q4NtC4wj1QmB46F21hqBLvPj3t7uifh0VKzksW7ChSdfCgqpURv+tIqW9qpfq42DrE
 tzkQ==
X-Gm-Message-State: AOAM532FFyKnH3yFocWjqn1XMyH4kQ++3qSiKkVpulh/DB/cssI3v48F
 jGMMzj4oVIbOPNFO8AlwXSV0iGrbpx/50A==
X-Google-Smtp-Source: ABdhPJyJsr+RJlgymM5JVj51Z2tEtoT8wRCjFV6XGMP3yvBLFdgI+r1l2GYWMwbVMBvyfGQKKBwHJg==
X-Received: by 2002:adf:fa0f:: with SMTP id m15mr5377685wrr.379.1623332140227; 
 Thu, 10 Jun 2021 06:35:40 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] vl: compound properties for machines
Date: Thu, 10 Jun 2021 15:35:27 +0200
Message-Id: <20210610133538.608390-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series converts -M to keyval parsing, so that they can use
compound properties.  The series also converts -smp to a
compound property.

This is also a preparatory work for SGX support, which would like to use
an array-type machine property.

Patches 1-3 introduce the infrastructure and the new functions that
will be used for "-M help" and to use keyval with "merge_lists = true"
semantics.

Patch 4 does the actual switch of -M to keyval and patch 5 removes now
dead code from qemu-option

Patches 6-11 finally validate the concept by implementing -smp as a
compound property; that is "-smp X=Y" is converted to "-machine smp.X=Y"
automatically.  Really the only interesting patches are 9 and 11,
while the others are just cleanups.

The series does not support JSON syntax for -M because we need
to consider what happens if string-based dictionaries (produced by -M
key=val) have to be merged with strongly-typed dictionaries (produced
by -M {'key': 123}).

The plan is to only allow exactly one -M option when JSON syntax is in
use; the problem is that this is a forwards-compatibility landmine.
As soon as -smp is converted, for example, -smp becomes a shortcut for -M
and it is now forbidden to use -M '{....}' together with -smp.  It would
be impossible to know which options in the future will become incompatible
with -M JSON syntax.  Therefore, support for JSON syntax is delayed
until after the main options are converted to QOM compound properties.
These could be -boot, -acpitable, -smbios, -m, -semihosting-config,
-rtc and -fw_cfg.

Paolo

Paolo Bonzini (11):
  qom: export more functions for use with non-UserCreatable objects
  keyval: introduce keyval_merge
  keyval: introduce keyval_parse_into
  vl: switch -M parsing to keyval
  qemu-option: remove now-dead code
  machine: move dies from X86MachineState to CpuTopology
  machine: move common smp_parse code to caller
  machine: add error propagation to mc->smp_parse
  machine: pass QAPI struct to mc->smp_parse
  machine: reject -smp dies!=1 for non-PC machines
  machine: add smp compound property

 hw/core/machine.c           | 184 +++++++++++---------
 hw/i386/pc.c                | 108 ++++++------
 hw/i386/x86.c               |  15 +-
 include/hw/boards.h         |   4 +-
 include/hw/i386/pc.h        |   3 -
 include/hw/i386/x86.h       |   1 -
 include/qemu/option.h       |   6 +-
 include/qom/object.h        |  23 +++
 qapi/machine.json           |  27 +++
 qom/object_interfaces.c     |  58 +++++--
 softmmu/vl.c                | 336 ++++++++++++++++++------------------
 tests/qtest/numa-test.c     |  22 +--
 tests/unit/test-keyval.c    |  56 ++++++
 tests/unit/test-qemu-opts.c |  35 ----
 util/keyval.c               |  90 +++++++++-
 util/qemu-option.c          |  51 ++----
 16 files changed, 584 insertions(+), 435 deletions(-)

-- 
2.31.1


