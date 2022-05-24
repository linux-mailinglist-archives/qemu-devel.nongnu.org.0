Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B22532F0D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:34:52 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXUh-0002x9-3Y
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWex-0004No-Uy
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWef-0005MF-Ch
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id m20so15150194wrb.13
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HF3oxtJzbPygKRRjZfwIDjRnPR4HjsUqS/dYhqTV/10=;
 b=hD48p295CVWJRIAJyIIPjaTKTd3fFYgBcO3F7H6LjSkboZRHGU5DIzcziCgCDSRmVf
 CnC+wvc3rU+2rtN5OwfVuA3Av35lGsGqc8QpUeYhn7ixF1ZA34qX1hvS4dt9os5++eGM
 LwgMYp68V6JNBRdZPT4vzw8RvdIdHOUl3FaRJaXJId9jxnU5UI2QN8w3ArZACMT62YWn
 Nkdn+UcNafSzJLH2J93oZI47A0knOLX3zSZZSBO3NrVy5hTgG9PaQ+grEjQxrK0o62PW
 cwfUE4+Io3pe9ojRNKdsQKLFDxyoVDpAQcBwdGB8Q8LOF8xMrpUXvEqYGe+N0VQsL9kD
 xslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HF3oxtJzbPygKRRjZfwIDjRnPR4HjsUqS/dYhqTV/10=;
 b=PFS2cHb31bB6jtjKJ7/anE7WTDi0IXODs0knFLtPyrR6wgQSHz6cYFgZ6/OWpoXW9e
 syTa6uU4yUSXadOIm7asXndy+axKKJSzaJd5HhfA5/3U33WHZWtKmlouAtHWXRhx0MRj
 OJfA/ls12yomN9lKzbt/BvaRkqWVBp5iVZUomMzipE6q2YfAOByqXQLeKma2FH6zBP5/
 KIfXClZ4CioA2zN4fWJtdCW4vmHRmZF+D6IPEHoGZGzGn4GzEd6Duh/KmRrZ+Sl8b95C
 GFSr5KTQv58L308lRJ5Zji3LljA8TFRYhj1X2uHXncuw8i/HkNC1Z/x7kVCKOVIpYvEi
 +Ofw==
X-Gm-Message-State: AOAM530pvJVK6NO9RRzEs4Xaw/pFUfK9/NyF5C4pB3wulXcbP8MAaQhz
 URRBFN1WmwF2SmVeY7spghJVhw==
X-Google-Smtp-Source: ABdhPJzH6wTCGXMXnAoauXEX+uLcf+iqK/ejjhd3uJtppspSvLyPoGaNM4y3RM/zxVQFzyf9j39BfA==
X-Received: by 2002:a05:6000:1843:b0:20e:6a9c:afa1 with SMTP id
 c3-20020a056000184300b0020e6a9cafa1mr22275662wri.218.1653406864088; 
 Tue, 24 May 2022 08:41:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i1-20020adfaac1000000b0020c5253d8dasm13459631wrc.38.2022.05.24.08.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0B861FFBC;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 04/15] include/hw/virtio: document vhost_ack_features
Date: Tue, 24 May 2022 16:40:45 +0100
Message-Id: <20220524154056.2896913-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 9f9f57c46e..bfe868e341 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -259,6 +259,16 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
  */
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features);
+
+/**
+ * vhost_ack_features() - set vhost acked_features
+ * @hdev: common vhost_dev structure
+ * @feature_bits: pointer to terminated table of feature bits
+ * @features: requested feature set
+ *
+ * This sets the internal hdev->acked_features to the intersection of
+ * the backends advertised features and the supported feature_bits.
+ */
 void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
                         uint64_t features);
 bool vhost_has_free_slot(void);
-- 
2.30.2


