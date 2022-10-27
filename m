Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350D60FB95
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:14:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4YD-0002cG-4Z; Thu, 27 Oct 2022 11:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oo4YA-0002DZ-Du
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oo4Y1-0002sm-HY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666883514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=KSp/4lHAXuOsrwqOC5Motkbb8RzEYnMS/koDLG8XNFw=;
 b=QJEhdKyAQV0v3oRdS6MgnT/vLt92WkLD+tTg8OCbAUMbz4tFeOlcpTW2n8QJWQAv54s5nd
 tRj1V+Stfna6BcReoeFJQVngmXdbjcHnpC+9IEpCai+2EznzDwEQoUw9n7tmr0bclbD20F
 2I4LMV++LOz3SWm5x/Xu/xu4lpdX520=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-TcdLV-hEOU6BRLo7udSN8Q-1; Thu, 27 Oct 2022 11:11:52 -0400
X-MC-Unique: TcdLV-hEOU6BRLo7udSN8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso492246wra.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSp/4lHAXuOsrwqOC5Motkbb8RzEYnMS/koDLG8XNFw=;
 b=yLIf4jtgLorYnjjP4LxICxxntgdPPU38XaJH4yzM5M2fk7p0jjr/l5JLR5ImMVP19h
 Nvbl9zdqh+Lax+ZkQtqEvmABAfoBeDSGfRrPkLSha1Uy1AH34s/vSLI6MevQP/jGeArF
 HpDZ77YbBBZL6SBWTgJW0gM3MX9uEBwUPSqywmWBglXqRDFNpruJOcHkz8Z+ZJHH1KmW
 Hr2A7tpkHrlFeHLa3EaxyK93MHOq9KWvTDeZq8XMQYKIe5yz/vxbxVKwvOfcwwxHiEun
 nXWC+P80oa0YUDiG/jBlPuJK82gFw0PTBB8u/rOVKMf12zVUxZlzkyVwr7bl7JVxrbqB
 JmtQ==
X-Gm-Message-State: ACrzQf1DrQ9zQXqZz9A1FAZrYboyo0rxpY/hehfbewrRGFkh3USzJ9UH
 ZUo3hHcSf+v1B4h6YNky/t0Z+4hjlATffUbAGchwtnp/RlF7X2NyEJ3cW10LBv1qpws2+mMHsSf
 AW1912U/ELTZTM9FId6621mIRo1ATNH8yM1OOrwFqb2O4l1GymwMFo5n/1EgT
X-Received: by 2002:a05:600c:310b:b0:3cf:33c4:bc7 with SMTP id
 g11-20020a05600c310b00b003cf33c40bc7mr6376487wmo.25.1666883511343; 
 Thu, 27 Oct 2022 08:11:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NWerlTyFG+pWysXe+HzOMnRWsN8RX4iXVZRayBiuoGHwZ3vTyITW24fEUg3k4HX2uTztmCQ==
X-Received: by 2002:a05:600c:310b:b0:3cf:33c4:bc7 with SMTP id
 g11-20020a05600c310b00b003cf33c40bc7mr6376467wmo.25.1666883511103; 
 Thu, 27 Oct 2022 08:11:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 a9-20020adffb89000000b0022cc0a2cbecsm1445443wrr.15.2022.10.27.08.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:11:50 -0700 (PDT)
Date: Thu, 27 Oct 2022 11:11:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221027151135.496368-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

we had such a beautiful structure for updating
expected files, designed to keep bisect working.
It turns out that we ignored the result of
the allow list checks unless all tables matched
anyway.

Sigh.

Let's at least make it work going forward.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e6096e7f73..a72f6ca326 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
                 "for instructions on how to update expected files.\n",
                 exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
 
-        all_tables_match = all_tables_match &&
+        all_tables_match = all_tables_match ||
             test_acpi_find_diff_allowed(exp_sdt);
 
         /*
-- 
MST


