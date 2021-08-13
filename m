Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7E3EB61D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:38:31 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXOI-0002zU-FG
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNE-0001Uy-4U
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNB-0002f1-MO
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h13so13392816wrp.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7PkZ1Inyx/gcfWknKTwi/BJStm1TEHLI0podxvwLdM=;
 b=sfnJtVk2NCNEMEVkCAHeMV0bLccWiG9f/oiK3UbTaB9f/WbNCatZeytfMEHd+wg6jh
 4eCuSzl873Szm84BvVmkx1TuSi+JGdc93YMOlc5KriF6old5EoZlvFQYZUf7TMWLPvPb
 2LZfbZ1zG3FfWFUX6Rtx4BGUsm2CQRtQ3dVPYesch7sHJPWvKEutA9djYvekkmLlWDAL
 vj3tweFfYIR2Be068gm5zNbaojvD3rRNTMR5kDRzK2oshmmgJp/ytz1PdGfLu/ioesNE
 L9MnWKy4IghjM6o3hX1CvLbUowKXSnlPllylqtsaW9pW/ucowBzR7QNQT9PIsfs4IJqB
 W4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z7PkZ1Inyx/gcfWknKTwi/BJStm1TEHLI0podxvwLdM=;
 b=D6qJaG/oQd1y2LoZw+SP6Xpbf40+FwojnxLCRIZ3AGsLJoq2deURiIN/wfieja7Qsh
 UAgOR5HbpBz7UJjKAoV1mYqG90tHW2TeiCcN5fnfybDI5L1qKOq+xTltYWp4sNGb7WPh
 3bYKCe7o09E2FsJ0GYitvOdOCTv0B+rZAlZ6jka8seAzjLSo1PiiO6Ka7iidOqY+txI+
 9QKXpAr4dwDgPEHk8MqLky7YJDn2gfPzk+hXWiv9Fb1ayOiIP/81Vx2Eqh0bAy5lQ4gb
 EsZcJLvMxCX9ozXj0LikDHj191ipV4HdUvz0qIhBvvLZXFaylPShPoaowaqcVTb9ghHX
 DXsg==
X-Gm-Message-State: AOAM531OYBkG8066eiIS6iWAlPPIHUWx3ORsKwGMV018g1yhG5hgN9Jb
 Tx8HYwChzScRTG3m/3bAjLZ/I/seV4UFww==
X-Google-Smtp-Source: ABdhPJxd1Cw8ElBUKfOQUGKFIEZlHSxp5QVS3ABFi505/noJvWDga+CCSDNuxKFCam6U8SaWDMbZtg==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr3244517wrp.281.1628861840095; 
 Fri, 13 Aug 2021 06:37:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm1413671wmc.19.2021.08.13.06.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:37:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/core: Add missing return on error
Date: Fri, 13 Aug 2021 15:37:15 +0200
Message-Id: <20210813133716.289058-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813133716.289058-1-pbonzini@redhat.com>
References: <20210813133716.289058-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

If dies is not supported by this machine's CPU topology, don't
keep processing options and return directly.

Fixes: 0aebebb561c ("machine: reject -smp dies!=1 for non-PC machines")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210813112608.1452541-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 943974d411..abaeda589b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -752,6 +752,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 
     if (config->has_dies && config->dies != 0 && config->dies != 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
+        return;
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-- 
2.31.1



