Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF5653159
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynz-0006yI-3l; Wed, 21 Dec 2022 08:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynx-0006ve-BN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynv-0004X6-PC
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22HTiVqCUQY8+u/d6nSRb69AufwfEdruw3bnWkKLKMU=;
 b=Se4t9meBcfzs9tsJWCWG8ugehEybtMfyF2iuN2HXHtGvNUNc8pQrpvFEr+Fuo158g8tBhV
 uWN4EDCHRp1fqx1phQWeHVlbx/Fn/yIRiBKAiKq4pYIczvnuQNvBHSIGzo+/lKgczS0GH/
 upjZ/6fh17+1yOA8KhsxsZoDblnQ7/M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-2R3wqvTqOvqvo6i1CRbKvg-1; Wed, 21 Dec 2022 08:06:37 -0500
X-MC-Unique: 2R3wqvTqOvqvo6i1CRbKvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so4304203wma.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=22HTiVqCUQY8+u/d6nSRb69AufwfEdruw3bnWkKLKMU=;
 b=TPlNzLfB5dmYgoUw2XSdhXxeacNqjQUHZh7rma9cnfamiz7GqVa0sQX9LREB/ekxi3
 JvSr48lObuKiD1WHJb1Ae2IEkoWu+Mtjkp9GCOmA9cTphMQ9Y4QROGsMJnvP9OZ7VG3f
 SX5Eajce+UnYLoywcZakkbDSCqvrIduvhOjPukZ3KVWrElKsHxWbKU+gnX0mFQ3RGLTr
 UFQQWsp+8j90iP0G0lRR5otfhzV6Ug8kMAi1qMbeK6fv/5llgdyCI3iIAYvTIk4nZn1u
 B9pFJcsUPnLTzpYuieeqvc14KECclZrtuEKvRunq4Tv4Y41pisxRbzZydByYYOMrSpt8
 Eyqg==
X-Gm-Message-State: AFqh2koqntQEqWh1qzk6wDNcLeXD7ZNeYDAFLn8bALzdMjLIvrezAe8P
 tibXZEvejCUeji+SDWTY0mjntA3csQuRT2B918ukQGeQ4C5YyHfdt5/RFqls5E037pMmvQHxK7q
 dGyv7qSFG1GmE9n1uL6RxwnQhWMaGsl+TsBX1CzjoQXdwJJU3wTqD/SYltzTg
X-Received: by 2002:a05:600c:1e10:b0:3d3:404a:8a1a with SMTP id
 ay16-20020a05600c1e1000b003d3404a8a1amr4478927wmb.11.1671627996116; 
 Wed, 21 Dec 2022 05:06:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbwIpwmykxb3ZxV2X8OG+9nzhKv3Qwak6P7CxHdXJsVnJ/j68w9E2UI9BaS2TUxl+t8sE3xQ==
X-Received: by 2002:a05:600c:1e10:b0:3d3:404a:8a1a with SMTP id
 ay16-20020a05600c1e1000b003d3404a8a1amr4478908wmb.11.1671627995836; 
 Wed, 21 Dec 2022 05:06:35 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 y33-20020a05600c342100b003d01b84e9b2sm2141325wmp.27.2022.12.21.05.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:35 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 40/41] libvhost-user: Switch to unsigned int for inuse field
 in struct VuVirtq
Message-ID: <20221221130339.1234592-41-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

It seems there is no need to keep the inuse field signed and end up with
compiler warnings for sign-compare.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_queue_pop’:
libvhost-user.c:2763:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
 2763 |     if (vq->inuse >= vq->vring.num) {
      |                   ^~
libvhost-user.c: In function ‘vu_queue_rewind’:
libvhost-user.c:2808:13: error: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Werror=sign-compare]
 2808 |     if (num > vq->inuse) {
      |             ^

Instead of casting the comparision to unsigned int, just make the inuse
field unsigned int in the fist place.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <20221219175337.377435-8-marcel@holtmann.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index aea7ec5061..8cda9b8f57 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -343,7 +343,7 @@ typedef struct VuVirtq {
     /* Notification enabled? */
     bool notification;
 
-    int inuse;
+    unsigned int inuse;
 
     vu_queue_handler_cb handler;
 
-- 
MST


