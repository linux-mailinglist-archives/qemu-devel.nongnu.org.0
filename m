Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B423510040
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:18:53 +0200 (CEST)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM1k-00089R-Aq
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzO-0005R5-1F
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzL-0005W0-HH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m22-20020a05600c3b1600b00393ed50777aso1632609wms.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMkgwOtpRBpSUQPtfQrUYRar8Okrd5p0x6AhVg3mxtQ=;
 b=bwZpoGa8u0mkzLlgzzVOwRMgidU/6qkRL0kCGzUFtcUd8gI/GkGD+wlxaP/gs3qTIg
 HcSHholcyiLQRCaEF8jLoPQR9TX99UXzRB8L4lzvKruCEVw76YYcAdbmRkE1JH4vnL5f
 H2xqzKiX3mdoQnFW6I1ko+bsTKOBkbIo8GhBOOlQXp6muhCHz4OXdwjVCrWDwXEcp0qP
 7hSgpQz21pqzjthJ07iN9UBNmEC+zqLLFI4fX8N9z/zW1pTmMh4butmgrZ/8ExNhJ5dP
 2T0Py+bvNVutm3wZt7z4rPsVCBdjsp4ae3vTSGupbqXjGDNsK7pEDdX3mxMkvtL5frPj
 l7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oMkgwOtpRBpSUQPtfQrUYRar8Okrd5p0x6AhVg3mxtQ=;
 b=7x6ams55JTYLuGCDSrdar9tHjaFnWe0VhdaMVlo17JLnjNPcHNFgB4Y0n4vu/SDKBs
 Q6iiBH0Y2q/1dat97e+zEV9LHo3iPSmnDhN80hGN1EcJqEtL4rI7xeU78Az3SMdOSfPu
 pySGwsTd6HZl2RmAkDG7o6gBWJ42ysyEHjf3Ufswwuiv/LjIyyzAkLdMTfW7xgNSdyKJ
 9E5Vm0TtHUn1sg00Hv+3i8XbykCuBIgmlbOPMavglHUUKbC+CfBuO9rglT7pg4JoMThj
 +vZtI5YoTo+wGP3PKFV9p/3ZOGIWc2tALM5fii+42XBDmgbQtJlb8K2DPUjvtmxV92oL
 9HiA==
X-Gm-Message-State: AOAM532uQoY8WqJ1uClJ+gLd+wJaDrPgctkRLuorFfTkm7BS6o4r5ku1
 7/rTplHxyVMDwI/c+cuwAJPe0AASVTUEkw==
X-Google-Smtp-Source: ABdhPJyj/beKOfc0dNzzdAmyhNemviV6K3bWliOAdTkdpKIsS/F4iGhb/nKqu3+YEuIbDF4T+raX7g==
X-Received: by 2002:a7b:c118:0:b0:393:e206:6828 with SMTP id
 w24-20020a7bc118000000b00393e2066828mr16321601wmi.134.1650982581539; 
 Tue, 26 Apr 2022 07:16:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] qmp, hmp: statistics subsystem and KVM suport.
Date: Tue, 26 Apr 2022 16:16:11 +0200
Message-Id: <20220426141619.304611-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds QEMU support for querying fd-based KVM statistics.
This allows the user to analyze the behavior of the VM without access
to debugfs.

However, instead of adding an ad hoc command, the new QMP entry point
can be extended in the future to more statistics provider than KVM
(for example TCG, tap, or the block layer) and to more objects than
the VM and vCPUS (for example network interfaces or block devices).

Because the statistics exposed by KVM are not known at compile time,
the kernel interface also comes with an introspectable schema.  This
schema is exposed by the query-stats-schemas QMP command.

Patches 1 and 2 add the basic support, respectively the QMP command
and the KVM producer.

Patches 3 and 4 add a basic HMP implementation.  The first of the two
adds a basic filtering mechanism to the QMP command, which is then used
by HMP (which only shows vCPU statistics for the currently selected
guest CPU; this is consistent with other HMP commands and does not
flood the user with an overwhelming amount of output).

The remaining patches add more filtering, respectively by provider
and by the name of a statistic.

Compared to the previous version that Mark sent, the changes are
as follows:

* changed the QAPI schema so that vm, vcpus etc. are not keys of
  QAPI objects anymore.  This simplifies the interface exposed
  to stats callbacks as well.

* changed the QAPI schema to use optional fields a bit more (e.g.
  avoiding unit == 'none', or omitting base if exponent is 0).

* reorganized the patches to introduce filtering separately.  This
  also resulted in some changes to the statistics callbacks that
  the producers have to define.

* removed "info stats-schemas" HMP command.  The information in
  query-stats-schemas is already printed by "info stats".

Paolo

Supersedes: <20220215150433.2310711-1-mark.kanda@oracle.com>

Mark Kanda (3):
  qmp: Support for querying stats
  kvm: Support for querying fd-based stats
  hmp: add basic "info stats" implementation

Paolo Bonzini (5):
  qmp: add filtering of statistics by target vCPU
  qmp: add filtering of statistics by provider
  hmp: add filtering of statistics by provider
  qmp: add filtering of statistics by name
  hmp: add filtering of statistics by name

 accel/kvm/kvm-all.c     | 413 ++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx    |  14 ++
 include/monitor/hmp.h   |   1 +
 include/monitor/stats.h |  42 ++++
 monitor/hmp-cmds.c      | 232 ++++++++++++++++++++++
 monitor/qmp-cmds.c      | 132 +++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 218 +++++++++++++++++++++
 9 files changed, 1054 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

-- 
2.35.1


