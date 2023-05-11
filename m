Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE26FEF38
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wd-0000D8-1q; Thu, 11 May 2023 05:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wX-0000Cc-En
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wO-0006d9-AN
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rkv4AKkVMESx2eIbt984dciBr8NT9lZxmgHVX7PPrj4=;
 b=XXoJ5lmD9t4MMv9t/WKRkY9IxUBg0dXA28POwiRkrW3RqnmRcm4LEHVSb9ff/fft3ujPDB
 IUpCWhsIv2T6ciwF0qA+SAw6HnPxyRYe+gbpj51HzzvwiowX/pz512hFQtzhSbS47avS0h
 34wifptpKFb9JRRai2KzVt3GojmwwnE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-_14yr0qqMrSgIp8LwaHaVQ-1; Thu, 11 May 2023 05:50:25 -0400
X-MC-Unique: _14yr0qqMrSgIp8LwaHaVQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94a34e35f57so820416566b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798624; x=1686390624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rkv4AKkVMESx2eIbt984dciBr8NT9lZxmgHVX7PPrj4=;
 b=Qg1pZLWh7WeXqW9i+WXGRaMVrq2QpgY4+VNQVhUkmtNfPicj7wPMaGlShq34ZaxI78
 N2nVU3fWaBG96/2yPCxVDQNTybhfP6dTKJjGROtSsgmYzQ3Z7PpP2hjyn38hlyWQp9yK
 SJa/TrHdrhvbloKMg8dD8uG534qHNLzffTqWW+465oJJrmuIdhZk4bTu80+c3xQks1yo
 itij7Y4YrSL6nIp+cM2/LFyrtNFYzFA/cJiKWCFMZvAmVgYOJMWTYbppU8SmTBXtG+OT
 zflykU7tG5i14qqGPbchS+PX8JR/vqr2pCIzvjzhD+FYBGpDlmAsSMWTbAJ0WwNEWY/W
 8jHg==
X-Gm-Message-State: AC+VfDz1Iwx3z52g2QgHjuDZOhUrBbSYjy1EqfIwLOwmaLUnDetmb7Uu
 /IlReUOEQhp2YTgiHtvet8dI3uwrYZZH5UqBvhdbM7HJY8UECyr8wby3dCQI6CEtxJxiLwtqFon
 6176KjVjd91XMEdBhX0xhGqMmvQTmLsgjwPSJjQATKrrCSd+f6SopzM3IoVrlh3kx8h7K9ZX7/2
 Y=
X-Received: by 2002:a17:907:930d:b0:94b:b4a5:30f with SMTP id
 bu13-20020a170907930d00b0094bb4a5030fmr18431470ejc.55.1683798623953; 
 Thu, 11 May 2023 02:50:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40KAR9nfJOXJJmymgzFmPl1th/rZLq1x/rJnsn/tBEvyzHVZ3t4UL3UUKXLd+kE8fvs3HSyA==
X-Received: by 2002:a17:907:930d:b0:94b:b4a5:30f with SMTP id
 bu13-20020a170907930d00b0094bb4a5030fmr18431444ejc.55.1683798623306; 
 Thu, 11 May 2023 02:50:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 bm11-20020a170906c04b00b00965ec1faf27sm3776595ejb.74.2023.05.11.02.50.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/24] Meson changes for QEMU 8.1
Date: Thu, 11 May 2023 11:49:57 +0200
Message-Id: <20230511095021.1397802-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The final bout of conversions; most of them were posted for 8.0, but
then delayed due to the Python 3.7+ requirement and the consequent
yak shaving with libvirt-ci and mkvenv.  It removes the remaining
compiler tests for emulators, applies a few cleanups that are enabled
by version 0.63 of Meson, and updates the documentation.

Paolo

Based-on: <20230511035435.734312-1-jsnow@redhat.com>


Paolo Bonzini (24):
  meson: regenerate meson-buildoptions.sh
  meson: require 0.63.0
  meson: use prefer_static option
  meson: remove static_kwargs
  meson: add more version numbers to the summary
  meson: drop unnecessary declare_dependency()
  build: move glib detection and workarounds to meson
  configure: remove pkg-config functions
  configure, meson: move --enable-modules to Meson
  meson: prepare move of QEMU_CFLAGS to meson
  build: move sanitizer tests to meson
  build: move SafeStack tests to meson
  build: move coroutine backend selection to meson
  build: move stack protector flag selection to meson
  build: move warning flag selection to meson
  build: move remaining compiler flag tests to meson
  build: move compiler version check to meson
  build: move --disable-debug-info to meson
  configure: remove compiler sanity check
  configure: do not rerun the tests with -Werror
  configure: remove unnecessary mkdir
  configure: reorder option parsing code
  docs/devel: update build system docs
  configure: remove unnecessary check

 configure                                     | 839 ++----------------
 contrib/plugins/Makefile                      |   7 +-
 docs/devel/build-system.rst                   | 296 +++---
 meson.build                                   | 658 +++++++++-----
 meson_options.txt                             |  13 +
 python/scripts/vendor.py                      |   4 +-
 python/wheels/meson-0.61.5-py3-none-any.whl   | Bin 862509 -> 0 bytes
 python/wheels/meson-0.63.3-py3-none-any.whl   | Bin 0 -> 926526 bytes
 qga/meson.build                               |   2 +-
 scripts/meson-buildoptions.py                 |   3 +
 scripts/meson-buildoptions.sh                 |  28 +-
 tcg/meson.build                               |   2 +-
 tests/qemu-iotests/meson.build                |   2 +-
 tests/qtest/meson.build                       |   2 +-
 tests/unit/meson.build                        |   2 +-
 ...{coroutine-win32.c => coroutine-windows.c} |   0
 util/meson.build                              |   6 +-
 17 files changed, 759 insertions(+), 1105 deletions(-)
 delete mode 100644 python/wheels/meson-0.61.5-py3-none-any.whl
 create mode 100644 python/wheels/meson-0.63.3-py3-none-any.whl
 rename util/{coroutine-win32.c => coroutine-windows.c} (100%)

-- 
2.40.1


