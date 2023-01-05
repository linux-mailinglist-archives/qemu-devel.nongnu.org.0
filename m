Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BB65E7B7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMp-0003rV-5S; Thu, 05 Jan 2023 04:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMl-0003la-Bs
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMj-0007eT-VF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V+M/t3F4PL2PXLYQa8aSHPchO06DtfXoQlvlpKy7gEc=;
 b=FnxymxmI7fHGdU/XOFnmjGb1LH1RhcpnbHcVOo1OX9BzxC++qJ2lEwLh9+1DjjLBEs3w/D
 EVCcPTCDWRHv1A/HYQPyH4yv/u8aawEDCWOnUkC59kK7JQmH3U7lwpBuAuu0gxoWYzkrKt
 YUSGDa8KzVom4st1oVoT+rQi0QvtzZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-3IxwFvLhPzubjWXuhqK3NQ-1; Thu, 05 Jan 2023 04:16:48 -0500
X-MC-Unique: 3IxwFvLhPzubjWXuhqK3NQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so728382wmq.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+M/t3F4PL2PXLYQa8aSHPchO06DtfXoQlvlpKy7gEc=;
 b=0kpNMK/zAyYlQhwSwDFqDPXB/6DTtbhn7zboyFm0pGyLHTH7MAZS6XGHl5GMu6nLqf
 dypAuD5pJAETMzB5uVFJwTaPjvsMw72Q2eD5YXZUElnD3b1k59OEOCz4b8LxPs6aZn+0
 LdFdjGah5tAWC8vO68+YAwWQ1Y4YVSfkLDvGKSs9YBgPjtyw1P5Qt225Venh1IxjMCdo
 A6ZvIcsSLN2kv8I+9nL9D25dUEtwedtZzY2+tBMSsi/3Sk5UAyJOXFt32MMksuyaILkQ
 IFZiyITraF0QgyL8rVAHz8Keu6bCkObZoJ9ceopubzhmDOx5Iwvm2Huv+GdxCBJEMebO
 QLUg==
X-Gm-Message-State: AFqh2kozFHOcIctyi6qCQEQiEXliwJ/B6jieLhAA8Mh59HRRKXe7gyiv
 /+Q8Xl37/uA1l82x1ibMaCwSIbB5eygWX+odFLp20Ts230BvFZVMXUZqpgCohwCLNV2t7naQVO5
 jJqkVejEovH0jQ6cszIrpfTTfLJIkR0Amdvgx73UoRacSWOtNsL9h47JYOFft
X-Received: by 2002:a05:600c:4e11:b0:3d3:4012:8da8 with SMTP id
 b17-20020a05600c4e1100b003d340128da8mr36434979wmq.40.1672910206682; 
 Thu, 05 Jan 2023 01:16:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuUbUnpKtCrSS3r3zkwd9UgbUQobPkLMH7AJk7kPMdKeXW9DEWVI7pwYKoCw3lpIaRpl3dIeA==
X-Received: by 2002:a05:600c:4e11:b0:3d3:4012:8da8 with SMTP id
 b17-20020a05600c4e1100b003d340128da8mr36434958wmq.40.1672910206401; 
 Thu, 05 Jan 2023 01:16:46 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003d973d4fb28sm1775065wms.4.2023.01.05.01.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:45 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 44/51] tests: virt: Allow changes to PPTT test table
Message-ID: <20230105091310.263867-45-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Yicong Yang <yangyicong@hisilicon.com>

Allow changes to test/data/acpi/virt/PPTT*, prepare to change the
building policy of the cluster topology.

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Message-Id: <20221229065513.55652-2-yangyicong@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..fc12cd8c5c 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
+"tests/data/acpi/virt/PPTT.acpihmatvirt",
-- 
MST


