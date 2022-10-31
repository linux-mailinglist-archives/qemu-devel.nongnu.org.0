Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F397B6136FF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFr-0000VP-T6; Mon, 31 Oct 2022 08:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFl-0000Gg-8A
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFj-0002Cy-Qd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=T9VIBrC/w4Oja9v8Xbgmyu3OG+P97uG3TNXV1W0CXKdtuBsnYBLZnhF/qv9uI6keswb0uD
 24zZQLOBzc2LrZ5OEtiDz8PXIYBaQH53h4UD8hxR7Bb9TgMCN99GNukTXy4Iox+0f3K5MG
 wdgfXE6cD3kmGWxmqmfMjRQjNurCVZg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-5iwD7JLvNx-wZhvUMs8_Dw-1; Mon, 31 Oct 2022 08:50:54 -0400
X-MC-Unique: 5iwD7JLvNx-wZhvUMs8_Dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso2571515wmj.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=vOg36GmggAQOYGQGgYNgRzbm8X8aethYFu1Y/DSjqfz6tRGwUp1Zxwvas8SAxZ5dSd
 +9LTY0YGgXz3chREMbub1N+MBxt/xS6FK0IFmhV4rmR65J0CcAAhuIckaXv0OZcV6UYv
 qehndQv/+T0rRRKG8fPdeAfdO8385zeN3EEyNDNae3lh0V0WvcSTKvgKKTVl/tV0VRYW
 duOZz7iCm1NJKLvbCx4x/u+CKApFxj3uxQpbdqNN1an2T+SsRQMpp25ZYypLMu1OK7cL
 /7ItUk44u45SesIJ8hueZP99psYLE0PK0YK55rOPLS1fnu4nZfKLVBGjNJcKuN9jCGlS
 H4qQ==
X-Gm-Message-State: ACrzQf0vgHuXRtkXx9UgjYoB/PK9bCyFCs2tQwHytq+zsM5121dBoRto
 Taj+uyer9pXWFK24v08rskq6dfJB2j3jk0DvP3Xio8ePI0F/lcmMfHxZu+piO5D/lFVYLtQ3Fap
 t/EzzG1aEiwXVO6hiAZJTLRnqdMhJFsL9yXT/Sqk324dOcpZC7ScVTEupVMpO
X-Received: by 2002:a5d:61c8:0:b0:236:b893:9d83 with SMTP id
 q8-20020a5d61c8000000b00236b8939d83mr6330126wrv.354.1667220652609; 
 Mon, 31 Oct 2022 05:50:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SZlHbv3N6I+EbehlrFJydZM8zKqOyW1VC6CvH5TGUdce7g77BoJeG9x4r7UYoNPWWID0Bqg==
X-Received: by 2002:a5d:61c8:0:b0:236:b893:9d83 with SMTP id
 q8-20020a5d61c8000000b00236b8939d83mr6330110wrv.354.1667220652318; 
 Mon, 31 Oct 2022 05:50:52 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c414900b003b49ab8ff53sm7229838wmm.8.2022.10.31.05.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:50:51 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:50:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 03/86] tests/acpi: allow SSDT changes
Message-ID: <20221031124928.128475-4-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Robert Hoo <robert.hu@linux.intel.com>

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20220922122155.1326543-2-robert.hu@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..eb8bae1407 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/q35/SSDT.dimmpxm",
-- 
MST


