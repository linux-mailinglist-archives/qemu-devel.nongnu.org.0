Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDDB4B73FD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:12:59 +0100 (CET)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1Nr-0002wN-1k
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Ck-0004pi-8q
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:30 -0500
Received: from [2607:f8b0:4864:20::102d] (port=38675
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Cd-0007SX-7I
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:29 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so3572705pja.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XzabvAoREFrbQIF5XGJ9s+gXahH/9Tg8zfkzLmHKgoA=;
 b=M9ToD2qCaGCCIVOvg2XHc4AHVqBqf5BABKDZBBhVJbkowJtmYnJHZSyHjKqoRq1qgc
 QLR0X6Ye7kE6UBOBtXEVv/rfmmjiWROFzM3kVQrr89TH3xRIBg62sAHZr1ra9Ql+a4uG
 KnZpmG2pl0YnMWrFuiR2i6ipfBrKui9TgZYFDlFmywPYwbZeq6zCvI730zQXKsSwJ0TF
 xMoxnDYGEDIpeKIeLFU8mSkfEHtYBKq6oM0J/4STxRRvaiz01l1CRBCuIE6y6WnlmBOt
 SCRJX40I2l4gBIHyQ0xQ67u4Ut0hyflO4JWzeJALALgoMSzBBOJhuY4/MySc4UNGZll3
 p1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XzabvAoREFrbQIF5XGJ9s+gXahH/9Tg8zfkzLmHKgoA=;
 b=jCL3r4pApIWzuT/GcnprQwRfH1Jmp7RcsHLIgndHf1hcWJJBNkwCJzOrfdHjriHcsg
 npb2Ms3YDQsWmoyyWwhVct6VoKVjG+Sj9t7DG8lQEcm5Yalm8S1bDJUhP3Lwjs6Qt1AD
 1/zTaVbNhjRJ7soGOmaUeLCw1K7A8atKeTGUZu4QlFMiCEUfpx5yT9FPw8F1ZfmPrsCn
 GeTY/cFcxWgesCcK8jQ/mPg0ihARveaJkThHruK/ybBTISJBipZatkBp6XPGIGrgSsJJ
 YY+7+609LZdtEZjJNmiCCvCkbWgak5YCmKRmPxrXf/iU0XYu97s3SpViIqVB0QgcXvCO
 ni4Q==
X-Gm-Message-State: AOAM5330yVndKKVxN2DXOcdzcSYhSM/oq73KJ029nBwrR+4tSzCOxomT
 LBgXRcmCYZRwcZEZfOHvjgxMM13wZqk=
X-Google-Smtp-Source: ABdhPJw6cuYsBIOXiynouy2dLAS7sqRE3ws5/+422hYvhgaL52Ps0uMzgBRfws/SdIqnsjva7MeHdw==
X-Received: by 2002:a17:902:a5c6:: with SMTP id
 t6mr5013094plq.114.1644944473177; 
 Tue, 15 Feb 2022 09:01:13 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id f12sm39967716pfc.70.2022.02.15.09.01.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:01:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/8] buildsys: More fixes to use GCC on macOS
Date: Tue, 15 Feb 2022 18:00:58 +0100
Message-Id: <20220215170106.95848-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Few fixes to be able to use GCC extensions which are not
available on Clang.

Since RFC:
- Split Clang __builtin_available() patch
- Do not un-inline qemu_thread_jit_execute/write
- Do not use #pragma diagnostic
- Demote ui/cocoa key arrays to static const
- Lookup scripts/entitlement.sh script once again
- Pass filtered QEMU_OBJCFLAGS configure -> meson
- Disable out-of-line atomic operations on Aarch64

Philippe Mathieu-Daudé (8):
  osdep: Avoid using Clang-specific __builtin_available()
  osdep: Ignore 'unguarded-availability-new' warnings on macOS Catalina
  meson: Resolve the entitlement.sh script once for good
  configure: Disable out-of-line atomic operations on Aarch64
  meson: Log QEMU_CXXFLAGS content in summary
  configure: Pass filtered QEMU_OBJCFLAGS to meson
  audio: Rename coreaudio extension to use Objective-C compiler
  ui/cocoa: Constify qkeycode translation arrays

 audio/{coreaudio.c => coreaudio.m} |  0
 audio/meson.build                  |  2 +-
 configure                          | 35 ++++++++++++++++++++++++++++++
 include/qemu/osdep.h               | 10 +++------
 meson.build                        | 11 ++++++++--
 ui/cocoa.m                         |  4 ++--
 6 files changed, 50 insertions(+), 12 deletions(-)
 rename audio/{coreaudio.c => coreaudio.m} (100%)

-- 
2.34.1


