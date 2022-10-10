Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C969C5FA02F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:25:53 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtj4-0003nM-FO
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtez-0005iQ-Ab
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtew-0004cV-N8
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665411693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AebqChOaDYq7yIDiTmRx5ouy/xOW4a8MFi9ab5gAfy8=;
 b=CFhG64ZGg9kR4UXUySop1COBHwJ+RLvAbyHQ49BxhRGsPOk07vpfuKNHdxBmkTHayAQAJa
 XVDWZLHiRlK0z7fyguu1TgfGNB6gQGFagiGTOU/qbI1nbHKMpyl5SVGWBdRAszFBcPnOTg
 9BkRT4sS3S+w7DQ0UhXkcIhnl2YHqN0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-LK88M5KqPkqSv5TGhKS8bg-1; Mon, 10 Oct 2022 10:21:32 -0400
X-MC-Unique: LK88M5KqPkqSv5TGhKS8bg-1
Received: by mail-ej1-f69.google.com with SMTP id
 ht14-20020a170907608e00b0078d437c268dso4438264ejc.20
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AebqChOaDYq7yIDiTmRx5ouy/xOW4a8MFi9ab5gAfy8=;
 b=elVAmt310T0o09C+E9p2retPBi9eiSEchLdo0sKKnCF8rGMCF/0r++ln8E7r+yVE7Q
 ycz5212QNcE+hqdx8pGmNNE2wiB2wWlhoTuCr0tgjH0kgqD+CnPm7l7xghQIMKtx88mC
 STtdbyGgW+qIA2lIa6CDB/FS67+8FDCyNz3lE767qf9wt9MBWxlHVnOBjD3byqKtYjj7
 AiVVYNRyzQc+0Cku0YhCvz5rqv6UqmXDpSFM2MNDV4u3zvgoZ/mF11+dLQYiM+SRAH5a
 4c1PbJFZOAyD8M0PgPFAC2CMrtNvJDLs134mBXBStxjJ3GEP6k7K96Ny/Fp4wyk+6Ai/
 vKww==
X-Gm-Message-State: ACrzQf2G5j9BUQ4kBmw8tD5mT6Op7cx11+x0dPVL1pswNnidEKuS5IZF
 TsuLfKatX94S6EZodpRPc2Z58cFhdeBSvSvmG7VPoFlzMnHgMSa5X4FPzZZjuJvehPCOQN1EafW
 uftFy0ndK3v5z2YDaad8mODDHvCYi19kvCrSYKqpbwv6pKIgoSW7FkvuhPuBibyBjXlc=
X-Received: by 2002:a05:6402:5106:b0:45c:2c80:94a4 with SMTP id
 m6-20020a056402510600b0045c2c8094a4mr3579083edd.298.1665411690539; 
 Mon, 10 Oct 2022 07:21:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6k2b7K1u2jtIaaK25yn3TwK8Ypkj+9vK2daN6kRhiDrclyityL+qLxsVwROK5AZnxUSUwU4w==
X-Received: by 2002:a05:6402:5106:b0:45c:2c80:94a4 with SMTP id
 m6-20020a056402510600b0045c2c8094a4mr3579048edd.298.1665411690187; 
 Mon, 10 Oct 2022 07:21:30 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 bq15-20020a056402214f00b00457b5ba968csm7129726edb.27.2022.10.10.07.21.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:21:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] linux-user: i386/signal: support XSAVE/XRSTOR for signal
 frame fpstate
Date: Mon, 10 Oct 2022 16:21:24 +0200
Message-Id: <20221010142127.295676-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These three patches add support for x86 XSAVE/XRSTOR signal frames in
linux-user emulation.  This ensures that signals save and restore the
extended save states as well.

For 32-bit emulation not even FXSAVE was used, even though the
signal frame supports it.  Therefore, patch 2 extends 32-bit emulation
to use FXSAVE/FXRSTOR if the FXSR bit is set in CPUID.  If it is not
set, QEMU will use FSAVE/FRSTOR as usual; note that recent builds of
glibc most likely will check for FXSR bit even on 32-bit builds, and
will refuse to start with a "CPU ISA level is lower than required"
error.

Paolo

Paolo Bonzini (3):
  linux-user: i386/signal: move fpstate at the end of the 32-bit frames
  linux-user: i386/signal: support FXSAVE fpstate on 32-bit emulation
  linux-user: i386/signal: support XSAVE/XRSTOR for signal frame fpstate

 linux-user/i386/signal.c     | 227 ++++++++++++++++++++++++++---------
 target/i386/cpu.c            |   2 +-
 target/i386/cpu.h            |   3 +
 target/i386/tcg/fpu_helper.c |  64 ++++++----
 4 files changed, 210 insertions(+), 86 deletions(-)

-- 
2.37.3


