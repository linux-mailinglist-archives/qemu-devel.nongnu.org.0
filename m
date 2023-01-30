Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C7681B71
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMae1-0004pc-GF; Mon, 30 Jan 2023 15:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMade-0004BW-Gv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadc-0007Dw-VG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tFTTc7WXuTD4mtGXod/PqPYVOn2MtwgkQJK+sIVXhuI=;
 b=FWzFHJ619bqPlfAfKncNk0CaOaNo6cXw1UezbZXoj4zDs0zKxYRFk0kbz4w3QQuEDUwLmi
 ebQMIo80kEAK4gqVdAbivR190QS0xj3Snw4mb6vUIJ6USoq0wHXp6WrhlYgfcK0K55YK0J
 ADMeRYmF1WoTrsNjqV7v3iPhtzcAiUg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-6uV5MVaCNRyQl__CMZyqzg-1; Mon, 30 Jan 2023 15:20:23 -0500
X-MC-Unique: 6uV5MVaCNRyQl__CMZyqzg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso8936327edc.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFTTc7WXuTD4mtGXod/PqPYVOn2MtwgkQJK+sIVXhuI=;
 b=sQ94aC8SZFz0DTGPkfziSFgqqGCXKM+L3r0xm6EOg2zmDmKtFBbq9ix7BaSOHJjpJx
 ePHPkwtAWp51VaZMU11h5vtxvWdc5tqaNNZ8diGqyujyjwT49gbvk0FZFVKUPY6SYsFN
 tsF4aF3H7TEzhvBV3E2SSCPzoEQ1CFQ152BI7uLn+ames3QsepKhORsrozPjeV3W48hb
 DxXdODanNL8X3Ir0qG/VlyCBXMN4Co2UUH2TM2Oia2a3hl6Pn3TtTaLPvxMFVtSDda6E
 nmNSRPWER68nQbZUykwuaLf7TdsnStEEQpYtxWv2qyc3znwcrlGfzkaGBXZyCfvI/3FZ
 h3dw==
X-Gm-Message-State: AFqh2kp6F/PpBhn2PC6joMLaqJe6ipfEelmZjAwD/ZpgGdOTiAD/e9Kr
 Deetz6GVZ83F8Rgj/77Si0LMrmsSZZjE1DcAiLSpfY6DERpgxcdlVAifR45bZpgJC6meDSjTSw2
 d3xcjALCBpd0o6aH3zLi+qgIGLr0Nt3UYQAA5d4UXSgzpRJOw2T+aAoo5s9iG
X-Received: by 2002:a05:6402:ea8:b0:494:fae3:c0df with SMTP id
 h40-20020a0564020ea800b00494fae3c0dfmr54524967eda.12.1675110021547; 
 Mon, 30 Jan 2023 12:20:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvB5fU6zYxP2DiZ9oXwqu9WxUwUTuEABNf6FC5HbatuVTHSJqasAZ26Z4LFMo62F+/0igJO4g==
X-Received: by 2002:a05:6402:ea8:b0:494:fae3:c0df with SMTP id
 h40-20020a0564020ea800b00494fae3c0dfmr54524952eda.12.1675110021328; 
 Mon, 30 Jan 2023 12:20:21 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ko25-20020a170907987900b0086edf177209sm7441864ejc.78.2023.01.30.12.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:20 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 29/56] tests: acpi: update expected blobs
Message-ID: <20230130201810.11518-30-mst@redhat.com>
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

expected change:
     Scope (PCI0)
           ...
           Method (PCNT, 0, NotSerialized)
            {
            }
           ...
     }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-20-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3064 -> 3071 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dea61d94f1..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.hpbrroot",
diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 578468f4f00a9373366c92926b512c192dd6675b..42d923ef3fcc17898955ff30a1dda1bfd7da0947 100644
GIT binary patch
delta 42
ycmew%{$HHSCD<k8KQ{vd<H?O&_c%G-6=ULqo#F-jH-F@0XJQv&3vl)eVE_OvXAEEf

delta 34
qcmew_{zIJ0CD<k82R8!)qwYqodz_pOiZSuQPVoXBn?G{0GXVg?l?qt^

-- 
MST


