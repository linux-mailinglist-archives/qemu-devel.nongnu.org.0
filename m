Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F0C681B91
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafd-0007vy-5S; Mon, 30 Jan 2023 15:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaep-0007IG-Qn
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeX-0007QH-7p
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyGAnTsuy19s0e2ypABO6ZtrOje+NugbOp6QdguQI/g=;
 b=CdvCMymFpBh8zY80TUWrPTaguHgnUarlaIl3074tmXHMBbKZUIqYnkf+RAjeKCMMk8xeyt
 BF5EZPk/8alAANIbpiNH6Tilwftg6pg+yPP0NHvHChZMFju/TLe5EhnBGOZoCGfdNovug4
 Al4TZC7GJt7kqLWX15viIbDWWlqYqO0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-TzFk3Tb4PiK1zVqGYhHvgw-1; Mon, 30 Jan 2023 15:21:17 -0500
X-MC-Unique: TzFk3Tb4PiK1zVqGYhHvgw-1
Received: by mail-ej1-f70.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso8125981ejb.14
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyGAnTsuy19s0e2ypABO6ZtrOje+NugbOp6QdguQI/g=;
 b=rcwxC2VM70Ricx/i0THuAV9jOTcqR4cUEBxDOUWtXTLTOTB5XX922s8rxS4lN+JA1K
 y0DJToDIn8piYcgVrdh9nlhtgQY3gfu9GavcS4Zb1Dsjac8Y/C4h1/UPg2WE2HKURgue
 Rm4Dgtv+sPv4esp3vRIMZ0SHm6d4bzASx+4LtfenqwahV87DQkLG4ojrS3qyvSNQfAIn
 zi8LUVqaIXnsafo0lmBqLOil0QR+ZK6PKioSHfwx8J3g46bLsKd+BUrsrVlJ6DkCqi6U
 YmxTRGoaxnBdiJIPTJJPFdMAQpvh3Vz/dsqkP33A28YHiVxSKnSAis36LLBZg8NgE0Kx
 8OXA==
X-Gm-Message-State: AO0yUKX7Udr6skwqo1I9goGIeRkUQCzYzlFpF1M3vlI0ZZr3t75qDNqx
 lzekV8GzCW5gvJioXizc3BmD9hokyTt+8gRW+ZdA+Kk6pogQykh9/JeJpinYNZadTPz+pPqMdPz
 D4rCndh12bRD2LszmG8ao5ZwZABBDHm5f+56qUrQsDFIbozbCzUjR8vfBLmnR
X-Received: by 2002:a17:906:e08e:b0:889:1480:d908 with SMTP id
 gh14-20020a170906e08e00b008891480d908mr747417ejb.17.1675110075023; 
 Mon, 30 Jan 2023 12:21:15 -0800 (PST)
X-Google-Smtp-Source: AK7set84mQOF0ahjzsClQW3zcgE3kbHv9mPvTBM3apR+sgrrgOO64tM0W3wWgAlD6tA+DJkfWJi8IQ==
X-Received: by 2002:a17:906:e08e:b0:889:1480:d908 with SMTP id
 gh14-20020a170906e08e00b008891480d908mr747395ejb.17.1675110074766; 
 Mon, 30 Jan 2023 12:21:14 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 w9-20020a170906184900b007c0f217aadbsm7214130eje.24.2023.01.30.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:14 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 45/56] tests: acpi: whitelist DSDT blobs before removing
 dynamic _DSM on coldplugged bridges
Message-ID: <20230130201810.11518-46-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-36-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a83322cb08 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


