Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9CD681B7E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafZ-0007ip-Rh; Mon, 30 Jan 2023 15:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadx-0004yp-B7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadv-0007M6-RW
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DIVmCJPRI4SCSb4H+VdxsAkmz8FsQBvlv4F1S/IqRQw=;
 b=PQaLzxNhOTAgxqZCa3sQhfDno3pJwkTnCTia4z4BoXxiyWOLvVcI0spfV4ogsmfgJ2bmMN
 UsrcAKKIZylcV/QiK6I2j+41ArhLs5OURuvoyjBGPBcYvBwJkKGpv7yWxdgxQqo/msuYLt
 YUhtXwpt6GeM0ngXQadglOnkKHdkWKA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-auzJjdI2O9yA6u_4hr6aRg-1; Mon, 30 Jan 2023 15:20:33 -0500
X-MC-Unique: auzJjdI2O9yA6u_4hr6aRg-1
Received: by mail-ed1-f72.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so8884328edc.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIVmCJPRI4SCSb4H+VdxsAkmz8FsQBvlv4F1S/IqRQw=;
 b=iRckSaV1h7DpPSaiS1dVpWSRWlFGD7nn6G7YaxRiBGSN+OR+p5vCgRcu4GDHMsw3lm
 FbataDBRP9eahZLqmzQoIYD9K9PvcVcD2yxEVl/Zud3ESPTvH23EZ362SHlUz+rGfwYi
 59xGBMGv8ZbzOtfEYGxW3uSEl5WMlFMiZZPOgmqIaNXGIMDprpD1h6/IB+3uASZi+ZtU
 UpX+xIAiRS7dDPLuhx3b9JdgHmspLnK04nzY9Fb/E1vsRnSsR2eXJ6oY0eLPhYm/5End
 ax+++Cp+pSGu7Eq9keIty3DDmvwMoHkRDflihht20oG1twJg+4VjM5PlBLpY0YvuekR3
 eSMQ==
X-Gm-Message-State: AFqh2kpEloT4JxVvcEJq0757fbP1y/2zIvVcX4lYPRS0K3oWrSvJd9Ke
 jsD/rIRtJPte4MAu3jiQr6Q2MRFfHiy5jqfF296iplY9ggtezsZ9qLU0AbyXx07aDkwO0JWh0kC
 YP3siXSHUka+h1ZES33/yb+TvoynvlMpGt9gLt+2QfDwuKCFRucUBbPVocqLu
X-Received: by 2002:a17:906:6b8d:b0:7c1:4d21:abb7 with SMTP id
 l13-20020a1709066b8d00b007c14d21abb7mr54091146ejr.54.1675110032123; 
 Mon, 30 Jan 2023 12:20:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5CVyu6CeA3ekpN69rk5SBKxvlINmVE5/hkCbrIKKsLDjgFMXioUjJ7R4HvAqWB8ON6I9RPA==
X-Received: by 2002:a17:906:6b8d:b0:7c1:4d21:abb7 with SMTP id
 l13-20020a1709066b8d00b007c14d21abb7mr54091125ejr.54.1675110031902; 
 Mon, 30 Jan 2023 12:20:31 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 gb39-20020a170907962700b0084d3acda5fasm7308714ejc.189.2023.01.30.12.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:31 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 25/56] tests: boot_sector_test(): make it multi-shot
Message-ID: <20230130201810.11518-26-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

if the function is called the 2nd time within the same qtest session,
it will prematurely return before boot sector is executed due to
remaining signature.

Follow up patch will add VM reboot to a test case and will
call boot_sector_test() again within the same qtest env,
which may lead to above issue.

To fix it make sure signature in VM RAM is no more before
exiting boot_sector_test(), so next time it's called it
will wait boot sector is completed again.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-16-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/boot-sector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index d3f68018e7..679ee17e2a 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -153,6 +153,8 @@ void boot_sector_test(QTestState *qts)
         signature_high = qtest_readb(qts, SIGNATURE_ADDR + 1);
         signature = (signature_high << 8) | signature_low;
         if (signature == SIGNATURE) {
+            /* wipe signature */
+            qtest_writeb(qts, SIGNATURE_ADDR, 0x00);
             break;
         }
 
-- 
MST


