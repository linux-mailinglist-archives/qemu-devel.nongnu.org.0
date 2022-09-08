Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7E5B1BBA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:41:16 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFuE-0002la-J6
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWFkc-0002JP-Fs
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWFka-0005Nc-UW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662636676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pOU7hRIJcm8dRtYse1TxPAeV38bnQMDLW8zImgBi/RI=;
 b=dWL/y9E/IRFDzJtY2H0g/uHgXQVZIFJ9Gq3rDSPKsQY+9t7t7tMiLwtnaFV/cjYWwY9sUH
 Yv6VAvMQY3IW8MukHiGpuvcRbQJo6hASAzSOtUOBjRJidKh+mQZZloLXKNGpvjOJ3HY5kC
 I3Ukj7hhppSoJ5/7/VdUC6B86b8SDTE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-8bdDrd0jM062jFt06iPO8Q-1; Thu, 08 Sep 2022 07:31:12 -0400
X-MC-Unique: 8bdDrd0jM062jFt06iPO8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 887233C01E1A;
 Thu,  8 Sep 2022 11:31:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E336945DF;
 Thu,  8 Sep 2022 11:31:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A92FF18009BE; Thu,  8 Sep 2022 13:31:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/2] expose host-phys-bits to guest
Date: Thu,  8 Sep 2022 13:31:07 +0200
Message-Id: <20220908113109.470792-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When the guest (firmware specifically) knows how big
the address space actually is it can be used better.

Some more background:
  https://bugzilla.redhat.com/show_bug.cgi?id=2084533

This is a RfC series exposes the information via cpuid.

v2:
 - change fvm hint name.
 - better commit message.

take care,
  Gerd

Gerd Hoffmann (2):
  [temporary] reserve bit KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID
  [RfC] expose host-phys-bits to guest

 include/standard-headers/asm-x86/kvm_para.h | 3 ++-
 target/i386/cpu.h                           | 3 ---
 hw/i386/microvm.c                           | 7 ++++++-
 target/i386/cpu.c                           | 3 +--
 target/i386/host-cpu.c                      | 5 ++++-
 target/i386/kvm/kvm.c                       | 1 +
 6 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.37.3


