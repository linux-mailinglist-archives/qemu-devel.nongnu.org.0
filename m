Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E373653158
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yo2-000765-FQ; Wed, 21 Dec 2022 08:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yo0-00073e-6G
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yny-0004XO-O8
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671628002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIdU6BU5H/qloVVXjAafwV6ZU0KH98qQP66NNxgw9cY=;
 b=MrfJQt4KDFgmHjk7U+zhljGv0nIet8cj0meTFPERyirQX33wfI5LXbm6H1QcCogfNuC4v5
 jH1C4Wwc8MM1SDEC79zuc84Qk8mFA60h/wawC65Ln2SNIQbESkx7W8TTjvuZmjOtVPaPEY
 BgkG6BjnOi4ZdEYL8ffkMx13stKUuUI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-U_kFSfeiPhG-LVi38hb-yQ-1; Wed, 21 Dec 2022 08:06:40 -0500
X-MC-Unique: U_kFSfeiPhG-LVi38hb-yQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i187-20020a1c3bc4000000b003d634aca337so1766780wma.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIdU6BU5H/qloVVXjAafwV6ZU0KH98qQP66NNxgw9cY=;
 b=d+E7YcEJpMa/ffdhAVdOzgFxDZxWnFnMfVzc5K3x9MEfLP02yExAyMjUVGctuHXfTC
 3uklCPj22LQvxpvGwdimrtlJWdSqTGS5u2Rrgoi0ycTNDA6uOw+JfFWsnEJ7qvZtT8GR
 tDhPcrU5vVZ9fp37uiAdv9a2raCJ+CCBzdSRlJ8kqC7xdPv3fGCTTChq09LDsMlQ97Vt
 kE4DdsMLjK8W2DZhLc5stAzuqZCaLgVBrHgYXI+U6Hc9Y8j86wrwmDr0oy0sYGqZiWzF
 93ofQjldEqFr8/d4NYO32AtcVj3L0JeSiQ3NXizS/2GX6FJMGZW9WSBMzdzp2kJ/x0ri
 hv4w==
X-Gm-Message-State: AFqh2krQYqap+qwDYBovMNkaZElklHDnfgivvKRWoWX5XswktFdM05wM
 6COqjrXjURFHgg2meIU7mTZ28fJTFnCkLkEQF283yIRlbzxpnoVzMzYfENDB1t1N244x7Mb+Zq6
 mHNaMYavT1xDCXw7M07y/tdoRWv0fszSCqWacsMHIKg9ep20Vjpzn3KJMpvv4
X-Received: by 2002:a5d:664e:0:b0:242:483f:e9b9 with SMTP id
 f14-20020a5d664e000000b00242483fe9b9mr1150115wrw.24.1671627999069; 
 Wed, 21 Dec 2022 05:06:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsqrMJN2jHW0neXAjTJI6wxFlvhPa7Ooi37xvhmvcPAsl56GAUZdItnkidPbtullr7lT1v/Iw==
X-Received: by 2002:a5d:664e:0:b0:242:483f:e9b9 with SMTP id
 f14-20020a5d664e000000b00242483fe9b9mr1150099wrw.24.1671627998818; 
 Wed, 21 Dec 2022 05:06:38 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bn22-20020a056000061600b002366e3f1497sm15585320wrb.6.2022.12.21.05.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:38 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Khem Raj <raj.khem@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 41/41] contrib/vhost-user-blk: Replace lseek64 with lseek
Message-ID: <20221221130339.1234592-42-mst@redhat.com>
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

From: Khem Raj <raj.khem@gmail.com>

64bit off_t is already in use since build uses _FILE_OFFSET_BITS=64
already. Using lseek/off_t also makes it work with latest musl without
using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
when using glibc but not with musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20221218220740.315839-1-raj.khem@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index aa99877fcd..7941694e53 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
 static void
 vub_initialize_config(int fd, struct virtio_blk_config *config)
 {
-    off64_t capacity;
+    off_t capacity;
 
-    capacity = lseek64(fd, 0, SEEK_END);
+    capacity = lseek(fd, 0, SEEK_END);
     config->capacity = capacity >> 9;
     config->blk_size = vub_get_blocksize(fd);
     config->size_max = 65536;
-- 
MST


