Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F706484D8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f6N-0004qt-7E; Fri, 09 Dec 2022 10:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6B-0004n1-PZ
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6A-000822-5D
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id h12so5497024wrv.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yhSJfJVg80YIcgRy8fjjtA35XXy79tWPwer5e9varSM=;
 b=Eq4/PRUKuVDVZRSZ4NKlMYs2jY39iiGJFBcpWX0COi/o4knpcl/lCvI0KZ+IiYrCGy
 oEISKrSy1tDoFe9RW0v4rUsWzCC/CXe24+ciC/pW6d9hzZwjgIKq/y+tZyZUoHbct4Cx
 0XkL+1emjqMtusdtDUR/86TC1A3lJgrjK6syy2bbeVLKo0N/CSswEzb6rR/KL3w12MaR
 OEVRi6h7BXuA1j6Mfec2TUjHQtvSsX7Ig3oMofBRrnhWld7bq/dmnirVtCwAzBTS5paa
 Hba4m7mdtwo04XE0PeVk3pJ7Sij29rBcTkO/FYz2iCycRzb0udHXePpNHVnCqXWygoml
 NF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yhSJfJVg80YIcgRy8fjjtA35XXy79tWPwer5e9varSM=;
 b=0gP5WTY1qqcAuC6K06UB2t/7+Y+w2scnn7wvnRXNibzVKUgj4Ey+G7zl+7yQLXur+s
 9RKquIH/yH81DxtmI/bB2r9LZdP5fkfl3VoVzvVVImQLjNDiDW6r9efluDqzrJgNmggN
 v6QAaZOrnD0X2+lDL3t4GbYaA0R+4cIqX+VnzvWrHLxdbbGa1j6r2QjoMlUEifSNtZED
 oSEB3+P+NHx5qHrmm2aAlufZ3rGd7VBBIqJ6Dk9HEvM+/iav6ffbeSdbLWrI7GLt82UB
 ZD69yjf/oakqY4UOGvZGloha8ZW50YSUG2TzT+CEBNNqRd1xPbHmznBnu9NonqRPh0Dz
 o9TQ==
X-Gm-Message-State: ANoB5plTDXa4D9Xun5AnnJHFOO+w78KXcG7jDBYhaE+ATAwvDfDs+dRg
 1sYPAdMFCrm/WC7/Lvnr3eyGCv5UGv88LfiqnOw=
X-Google-Smtp-Source: AA0mqf71mWNwZzv+FrDzN7HhKcxKvgv664I6pWDKnxa1oeUX64BLWpyrqR+VTc4+vqDNO90SGPPfGw==
X-Received: by 2002:a5d:420c:0:b0:242:639e:e30b with SMTP id
 n12-20020a5d420c000000b00242639ee30bmr3526265wrq.40.1670598935522; 
 Fri, 09 Dec 2022 07:15:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a5d5188000000b002421888a011sm1548549wrv.69.2022.12.09.07.15.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:15:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH-for-8.0 0/7] hw/mips: Make gt64xxx_pci.c endian-agnostic
Date: Fri,  9 Dec 2022 16:15:26 +0100
Message-Id: <20221209151533.69516-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Respining an old/unfinished series... Add the 'cpu-little-endian'
qdev property to the GT64120 north bridge so [target-specific]
machines can set its endianness, allowing it to be endian agnostic.

Philippe Mathieu-Daudé (7):
  hw/mips/Kconfig: Introduce CONFIG_GT64120 to select gt64xxx_pci.c
  hw/mips/gt64xxx_pci: Let the GT64120 manage the lower 512MiB hole
  hw/mips/gt64xxx_pci: Manage endian bits with the RegisterField API
  hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev property
  hw/mips/malta: Explicit GT64120 endianness upon device creation
  hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
  hw/mips/gt64xxx_pci: Move it to hw/pci-host/

 MAINTAINERS                                   |  2 +-
 configs/devices/mips-softmmu/common.mak       |  1 -
 hw/mips/Kconfig                               |  1 +
 hw/mips/malta.c                               | 11 ++--
 hw/mips/meson.build                           |  2 +-
 hw/mips/trace-events                          |  6 ---
 hw/pci-host/Kconfig                           |  6 +++
 hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} | 54 ++++++++++++++-----
 hw/pci-host/meson.build                       |  1 +
 hw/pci-host/trace-events                      |  7 +++
 meson.build                                   |  1 -
 11 files changed, 62 insertions(+), 30 deletions(-)
 delete mode 100644 hw/mips/trace-events
 rename hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} (95%)

-- 
2.38.1


