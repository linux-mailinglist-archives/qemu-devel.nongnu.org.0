Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F46568587
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:29:11 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92HO-0000xn-FH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mM-0004Af-K1
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:08 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mL-0004QY-4F
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id o12so365886pfp.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRDKSi3770K/JU0FuB6T8ubSTJN1+dOqkAdD6Kmc4sI=;
 b=rUfwym+28XIlqihk4lmcWFDYLnhZrRpKH8EbXftUWWGNkKzroethHQPviyFe5ClYDH
 zc8ulM5hiskjdZNld7Hl5E/qKEFrLAheL03L96wL/hOf1yQHi1kRypMEwo1aCznM4u1A
 U3qajFXtzB9nEFHiOFW/2hQWj390h++0JtZqcGXu9qBPqYxlqh4RymlfGAODpRGwlvet
 x+zZa+OHN8zLfmiuy3RWG+wI+1KfJuBlez4OFNhutW3OxsrcCGm4Q5w7J8hgpue38F0F
 YADrpPHTgAikSgq8fTTn77l2vTXsjcp/0F++2z27iBTXvHLJw6EXm4B2fmRkVQos+sdc
 9AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRDKSi3770K/JU0FuB6T8ubSTJN1+dOqkAdD6Kmc4sI=;
 b=JeT6wtJbUGuBRPxkyXHr0zP8fSGWBzU+/ZDJL57mmfxgvYXlBAy/vl++NECMfK2+oG
 VAetW936sd5qJHnlMe0WZtkjWyOl+WzbxdWmHxE5adcx3jDDIh5A3YM5IhlMoWn266hh
 KMpdF8OuCOMcH3dPVdxWqiRWNvnINg8rIzzUdJoaQcW81jlBwdcpyg4h64l3hqVga4B0
 W5nmRNr53tyXarMoqAjfys/r5urH6wzWFmlNQMPjqVet4wE03PDknqIyUwGG1LnHUDli
 fd/1yo2cPTIEpoocGJ444ejU7eRatU/wcgjSDtCu8Wv9KBrQZ7CqTVynvPvKujI8LMMS
 U3RA==
X-Gm-Message-State: AJIora+CpAN0GrGeVH66eqQhnQrw4l0/DXlnIE8VSRH/+jyvR+I/UqBd
 yPB9VILZWAqcasm1S+7IpbMakaV/X9w2DKo=
X-Google-Smtp-Source: AGRyM1srqoGoHBj3K1O1PcHNwAQom3W0yBkp4laHGQNyOYOdgItcI2iknjv+EqQlvN1JvhGkGeFjeA==
X-Received: by 2002:aa7:82ce:0:b0:528:bf80:3e08 with SMTP id
 f14-20020aa782ce000000b00528bf803e08mr1206499pfn.65.1657101423908; 
 Wed, 06 Jul 2022 02:57:03 -0700 (PDT)
Received: from localhost ([139.177.225.253]) by smtp.gmail.com with ESMTPSA id
 u15-20020aa7838f000000b0052592a8ef62sm21496919pfm.110.2022.07.06.02.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:57:03 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com, stefanha@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] libvduse: Replace strcpy() with strncpy()
Date: Wed,  6 Jul 2022 17:56:23 +0800
Message-Id: <20220706095624.328-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706095624.328-1-xieyongji@bytedance.com>
References: <20220706095624.328-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Coverity reported a string overflow issue since we copied
"name" to "dev_config->name" without checking the length.
This should be a false positive since we already checked
the length of "name" in vduse_name_is_invalid(). But anyway,
let's replace strcpy() with strncpy() (as a general library,
we'd like to minimize dependencies on other libraries, so we
didn't use g_strlcpy() here) to fix the coverity complaint.

Fixes: Coverity CID 1490224
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 subprojects/libvduse/libvduse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 6374933881..1e36227388 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1309,7 +1309,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         goto err_dev;
     }
 
-    strcpy(dev_config->name, name);
+    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
+    dev_config->name[VDUSE_NAME_MAX - 1] = '\0';
     dev_config->device_id = device_id;
     dev_config->vendor_id = vendor_id;
     dev_config->features = features;
-- 
2.20.1


