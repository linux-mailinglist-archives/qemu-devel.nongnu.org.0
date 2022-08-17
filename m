Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BF597798
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:12:41 +0200 (CEST)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPP6-0006eo-7E
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJ7-0003Et-6r
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJ5-0000Iz-JY
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qDm9ba4xKEi3LKXl4UlNy7JuhkQRFooUwFqHTDiXY2A=;
 b=VVsQoyW20By6a6bZgUcGv4r8k9OBIK9nu+a2lBhQRIWR6oePndKpWa8358ChJfEdag9Ke/
 J3f8vlSjQlT5GJkLEQVIExKCZwh+zW6XHLbXhnrK7Wi4L21r67amT7g7rshEbUn/Kw6zCC
 ZK85S8Qc8VFU7NgQof1FRMEczn01NYM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-DfVxw6_eML-e6M8s642TJg-1; Wed, 17 Aug 2022 16:06:25 -0400
X-MC-Unique: DfVxw6_eML-e6M8s642TJg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d11-20020adfc08b000000b002207555c1f6so2647646wrf.7
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=qDm9ba4xKEi3LKXl4UlNy7JuhkQRFooUwFqHTDiXY2A=;
 b=v5fzbN1irhRVkPwZ980mHj6oID6O8pr7g/CFmeimtN/fX8E+RNL04MtE1ZZh1UB3lc
 iX4JoLpzMtZZEv6fzmOLeVVZ3Zbb1NP5TDI33Nge9uqrvz9MkbnFwRiah+9mmql2Kt9H
 f86X+48aFbhtLT6aKz8B772WPSmQYrbSdpB8TN8/jkBxoyNjS81jwbV5JkjotzD59kBK
 j+RUbDrC1LMVhGihoWkLU+j80zs65AqN+VlNYp5rDqbDJlXB7PZpGRvNUwWFAtC9Q8KK
 v6pXkil415zV3WZVohZwlCKcgHHz0qaMyHVSjPhOmd6S4uSZiSNIrENGbhn9qbtal10N
 MfIg==
X-Gm-Message-State: ACgBeo1ddeTLO49Ut7QTBzcf36ALnmLfpzF9QDF8l7fve6qhdU1nR3YJ
 MujuwnTVSr6CpoAT+NIPdZBmTKMrBzpCLz1po1r4Evn/rLLMtDnsPkIxJkvg56+zPZhE4VZZf7C
 njSfbZUKuMwyvgiX7D9o7/gY9x6WTyBuEPmSRqS1mGtJiOvZEymWHa8yjLg8X
X-Received: by 2002:a5d:47cd:0:b0:220:70a2:5383 with SMTP id
 o13-20020a5d47cd000000b0022070a25383mr15544137wrc.258.1660766784562; 
 Wed, 17 Aug 2022 13:06:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EHMkw7lAIJ96C+Gp7FspSVpQVrGyhoVDoZJUuzJtvnv5geYcQp/5BrwdWoX3mZ/ByxM9Tmw==
X-Received: by 2002:a5d:47cd:0:b0:220:70a2:5383 with SMTP id
 o13-20020a5d47cd000000b0022070a25383mr15544119wrc.258.1660766784264; 
 Wed, 17 Aug 2022 13:06:24 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c014a00b003a32297598csm2915396wmm.43.2022.08.17.13.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:23 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 09/12] hw/cxl: Fix Get LSA input payload size which should be
 8 bytes.
Message-ID: <20220817200536.350795-10-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


