Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1255681B52
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:23:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafC-0007aO-GD; Mon, 30 Jan 2023 15:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadx-000507-Uw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadw-0007MC-7p
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y1SyP4TgCvHvCzg+aSuuJOZahNP431nsZLRTo97jEFo=;
 b=blo2cXe+EaqMfp8ee91hr7dpwFKQeVMxvGuFcwdHY/sv+6UW9dCnmcahK8QfNK2TSXVtDA
 mML3LgY2tgNn9M2mkUmxoojZeaZvsunDdqYoDEuAd+pPyJbmAxJGFFqHm61r2IJzohYgyp
 FaeNtXwBoWBG2cY5aVcEijnJZR31nvI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-7l8UD97FNaiMzW7LH1w-vQ-1; Mon, 30 Jan 2023 15:20:41 -0500
X-MC-Unique: 7l8UD97FNaiMzW7LH1w-vQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ds1-20020a170907724100b008775bfcef62so8064188ejc.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1SyP4TgCvHvCzg+aSuuJOZahNP431nsZLRTo97jEFo=;
 b=uXAtHyG05AbqJGYSd6APNOAu+dLqkLVPXgCyTOP5diqWiVuSW04bii2enmj3IPwBQt
 1C9snosKuU2GLvnjynR81CZEkQ0FvQo1iWLm4XS+QI67iiqwDfscs9rtOLosFTDrclD2
 Z4e6QUyQYjXGjkG1CWfmGseblpbbTfDTAGdSirMq26aeu/3qiz85XqCjcJjcnOa4pwkM
 OahPNw3hDelweCwqgGktpGhRORe0LQcZYWoIN3HaLVDbWRHvNZys9QyQ7vpWui5T6qRP
 CxXyPCGDe7CBvfWlPujXq5sSefXbph//oHQ/6ENqCqo+i9kT4oN7AlX3OtVMS6yDWJwz
 bvYA==
X-Gm-Message-State: AO0yUKUuWfa0FOX2Aef/gGW9RLC4PhwBVNymm3bF7lEXhHfH/l2QY1co
 RMun5cdsKmWmcRGWdLznt30Mx+s5ZKgNQhbfBN7iLB6ie9fT49xAKrXEM79YJNKQl+7+EGymT2p
 OQxyqMOLUNwxNyQ5crqAcg0clSaw0NJgiCP893PbBBalPdIRXI1hA0bYg0KOf
X-Received: by 2002:aa7:c754:0:b0:4a0:e234:5351 with SMTP id
 c20-20020aa7c754000000b004a0e2345351mr19229395eds.15.1675110040102; 
 Mon, 30 Jan 2023 12:20:40 -0800 (PST)
X-Google-Smtp-Source: AK7set8Tk+bcGz6lAfzS9Sm5P8vkHriu7YHRu5nFfdhPtOruVQFLLagBiHI78ZjnuOf6INmRWhk7CA==
X-Received: by 2002:aa7:c754:0:b0:4a0:e234:5351 with SMTP id
 c20-20020aa7c754000000b004a0e2345351mr19229376eds.15.1675110039803; 
 Mon, 30 Jan 2023 12:20:39 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 l23-20020a50d6d7000000b004a0b1d7e39csm7373170edj.51.2023.01.30.12.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:39 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 34/56] whitelist DSDT before adding endpoint devices to bridge
 testcases
Message-ID: <20230130201810.11518-35-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-25-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..571f14fd59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


