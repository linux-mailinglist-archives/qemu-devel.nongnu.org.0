Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDD68F44C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:21:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo78-0003bG-8B; Wed, 08 Feb 2023 12:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6k-0003YD-II
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6i-0000Xs-TO
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kU2bq75/hQBZoUi8mcijq1aLcHopMGmqeGTTwiMvGeg=;
 b=cJKApNOA7IRUaRjFX/DDW77QKzgzMiVC45VlFrkMdRitumeIU6bGaGCnuBeQr+7Xgx7mhX
 jq297IWtdO388Pst5xTvV/yEHi8U13RgD9kNvYFkdrdE0Y8dmxJmdxMnuLjgdUyLmSk+co
 /1NzvfPOXVLpQmgFzdMnB1Cp6XSU304=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-2NO5MtWTM1ap-cFdZUzaNg-1; Wed, 08 Feb 2023 12:19:27 -0500
X-MC-Unique: 2NO5MtWTM1ap-cFdZUzaNg-1
Received: by mail-ej1-f72.google.com with SMTP id
 i11-20020a1709061ccb00b008aadd9cb12fso1877492ejh.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kU2bq75/hQBZoUi8mcijq1aLcHopMGmqeGTTwiMvGeg=;
 b=UpTdxxKiLD3jdth3hK7hB/gaZ34phRlCl6Q3zG0rsAyhKPz6LcMec7iE38cAtekZiA
 vush4dzOF0/cO5sbE7OSNvNEHlmDwVj2gAfLljGMUySDG74MUH4BVAytUttEucOm8f8X
 psasia9V3GfImJ91ocHkfr9mHZeGZXbN1Umrhx9OBgkwN9RbE91BSQeI81AxuZouX7lf
 OeD64lNazJYGV9o1DagxE1qc6A8rc87VO0okeF0rLJki1HV80MRZr/ZypHH+D79x3/U/
 PrUlvNB6suF3BQhjxmaI/obxEvzhoB5dCBTohzQ3/S6kmMRWMqorGCTqxzVNkax6qrsK
 YdWw==
X-Gm-Message-State: AO0yUKUcsnVgMy/zTXTElMrFyU+9z889bHN+RYCLhS5r81Hwx0KoLq6R
 7e/YpfwztqHgzrJrNEu9X8iv0w14PfDWcs2XlYYTvpN+w892dNj0LIFCPh2KWcSvvQGaY52Zn9V
 8M4Bs91SDm7Ze+Ztz9wX5H924q+hFQ3AnJ7Q0jJFAjdZ+N0R5fk3iZw8iBcTcYyhI74z0Ti3Q
X-Received: by 2002:a17:906:b853:b0:8ab:4c4:d0f6 with SMTP id
 ga19-20020a170906b85300b008ab04c4d0f6mr3853975ejb.56.1675876765830; 
 Wed, 08 Feb 2023 09:19:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8tmylY2/XLtxh2s3uLA2HZB8n2qCCHMQ8p1QIm8ttz9vestfVNC5UFgcSmtlI87gr31dbwTg==
X-Received: by 2002:a17:906:b853:b0:8ab:4c4:d0f6 with SMTP id
 ga19-20020a170906b85300b008ab04c4d0f6mr3853941ejb.56.1675876765426; 
 Wed, 08 Feb 2023 09:19:25 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a17090692ca00b0088f8ae18b6bsm8544268ejx.189.2023.02.08.09.19.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Misc patches for 2022-02-08
Date: Wed,  8 Feb 2023 18:19:11 +0100
Message-Id: <20230208171922.95048-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

for you to fetch changes up to e0de04cf9bd7cf03db16f33276679caf1724b75c:

  target/i386: fix ADOX followed by ADCX (2023-02-08 18:16:55 +0100)

----------------------------------------------------------------
* block/iscsi: fix double-free on BUSY or similar statuses
* catch [accel] entry without accelerator
* target/i386: various fixes for BMI and ADX instructions
* make the contents of meson-buildoptions.sh stable

----------------------------------------------------------------
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


