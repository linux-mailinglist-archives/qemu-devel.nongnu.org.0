Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805E204F9B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 12:52:25 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jngXP-00071Q-I6
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jngWB-0005DJ-Ie
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 06:51:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30235
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jngW6-0007PR-Oi
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 06:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592909461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q94CucqHN1D7KKGTyBIU8O5tt3pd+XQigNdMLEupMvs=;
 b=h+QbQimdOzksGgErMkIxV2v9SaswPsz24Fxr/FPxRgiXmSkSJjxQyftxpsqTUwxxeL7kJH
 0Edl6JU/ae7xdFjpQMcPtmIcPR4S9ATer+unCN9gr6a7lqznkhbHBGaryTgIXklEmMX7iT
 HND+ZbyqxPdLt1y/Jh9AEgQhunLH9pc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-KZTxcMlZN3-nyizM66NhTg-1; Tue, 23 Jun 2020 06:50:57 -0400
X-MC-Unique: KZTxcMlZN3-nyizM66NhTg-1
Received: by mail-wr1-f69.google.com with SMTP id o25so12994651wro.16
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 03:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q94CucqHN1D7KKGTyBIU8O5tt3pd+XQigNdMLEupMvs=;
 b=iRlVJKKM+r0H74WhPwRxQdV4vINHpWcibFA+PStNDkUAiRhX3koUOzrccfWQPBiM+/
 la4nRBM59+uR1i4T0BuTAAMB4fJGQ1CjuwgJBieIyFW5Wb4aBJalZh5iEFUBPKrznWaw
 ojRK12Ju3qWHsNCaPpsSmpUGc8QctdaYN6k+DeWkIn9Pdzqp5sit9eFX1GEPgPX/NaLF
 9HKZ8hndXduJUQB0Z1IUAfkHA8ZakaU8USxIfCGrqBpTB7G6DVU+tN0b8TaDHXrZJIbu
 iU/AiGnG5MoIVBJatUqXv+Vf3wmubt9Jlm8goY+u/kHnILS/rtVhr3ssJNWD+9hdD9cH
 kczw==
X-Gm-Message-State: AOAM531DhNgbxhaw1u4Xm4U55wJRFkPnruKAEK+apDqalrVf7qLCSE0R
 Pv5Snk6OUGhoOopHAHCWqLdPprgqUJ2SyUi/3qIDXRMXtVluztsT9hZOHLhMiLMOVAXrvKfcw8F
 LZMZKXX9XkW/pHnQ=
X-Received: by 2002:adf:f70e:: with SMTP id r14mr25942429wrp.150.1592909456060; 
 Tue, 23 Jun 2020 03:50:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlFax+p3i5iqFekMZp1RI7Mb/GelsfigfVK2k+fsxbIpqx4pyzX+QN9QZ0xJFmneZKKMePoA==
X-Received: by 2002:adf:f70e:: with SMTP id r14mr25942396wrp.150.1592909455858; 
 Tue, 23 Jun 2020 03:50:55 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r7sm3069566wmh.46.2020.06.23.03.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 03:50:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] accel/kvm: Simplify few functions that can use global
 kvm_state
Date: Tue, 23 Jun 2020 12:50:45 +0200
Message-Id: <20200623105052.1700-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:54:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following Paolo's idea on kvm_check_extension():
https://www.mail-archive.com/qemu-devel@nongnu.org/msg713794.html

CI:
https://travis-ci.org/github/philmd/qemu/builds/701213438

Philippe Mathieu-Daudé (7):
  accel/kvm: Let kvm_check_extension use global KVM state
  accel/kvm: Simplify kvm_check_extension()
  accel/kvm: Simplify kvm_check_extension_list()
  accel/kvm: Simplify kvm_set_sigmask_len()
  target/i386/kvm: Simplify get_para_features()
  target/i386/kvm: Simplify kvm_get_mce_cap_supported()
  target/i386/kvm: Simplify kvm_get_supported_[feature]_msrs()

 include/sysemu/kvm.h         |  4 +-
 accel/kvm/kvm-all.c          | 76 +++++++++++++++----------------
 hw/hyperv/hyperv.c           |  2 +-
 hw/i386/kvm/clock.c          |  2 +-
 hw/i386/kvm/i8254.c          |  4 +-
 hw/i386/kvm/ioapic.c         |  2 +-
 hw/intc/arm_gic_kvm.c        |  2 +-
 hw/intc/openpic_kvm.c        |  2 +-
 hw/intc/xics_kvm.c           |  2 +-
 hw/s390x/s390-stattrib-kvm.c |  2 +-
 target/arm/kvm.c             | 13 +++---
 target/arm/kvm32.c           |  2 +-
 target/arm/kvm64.c           | 15 +++---
 target/i386/kvm.c            | 88 +++++++++++++++++-------------------
 target/mips/kvm.c            |  6 +--
 target/ppc/kvm.c             | 34 +++++++-------
 target/s390x/cpu_models.c    |  3 +-
 target/s390x/kvm.c           | 30 ++++++------
 18 files changed, 141 insertions(+), 148 deletions(-)

-- 
2.21.3


