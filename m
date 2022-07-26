Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8298581A5D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:35:45 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQLI-0003Gp-B0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7v-0003A5-T3
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7t-0002Gz-Rr
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id m17so21166314wrw.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YA8bK0QimOlD2NvATId4ShuayIO9M3XtMDLWtyqNjMU=;
 b=rvCiJcliKYs27pOKccyWbWtEwBAGTJnUIVV3uD0ieM/Jj0FL/nfm1fESd0M6AaLIQ9
 UtPCVOd+dJQUqnefBkpnS7b9Qrjsw93toP7BioknpsGhscDPCGth7OVMgyMu8r4wlr/K
 R46chISaJ0kVR9ouJ/mZODJDG07oHeJF3hq/Z6gWS5uSY1LoUf0T3RzbKtH1vZLh3e29
 xOzX5TsbtKjCoPV3tPWWjsyDE/18Hwo305voq5+BmVUPLx+V0Nqj1/+1ohcJHxCnVJsJ
 sdUcwzKRNndiAlGNhHQFcZDTDtWAW4uJ0yh4wcsDIlVyZuPet60YWUrJ1wDrCw2DhEay
 GqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YA8bK0QimOlD2NvATId4ShuayIO9M3XtMDLWtyqNjMU=;
 b=fSKa6cKkNVeMI9Wedeuxmz86fQvb+Kz0YosJDGLGIqgXeBERfTKoCvmHu7qjj+mvjP
 j6ycdBWOit5h28jriv4gGCOfvipaSmHomsId7htdBi0/rJyISBQ8j08oivK/wrtZjC6S
 M7ubLMx5G5nwUNDTjkjRBtOEk+XAust/hqOpNUXRGP10tF6eDfm2lHcSUeVsxum0akIr
 LHI+zE3YeQtHZsNCJoMIGjukNjMvmwbksfgRlnOgGncZ3BXY3BLFgKeI6gSAMuFj04WD
 gEHgo/bDDfmonbACJ9aXneBKgwwKk9fzC0+nXMB1oWwZPo+wbamovY+ufXrsifebhVrB
 RWhw==
X-Gm-Message-State: AJIora94J0EAJhvahOUkcYrLt92PC5gzSXtfeWYdwxciaX7DHb6JulV7
 CxYVglJwjNumfkIEhYs6VhBLkQ==
X-Google-Smtp-Source: AGRyM1v55a66K/AQi26HXoAL9CEJVPVAMRdLt5PXAFlOS4vlblXY8EJ5hZ6fWP8ST3KpSIOXZ/xz4g==
X-Received: by 2002:a05:6000:2a8:b0:21d:8c81:7eb0 with SMTP id
 l8-20020a05600002a800b0021d8c817eb0mr11435997wry.460.1658863312083; 
 Tue, 26 Jul 2022 12:21:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a05600c351500b003a31df6af2esm25229340wmq.1.2022.07.26.12.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A6AA1FFBA;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 02/21] include/hw: document vhost_dev feature life-cycle
Date: Tue, 26 Jul 2022 20:21:31 +0100
Message-Id: <20220726192150.2435175-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Try and explicitly document the various state of feature bits as
related to the vhost_dev structure. Importantly the backend_features
can advertise things like VHOST_USER_F_PROTOCOL_FEATURES which is
never exposed to the driver and is only present in the vhost-user
feature negotiation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..586c5457e2 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -86,8 +86,11 @@ struct vhost_dev {
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
+    /** @acked_features: final set of negotiated features */
     uint64_t acked_features;
+    /** @backend_features: backend specific feature bits */
     uint64_t backend_features;
+    /** @protocol_features: final negotiated protocol features */
     uint64_t protocol_features;
     uint64_t max_queues;
     uint64_t backend_cap;
-- 
2.30.2


