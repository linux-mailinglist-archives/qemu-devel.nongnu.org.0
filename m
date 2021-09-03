Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6273FFF39
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:30:45 +0200 (CEST)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7PA-0004b0-7d
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM740-0007qK-02
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73y-0001hI-HY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOTtLJVTxmWiXFyWxgdLM6727jqRmtc6Bq8YlLBzcWE=;
 b=h/tilX1G/wbKzsdiFSo+jDpSMbVhb0LJcWNGZrLwiBu5nOKmkCpp6YSXUh4aXYG7yG/Rl5
 XHf+RjaH0ewMpiJyTsu0S0T8exQ+AkPEkXHgN2uOgcIIu5iREbCl5UfenMuDVE1F1O0Jgy
 z0TbJPkW855TyloDvH5g3mY2mgPA2rI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-joHnDo97Pm-rKsxn5tTXqw-1; Fri, 03 Sep 2021 07:08:49 -0400
X-MC-Unique: joHnDo97Pm-rKsxn5tTXqw-1
Received: by mail-wr1-f71.google.com with SMTP id
 z15-20020adff74f000000b001577d70c98dso1455643wrp.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VOTtLJVTxmWiXFyWxgdLM6727jqRmtc6Bq8YlLBzcWE=;
 b=Y4w6HbLHLIMPhicklJJQe1XP7C07zS+Outh41bEYB9jouTO+tGlWwDioFi601IIxh9
 5l1sz6NYILUZaCKajsSF+WV8+3RS2/QYTknrLuxp+DbvumsAW85gTOjg2v34MCvYpPD3
 Wcrs1oLTaFnHSDVD/7B9if/T38rQGhw/kLjR1QXelK2rkKAFFvHTa9YZ3VYGH8O+s5Vc
 yNGn57/ejzJUI/wRmqE57vqCb+jXitDqy74YQ8BB1Zqt9im9rqedmDww+FgdsXcKI04v
 z4iMqjXaijbdtOeD6IXQnILRgXsDA/OaSZiqbc4KQl8pziWFpAPqawpk9MHaSZmG8mKg
 7eXw==
X-Gm-Message-State: AOAM533YEghvGhNf94Q4yHUHRxp7LVpOJ++ga8nj9HuXJZzn0N5FB+Ot
 soG7A+oJVwBRFbPZbS/rzQWN2oLbZIqsNLGqT1QBhmUVVV+HRn4f1ADQmg9ajTVziYPyfhSiQvV
 ddSdxih+YghxwK25ra3bOYUBcopueWhcSVBVgMd1wOdbMs3NY7wAbSBx9EOwFF2Iv
X-Received: by 2002:adf:c14c:: with SMTP id w12mr3481240wre.115.1630667327657; 
 Fri, 03 Sep 2021 04:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIBBuXYMK0C2F+Vw5z9iQcRoob5RxQQtk7EF66z9lHOLy5Q7edix8DBRMzSDgVMsm39FO74A==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr3481173wre.115.1630667327398; 
 Fri, 03 Sep 2021 04:08:47 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g1sm5692199wrb.27.2021.09.03.04.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/28] hw/vfio/pci: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:52 +0200
Message-Id: <20210903110702.588291-19-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23b..5c9acfd9c40 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2040,7 +2040,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
      * physical device, we cache the config space to avoid overwriting
      * the original config space when we parse the extended capabilities.
      */
-    config = g_memdup(pdev->config, vdev->config_size);
+    config = g_memdup2_qemu(pdev->config, vdev->config_size);
 
     /*
      * Extended capabilities are chained with each pointing to the next, so we
-- 
2.31.1


