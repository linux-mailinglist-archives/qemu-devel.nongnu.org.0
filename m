Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2E546279
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:32:55 +0200 (CEST)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzb0h-0006ap-17
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXR-00017x-1t
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXP-0006KN-Hm
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7IWfIBrFepbsxN61C4a58DCenvK50R6Ziy2eNT6bJSE=;
 b=CCrGLDXop+JSSThxPbo6L5aREaRVOKvnahrOOy6UFKFyTjszF4T7GSrXEXvfZyHRXvr8yn
 gK+orrbke8JRewb3avPcYTVc/B+HaPqVYMSINp9SEO6KmXDeLQ5q3+uVGh1kHIu0f4qvgY
 lqeEoYFIZ2UnDz0EZplSbmw5TY8TAFs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-V7lV73ETMbuQSMif7bMieg-1; Fri, 10 Jun 2022 03:58:34 -0400
X-MC-Unique: V7lV73ETMbuQSMif7bMieg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b0039c747a1e5aso949628wms.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7IWfIBrFepbsxN61C4a58DCenvK50R6Ziy2eNT6bJSE=;
 b=I0Xv67BEa9tPVFi22gpmzqGxjoqEcqyDpVqVJ+DJXjivo/livqK2R5lIfFg1/9XNMx
 6saidiZGftIOfvYE40HKqTXE9wTgyCuKkVrNI8nkWNY1uZemwewUos5I3b7ZxXbksQ0j
 VQUvxE5zphPhpHHD7F3REdn4FG7FH7KSKe2egLPWQg9BCuPl/HV3y0yC2xFO9U7n9fTK
 c29mpELpysq/G78iJ72yxIrDMOyoWkWoGYyJeDoK/OkQgYqXMIE2P4gjS5fjdHTSZR4/
 pSzjuq0o755GPK3XpPz1G7IxywnzMCgZSDHWgm7xVEL6zZIO+LqAzV4JHVYFLZ7+GNKy
 65FQ==
X-Gm-Message-State: AOAM532u249YmuXI8FLk+M5hAWHv6z7431u9uit9P5C0zfTWOhII9QQe
 eIA2hMhZ3NrK1RmGvCLb635DaPLBC56a5YxGoKj7p2CnA+ujFcu4MX2avNGMQNAuPNrOCmsZN2l
 +WpljKqRPnn5HJrxF9O77zoTjR1Wk7wlWRYVzyMahQ9aFwm1ju8DcTeWpvhUL
X-Received: by 2002:a5d:6745:0:b0:214:d2b:6fe7 with SMTP id
 l5-20020a5d6745000000b002140d2b6fe7mr37879943wrw.82.1654847912561; 
 Fri, 10 Jun 2022 00:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcTzfhK0p7ZUoY0T/3M6vFVcyTGh/8C3ocR2pGu24q0/xINOAs8iFYnkBJoYy5Tbq0fuQYPg==
X-Received: by 2002:a5d:6745:0:b0:214:d2b:6fe7 with SMTP id
 l5-20020a5d6745000000b002140d2b6fe7mr37879925wrw.82.1654847912318; 
 Fri, 10 Jun 2022 00:58:32 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d6e0c000000b0020ff877cfbdsm26309849wrz.87.2022.06.10.00.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:31 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 30/54] tests: acpi: white-list DSDT.tis.tpm2/DSDT.tis.tpm12
 expected blobs
Message-ID: <20220610075631.367501-31-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220608135340.3304695-31-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7b3bf9a207 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
-- 
MST


