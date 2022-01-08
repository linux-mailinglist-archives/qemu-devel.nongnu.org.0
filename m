Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B027488441
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:42:18 +0100 (CET)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6DrE-0000OM-7g
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dou-0006gk-2w
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:52 -0500
Received: from [2a00:1450:4864:20::530] (port=35621
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dos-0006oJ-FK
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:51 -0500
Received: by mail-ed1-x530.google.com with SMTP id q25so25805709edb.2
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PanwFLUdI10ODYldtXK1jrMoM3JIKVqhyfXZOS1TzpA=;
 b=KEF8O1SipUd3fTnZpmNyP2we3F8OhrS+6p4oO3P63YAc0zd9nVofWiKuMRpoeG+aDY
 yVS1e7ah3U9Om4/fNHYLWmNNRZlfQf2JsU5puacqDhh83jnnT/ZdmkI5+rWAXGChMiZK
 iDeFq3qu6TVB7sUVojLWvVhvPQWh7rFecl/vcriNL2B3gQz8u9RQp2KGJgRF90Xj8vJr
 bHJ4nLDby2owOIcLASI6s+bfin7GOT5A90rUy1CScmQYG0gdUWDG0Alm2yHcpVqApeH9
 ZQz7r6yMHqpDBwS2U2zPdo5AKkoM4vcDaIGb7ALRhzomVKohMQTE7ENaA8bUxpKF+7OS
 LCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PanwFLUdI10ODYldtXK1jrMoM3JIKVqhyfXZOS1TzpA=;
 b=fYEUFhV0SXI5+0PERrY3GMUGQleHR0NiumL+uWmxvTmyEK6RilFVujJaeRP7h9wPBY
 wgqXEKmD60ggJ39Vu0zSI/Ike5/y8FlXiwuU+r6dhvKyqtwXyw+pitPBTpN8LeKSoBlc
 Vko1exPELybRoP4jujgNJk4TVZ9J2Tl5JWmkfYoqy0jzA+E6khwPEEEWoMz80nljaX+h
 YfSQB4htLPJLf5yzD4T2QvsDn+2vFcTPBcJG8//nLkwGry79DgKzLhfTWhv1f+uU9ku5
 gMiNmvfMM8aAxZcrSDBKZdVX4BJoSyNfrQ5vm8zkmtZtw/Z94Nid0AjBSejR13tKuxdi
 NNsg==
X-Gm-Message-State: AOAM531DHkSpfrnbDnj9EeJLZdfSC3TJxhGqfc4ExbcV79kjBIQMKMR9
 UhkwWnj8LtfTKYb5eLuphefu8Q79eBY=
X-Google-Smtp-Source: ABdhPJw1fO1qklsWwW+KytTUyyVPQ9olfx8UytN0UNbTf6EWEJls/xULHzgMwOrYX5nzdurylpr6lA==
X-Received: by 2002:a17:906:59b:: with SMTP id
 27mr27587095ejn.294.1641656388042; 
 Sat, 08 Jan 2022 07:39:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:a467:f77d:1:78f2:78aa:23a7:b824])
 by smtp.gmail.com with ESMTPSA id
 24sm599840ejg.47.2022.01.08.07.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:39:47 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org,
	dpetroff@gmail.com
Subject: [PATCH v4 0/5] Add horizontal mouse scroll support
Date: Sat,  8 Jan 2022 16:39:42 +0100
Message-Id: <20220108153947.171861-1-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds implements passing horizontal scroll
events from the host system to guest systems via ps/2
mouse device.

This is useful during testing horizontal scroll behaviour
in guest operating systems as well as using it in case it
provides any benefits for a particular application.

The patch is based on the previous work by Brad Jorsch done
in 2010 but never merged, see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=579968

Original submission: https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg00223.html

Changes from V1 to V2:
  - Patch is split into a sequence
  - Value is clamped to 31 for horizontal scroll in the device code

Changes from V2 to V3:
  - Cover letter
  - Removed unnecessary log line

Changes from V3 to V4:
  - Added a link to the original submission by Brad

Dmitry Petrov (5):
  ps2: Initial horizontal scroll support
  ui/cocoa: pass horizontal scroll information to the device code
  ui/gtk: pass horizontal scroll information to the device code
  ui/sdl2: pass horizontal scroll information to the device code
  ui/input-legacy: pass horizontal scroll information

 hw/input/ps2.c    | 57 ++++++++++++++++++++++++++++++++++++++++-------
 qapi/ui.json      |  2 +-
 ui/cocoa.m        | 18 ++++++++++-----
 ui/gtk.c          | 54 ++++++++++++++++++++++++++++++++++----------
 ui/input-legacy.c | 15 +++++++++++++
 ui/sdl2.c         |  5 +++++
 6 files changed, 124 insertions(+), 27 deletions(-)

-- 
2.32.0


