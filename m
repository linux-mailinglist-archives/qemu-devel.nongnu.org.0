Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32FD2D3323
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:24:46 +0100 (CET)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjXR-0006Xw-MB
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminz-00087D-My
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminy-0005z9-4H
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IXfUWibUDD3qvFBeOlmCILSH/5yiUugL3d2LfLjhcv4=;
 b=TTPIqbq7Cd7Y5CYIDGlm2yyZjVHz/vW6X4j5Xw1E5eDIRO4VWGxv0qDHuYOwsxolo8TAIw
 PZ6HseuXjEfV4BY/iMUc7AQQCDMrNWFAZ8sod+o+x2N+37OAGeCZBq5K6+4cyGWZRDCnBO
 08K7rot8joT4agUC/28wSdakcJThAMk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-95eyzux2OgK7xn3YEKKttA-1; Tue, 08 Dec 2020 14:37:43 -0500
X-MC-Unique: 95eyzux2OgK7xn3YEKKttA-1
Received: by mail-wr1-f70.google.com with SMTP id q18so1163081wrc.20
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IXfUWibUDD3qvFBeOlmCILSH/5yiUugL3d2LfLjhcv4=;
 b=Ku0CWAXYdndpYoPFlompjEWnXTDcrrwdDgJudqPkQwLkLKM2pyWUDS3F6J41NV7shk
 MUfMVtuGnvfh2+BAekA2xSdkQ/gDaEFbZx8Uj6ElwZa2DUKvk6FsLS2EZssPE1JvOWaG
 F6paUyqZOqzqznzHUEGGF1/1JnZK2YNxMVHmebZWbswaQtujtCjTZ75s6xVcyXXj7Y4F
 e2/428AxGtEsn4cX1GNSQx+MEJWPPK8u1v+IebvWQqLmA0RZf8xIM5II5iNdCTcUGgK4
 jSiJMjFY6PembDuEBFjP4hPlAxxQk/L0T8YYPHTJvc6d15yaEHNeS0GBBF3QF2CES1RX
 2SoQ==
X-Gm-Message-State: AOAM531LSOhYWNY/96fMmbQil0xo6B2UmvRVzagRpFcOzfokRQC7Sy9K
 KrTdRBn1uE63ydxKNrr2TpUtmg+nhPgXAkUhe1xR1LPq1/OOn4nQY8hFuck3aZ4GHwlbX0WXOoa
 +pM0XbDcBdTFfGsYCJiyRNVRmnHdmQyvN/9FhyiTZZh2O88zQCO8zcNbN1Q66
X-Received: by 2002:a1c:b402:: with SMTP id d2mr5147739wmf.38.1607456261887;
 Tue, 08 Dec 2020 11:37:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMjx0QrQwuz38tBf1zjDgcapKTn4cCfU3L/H8NThVvTQpW0lQ9vSo2gH91GyFkxbeWS7B0Kg==
X-Received: by 2002:a1c:b402:: with SMTP id d2mr5147723wmf.38.1607456261685;
 Tue, 08 Dec 2020 11:37:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c4sm5507627wmf.19.2020.12.08.11.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:41 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 64/66] pcie_aer: Fix help message of pcie_aer_inject_error
 command
Message-ID: <20201208193307.646726-65-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

There is an interesting typo in the help message of pcie_aer_inject_error
command. Use 'tlp' instead of 'tlb' to match the PCIe AER term.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Message-Id: <20201204030953.837-1-yuzenghui@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index ff2d7aa8f3..dd460eb908 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1302,8 +1302,8 @@ ERST
 	              " -c for correctable error\n\t\t\t"
                       "<id> = qdev device id\n\t\t\t"
                       "<error_status> = error string or 32bit\n\t\t\t"
-                      "<tlb header> = 32bit x 4\n\t\t\t"
-                      "<tlb header prefix> = 32bit x 4",
+                      "<tlp header> = 32bit x 4\n\t\t\t"
+                      "<tlp header prefix> = 32bit x 4",
         .cmd        = hmp_pcie_aer_inject_error,
     },
 
-- 
MST


