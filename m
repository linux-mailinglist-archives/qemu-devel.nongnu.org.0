Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA81613716
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHj-0006hE-Am; Mon, 31 Oct 2022 08:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHE-0002re-5m
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH7-0002bD-Se
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHFXNJ7TRNOvAiA8s7O4cek3bdeS2+9Q5HzxZqyBRsc=;
 b=SD0NMLX58tCiqPgRiS/Gi8UWF313Qi8PHp8X1IFedg6wT+z8v73ku+EkontrwqbZfEg3iT
 rd7y6EHfnfujCxzv89HU88fg7l1RISesWOvbrOAxJ5/UbsL/WTRW+OXzUnU7YISgXHZc3g
 N8uPGXcRJt+qzAsQ5lCV9UzXIp13GHs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-Alm8Q6QZMHCqUYbQ55uS8Q-1; Mon, 31 Oct 2022 08:52:19 -0400
X-MC-Unique: Alm8Q6QZMHCqUYbQ55uS8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 s7-20020a1cf207000000b003cf56bad2e2so2212211wmc.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHFXNJ7TRNOvAiA8s7O4cek3bdeS2+9Q5HzxZqyBRsc=;
 b=s/mxsMtGlk2b8OnKViodrYt2XFVo7qCg7NAiehjckUFHczRK08kv4ADPm0METyxs8B
 qhB7rpy84qdw5SLphiQ8YvVYGtBV/Nd0fWWRc6bVZAA6jj4GslB132xDaIoP64F1Jj72
 QB6ZhAfuR8w42dDsfK9wY6sSCByVhHtXWBuWfxOUWF2HTIxnfMU/zNf6opp3m1xxl37Q
 LMic21jvzrd7ROwEgpIClHOP4aAILwYEPnPWQRd5oIcjuqjz7QGqaDN2i4qz6lfRnB7/
 lwVU6QEy0s2bAB9hN+LSpnP1f0jpjRs5npRZtCVfa2HzrbBH4znJx5WM53npKiVAevzT
 k3jw==
X-Gm-Message-State: ACrzQf20zuIMfgytu1vLnzFrBFM6gH2s2mLRu+Z/2m3jDLnTugNYKnUI
 TUA+xc6j+1cpNKmVX7xb0iM/L0a0gVGbZW6xE0RukuOZsXwMIn4lj8fPJplKOYSrmLwe+/mSGYS
 3AH2MltIYxSvFON9V9wpjWwktEB2GN6VwpFXKxejkvUkLFy7rZxLkcaCTnmSB
X-Received: by 2002:a05:600c:168a:b0:3cf:68c0:a9b0 with SMTP id
 k10-20020a05600c168a00b003cf68c0a9b0mr6618597wmn.101.1667220738271; 
 Mon, 31 Oct 2022 05:52:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Pnd3+BYTN8q+lcb5GGCRugtRegPsXqrpoEJn56+MaEZlRGGYmXEeYUbmIJZRhXUuQodJsuA==
X-Received: by 2002:a05:600c:168a:b0:3cf:68c0:a9b0 with SMTP id
 k10-20020a05600c168a00b003cf68c0a9b0mr6618575wmn.101.1667220738001; 
 Mon, 31 Oct 2022 05:52:18 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 w4-20020adfcd04000000b002366dd0e030sm7203622wrm.68.2022.10.31.05.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:16 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 32/86] tests/qtest/cxl-test: Remove temporary directories
 after testing
Message-ID: <20221031124928.128475-33-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

The cxl-test leaves some temporary directories behind. Let's
clean them up now!

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221012091435.893570-1-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/cxl-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index cbe0fb549b..61f25a72b6 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -101,6 +101,7 @@ static void cxl_t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_1pxb_2rp_2t3d(void)
@@ -115,6 +116,7 @@ static void cxl_1pxb_2rp_2t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_2pxb_4rp_4t3d(void)
@@ -130,6 +132,7 @@ static void cxl_2pxb_4rp_4t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 #endif /* CONFIG_POSIX */
 
-- 
MST


