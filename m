Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9367B2EA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfOr-0002bf-UB; Wed, 25 Jan 2023 08:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOd-0002XI-Qj; Wed, 25 Jan 2023 08:01:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOW-0007TR-B8; Wed, 25 Jan 2023 08:00:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso1150386wmn.5; 
 Wed, 25 Jan 2023 05:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g7zzJwGyzr20GldkTcYz5CjZEoK6PbgeSuI+8jSMybs=;
 b=WUlteI5grwU1OcpdqTcrqAQYZtoUbMqkqqZIBre5fOUtQ/V9XqaZL2V5oJ0dZrNBbV
 i2sWVQueIsmxu7dwsny+VdMUqIXvm85r5lMszhHZORHkGNRnwMGMDu6pwc3LX6NjnYJj
 2iu+oFwMUoj8EmpAL1d4WRL7OHewu914dLPxpLZogAd8Oo8jhelxMSjjweqO/asBoYdy
 P2ZSJ3ZWXIDvfPLYK1pdTC3fE/frF74ZijVo5OLJX4fY9tyXdABEjI1gcxa7bdzgBEzT
 I4l469QLtylyYaXvk14nYktxfrnprjvP0ySt4qXzogtSvSy5fkCaHsoqv8CeiKBqHhXT
 ghHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7zzJwGyzr20GldkTcYz5CjZEoK6PbgeSuI+8jSMybs=;
 b=k9CuWr1VN5syZ6btqWQ6HLf5yI2fK+6/kuxUhhI6UD44zn0lv/w8xrAH24hM/Rm6co
 v1YRMXVvr8Ft9mZyq9m7Pgfiwooc2bxSDjan5j9cPP1CkJHN7DEXoipGrYK5cYcs53T+
 ogV83Ey0Jl/sfFclX9fok2KiWTBGCDxbuvFBjaM7WMxHLcvSZ+eMYhCpmXwgC8B9tfp3
 hytsQEid4mM4Z9ZFhqb/ZcdNkhNRT8p+YzNJLV0HySWlf3nN6a2n4cgogpnKHT9erUCK
 Zke2zBP2q+XereNGjeyvHLFUVm3uH/3ow2lGQpgNWZ1Gu/nkSkfvCCnO57ls11Fd/lRn
 3ofQ==
X-Gm-Message-State: AFqh2kopUAngOSNtykdS906qE4ZiSspYcroQx7PhtRH+ZItzyXXFGM71
 /BJn6ogR5+AEh4xES7AkB+zILnQ5xz2PVg==
X-Google-Smtp-Source: AMrXdXvzyEbDIsukZxW0+OI1FpHjo4U2JKUhaFg7Pq3ZfvC6XpAGdyFt5NFUrQjeWP5MQkHvULtVYA==
X-Received: by 2002:a05:600c:1c02:b0:3d2:3b8d:21e5 with SMTP id
 j2-20020a05600c1c0200b003d23b8d21e5mr31828125wms.14.1674651648058; 
 Wed, 25 Jan 2023 05:00:48 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c384f00b003d9de0c39fasm2078828wmr.36.2023.01.25.05.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 05:00:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/4] E500 cleanups and enhancements
Date: Wed, 25 Jan 2023 14:00:20 +0100
Message-Id: <20230125130024.158721-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This series includes some cleanups I came across when working on the ppce50=
0=0D
machine. Furthermore, it enables support for the 'dumpdtb' QMP/HMP command=
=0D
which was missing so far.=0D
=0D
Bernhard Beschow (4):=0D
  hw/ppc: Set machine->fdt in e500 machines=0D
  hw/ppc/e500{,plat}: Drop redundant checks for presence of platform bus=0D
  hw/ppc/e500.c: Avoid hardcoding parent device in=0D
    create_devtree_etsec()=0D
  hw/ppc/e500.c: Attach eSDHC unimplemented region to ccsr_addr_space=0D
=0D
 hw/ppc/e500.c     | 24 ++++++++++++++++--------=0D
 hw/ppc/e500plat.c |  9 +++------=0D
 2 files changed, 19 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

