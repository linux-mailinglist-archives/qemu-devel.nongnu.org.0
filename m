Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686E476C27
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:47:39 +0100 (CET)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmQM-0001xD-35
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:47:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOW-0000EK-MZ; Thu, 16 Dec 2021 03:45:44 -0500
Received: from [2a00:1450:4864:20::42d] (port=40905
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOU-0003He-G2; Thu, 16 Dec 2021 03:45:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q16so1959177wrg.7;
 Thu, 16 Dec 2021 00:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x7h4IFcdtUPDr1JygqvtRcndheDiqrA4h0qEiTxFhuk=;
 b=SzW9CTPRjcUb6SGZzYGrxTeMWXjzR30BPnRTbPUfyYsgAe/x7raudb4KTs1h5O903Y
 QVDfuBApC4Jj2CC7iJe5hSYAg4d4c6uyoNEZ5TirT2LkNrHTOGWTljrDkXAWc3B8PSgX
 lR7X6veUwDByxE7C+ZltCbDLvqFv4rc+7m29rD26yUO/Cg+I6fXUq4+kNbPCaT90eboK
 7yolJpUg9ARB3Pms27ch60t83hmyJLNUMGBN6URdU3OZyD8sxVSArGvdewW48tMfOB/Z
 T8BgyRTMwCAhZKVFdWdT06z50koV7B7BmGSXcBxjrGB+qmu8ZIuSQVhJRCeP/13VzNat
 +rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=x7h4IFcdtUPDr1JygqvtRcndheDiqrA4h0qEiTxFhuk=;
 b=q4z3L0h6MTYb4jZ/2VCom7c15U64Xm5cFG+pf9sJGOraYiGy5MJc7eH5wPI8Z0/GFc
 K4kp7efGvb+GsyU5kKKrmiU2JQLRnyXogRvN6iz4p01jngRUENcokbEIMdCfH0Jcyqh2
 s2LMsLBha2rW9ekQeHUx0BSta6Rddfi25FtMSFjHDEojY+Rbuo4py02BkgF5xnQttVP8
 54//sGUeeT+TveWyl9NgqAjjzU5JsmMDAKBV6yE5Ehnrtv6pCdu8/1mh3WLg1sjv3aHs
 FIA4V7mmsPLrOfnUE+gqiZLslbUAG435YxdUoIq9JVcOXYgKuFal+3WHF9ELdhKESa3+
 Uw6g==
X-Gm-Message-State: AOAM5318HlVYbTwVHEuB9et4kXVvRD3Mzz2fJaErCxl+YVk1y74wX4um
 sUDPa69vCzBnd8IaXwrg2wb0LqiYLP8=
X-Google-Smtp-Source: ABdhPJxU7O8fhcs8f6/Plfovq6HzdUH8eHcSbt9/jRPB02N56wq3uj5wqnMdOEo0JJTQSLeKBhHd8A==
X-Received: by 2002:adf:ea8c:: with SMTP id s12mr7430699wrm.342.1639644340227; 
 Thu, 16 Dec 2021 00:45:40 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 12sm2323845wmi.35.2021.12.16.00.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:45:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/net: Move MV88W8618 network device out of hw/arm/
 directory
Date: Thu, 16 Dec 2021 09:45:28 +0100
Message-Id: <20211216084530.698125-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series simply extract the MV88W8618 device from the ARM=0D
machine in hw/arm/ and move it to hw/net/.=0D
=0D
I was expecting for this to get merged before posting a generic=0D
network code rework series, then figured I never posted it >_<=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/arm/musicpal: Fix coding style of code related to MV88W8618 device=0D
  hw/net: Move MV88W8618 network device out of hw/arm/ directory=0D
=0D
 include/hw/net/mv88w8618_eth.h |  16 ++=0D
 hw/arm/musicpal.c              | 380 +-----------------------------=0D
 hw/net/mv88w8618_eth.c         | 406 +++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |   2 +=0D
 hw/net/meson.build             |   1 +=0D
 5 files changed, 426 insertions(+), 379 deletions(-)=0D
 create mode 100644 include/hw/net/mv88w8618_eth.h=0D
 create mode 100644 hw/net/mv88w8618_eth.c=0D
=0D
-- =0D
2.33.1=0D
=0D

