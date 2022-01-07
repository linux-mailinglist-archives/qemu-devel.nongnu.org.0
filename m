Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E94F4875F8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:57:15 +0100 (CET)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mvq-0005p5-6J
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mt7-0002xR-OG; Fri, 07 Jan 2022 05:54:25 -0500
Received: from [2a00:1450:4864:20::42e] (port=36360
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mt6-0008Ku-80; Fri, 07 Jan 2022 05:54:25 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r10so2642235wrc.3;
 Fri, 07 Jan 2022 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iauCTE/Qc3gGKTbzj1Gz0Ier6cmWvJeJVpgEvvuIJwU=;
 b=BCB6J1J/D3f/muWX+h8hWk1U7O5TXdP0CMAjk1/MVVTjWnId3QeaEYHeL3SADNaoXl
 nImDLgwNwqtzDX5SjHo11sjX/qd6MIoLaQJc8z7K9o2q5sUYm1bi0GEyiluY/fEBXJiV
 KU5XNUyF2l2O2ZrwnPBxB89yL46idAGfGo0HlhZJE++IfgH1OAG3+8WBGruglHkF+N7z
 jPi1QBYGtOZP5wkM4HWieS6EZmCdBYWUOJmm5Ho16qg/T8iMncpioXzHNTk+zDK0N+CZ
 TgHwfe/R0sB6cB4dvSCsn7EQ2TbbaU6w+ousDfBzDUGEFwD2Q97OTVqP8zwu1gGPmqX7
 ctkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iauCTE/Qc3gGKTbzj1Gz0Ier6cmWvJeJVpgEvvuIJwU=;
 b=Vf6ovOq5nCkAt0b/PQ17dIs642/QIZLZH0K5pei7eMxXyb8Go57g3Vl3g8nusDlNQy
 GPMlNpbzC/OCjB0aeecmybuDsrbbK0BPUj4LcwpHlUBbKU8g83YA27uBjTcWx+XF96FI
 z6+5u5qSaaUedZmKzJsawSbpsucwc479WuDspa9Y5Twb4TZWYhGWNvOzE/PmX/I+ynWL
 x6CcKoiahBtVrVXILK+KGIPKPvmqgxR19iO/WmvA8E5m3wo2h31w5AfQ5tREayJo8Nyx
 CmfG3Ss/+pkXALfmXaIKM0aUO7+91KMm2V5yZPofeFa9230dQFAxYYf/9AF6EilyOZLp
 4SNw==
X-Gm-Message-State: AOAM530iX5GcJ4cQgb8UrAwKErA7uVndwynIoTsHxWQNeVjWVMhSLvx9
 dONb1hx3JQ1IrtcITBAigvVg4bDrJKcM6g==
X-Google-Smtp-Source: ABdhPJx95XHZ7+uSRGgPmRiE+5TT3UgXM0nCBuiqvBHA72h5l2rASxmqNZP/hqbZSlES6MQeJO5e3Q==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr54254495wrm.607.1641552862132; 
 Fri, 07 Jan 2022 02:54:22 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id f10sm4554707wmg.43.2022.01.07.02.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 02:54:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] block: Minor vhost-user-blk fixes
Date: Fri,  7 Jan 2022 11:54:17 +0100
Message-Id: <20220107105420.395011-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Add vhost-user-blk help to qemu-storage-daemon,=0D
- Do not list vhost-user-blk in BlockExportType when=0D
  CONFIG_VHOST_USER_BLK_SERVER is disabled.=0D
=0D
Since v2:=0D
- Fix typo (Eric)=0D
=0D
Since v1:=0D
- Reword patch 2 description (Markus)=0D
- Fix BlockExportOptions enum build failure (Markus)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  docs: Correct 'vhost-user-blk' spelling=0D
  qemu-storage-daemon: Add vhost-user-blk help=0D
  qapi/block: Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER=0D
=0D
 docs/tools/qemu-storage-daemon.rst   |  2 +-=0D
 qapi/block-export.json               |  6 ++++--=0D
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++=0D
 3 files changed, 18 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

