Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117AB55B0EA
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 11:49:57 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Otu-0001kP-QV
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 05:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5Orp-0008DZ-P9; Sun, 26 Jun 2022 05:47:45 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5Orn-000097-AJ; Sun, 26 Jun 2022 05:47:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id cf14so9172014edb.8;
 Sun, 26 Jun 2022 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/18Wn59mCVUcj5sOf0xFz2mH+5FELr59xslfCm8MOAc=;
 b=KQFT2epSHelgMWfg3dPUpwaqRsz0pA/6e5/iNbH31U8kKSk7PILo/zpeyNLhXSDyXY
 ksboRyLpVAxrJRZjtAxwI3LHi4Wev6eMXmfCmklaVS9jL5Z0KdOvXRm8kckW8cQo37FC
 YxXRil6dPmLObGen9MY5oVQjsCSzQpEAo2wWpnmmO4mbiRNQBYOWldMYZSjEPl0225FR
 bEtKL5nACHbm2OBsnHlqafqzkrPAhIn/1zznkFdgYP0bcXQdy3zrgOkXKwbBqj6/7JAa
 sV981rtXpApP/c92nYXlgVMSFrNCgMY6+ei3LwETElwYuEt2S19vSnyRJs3hiw/3EKzy
 utPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/18Wn59mCVUcj5sOf0xFz2mH+5FELr59xslfCm8MOAc=;
 b=l2y8ZZFWAlcdPRWkvoRlI1UFK15RyXoV1YgpsBtibjHRoVDyfvliq1Ev/hG1J69ob4
 tEd3NAcLDQEkYhK2qH+DHw9zLMqepAhQQSpBWZ3jOVrMHY7/LEU5mY7wsc7KL+QvnLu5
 Y+2PzTetlMFnSzFZaGkx/mOFCHtX05MP/5U/9LTxPnZGuUMmaQqD3COleoF1hEQVaZhT
 YThDZpha5Fh/FzsNKR7JzazS80U74T2t25JyI2uFT4lLRR53jP2dRUg2NJ0j5D3ln6Ai
 E09v49kA2nzzBccsUxD7Se3MZUKR0DVrzdg1mlNKGBDAGn62yeAGp9hO0oWORnEuWP5J
 I/dw==
X-Gm-Message-State: AJIora/1ajoWpA1y1JBq+wtn7PXgyVn8DY63gUPCHmqHtaaxSZd4arkv
 FBs1/aeWCAVB6mQWCecdlioC4wEma4k=
X-Google-Smtp-Source: AGRyM1v/lS+4NjVferS6kUoLylyCQHZ+ljz7kEWCPuWjTusvwodjvL0yfMAzSACL+nodY1l45DSCNg==
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id
 x21-20020a05640226d500b00435aba29495mr9923552edd.133.1656236860604; 
 Sun, 26 Jun 2022 02:47:40 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-055-174-013.78.55.pool.telefonica.de. [78.55.174.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm3504752ejt.212.2022.06.26.02.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:47:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/2] Decouple Xen-HVM from PIIX
Date: Sun, 26 Jun 2022 11:46:54 +0200
Message-Id: <20220626094656.15673-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

hw/i386/xen/xen-hvm.c contains logic which is PIIX-specific. This makes xen=
-hvm.c depend on PIIX which can be avoided if PIIX logic was isolated in PI=
IX itself.=0D
=0D
Bernhard Beschow (2):=0D
  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()=0D
  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and=0D
    remove it=0D
=0D
 hw/i386/xen/xen-hvm.c       | 17 ++---------------=0D
 hw/isa/piix3.c              | 15 ++++++++++++++-=0D
 include/hw/xen/xen.h        |  2 +-=0D
 include/hw/xen/xen_common.h |  6 ------=0D
 stubs/xen-hw-stub.c         |  3 ++-=0D
 5 files changed, 19 insertions(+), 24 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

