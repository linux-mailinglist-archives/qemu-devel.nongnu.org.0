Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F296A4899AA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:16:02 +0100 (CET)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uWo-0002Ho-39
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRD-0008BA-Eq
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:15 -0500
Received: from [2a00:1450:4864:20::333] (port=42907
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uR5-0008Kr-Gr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso7249391wme.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d++8EwE1gE0mlDKD4w40o+kZgPFp6loKeFvJ4n7GzuY=;
 b=g7/F1NfPyoBNiHisfEK6S4ywN232rAV4qqCrOQeye+z7dLwpnLm0y/ehghRvk68QPu
 Qe7fRxjuTMf+i3LVM6IX7w19uWD3TCBh2l/clgiUB6dfiSlLPq0Ge3dNksT4OOjvy331
 wCzppIwbBdkhpAv7zBXrPK97r/5kUo4PMOJLt1uv/50SfHWj8II1knhxPw4pyqBhXD9N
 If7xNv72UKCWb8KHhvu0WfTGAcJ2S1NC9B8RjqKLjOnBSr9+1AKSOxlcg2aKUQDMVPtY
 BE3dDNSHmsu67/m5X+RcrVxp88R3JCSSFrMVo2am/HrWfaybgHykzPuGa+kU27JAsIii
 pVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d++8EwE1gE0mlDKD4w40o+kZgPFp6loKeFvJ4n7GzuY=;
 b=t0jTJ4IekmLuMBeSHQeKGFoa9W8Hc/uQFckXs2LTjOrzSRkcbxRNbPtgLzmBl7KgEn
 ez1n1lomO2//Z0DGEKLRvA9kj/je9x1CZDVmRSGjTLGSl1MO8XyuY+q74/XTlnvlR2xT
 kApIdBCZMXYI6IMO8sLv0eUE/ce2R9jIJ+aXTZW6jGcayPGK8giqFQBNCbG+MEqbhvAu
 Atu1c7tCI9mFGNkxKkmTwP8KyoJXXRQB8U+Czt6slz+AozVw+kfztAUjvle4dHsROTLz
 9etRGkPVw9ZsF1W+E5UQ+zeiavdJZOAdEFJQpiW15SbUqNXnfWI/RdcxkKTBu0cZ+XBa
 21gA==
X-Gm-Message-State: AOAM533Z7qexn/DPoDJN6HVVvbK9OaN6Di5TPLZLKiyW5JoELiZOh6st
 vI4Kzs46hwHyU2mGftWVancrjb/9f6NJqg==
X-Google-Smtp-Source: ABdhPJxpjmHV8ujSPqu490+DYrQDDylG+0uY7m/FxbtwYQusp5FfUGeIEYpwSg6JfKBHGRidjemhjQ==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr13139445wmi.176.1641820203792; 
 Mon, 10 Jan 2022 05:10:03 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id bh10sm6575338wmb.12.2022.01.10.05.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/7] host: Support macOS 12
Date: Mon, 10 Jan 2022 14:09:54 +0100
Message-Id: <20220110131001.614319-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Few patches to be able to build QEMU on macOS 12 (Monterey).=0D
=0D
This basically consists of adapting deprecated APIs. I am not=0D
sure about these APIs, so tagging as RFC.=0D
=0D
I couldn't succeed to adapt the Cocoa code.=0D
=0D
CI job added to avoid bitrotting.=0D
=0D
Since v2:=0D
- Addressed Akihiko Odaki comments:=0D
  . use __is_identifier(),=0D
  . remove cocoa setAllowedFileTypes()=0D
- Addressed Daniel Berrang=C3=A9 comment:=0D
  . rebased on testing/next, update libvirt-ci/lcitool=0D
=0D
Based on Alex's testing/next=0D
Based-on: <20220110124638.610145-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  configure: Allow passing extra Objective C compiler flags=0D
  ui/cocoa: Remove allowedFileTypes restriction in SavePanel=0D
  hvf: Make hvf_get_segments() / hvf_put_segments() local=0D
  hvf: Remove deprecated hv_vcpu_flush() calls=0D
  audio/coreaudio: Remove a deprecation warning on macOS 12=0D
  block/file-posix: Remove a deprecation warning on macOS 12=0D
  gitlab-ci: Support macOS 12 via cirrus-run=0D
=0D
 configure                         |  8 ++++++++=0D
 meson.build                       |  5 +++++=0D
 target/i386/hvf/vmx.h             |  2 --=0D
 target/i386/hvf/x86hvf.h          |  2 --=0D
 audio/coreaudio.c                 | 16 ++++++++++------=0D
 block/file-posix.c                | 13 +++++++++----=0D
 target/i386/hvf/x86_task.c        |  1 -=0D
 target/i386/hvf/x86hvf.c          |  6 ++----=0D
 .gitlab-ci.d/cirrus.yml           | 15 +++++++++++++++=0D
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++=0D
 tests/lcitool/libvirt-ci          |  2 +-=0D
 tests/lcitool/refresh             |  1 +=0D
 ui/cocoa.m                        |  6 ------=0D
 13 files changed, 67 insertions(+), 26 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars=0D
=0D
-- =0D
2.33.1=0D
=0D

