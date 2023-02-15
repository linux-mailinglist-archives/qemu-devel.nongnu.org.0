Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F88698300
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:15:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMIn-00017J-46; Wed, 15 Feb 2023 13:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSMIl-000173-8m
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSMIj-0002p6-8H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676484880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yksmljmUvR4zWWTUAl0ck1IccTIf2wenFXT2fKSRwlY=;
 b=iAFsYbXLSUZEq0ReZtYN/8TQnJ30i5CxzLg6hjSof1M2Z5Yb1uvVQlfGujPpTCnkD1AcEq
 MPF3aFbLFnI3ctKwUchEFQ2Ah8wQkzo5YP9miKSq25FEm40hW5K7jfCcAUz/APJ6FFekm6
 TiTIrAmlcYYOw2JhMLzvWd+Jz+bdWRY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-Yibtf_YZOBip44SMlePQdA-1; Wed, 15 Feb 2023 13:14:39 -0500
X-MC-Unique: Yibtf_YZOBip44SMlePQdA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y18-20020a056402271200b004ace77022ebso3439248edd.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yksmljmUvR4zWWTUAl0ck1IccTIf2wenFXT2fKSRwlY=;
 b=wIlZ7ZuAddbi3bIqJIuCn1LjSmX7FLEGzEfA5FaIGUoZFD0JfGjF9vG7p0h4hAOagt
 6casFBQaHXsGUvASUErDbrHwpnaCcpJNRt4l2d0jU/6XlkQ8HE844hvLGovgxi5z+p/5
 nR1fu6w9KQUj1yvjwtd+2R3gh0Yx/2C2THfXzKr/5L9UPTvDe10spF1XYuT1+JeszJ1q
 kDsUsPquTCvvnkLwPGXHRoh9JZ/lTM8NpCU1JfUHgUi+AWMezJQkFi95TWW4jec3SJgU
 Mv33YGSLez53SAzARgKCAIC/Xe8Pqp6DwmytNj/m8ZUlo2Z94Slq+uzaJrhjkkZIzCGd
 BXiA==
X-Gm-Message-State: AO0yUKV3oM2H+Tr1wu2nJCK3nrc8x2g6/BDqWBnrKrjGUtSmbTJ8l5rY
 OTIMpx/4s519gFMfI/M6zVtfUCMrFGnqO8evZsK2maelXBhJdBkyKNwQ4LtMBRqC4OBJY80Ycg7
 VJ8VpSjRV+xCPZJY/TFyZF9rJymh2wTZy0J2oNpukeVKFJaPV20WN7D1OZOLw1OH+GQi1ZcW8
X-Received: by 2002:a17:907:8e13:b0:8ab:b03d:a34f with SMTP id
 th19-20020a1709078e1300b008abb03da34fmr251527ejc.12.1676484877713; 
 Wed, 15 Feb 2023 10:14:37 -0800 (PST)
X-Google-Smtp-Source: AK7set87xeefXRUxT2YjFtwjGwpqMxaRbCuuGKWPnKr5PVLbWk7bFA+txXtcwSRGALTUFwHm4S70BA==
X-Received: by 2002:a17:907:8e13:b0:8ab:b03d:a34f with SMTP id
 th19-20020a1709078e1300b008abb03da34fmr251499ejc.12.1676484877288; 
 Wed, 15 Feb 2023 10:14:37 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm10027410ejy.174.2023.02.15.10.14.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:14:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/10] Misc patches for 2023-02-08
Date: Wed, 15 Feb 2023 19:14:34 +0100
Message-Id: <20230215181434.143843-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 3b33ae48ec28e1e0d1bc28a85c7423724bcb1a2c:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-02-09 15:29:14 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 12008ff748d8cfb62fb937559c0fd844371bab5e:

  libqtest: ensure waitpid() is only called once (2023-02-11 09:20:38 +0100)

----------------------------------------------------------------
* block/iscsi: fix double-free on BUSY or similar statuses
* catch [accel] entry without accelerator
* target/i386: various fixes for BMI and ADX instructions
* make the contents of meson-buildoptions.sh stable

----------------------------------------------------------------
v2->v3: dropped the test that failed on the BSDs, because it could not be
        reproduced on a VM. :(

Paolo Bonzini (7):
      build: make meson-buildoptions.sh stable
      remove unnecessary extern "C" blocks
      block/iscsi: fix double-free on BUSY or similar statuses
      vl: catch [accel] entry without accelerator
      target/i386: fix ADOX followed by ADCX
      libqtest: split qtest_spawn_qemu function
      libqtest: ensure waitpid() is only called once

Richard Henderson (3):
      tests/tcg/i386: Introduce and use reg_t consistently
      target/i386: Fix BEXTR instruction
      target/i386: Fix C flag for BLSI, BLSMSK, BLSR

 block/iscsi.c                    |   1 +
 include/disas/dis-asm.h          |   8 --
 include/qemu/bswap.h             |   8 --
 include/qemu/envlist.h           |   8 --
 include/qemu/rcu.h               |   8 --
 include/qemu/rcu_queue.h         |   8 --
 include/qemu/uri.h               |   7 --
 scripts/meson-buildoptions.py    |   7 +-
 scripts/meson-buildoptions.sh    |   2 +-
 softmmu/vl.c                     |  15 ++-
 target/i386/tcg/emit.c.inc       |  45 +++++----
 tests/qtest/libqtest.c           | 158 +++++++++++++++++--------------
 tests/tcg/i386/Makefile.target   |   6 +-
 tests/tcg/i386/test-i386-adcox.c |  75 +++++++++++++++
 tests/tcg/i386/test-i386-bmi2.c  | 194 +++++++++++++++++++++------------------
 15 files changed, 316 insertions(+), 234 deletions(-)
 create mode 100644 tests/tcg/i386/test-i386-adcox.c
-- 
2.39.1


