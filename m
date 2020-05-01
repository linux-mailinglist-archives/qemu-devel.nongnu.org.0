Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3A1C18DF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 17:02:04 +0200 (CEST)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUXAw-0007ec-TH
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 11:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUX7L-0004rt-Sh
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUX6L-0007pS-Ga
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:58:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUX6L-0007nD-2F
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:57:17 -0400
Received: by mail-wr1-x441.google.com with SMTP id l18so1065247wrn.6
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJxwSUmKd2TGeue0/o+1IkVE9FKAt3LbQlUrmLYvhJ4=;
 b=GIVGmYkT9vzLin1gX7nE4Iv21HGul3dRcWIPqW3xN1l3iGAhu1Dji/eB1yGBRdUiUN
 L/zfN1KftB8GLc0jIvjidIlrwgkkgAoS9K9houyfFba4k+PQoQ0XAO0Dgt3x6uK4rhaA
 JujZYa6ptXqrmtAnvxn9uheRWQvxyaSJr6OTHPG+NcMIBGfBWTyl7vvvMlZzP/NmpoOS
 O3DwKhyBnC4/jZDWVI7WC0KM7MiFOvh8QC/DatV/UJ5ogb15swHTMF5u9jKtrRSXPklV
 NFPfczPQLOFwjA+h/skIxgjxXr3LSJflffv6rdaXplGxU3tO9ILe2bvJ/G4gUpCE6dgs
 LpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJxwSUmKd2TGeue0/o+1IkVE9FKAt3LbQlUrmLYvhJ4=;
 b=qvfGXRNA1KIE7FbObaEgWCuKe21CaNQmzuhOL6OAHYruQ/iZbrTPYzV9fEX/yNwJKq
 yT1aPV34qqa8hoPPqhRq7NiGV2456Ybtyng6ud2vQib6kbs5ZYNCpQfypxZnstGnpdPh
 fP1+k68OwdbsbssEbsHd0q3+P4mmC6SLma7nTP4rVTwOgLX8i6F8T7X1zjTqKGPcK6PM
 X5uPzM7ygTOfGXatL7m2FF0oM5DQEJOiwtH5bDniurOIWTEV3zKbn3WcDaGE1YWPxQc9
 gX1CDx0fcwM3gJvB1RsLYAcCElKn6UL1G/g4skpt+ChlikoboPHHu72KaTmSpojv81On
 Cj1Q==
X-Gm-Message-State: AGi0PuY66GIU+ioBX816lwVRx9Jq2mDm4dbrzIb7gJZeX+xv2V8OIkd5
 fm5pvvpJdgzsglax48zrEAzUkA==
X-Google-Smtp-Source: APiQypKIusW447Pm51VeWMJ6jYQZvOi0zbqJGaJsNWHt9ZGhaR8KsTBgGgVC3B51bs3yErfFVrwSjA==
X-Received: by 2002:a5d:4dcd:: with SMTP id f13mr4389002wru.417.1588345035107; 
 Fri, 01 May 2020 07:57:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r20sm4091112wmh.26.2020.05.01.07.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 07:57:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D8901FF7E;
 Fri,  1 May 2020 15:57:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/7] various tcg and linux-user updates
Date: Fri,  1 May 2020 15:57:05 +0100
Message-Id: <20200501145713.19822-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, riku.voipio@iki.fi,
 richard.henderson@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Cleaning up my queues into more focused trees these are all tweaks to
TCG related stuff. The guest_base changes where posted before but
where a little radical for 5.0 but I think are worth getting in early
as it enables the sanitizer builds for a range of linux-user targets
we couldn't run before. Finally there is a little tweak made to the
out_asm handling which makes it a bit easier to see which guest
instructions are being emulated by which host code.

The following need review:

 - translate-all: include guest address in out_asm output
 - disas: add optional note support to cap_disas
 - disas: include an optional note for the start of disassembly
 - accel/tcg: don't disable exec_tb trace events
 - linux-user: completely re-write init_guest_space

Alex Bennée (5):
  linux-user: completely re-write init_guest_space
  accel/tcg: don't disable exec_tb trace events
  disas: include an optional note for the start of disassembly
  disas: add optional note support to cap_disas
  translate-all: include guest address in out_asm output

Richard Henderson (2):
  exec/cpu-all: Use bool for have_guest_base
  accel/tcg: Relax va restrictions on 64-bit guests

 include/disas/disas.h     |   2 +-
 include/exec/cpu-all.h    |  25 +-
 include/exec/log.h        |   4 +-
 linux-user/qemu.h         |  31 ++-
 target/alpha/cpu-param.h  |  15 +-
 accel/tcg/translate-all.c |  55 ++++-
 bsd-user/main.c           |   4 +-
 disas.c                   |  35 ++-
 linux-user/elfload.c      | 503 +++++++++++++++++++-------------------
 linux-user/flatload.c     |   6 +
 linux-user/main.c         |  27 +-
 tcg/tcg.c                 |   5 +-
 accel/tcg/trace-events    |   8 +-
 13 files changed, 379 insertions(+), 341 deletions(-)

-- 
2.20.1


