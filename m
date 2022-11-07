Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E631620325
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAuA-0006ER-Na; Mon, 07 Nov 2022 17:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAu8-0006D0-3h
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAu6-0001T0-HZ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=LxLEH1bZ/gYdZrfDbOd3GujudxL863SguH1PWHTE9zHQbYuat0br6zXNi3G/VG3FYHu83H
 QcXs1KhdMIV62vqgTBJNiw1GvF0bvkALa6MpVj+nogl6TFXCEy2C7hlLfBVfUX+ytwIGI8
 yPrXLt+vtzMDKM16z6NcoWBet1VqrQI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-sG4XVrjZMoSNP_Lj5KyQDA-1; Mon, 07 Nov 2022 17:47:40 -0500
X-MC-Unique: sG4XVrjZMoSNP_Lj5KyQDA-1
Received: by mail-qk1-f197.google.com with SMTP id
 w4-20020a05620a444400b006fa24b2f394so11371928qkp.15
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=Shd+fxaBJmUQ/nxtqPBbRvIwfrV+L8JwkdkQJGscrZX7MCd4tQcnGPIZcJGsHT+KXS
 5L0tyajCPlsk7P7IhSbgl+Ux80l1krpPcuSS6xFZsYGaBU2f7xeBnyIjrP8hns+hQnaI
 x203l/2vyRWPMzqfBNG+3J6B5x1Mjt62itZ6VBGtJ6sxx80V2BSJk/DinVxeXP4qqcdX
 m42s0c7D1ojfUf39sexJ6uGTjVpDVadi9CLthjBXD25/9raFzfxtR3cc0o+S10HK74lU
 YJFbb9M9gFTXPBm+aw6LPMqVPamzp/SRxHgFzXYjHKmGB0ojjcCU3JJYUoJKaKWbwIKL
 V6zA==
X-Gm-Message-State: ACrzQf1b95PbT0imoR1RvemEX0pFLDyONmd7MNItuHM5LEioAzgAaZZf
 Vp47KMVcD2+/aPdSZQWoSV4ANIEO9i9brVbmcSnkWy/2AdLadPkGfzpExrV4SzBrIFZciaAqVYi
 bbMgICbCjY61QZ7xK32qF0OEX0DQrJJJnKKxKUeKz4v+lbmwkwwemIouBb1tw
X-Received: by 2002:a05:6214:c88:b0:4bb:5b29:e96a with SMTP id
 r8-20020a0562140c8800b004bb5b29e96amr46676241qvr.6.1667861259939; 
 Mon, 07 Nov 2022 14:47:39 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7PS8AF5sH2y+XD7B32d/TxRevuh84tyMXEbFjTJrTpKSZixRu2ctfVdBKZSHKoXVM+f9J+aQ==
X-Received: by 2002:a05:6214:c88:b0:4bb:5b29:e96a with SMTP id
 r8-20020a0562140c8800b004bb5b29e96amr46676213qvr.6.1667861259601; 
 Mon, 07 Nov 2022 14:47:39 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bk42-20020a05620a1a2a00b006fa4b111c76sm7898412qkb.36.2022.11.07.14.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:47:39 -0800 (PST)
Date: Mon, 7 Nov 2022 17:47:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 02/83] tests/acpi: allow SSDT changes
Message-ID: <20221107224600.934080-3-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


