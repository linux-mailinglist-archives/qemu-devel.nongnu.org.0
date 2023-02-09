Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9F6903EF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3Kw-0005az-FA; Thu, 09 Feb 2023 04:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ3Kt-0005ZT-FU
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:35:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ3Kr-000792-NQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+wRfuW+iREu55n8kR5EewuDbbXG4Lub1NVJiJBtFIA=;
 b=ToA/cJHoJS7Usc606XwmPKpUzHXpmAGnYPH77rKXBzKxpmwlUrq+h+ZwauRvr8rQ0LZogX
 7AlAB7gJfBw1HINueAn7uJYOfRjO2jV7Mze9M1/0urIo76sWvmdkDvsGeoAE/VBbdkIZpm
 H25hTL/QHLY18KhE+yLbLsFD5CN/CVI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-g06J7rn0PBSw0lTjlT_XiQ-1; Thu, 09 Feb 2023 04:35:19 -0500
X-MC-Unique: g06J7rn0PBSw0lTjlT_XiQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 wu9-20020a170906eec900b0088e1bbefaeeso1163487ejb.12
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+wRfuW+iREu55n8kR5EewuDbbXG4Lub1NVJiJBtFIA=;
 b=aB4KFF5sPrA7LOZgkKqNzvxTUq4yMSTOl7CqXLC1478ric9SUIGYNB8vKVCFGEU19b
 lRd7zOlNEzAwBzfMqJtbUBD5X37F63kgLtqBW2rEelqaJ+OqaqIjJah9EBGJyfm4k/KE
 RVOhXrVXcMoTaqq6tT7rj/QEa3rR0h5JdFMq45lU0cg/6K9pwXpq7mfWo8LUBXhPIoU0
 DhMPimCg7m5NUwU0Rs1I0IlVPLUU0TGJXLCC6ZhdW4iV+ROC/R4BY/zGtzWAIUHlX6+m
 K+GpDX7jn8NIDjftYTMSoaWiVVvEPY8CME0Z4SOu5ma2/INkEYq7XFmUAtgXBP2Cnjaf
 oSTA==
X-Gm-Message-State: AO0yUKWMz+Qs+tNhNNmfvIzBCkrPBuFY+gLGaQJed0vUwt5LD0LjAQqA
 mKXylkeGO/yxSF95/ehZFB4YboVHivH9G1LzPuIW9dvRifzfFYYGWzaelJ85aKBMsoGIss5TNm/
 apECIW+J0a4eWPgEqDEGnGG90Ta6Sn/+esSK97ppO3s+VXU1AxRntDSPXcTbNy6BzJPgwI1W+
X-Received: by 2002:a17:907:6290:b0:8aa:bdeb:92f with SMTP id
 nd16-20020a170907629000b008aabdeb092fmr11664351ejc.33.1675935317818; 
 Thu, 09 Feb 2023 01:35:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/XT9QKE1dcNl1EAjjZF7jt7dc/j7l54l2tqmM1+4zkjMSyahOhEoOOa09RqDae5yd4RS1LAA==
X-Received: by 2002:a17:907:6290:b0:8aa:bdeb:92f with SMTP id
 nd16-20020a170907629000b008aabdeb092fmr11664327ejc.33.1675935317505; 
 Thu, 09 Feb 2023 01:35:17 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 kg3-20020a17090776e300b0088a2aebb146sm644048ejc.52.2023.02.09.01.35.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 01:35:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/11] Misc patches for 2023-02-08
Date: Thu,  9 Feb 2023 10:35:12 +0100
Message-Id: <20230209093514.177999-1-pbonzini@redhat.com>
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

The following changes since commit ae2b5d8381a73b27f35f19c988d45c78bb4d5768:

  Merge tag 'pull-include-2023-02-06-v2' of https://repo.or.cz/qemu/armbru into staging (2023-02-08 10:40:06 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 92f5d4606bedf0e2af0169a32aff9443084c5d0a:

  target/i386: fix ADOX followed by ADCX (2023-02-09 10:17:34 +0100)

----------------------------------------------------------------
* block/iscsi: fix double-free on BUSY or similar statuses
* catch [accel] entry without accelerator
* target/i386: various fixes for BMI and ADX instructions
* make the contents of meson-buildoptions.sh stable

----------------------------------------------------------------

* Include review comments from Thomas and Philippe
* Fix year in subject :)

Paolo Bonzini (8):
      build: make meson-buildoptions.sh stable
      remove unnecessary extern "C" blocks
      block/iscsi: fix double-free on BUSY or similar statuses
      vl: catch [accel] entry without accelerator
      libqtest: split qtest_spawn_qemu function
      libqtest: ensure waitpid() is only called once
      readconfig-test: add test for accelerator configuration
      target/i386: fix ADOX followed by ADCX

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
 tests/qtest/libqtest.c           | 186 ++++++++++++++++++++++---------------
 tests/qtest/libqtest.h           |  12 +++
 tests/qtest/readconfig-test.c    |  45 +++++++--
 tests/tcg/i386/Makefile.target   |   6 +-
 tests/tcg/i386/test-i386-adcox.c |  75 +++++++++++++++
 tests/tcg/i386/test-i386-bmi2.c  | 194 +++++++++++++++++++++------------------
 17 files changed, 386 insertions(+), 249 deletions(-)
 create mode 100644 tests/tcg/i386/test-i386-adcox.c
-- 
2.39.1


