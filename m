Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7E9597422
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:29:32 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLv9-0001j8-0L
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLnU-0007dg-O4
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLnS-0005Xk-5N
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660753293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qDm9ba4xKEi3LKXl4UlNy7JuhkQRFooUwFqHTDiXY2A=;
 b=P85t7GzI1mZbcabWLBzH66kglfjS5OBJ0J5OCiMfI51FhNFUW5Ed2rEJO9FRSuZQ5d2yq8
 zYjrm9ljEJl074HpRBIAOhYknH5aumyBaSO2Pz4TozT8DzXcv9d8J5ZskvxzmgH4HqHaGF
 Lz8xNC9zahecbUTzDoX0zNfMhi3OMaI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-2MYvHjyxP1yB4DRqdlPhGg-1; Wed, 17 Aug 2022 12:14:58 -0400
X-MC-Unique: 2MYvHjyxP1yB4DRqdlPhGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v67-20020a1cac46000000b003a615c4893dso944123wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=qDm9ba4xKEi3LKXl4UlNy7JuhkQRFooUwFqHTDiXY2A=;
 b=DVHmts1VyFY7zgvkm+tyE3xCHtk3xpKfJ+PbsZgDGsEQN57vUvXqHAmtPaDPif0E9Z
 5Vah2GBA8e8+DkfuWtlxNsQbVSq9zKXAlwJiutsHaUWDhlky5YH1nffl2xEuCJyxt+KW
 ct24mLWoJq/e7dVcFtnY6/bRRkAVp5ZrrmXj5DDI7KerCbv+x90cjZnJwW9+dhn3fkMe
 2Cq189ZvMx9Tm9cnMzUjX/W6VQTd9XW81IawOSto0k8Y2FO0Pdqvq0sYc3veY3AsbNap
 M+dQ8YMsAah/PSKrUd4AhX4J8vKPOlzzeraplnhb6mJgVjx3h7YMI2ch4SIUBNQCFQmv
 fy6Q==
X-Gm-Message-State: ACgBeo0cIfha83Nforwe1IJV2Z10V/vVz8+pdoeoEaJNEUP9bCK8Jlof
 WRZ2qq5QS5DftOr5n63UXD9JMX1k5Fh9x771PktRTmSXEPft9dGs8A+cE7ZKeeE5CNFocVI+ual
 4C8eyyicfR9qxjhhaWQmY8+jvWTWrLwszFOPH7lWKIek3RXEJ0FwRyMFgyxYk
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id
 a10-20020a056000050a00b00225210ca7e4mr3068145wrf.704.1660752896635; 
 Wed, 17 Aug 2022 09:14:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7N9BQhGx/L6Bl0z45YU07nurapipLrTJvNFQvghogz4N43zfTmgcYsMJ3mSLsA/m+vfa1NKg==
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id
 a10-20020a056000050a00b00225210ca7e4mr3068131wrf.704.1660752896367; 
 Wed, 17 Aug 2022 09:14:56 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 bt22-20020a056000081600b002251e86241csm4080678wrb.48.2022.08.17.09.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:55 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 07/10] hw/cxl: Fix Get LSA input payload size which should be
 8 bytes.
Message-ID: <20220817161342.240674-8-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Get LSA needs 4 byte offset and 4 byte length arguments.
CXL rev 2.0 Table 178.

Fixes: 3ebe676a34 ("hw/cxl/device: Implement get/set Label Storage Area (LSA)")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220817145759.32603-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index bb66c765a5..3cea8b17a8 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -406,7 +406,7 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_identify_memory_device, 0, 0 },
     [CCLS][GET_PARTITION_INFO] = { "CCLS_GET_PARTITION_INFO",
         cmd_ccls_get_partition_info, 0, 0 },
-    [CCLS][GET_LSA] = { "CCLS_GET_LSA", cmd_ccls_get_lsa, 0, 0 },
+    [CCLS][GET_LSA] = { "CCLS_GET_LSA", cmd_ccls_get_lsa, 8, 0 },
     [CCLS][SET_LSA] = { "CCLS_SET_LSA", cmd_ccls_set_lsa,
         ~0, IMMEDIATE_CONFIG_CHANGE | IMMEDIATE_DATA_CHANGE },
 };
-- 
MST


