Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1B36A214
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:24:34 +0200 (CEST)
Received: from localhost ([::1]:49306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL57-0001L9-9y
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3G-00081x-3f; Sat, 24 Apr 2021 12:22:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3E-0004HI-Gr; Sat, 24 Apr 2021 12:22:37 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e5so22761140wrg.7;
 Sat, 24 Apr 2021 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DaeX48c3fbgdHFclg8wHqwuYUqCsYJ2raA36awzI2jA=;
 b=UYFjNG8rjbeqzCkBgzSXyWst0MDMVQkCASGFa2w6FiCaE5F6gYjLKOS9/Qxe5svLqO
 iGdEmQzEv/hAeDe411H0YBTkOl8XaDrNBdtoklVUFS0I/qMkYjyPOubPQ58yCgnFa/43
 qGrGSla5YGbmnSRJSsNH1NVta9cWtu6QaVispfhkA1kt1/7O4DKxQPHhj6zFlMT+Z0gX
 6rVyCYBt4Z+rhe1hbPfGl4ELUKF0oCePSfoG7miHSnij3kF/9qeeQXq4ZmeuHWIOHITd
 66eXOHyaAYTR164FKgMwsMEDah4FBxYgQ++9AGpJYOZ7JSpVyhvNL3zelGe37lBiKe9c
 WhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DaeX48c3fbgdHFclg8wHqwuYUqCsYJ2raA36awzI2jA=;
 b=jLwmZfpUymXA1G9z/HDgqumgjhR1KuSTFMtSeerv/SeB4EjXmNa0eNgGeJvnBPtIY5
 DDcsr27ttfqaHcty/ZeDxd48OkOErI588oI/xA8UFOkUkBxm5V26wbxbr+9u32JQD+gy
 E7HLmbqN3D/JvQLfDZ8CJ+uPpXa04tZNR9oc3rT9wTxOdl+oPprRjRnCkdOmUZYt0n8U
 SZBFZwYdBgB3JyReXvm2as92mwKb8+N6QQonFrjX+GmG8GBrDlo7djqXqEzNqlB4+ntc
 Z6UC/A75SQioLjZI1AxOIYlK89YWkF17lXqfpVnrr4IioePZDodE8rBC8zrmDzHGqbUZ
 lMBw==
X-Gm-Message-State: AOAM532ELt9eGPb3pLdocngbT6y1gymOBEeUCCuIqvIhKbj9LSjfAKVa
 zbn+ynCvFugX5f6aIIXn5ChFAAGZ2pnm0A==
X-Google-Smtp-Source: ABdhPJy2fxxcn9OEVz/k4bblGEY5ahBihmf2IBWaPMtgeInFVtzbf7ybQG2JiPg76EcCY7b4aun9xQ==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr11816194wru.305.1619281352337; 
 Sat, 24 Apr 2021 09:22:32 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm10189213wmq.4.2021.04.24.09.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw: Fix reset of bus-less devices
Date: Sat, 24 Apr 2021 18:22:24 +0200
Message-Id: <20210424162229.3312116-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is the result of a code audit of the DeviceClass::reset()=0D
method uses, having Markus following explanation in mind [1]:=0D
=0D
  "Propagating reset from the root of the qtree to the leaves=0D
  won't reach a bus-less device, because the qtree contains=0D
  only the devices that plug into a qbus."=0D
=0D
Which is a resumed of what Peter said earlier in the thread [2].=0D
=0D
I'm still confused by the TYPE_APIC (and its KVM version), see [3].=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg801374.html=0D
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg800917.html=0D
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg801379.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/ppc/spapr_iommu: Register machine reset handler=0D
  hw/pcmcia/microdrive: Register machine reset handler=0D
  hw/block/nand: Register machine reset handler=0D
  hw/pci-host/raven: Manually reset the OR_IRQ device=0D
  hw/arm/armsse: Manually reset the OR_IRQ devices=0D
=0D
 hw/arm/armsse.c      |  4 ++++=0D
 hw/block/nand.c      | 14 ++++++++++++++=0D
 hw/pci-host/prep.c   | 10 ++++++++++=0D
 hw/pcmcia/pcmcia.c   | 25 +++++++++++++++++++++++++=0D
 hw/ppc/spapr_iommu.c | 10 ++++++++++=0D
 5 files changed, 63 insertions(+)=0D
=0D
-- =0D
2.26.3=0D
=0D

