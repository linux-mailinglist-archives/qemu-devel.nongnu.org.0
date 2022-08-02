Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D11587925
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:38:39 +0200 (CEST)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInQF-0000x2-3u
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhG-0006pY-Uv
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:14 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhE-0007Zt-0E
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x10so12028549plb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJ1r98j+tEpnh4mKLZceHpZj7/yQpqzcLKBOOGbJsS4=;
 b=BHyfLxM7fvUKlKKdXa5LafYa+bkhzRI9/s28JIyFSjuAlTiYP//LZy7M4f0Fz96iPi
 l18xWC0cpZTH8WFp93THcvXuiwdRvzt4HbglezxNy/RlYVbD3isS8riDdXYiGm1oAL2p
 srv5N6qgo899jiw56jDokxg5+aMBEf5H0R1UGHwE3lRKDLH1FPZ/RLu5Fjn334UAn2ja
 JccYamgTG6WgK4CsMsHrkvddLRURTy0omNDAgheNyJ53pUDCuH5hJMr/a2pq0pLYdWVD
 Hwz+7+OaNGqkoB4w6D+DsLxA5RSiYjyYqRfF6Nl47lvwngMSIAeUEMJ2IPhmgGrau7w8
 aQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJ1r98j+tEpnh4mKLZceHpZj7/yQpqzcLKBOOGbJsS4=;
 b=TfVR/5C1lXz28HW6pWObkG2gu66c5PCAZZhhTyu96mA5I9ciFzeuNMtzFYrzFCU0Mm
 ZtBKDAKUej2s/PR16rr1WEC/GMHB7QuEBpIpZmSkBHRUpFGOYTozDvcAyiYNFGZbSHnJ
 nvR2Hl+I9BOGuFIOYGfNQkETIZmVCOiQZ5leDvvmLlSTq/IJsEw2E9+thIamrf9oFz84
 N6KRQiNfZA1oDAQUit/zV0EZL6dhI4TQBH05rMgR6ommdejDUvIfkzxxi8Gyjc24YRst
 XbgZ1rD7gJa56c7e33kGSwgEs1drk1AyLBgbYic1l50S9LAQ3wkypQuClgOr10RugUMq
 H41A==
X-Gm-Message-State: ACgBeo2dQVLhJp85lwppWgrJ6M3IookBj8Sudoyksa5ek6y1u9wzIX8T
 9rMFCVXHhy3KtQ66/+bzsOo6nsyphJM=
X-Google-Smtp-Source: AA6agR6D7idjQo/fLI/IcUcHQFpW4qzBziLQQRICfjSF6R+GHO4MvYwrIjm89l+m2shrN7i4MUHm6g==
X-Received: by 2002:a17:90b:3144:b0:1f5:2c6d:7dea with SMTP id
 ip4-20020a17090b314400b001f52c6d7deamr1367887pjb.220.1659426725697; 
 Tue, 02 Aug 2022 00:52:05 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 q19-20020aa79613000000b0052d92ccaad9sm3226098pfg.131.2022.08.02.00.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:52:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v4 0/4] Enable unix socket support on Windows
Date: Tue,  2 Aug 2022 15:51:56 +0800
Message-Id: <20220802075200.907360-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Support for the unix socket has existed both in BSD and Linux for the
longest time, but not on Windows. Since Windows 10 build 17063 [1],
the native support for the unix socket has come to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Changes in v4:
- instead of introducing CONFIG_AF_UNIX, add fallback afunix.h header
  in os-win32.h, and compile the AF_UNIX stuff for all Windows hosts
- drop CONFIG_AF_UNIX
- introduce a new helper socket_check_afunix_support() to runtime-check
  the availability of AF_UNIX socket, and skip those appropriately

Changes in v3:
- drop the run-time check afunix_available()

Changes in v2:
- move #include <afunix.h> to os-win32.h
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32
- drop #include <afunix.h> as it is now already included in osdep.h
- new patch: tests/unit: Update test-io-channel-socket.c for Windows

Bin Meng (4):
  util/qemu-sockets: Replace the call to close a socket with
    closesocket()
  util/qemu-sockets: Enable unix socket support on Windows
  chardev/char-socket: Update AF_UNIX for Windows
  tests/unit: Update test-io-channel-socket.c for Windows

 meson.build                         |  3 +++
 include/sysemu/os-win32.h           | 17 +++++++++++++
 tests/unit/socket-helpers.h         |  9 +++++++
 chardev/char-socket.c               |  4 ++--
 tests/unit/socket-helpers.c         | 16 +++++++++++++
 tests/unit/test-io-channel-socket.c | 37 ++++++++++++++++++-----------
 util/qemu-sockets.c                 | 29 ++--------------------
 7 files changed, 72 insertions(+), 43 deletions(-)

-- 
2.34.1


