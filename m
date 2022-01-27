Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1549E25E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:29:30 +0100 (CET)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3u5-0005lX-LZ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:29:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3nZ-0007QT-TW; Thu, 27 Jan 2022 07:22:49 -0500
Received: from [2607:f8b0:4864:20::92e] (port=33329
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3nX-0000su-AB; Thu, 27 Jan 2022 07:22:44 -0500
Received: by mail-ua1-x92e.google.com with SMTP id u6so4493144uaq.0;
 Thu, 27 Jan 2022 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuBRf4UELgr28Is2ZxSXKSWuxmaYSvTrzCxCdtHCIac=;
 b=AhSD5rDvV6pjQnEes/0QY1RiMa+0VqrUe6tll7ndyfPEWHOY2sYHJSinXmwFuNo7aQ
 e6xcNLMvSNNU4N9V77u27Mi0xuvF5/g7SY8U99cvlNIKggr0bLPvyBHBxZBEVjHxp1i5
 OIyBKpDqASpBDJl0/QGfUqXD0jC5v284TYB5v47Xpgj+J8BoXLexHrZq2BuDIZNt5IAQ
 Xbuuv7WP+wWq8Mag3VcdVyOBSLv80xLOtRhNmoSKc8rwAAUiBcmbp8W2OIO87S2uDUGP
 vJPocNfpHfVwl8PSqWPhbf7oO8axehYV+IU5oDPwdGDuvaBIHqsUKA1VHF5ngUeGbY8g
 1pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuBRf4UELgr28Is2ZxSXKSWuxmaYSvTrzCxCdtHCIac=;
 b=Q3sk0Ymib+diwgfY+UBM5otpGhGF/hqs75I2JYOZp379oThiYC9m9DrrRdPAEQ1NvD
 Xd4npuwut1BCZn4RhhpWhrEtDbxLt27ny3wk/rWKlVP3HunXLGZ0X61a19LYBKRAtDYK
 2uZZ3PAWj1Vc8rRyhMpuFZpKY/sFc5mHtjZFwR3q3HxJwOImpCK+KNgJQHk8bCmBadPi
 bZB66+cN794Fw0c6qAOg1U9LWJ+cnySu+aJkyo1Z6CsfGLOazpfa9shdh91iM79uW0KM
 fM6PVAVtUuzSll7EC3d9H/B13fufh1FPAy40BTdT7TBS1bv9AZZtBEcxBIfNM69jQZ/b
 EnBA==
X-Gm-Message-State: AOAM533n0FkquQSm0ZXh9c4tHlYtVHTZqmp5bvuc9JVdXXGxH7SzDUlT
 2DS45XsDMMxlTJto56q13oCRXsGnkp8=
X-Google-Smtp-Source: ABdhPJzc7IJrPUUGot2gFZGvRbhHwkDxhvBlVEwjEqqkekj/AgDPwUm2xvgR53QGZcEXe+j7VgPC2Q==
X-Received: by 2002:a67:e947:: with SMTP id p7mr1303293vso.59.1643286161796;
 Thu, 27 Jan 2022 04:22:41 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id e14sm520724vsu.3.2022.01.27.04.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:22:41 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] use a do-while() loop in pnv_phbX_translate_tve()
Date: Thu, 27 Jan 2022 09:22:32 -0300
Message-Id: <20220127122234.842145-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This version contains fixes for the problems detected by Matheus
in the v2.

Changes from v2:
- patch 1:
  * fix loop condition
- patch 2:
  * fix loop condition
  * remove the initialization of 'taddr' that was being done in v1.
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg05591.html

Daniel Henrique Barboza (2):
  ppc/pnv: use a do-while() loop in pnv_phb3_translate_tve()
  ppc/pnv: use a do-while() loop in pnv_phb4_translate_tve()

 hw/pci-host/pnv_phb3.c | 6 ++++--
 hw/pci-host/pnv_phb4.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


