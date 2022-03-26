Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58F4E8244
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 18:02:24 +0100 (CET)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY9ny-0005X0-UJ
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 13:02:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nY9kj-0003ra-NK; Sat, 26 Mar 2022 12:59:01 -0400
Received: from [2a00:1450:4864:20::52c] (port=46997
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nY9ki-0001tv-9s; Sat, 26 Mar 2022 12:59:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z92so12403847ede.13;
 Sat, 26 Mar 2022 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mj8A0RLRNIdvAuF8hgtnInpYRyCPwexDk40qwfPOsBQ=;
 b=VudIedkzcmZpCKFNPLWeC9meXXGEiW8avS4VNLX8jIVMq6xJDK47smSxPdh7j1zXKa
 aE8u3AMTLoygZbgNVKE7RRWsBh28Afpn/qsozjTQosph9P1r1uFeMtXmNnlXjdJv3eGV
 qAWGYjTrg5KKGMxgZXQaSYn9FPoqA6svm8HJp8Qd2hTulf30q++vJQ7xfxz8MuU3Y8mE
 vXMVhAwxhhx8xB+7LcWh+DEAdj4myHRulQv1PyP1VdLRdWvn+aWphw/xBXmJ5NFmT9NX
 W/sDySyaTmaoUgty/l9xmyEK1S//42X60Ni/3TrLwwoU34EwKNaSARtCtO/eN1vqoi6V
 /UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mj8A0RLRNIdvAuF8hgtnInpYRyCPwexDk40qwfPOsBQ=;
 b=cnxqLuvbXKtJko16a64L/r3VY4bYRGSjc9Nu37ODPhbKJZ93GqAaYfJCkaT5L6I5dH
 +Qy0RxwG9vxJTEvllrWZxcZQMF2yReGQev6Mn2agI8bW7x2Fc0I0G0ZGs82XRaEf6b1u
 FYtA0a8ODGPGquIFWe0y6clo4znsTzDj3p/Lc+l36vAQuXGuk2zClJOWZnj/AFRqP9Qs
 2G3qW+aZn4moSqEu8d6cfaFzv46rf/Ui477TtnIEXxNCUq70Nw3b0a7j9qngsJgJZNA8
 ffvpVu1Z8+de7j9QedP+NHKkoSdIkuFNPvVcKnX4MNFFr42unMHvd+DWf+phGQG6N6VO
 L2dA==
X-Gm-Message-State: AOAM531BM2fqsPmeJPU29RLy7vVdax24H2xLgQkRbugggmLPYSCEdzoQ
 UY8kjl9YBi+TFv3nwR+8aP+Y5Eoox2w=
X-Google-Smtp-Source: ABdhPJwpaKpN2SLviNqSkrKGGaoo27iFbtmd02Z+9nBx9SBKgvE51utb8uiM2TLaZgy5tGSyyJNNOQ==
X-Received: by 2002:a05:6402:1906:b0:418:ff14:62b8 with SMTP id
 e6-20020a056402190600b00418ff1462b8mr5616206edz.40.1648313937680; 
 Sat, 26 Mar 2022 09:58:57 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-012-231-111.89.12.pool.telefonica.de. [89.12.231.111])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm4515930edj.36.2022.03.26.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 09:58:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Confine igd-passthrough-isa-bridge to XEN
Date: Sat, 26 Mar 2022 17:58:22 +0100
Message-Id: <20220326165825.30794-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series changes the "igd-passthrough-isa-bridge" device only to be
provided if CONFIG_XEN_PCI_PASSTHROUGH is true. With it xen_pt gets decoupled
from i386/pc.

Bernhard Beschow (2):
  hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
  hw/xen/xen_pt: Resolve igd_passthrough_isa_bridge_create() indirection

 hw/i386/pc_piix.c        | 118 -------------------------------------
 hw/xen/xen_pt.c          |  12 ----
 hw/xen/xen_pt.h          |   2 +
 hw/xen/xen_pt_graphics.c | 122 +++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h     |   1 -
 5 files changed, 124 insertions(+), 131 deletions(-)

-- 
2.35.1


