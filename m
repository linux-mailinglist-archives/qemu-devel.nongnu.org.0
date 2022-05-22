Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E627F53062D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:29:31 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nst8k-0006q9-Qn
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4Q-0002sj-FV; Sun, 22 May 2022 17:25:02 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4O-0005RW-Pp; Sun, 22 May 2022 17:25:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s3so16845421edr.9;
 Sun, 22 May 2022 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fBaH0kZiR6dSw7H2/eqC6uMYlqPGxjuaHc4FE2BaAQU=;
 b=FOuN+JhHa8oQ98t84+sncM85riB+9bhJIzqRahoGMfixZm/9ZizZSOy1QnBRcevAnK
 fD0UjbOwXFLFPzpN5Y/KedCVDUOKcObU97UQlnLNDEkJF55187v7aa7F/RhpQfZAGTdc
 sPbYg0YVbqQmVWzo9QiSeTnYsFG5WEXzeBrHV++Ds0CGNzjEBb78QlCutJI84F2a6LN9
 EkEXh48TMrAa0kxloT5HDaUY+y4ryEhYOSHcaW9VRKc4EDBoCxDa/hqSIxdxXj3NCf4B
 FoHy3GntlcSeo34AUB1cWZuklLwvChO7jdSlOC6VxLudzwA+TH486WSkfDVJNyU+850X
 xrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fBaH0kZiR6dSw7H2/eqC6uMYlqPGxjuaHc4FE2BaAQU=;
 b=mEcdX/T9CSnQvTLGvDtUl1ZcQrtYJRFJCo8wjcsAl9wQXwumX7sGqaL+db2FgIcLG6
 lMyfsHuN/y10OfmEkKqQ/ZnfofKPTyBL/xrHIhS8wYfl9mXjWvLCEqSLBPQ82OPAOUgo
 lhhzDnKeokSSUOTvu3bVaeZNZNRgh/WWyXvBIb2uN+BN8rJNL+o/gL9Ha92F3V8wuQzZ
 K/HhZkp43Y/T2UMqx9uzZkmuW/c75otK2bNTLMFCrgdKp5CSblTUIEqcc7Nr/81lZOkB
 FSDlGDeglCZz38ypiSWK4pUkk2es0Hwqzw/poG1Fh7QCW9DCcl/Emn8eQmncgX8E0EPf
 OAog==
X-Gm-Message-State: AOAM533sqW9zoepLczFSgrgfbydQ4UpUKrpc84pAE2Ix1GVv6SvrCj1l
 7roosaB3PyUQqcQZZfetWcxMGWS3miQ=
X-Google-Smtp-Source: ABdhPJzkPD1+JHJOoaQGjPuPLLCDkzYmldWglEdQkzP6CQs7gUezmv+yWXGiSEuimSPEeQg6I0rr4w==
X-Received: by 2002:a05:6402:440d:b0:412:9e8a:5e51 with SMTP id
 y13-20020a056402440d00b004129e8a5e51mr20511407eda.362.1653254698594; 
 Sun, 22 May 2022 14:24:58 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:24:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/6] QOM'ify PIIX southbridge creation
Date: Sun, 22 May 2022 23:24:25 +0200
Message-Id: <20220522212431.14598-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* Preserve `DeviceState *` as return value of piix4_create() (Mark)
* Aggregate all type name movements into first commit (Mark)
* Have piix4 southbridge rather than malta board instantiate piix4 pm (me)

Testing done:

1)
`make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
Result: All pass.

2)
Modify pci_piix3_realize() to start with
    error_setg(errp, "This is a test");
Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -cdrom archlinux-2022.05.01-x86_64.iso`.
Result: qemu-system-x86_64 aborts with: "This is a test"


v1:
The piix3 and piix4 southbridge devices still rely on create() functions which
are deprecated. This series resolves these functions piece by piece to
modernize the code.

Both devices are modified in lockstep where possible to provide more context.

Testing done:
* `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
* `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda 
debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`

In both cases the system booted successfully and it was possible to shut down
the system using the `poweroff` command.

Bernhard Beschow (6):
  include/hw/southbridge/piix: Aggregate all PIIX soughbridge type names
  hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
  hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
  hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
  hw/isa/piix4: QOM'ify PIIX4 PM creation
  hw/isa/piix{3,4}: Inline and remove create() functions

 hw/i386/pc_piix.c             |  7 ++-
 hw/isa/piix3.c                | 98 +++++++++++++++++++----------------
 hw/isa/piix4.c                | 97 +++++++++++++++-------------------
 hw/mips/malta.c               |  7 ++-
 include/hw/isa/isa.h          |  2 -
 include/hw/southbridge/piix.h |  6 +--
 6 files changed, 109 insertions(+), 108 deletions(-)

-- 
2.36.1


