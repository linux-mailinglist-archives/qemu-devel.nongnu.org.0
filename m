Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48032B7CA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:28:14 +0100 (CET)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQbt-0004y9-BL
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQad-0002vu-GU; Wed, 03 Mar 2021 07:26:55 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQab-0000bP-Ta; Wed, 03 Mar 2021 07:26:55 -0500
Received: by mail-qk1-x732.google.com with SMTP id f124so5503883qkj.5;
 Wed, 03 Mar 2021 04:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7vx3rMQp+C5wt2Y4UL8wpFlnpFYtOnrpf+PZdC/1d8=;
 b=kGvX2AhGowvDqzf/r9oGe4a70ozv2CfNMCMEFRiSrxjKrBJkGSiyY2cXomY2SGaDH4
 9EzBGWIXbB5qmiXmeYiNL9K85eRzQ2Lx71QwkDDgxmk4nGYwSa0eU61bvLGVwgJHty/F
 BM922rDFvzt/8vd/tTIV2iEzP8OAyR+gB7iuCer8ugVU2Y7j7yg4WQXSP643jgIvhPZZ
 RzPph5xkjVB0tVKu+j+VGtBty9SJTsAeq3lz4INZxXpfHqPJHAUhg7Ze0ZvicTA9f+a2
 rqExCnJOGb/1/twFYKoOIlm1+WkzBE4V7jzXqV+4XYUd8EIRl7Fj9aJX9lT6RZxJ4WJQ
 K+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7vx3rMQp+C5wt2Y4UL8wpFlnpFYtOnrpf+PZdC/1d8=;
 b=SVdh1pwt+lB7DohOKy1ZNocSWyKFtH3LG/an9EbC/17jnPKX2VzdgpqpylwxOxGAXc
 cxdR/MY9Eby7pfOtFhLZk9hUzwEWxBC53Jyf5WBwxpaSGckReO8IfLPvrpGqsfxOD0sw
 pV2kO3565/XWKBaPIAQbBUeIky1A7WoKtxWT9wGTAsrJMgdu0X9OKly8LH2WI51zVeBL
 FGwvoWYgZQNrqAW0hct/OxXEehjTONDxhfVEGJKdoINaDCUAExtG98XvOMSmdQL/Q6Ux
 lsS7g5AfDxEuPYMvfof/mgtI1syNlawH7kU52FoJ1xikqX/PJE3QXlYH7N0WWXp1fsV9
 3bcQ==
X-Gm-Message-State: AOAM530VdcL8YvvHUy2KtjMjGwxODPgvDElAaAuFO1tDszwX2JGv1xke
 fk9rNt80+qBPDwcMqHzyCQU=
X-Google-Smtp-Source: ABdhPJyTAKzqw/SjDIbnDlV5b/FtlYEGfbiqAySEXUh54Qi6rIr8Za1cuOsdu4oDDTpM5uLsKck4/Q==
X-Received: by 2002:a37:7044:: with SMTP id l65mr24490093qkc.417.1614774412294; 
 Wed, 03 Mar 2021 04:26:52 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x14sm15433458qtq.47.2021.03.03.04.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:26:51 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [RESEND PATCH v3 0/5] hw/sd: sdhci: Fixes to CVE-2020-17380,
 CVE-2020-25085, CVE-2021-3409
Date: Wed,  3 Mar 2021 20:26:34 +0800
Message-Id: <20210303122639.20004-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series includes several fixes to CVE-2020-17380, CVE-2020-25085
and CVE-2021-3409 that are heap-based buffer overflow issues existing
in the sdhci model.

These CVEs are pretty much similar, and were filed using different
reproducers. With this series, current known reproducers I have
cannot be reproduced any more.

The implementation of this model still has some issues, e.g.: some codes
do not seem to strictly match the spec, but since this series only aimes
to address CVEs, such issue should be fixed in a separate series in the
future, if I have time :)

Changes in v3 RESEND:
- Drop the duplicated SoB email address

Changes in v3:
- Embed the reproducer in the commit message

Changes in v2:
- new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable
- new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed

Bin Meng (5):
  hw/sd: sdhci: Don't transfer any data when command time out
  hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in
    progress
  hw/sd: sdhci: Correctly set the controller status for ADMA
  hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE register is
    writable
  hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a
    different block size is programmed

 hw/sd/sdhci.c | 53 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 17 deletions(-)

-- 
2.25.1


