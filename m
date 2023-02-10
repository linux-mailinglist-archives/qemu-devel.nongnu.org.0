Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FD692B32
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcrU-00067I-G4; Fri, 10 Feb 2023 18:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQcrS-00066w-E2
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:31:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQcrQ-0007pd-R2
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:31:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso7424357wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjawzsB6JEsBYu+9JA5UAOJ96xG3xQwP9+NWJpC4/hY=;
 b=khYPMvoEsG5OrCRu5RuWmscJvLHdSAs804nLFC4umcuY3753pMq7HEV5TyoJ9pnYbR
 NLmrH8HXwNrERFm2UJjBZjb3is8HX54qLtLOk10jk0uDv3GJFtuRAxXp9aCfVxsQIFMF
 ohY77uugbiVpiL+OFE1LlOsiDGd+KLB9lNsRYru1VTdS7vx6hmZfIX1qiKKnQRCTSrVZ
 fn7gm0YBxPHuDt+sOglPrj8IwpGqT18mzFc4PSJrHSzt6GaMcFBYtpOfTtJvssmknnz8
 uH2HDlScYIuY2/dYZ+R9C6Hlyh5Zq6JIwJmcsvYJHfcJMt85aTzfA7BNEixEDNKQz125
 Izsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZjawzsB6JEsBYu+9JA5UAOJ96xG3xQwP9+NWJpC4/hY=;
 b=v7M+lzI/ILP2BxBvmRs6ePrbmsk10wZ6sZxnLGqUmuktVhMD8maTBXDFiRLrizSGoS
 WesRu9wyC/r3EADnbQUwiLwVbuQkcz2pLBQpTChRdq7S5LxLFANENQZo0OuxpakFbVJN
 srLXcpbyATa/xhl1oTzxFdLqGG9OYnq0TQOwtSftFUkrpSfAzmXG1JTPyumFRuzmBe0Q
 f0RFXh+jScEu4EN7Y+CfERxaH1Dc+MbaWUrEhTHpzI2eFsTGMpeXkZuJ0Z1amHxnTQOr
 YEtfTEoayadrVrd1G51xH5V+v5HNXw9ovxUIF/6UchGPGyHfNt4J6eq8XAv70JZBW241
 zPUA==
X-Gm-Message-State: AO0yUKVSeZOvu1cpHUbZczVvrqg37sV6OfMottogIQne/f1PIqIu5/f1
 BOhO/yl3q1Z7swlJuOsHkh4AcwBud6gfMb7/
X-Google-Smtp-Source: AK7set8VcsG+2JVD23TQWbIUgspGfQWgwg8XupyHco67MvcQKmJh1zB9741chpMFyO/4z9IMWAfeYg==
X-Received: by 2002:a05:600c:4d21:b0:3de:e447:8025 with SMTP id
 u33-20020a05600c4d2100b003dee4478025mr13832707wmp.21.1676071878693; 
 Fri, 10 Feb 2023 15:31:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b003dc41a9836esm7408903wms.43.2023.02.10.15.31.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 15:31:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/rtc: Rename RTCState -> MC146818RtcState and adapt API
Date: Sat, 11 Feb 2023 00:31:13 +0100
Message-Id: <20230210233116.80311-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

rtc_get_memory() and rtc_set_memory() helpers only work with
MC146818 RTC devices, not any ISA device. Rename accordingly
including 'MC146818' in the method names.

Philippe Mathieu-Daudé (3):
  hw/rtc/mc146818rtc: Rename RTCState -> MC146818RtcState
  hw/rtc/mc146818rtc: Pass MC146818RtcState instead of ISADevice
    argument
  hw/rtc: Rename rtc_[get|set]_memory -> mc146818rtc_[get|set]_cmos_data

 hw/i386/microvm.c            |  28 ++++----
 hw/i386/pc.c                 |  74 +++++++++++----------
 hw/i386/x86.c                |   8 ++-
 hw/isa/piix4.c               |   2 +-
 hw/isa/vt82c686.c            |   2 +-
 hw/ppc/prep.c                |  11 ++-
 hw/rtc/mc146818rtc.c         | 125 +++++++++++++++++------------------
 include/hw/rtc/mc146818rtc.h |  14 ++--
 8 files changed, 132 insertions(+), 132 deletions(-)

-- 
2.38.1


