Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E03AB89F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:07:20 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuY3-0008Sk-IX
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKO-0006S4-Uz
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:12 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKN-0001QG-9u
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:12 -0400
Received: by mail-ed1-x531.google.com with SMTP id c7so3772341edn.6
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yThrBTQxf0I26wZCpWet6CPoqt3rNF15i0Hd5IeB0hM=;
 b=VsBTQwiSQnO7X3uncJvGE6+eDNl2rGYUNB1N6yuxWJq8woWDoqN5RKGx9prfN2YSF1
 REjjowbk8axpNes0Xd+qjV1lefVLVWMRX0JrD36zlKeImBTR1qQFeuwzACr2bJ42Hyis
 IGmdFgg/Hij9WBdLqENARSt/nzanx+HTqc2BF1ae6YxbYUmcDddEjd+vNSIbuvcOFLzt
 /+ioRfoLM+bZG+v2+aBuJwySblpSuT2M9n1chPox8WQub6NxFWbpfDKtK1SaQNqgfsUs
 jqVoJqALjMafdZuN0UWffTkT4BCp8IO5rhTSKAloMz/XNeEuMwuMRlq/WozbvgDF0p0P
 Hmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yThrBTQxf0I26wZCpWet6CPoqt3rNF15i0Hd5IeB0hM=;
 b=gEOhAJF5hoA9HIfjT7QTsmqxLugEXLtqIAHil/KYsySle3Tcab4Hul1qqljhDqZPLs
 1R28KSDFoEicPOPXjZ11UWWMZd8PZhB2ledMmfXDlsrEf7ha5zEX+8/MoNXU3fZMI4Kz
 IrFgHqXy3o4d/qHp8S2fkCY/HO2I47LjztgRkNb6b9vcPd5uzFkQXiIVXfkBeZ2MLSNy
 8FGccf7DVU/Vf/MVYj/OlndB5a5X5vbrzS+oisUgoT4pkO8mFn2ZSvViCabgeLovA0jh
 3s1b1JeyASPgmvVzEFn+MyN6iVO8rm7f27+zXwAJhwsJzx1boCVGMYMqa8m2oq14j41t
 2Rxw==
X-Gm-Message-State: AOAM530r+h+dFz5lTIP5sZfPCqWjd3ObtEtp+4nT/0mtrz6iqdI68tW8
 eeJMl/wHRWa4S+n+DgZetgxJcuwNJf0=
X-Google-Smtp-Source: ABdhPJxgyLkMs3DAhnsTZ/enUVVvBwB/aznoobGZvd9F8tI1GfijI4PplxmZpC531ka998iP4lG4rw==
X-Received: by 2002:a05:6402:5244:: with SMTP id
 t4mr7596871edd.254.1623945189769; 
 Thu, 17 Jun 2021 08:53:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] vl: compound properties for machines
Date: Thu, 17 Jun 2021 17:52:57 +0200
Message-Id: <20210617155308.928754-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: armbru@redhat.com
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

 hw/core/machine.c           | 192 +++++++++++---------
 hw/i386/pc.c                | 110 +++++-------
 hw/i386/x86.c               |  15 +-
 include/hw/boards.h         |   4 +-
 include/hw/i386/pc.h        |   3 -
 include/hw/i386/x86.h       |   1 -
 include/qemu/option.h       |   6 +-
 include/qom/object.h        |  23 +++
 qapi/machine.json           |  27 +++
 qom/object_interfaces.c     |  58 ++++--
 softmmu/vl.c                | 348 ++++++++++++++++++------------------
 tests/qtest/numa-test.c     |  22 +--
 tests/unit/test-keyval.c    |  58 ++++++
 tests/unit/test-qemu-opts.c |  35 ----
 util/keyval.c               | 114 +++++++++++-
 util/qemu-option.c          |  51 ++----
 16 files changed, 621 insertions(+), 446 deletions(-)

-- 
2.31.1


