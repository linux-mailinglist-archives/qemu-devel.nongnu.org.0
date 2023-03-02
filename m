Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD56A7CAD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHk-0007e8-9I; Thu, 02 Mar 2023 03:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHJ-0005j3-7n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHH-0002dF-MD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wh1Er9v7J0W+GmPxUecMe89Y+EM6DaUlXYuRCYSIj6U=;
 b=jWrhdNhg96GS4NBKOvqtyWkxlsIKqdVkQpJMIE7AiGlqN6pMnXmu/yofKtGoVeHwrqncBI
 D574R0SO4iIZlRDlZW/ibHNPC0wczxFQcA6U7gKNKtNKGJCU0zfEEaLNu6OK+aEWxg57zv
 0mWLTvw1vIKVRkDVac3VU0IqO1NBfZ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17--KoAYL5fP6itaBuxQbVvvg-1; Thu, 02 Mar 2023 03:27:01 -0500
X-MC-Unique: -KoAYL5fP6itaBuxQbVvvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so5463639wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745620;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wh1Er9v7J0W+GmPxUecMe89Y+EM6DaUlXYuRCYSIj6U=;
 b=qS6fnxXjfDIXWWWWfSUr+RmUpNIR/PpBCPBTYLAhHn0tcLq70FaABevKyN8eHhwblw
 VsrxHhgno5itNGfXL+FtQuE44RBZpQNgX3wdHq8EmllX47rVGVyq4GMdwwzIjzHB3vU2
 eoQdhsSsO/M/gmxk04bvAPh7i3kaqhrl5aSaXtoAO+MtH8M+g+bgJPvDp2Hcm85KhRz7
 MShYApvT8p4gVzuhps5Z6PitxqiQoRHipylDkhWLInnhNw1kCYHjv/blbGXO7VR+XXju
 FOw4TAuRd1x8qH/mvVTG5rN8uJt8DJY6HqJVNgxQHwPfq+ETOQi8l3WOhTXZVuNBxbnI
 WVaQ==
X-Gm-Message-State: AO0yUKVeKaexF8Ocuti/TQ49+xVxe/4YbdN6luXVvV0vcOgqxJVhEutO
 Zmes2rw4lCucjEcQjrcWJcMvlsVI9fF6dc4VVe2T52951jRyInE2qImJMIaFDaqYLonljgiIEJo
 Yn/h8QpUSETJfIPOmgOmdzqgAi3GNgJ7cyyrNHCju159rd6is/pj84OBBbdosVXgjxA==
X-Received: by 2002:a5d:6604:0:b0:2c7:fc61:12d4 with SMTP id
 n4-20020a5d6604000000b002c7fc6112d4mr6635218wru.47.1677745620235; 
 Thu, 02 Mar 2023 00:27:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/wJ9mjgFwAezzU/5g43yUhL0sdFUc+kMGPLL++Iv1xfFbn27lpMSaRgKJ1+zJxWnQEM0ufmg==
X-Received: by 2002:a5d:6604:0:b0:2c7:fc61:12d4 with SMTP id
 n4-20020a5d6604000000b002c7fc6112d4mr6635199wru.47.1677745619900; 
 Thu, 02 Mar 2023 00:26:59 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm14859699wrm.16.2023.03.02.00.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:59 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Gregory Price <gregory.price@memverge.com>,
 Fan Ni <fan.ni@samsung.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PULL 47/53] tests/acpi: Allow update of q35/DSDT.cxl
Message-ID: <20230302082343.560446-48-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Next patch will drop duplicate _UID entry so allow update.

Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-6-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..9ce0f596cc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.cxl",
-- 
MST


