Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7238A54E86D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:11:38 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1t1t-0003oK-7H
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soh-000574-P0
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1sog-0001zn-6T
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cw2HekeVyRAhFlZkfX/10FziOX2dpCtVaFq88ib5yvk=;
 b=HsX6iJaOhKhGxqnfqG2/q8Oj4TnHuG6xVmJcfDE4hDpjTy/MnyKK9j2L1SxtB/wyloirp/
 cpi9UJjihSHXAKteb2TdwbV3yjiBPtRaxJpD4on5OVNkI1crAgB2KwFwgEw6sMKE2mmB7Y
 W/G9yjXsw3OGx0/fls1LMplcEF+ah5k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-G3AcohAGO0WNPA25k5_RMw-1; Thu, 16 Jun 2022 12:57:56 -0400
X-MC-Unique: G3AcohAGO0WNPA25k5_RMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso863648wmi.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cw2HekeVyRAhFlZkfX/10FziOX2dpCtVaFq88ib5yvk=;
 b=hABQ3VGsdq6UPIevFy2JfMlHpgzybBFo6JrJ5VKQwJoq8sFQouSCL80c+EA29tD/Wc
 8z5dIIi2nltcfMgDPFxOrDkfeMpaS8Um4N9JsV07F0nM7qWIvfyxPSXLtgxzSN1ZnsrM
 2qqMoB1Msx93Ov4kGRImoCEG4J3zR6yz+LmgAhxsA4gciGQEcbH+0KfjBrnMdyI34imB
 7hzh9Cuqbjl/+tFJ9Az5Qk61mc2V+DDNr83tg6E+OrOFjcB1STMXAQqoSD0kSXIxlwPd
 w8diQ/aIGKL7MjQC7ykT6Liw1NPFMRR+xfCO+iaADZGpTuD0XhFzJEGQse6HOSQuMG3/
 ASLQ==
X-Gm-Message-State: AJIora9254L5Ukr6tLvkS1DYdrXco0KAD7IJWWOaQepbFBLJ/fiu1doB
 zY8aKm8/cUuJN3skDFY0kiJETpo3qqHzXLVYJnPp2Tx1axU2DZ2liQZrIU+kjprJKDQLNxF7XBp
 fWmbzOZji3kjBbYsyQMM9WCwZQxrBMgWldz7gmBPh+P2pL9X4aFJ9MVHn+Cyd
X-Received: by 2002:a05:6000:a07:b0:21a:3d99:4fb4 with SMTP id
 co7-20020a0560000a0700b0021a3d994fb4mr267064wrb.450.1655398675100; 
 Thu, 16 Jun 2022 09:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v13ZfJujXwz25OovRkkXdaGyJUWE8qWltw7SVhtSqu0xZmufs1AMShL4nG2rgAQxdMj1WjOw==
X-Received: by 2002:a05:6000:a07:b0:21a:3d99:4fb4 with SMTP id
 co7-20020a0560000a0700b0021a3d994fb4mr267044wrb.450.1655398674869; 
 Thu, 16 Jun 2022 09:57:54 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002103bd9c5acsm2281295wrn.105.2022.06.16.09.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:54 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Eric DeVolder <eric.devolder@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 10/10] acpi/erst: fix fallthrough code upon validation failure
Message-ID: <20220616165703.42226-11-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ani Sinha <ani@anisinha.ca>

At any step when any validation fail in check_erst_backend_storage(), there is
no need to continue further through other validation checks. Further, by
continuing even when record_size is 0, we run the risk of triggering a divide
by zero error if we continued with other validation checks. Hence, we should
simply return from this function upon validation failure.

CC: Peter Maydell <peter.maydell@linaro.org>
CC: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220513141005.1929422-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index de509c2b48..df856b2669 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -440,6 +440,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
         (record_size >= 4096) /* PAGE_SIZE */
         )) {
         error_setg(errp, "ERST record_size %u is invalid", record_size);
+        return;
     }
 
     /* Validity check header */
@@ -450,6 +451,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
         (le16_to_cpu(header->reserved) == 0)
         )) {
         error_setg(errp, "ERST backend storage header is invalid");
+        return;
     }
 
     /* Check storage_size against record_size */
@@ -457,6 +459,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
          (record_size > s->storage_size)) {
         error_setg(errp, "ACPI ERST requires storage size be multiple of "
             "record size (%uKiB)", record_size);
+        return;
     }
 
     /* Compute offset of first and last record storage slot */
-- 
MST


