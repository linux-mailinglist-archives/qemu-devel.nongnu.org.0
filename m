Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ECB4AAECC
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:18:27 +0100 (CET)
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeck-00053M-AU
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0v-0002Bo-Ux
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0t-0003nU-Lj
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eumjoy2b3JuV2CT6O4JwajdWx+yglD5Kzegw38RNJ0M=;
 b=aOMkPRaSSGHKY4KsZtrKTSRgueaKtz/FuPXtz3X71fRfPX5pYtVMO3VJpOJCcgXTJc1Ulg
 hE+kowjMLSyjf/FXqzBRqW8gCsTMrcGZIuJQpDdjpcMRoc3TZy++A5ImDS3I+0YZIZyu0F
 B5A2L+2Kxur/ghet40pdD40J9XxDHX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-WB3k6PcKNGGeRehhWQm_-w-1; Sun, 06 Feb 2022 04:38:19 -0500
X-MC-Unique: WB3k6PcKNGGeRehhWQm_-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so3956627wml.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Eumjoy2b3JuV2CT6O4JwajdWx+yglD5Kzegw38RNJ0M=;
 b=tW/2/w6Scq9TKbvLeA4loal768fPEs5OyMadnGo+wmZh9k8nv0ZhaBxNaM/nWYkuPt
 N5E5KixiD6YDn44yt00cS9L+jMIgmdHtbOCyWeR71EE/8bllYw+gorOyKZYCdlqegcJV
 4DtmDvLPISd6WdG10woqH4LliwM9H5GiKT0zYmaq/XzdIh8qEEc57WiZ7qalt5J7o6FC
 Rf4ebb0wOwaKC/UvSWC1caqoD8g2vBEzt4o15DaV3GDAs7XMWHztPyYUEl2qaCwpG+6Z
 SZM40bESeGVU6gUc+wGKNbniXD7x+r1zinWckT46ZxhkoCEAX2Xolqld7riwQk0UDUnM
 XqtQ==
X-Gm-Message-State: AOAM5338EQfHMvJEqb81ZTl1KZ0TsgcnI7tCgXBGMPEAHOGFVKiVkZqb
 H2PajEnhbve7viInQvD3yLQtKvNdmC811lj80Nb7gFrQAKbnMWm8bpV3e1/oJL3MvWeAEFtGzzT
 DIeiJo9C/6VE6sKeffxlxcCKoM9b9xtpHGzBEcwXempfh2qVa3AjzPlX76Spj
X-Received: by 2002:a05:600c:1d85:: with SMTP id
 p5mr6307612wms.36.1644140297567; 
 Sun, 06 Feb 2022 01:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6uXurDT7ayBROU9yrIKFz4IAqvYUyzY4D08P984I5DgNBM8PTod2f+ljLxFCxBEgu65L7zw==
X-Received: by 2002:a05:600c:1d85:: with SMTP id
 p5mr6307588wms.36.1644140297327; 
 Sun, 06 Feb 2022 01:38:17 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id g7sm6907360wmq.3.2022.02.06.01.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:16 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/24] libvhost-user: fix VHOST_USER_REM_MEM_REG not
 closing the fd
Message-ID: <20220206093702.1282676-12-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We end up not closing the file descriptor, resulting in leaking one
file descriptor for each VHOST_USER_REM_MEM_REG message.

Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-5-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 7dd8e918b4..3f4d7221ca 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -868,6 +868,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         vu_panic(dev, "Specified region not found\n");
     }
 
+    close(vmsg->fds[0]);
+
     return true;
 }
 
-- 
MST


