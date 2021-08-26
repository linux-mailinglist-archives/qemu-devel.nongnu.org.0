Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2EC3F8F62
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:00:07 +0200 (CEST)
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLXd-00068z-9V
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOb-0005K5-Uw
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOZ-00035H-KB
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPZfczG2XQrRC55s69h86ljHzGci8wjhwO3c1XD3j8g=;
 b=GvK9hLvlvCwfFG+v5riWOLsSPLU048yducizMLYKbnDGu5CIherS9cvXRTqybQyOJLwtIz
 bbxNRwvENe91Pd3gHnhw/lIjrYQHLB/pZmri2Dy4nVRQRAGBg/QAextRa7XDarLw+1mbMm
 a0gftFCIUZaRwkl7D3mCATEm/C+E1Ko=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-7Lbqu5ZGOAyWhv2G0osWyQ-1; Thu, 26 Aug 2021 15:50:35 -0400
X-MC-Unique: 7Lbqu5ZGOAyWhv2G0osWyQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso1221058wro.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPZfczG2XQrRC55s69h86ljHzGci8wjhwO3c1XD3j8g=;
 b=SapqYbIlxMGrYAcpZ+WSPMgBjIwxcQPic+UN9nLImDQKfdxCnp/Sy+PjQs1lBm1qzz
 TFPiVkYvNJa7DXh+GvULv3odisrHSub9X5yJUJxbStmdFvWnr8jMV9HKuYlKsQmaIwkF
 UATiirBUHbEAS3+NG+6mlGE0gGgsLvgFmgXWi4DV6F5x77SqheY2TIu5rVB5UtSMbbFS
 aurRcot/xnyNJr4NWeSHVudu1bgot+If6FD8aO4WezheX0+c7ASbSDK4r4f40KlGQVnV
 gOMxeFeebppPJG+tl1J79//GCP6S0zENU0QDipLC1pMAJFfTaIRyCO3bRhJdoQNYJBf5
 ZDUg==
X-Gm-Message-State: AOAM531Oft2ZmKuSKPjUsrEYgSRvRUg0kaEXrT3X/mf/AkIPKIEtwQrR
 qogP7LAK63v731XWN405P3pFfuMNIORDOSWXIQSCyMN9/eF1YnOLbJDQHjCvEf8h46pUuyEjGgH
 qNKQB0l13HDT/CdQ9Ts9iK3BsKZIK0Y3thjsxgSrJIqaYGxdPY+vbx1BNjnWxbNKD
X-Received: by 2002:adf:edcf:: with SMTP id v15mr6037122wro.61.1630007434120; 
 Thu, 26 Aug 2021 12:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpPp74nFUTEVaLdtiLUSM5iwa51BcR3IivZ17saErSXnDIEFKbQUjijSVSLzvrnHoZPy7trQ==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr6037090wro.61.1630007433858; 
 Thu, 26 Aug 2021 12:50:33 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o5sm4003844wrw.17.2021.08.26.12.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] util/vfio-helpers: Remove unreachable code in
 qemu_vfio_dma_map()
Date: Thu, 26 Aug 2021 21:50:07 +0200
Message-Id: <20210826195014.2180369-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.742, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfio_add_mapping() returns a pointer to an indexed entry
in pre-allocated QEMUVFIOState::mappings[], thus can not be NULL.
Remove the pointless check.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index d956866b4e9..e7909222cfd 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -751,10 +751,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
-            if (!mapping) {
-                ret = -ENOMEM;
-                goto out;
-            }
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
-- 
2.31.1


