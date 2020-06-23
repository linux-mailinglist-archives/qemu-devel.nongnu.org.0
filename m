Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D84204D6D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 11:07:55 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jneuH-0007Nj-J4
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 05:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnesy-0006KZ-J9
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:06:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33024
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnesx-00032B-3n
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592903189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2m2t021fPmocAk1w7rK7jsWgzV0rCiGfOdB2/ye3op0=;
 b=dbWhakwHD8H5oV049Nm+m2ldEXE7NSVAF2idN+WMAyTsxvJ4cCiTBvAkg7NO+PUxB+Y+nC
 NMn6fD9q8iKuQg0lSkbeEkp1VHImEECRghDDP565wtvntpFsBw9y+Cef+WJUuoN+bxbR3L
 RWcQaCp9ZpsWNrL824US93HByBDN1GE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-7NYUiXCoNfyG_wSJMzs19w-1; Tue, 23 Jun 2020 05:06:26 -0400
X-MC-Unique: 7NYUiXCoNfyG_wSJMzs19w-1
Received: by mail-wr1-f70.google.com with SMTP id g14so7769816wrp.8
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 02:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2m2t021fPmocAk1w7rK7jsWgzV0rCiGfOdB2/ye3op0=;
 b=OHKIIv3uDe1wF5vFqTqGI7xBwAB6FiGix2F7Lvy3A33JcFDeK/DG/HzgDYRSZxKKgj
 v7WfK9A8KEkA4e2IheVYTeW1j7/JtVCZv+cCLHlvv25iANe6xH+vedPIQ4izV0oqooTo
 eKWcp3Re60Z4prI/9vBMAb8npexx2xtk0ZwYAjHaalVXGbsQf2HNF/nzGabPp9w2iXw4
 1PbE0DYr/uZsHbulDzTzn3KYgE/hz1I32oIImwgBDx7CFTY6mSTqVDoneiyQw8aq5XAi
 l8wQS6l1lx7tty4fcBEBOhCETANXeON3uJ8E07GGLAbLegdGAkpHHZ8p8dVPTsd3Yr1a
 XRBQ==
X-Gm-Message-State: AOAM533/vxbJJLrwhcWzPMHgJCP+bu1WIDbEehWe84Oj2xFK0/6sfSta
 l11kJQ43H565cYodPB62658ZBkV3Rh4WlNVCVnG7CJ5yss6VnAn5Y9/ORJFNGe3rfGvEXpgxJh6
 lG3PWWtSj2Sw4BgQ=
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr11437365wrx.81.1592903185314; 
 Tue, 23 Jun 2020 02:06:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZP10WQPOHMp4i3NHPCCa9B8KmGvXoITH2SZ5LSo0WtmaCkCiIGpy/qn/H3k+WRHf/tocWQg==
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr11437320wrx.81.1592903184970; 
 Tue, 23 Jun 2020 02:06:24 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id b19sm2951554wmj.0.2020.06.23.02.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 02:06:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] target/arm: Fix using pmu=on on KVM
Date: Tue, 23 Jun 2020 11:06:20 +0200
Message-Id: <20200623090622.30365-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:55:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v2:
- include Drew test fix (addressed Peter review comments)
- addressed Drew review comments
- collected R-b/A-b

Andrew Jones (1):
  tests/qtest/arm-cpu-features: Add feature setting tests

Philippe Mathieu-Daudé (1):
  target/arm: Check supported KVM features globally (not per vCPU)

 target/arm/kvm_arm.h           | 21 ++++++++-----------
 target/arm/cpu.c               |  2 +-
 target/arm/cpu64.c             | 10 ++++-----
 target/arm/kvm.c               |  4 ++--
 target/arm/kvm64.c             | 14 +++++--------
 tests/qtest/arm-cpu-features.c | 38 ++++++++++++++++++++++++++++++----
 6 files changed, 56 insertions(+), 33 deletions(-)

-- 
2.21.3


