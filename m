Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E368D681B44
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacD-0002EE-NY; Mon, 30 Jan 2023 15:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacB-0002DJ-VO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacA-0006oN-ID
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpkP3BwdICaXbL7Cls9z3SxAYHNj+Y8K4nCKPcKNOvs=;
 b=P/US0KmcT4Ypj74Kh1ODQtKZS26Ar467sMR87VL60znAQXSt/ppicfO74a+9WdFEEBX10j
 GDaZ2JoG01TjUE5pYtukAEmxGV4VVL/uiehhjHj5cMA+6VuYGzsI5IE0IJom2spoTuA4o8
 imV7bePWluwq//NcAfGbvCFXcT25ztM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-X1GyaDimMLCYmfSqyOjOdg-1; Mon, 30 Jan 2023 15:18:52 -0500
X-MC-Unique: X1GyaDimMLCYmfSqyOjOdg-1
Received: by mail-ed1-f70.google.com with SMTP id
 q20-20020a056402519400b0049e5b8c71b3so8944148edd.17
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FpkP3BwdICaXbL7Cls9z3SxAYHNj+Y8K4nCKPcKNOvs=;
 b=YzCiqYClJMpweTggfVaVHuUnDsTk8VmW8Jug2gk0ACIvYEumDzCjTXdcMFmfj4V/RA
 ehgmGmZORDESspI3gho22aqOei3syUfzHartikrqvTGWh1UuHMvQOzLs1toqN+xDj6/g
 mXwJBukRYw+y/jp9KvPWyKtAYuBhWhVaCB2WYRR1J1IHhj/6PqJuZLfe8+LRe6YuqBfR
 HE4ltSVwEoMLIBLv+KCdoHNiqAp7R76lUMD8J1R5zsC4HZjEGxe/Ak6Lad7jxYjqQQrg
 bx4modjLnB9mJY7C2s3lUdydin1R6XgZnosfpv+KrI48V9Y7TAc3qr2cimQaoUjId6o5
 K1iA==
X-Gm-Message-State: AO0yUKXbaM+KYYUteAzkJCwFMZnK9yQK4KHlFyh/bBVko2n26ILskhMP
 9RT3kb6dkPsFeIjTzBv+aHaolB71S2IKUrmgx3mDLT3+srwI1IcIxg5Sbkc7hABY6X3Utvtq+N6
 WGttHDabwwBrocjKdd+OhHZ+SDZrV3z4el81r6RXVzvIAa8CHQnJDRkxWwzrQ
X-Received: by 2002:a17:907:2989:b0:883:5b33:e019 with SMTP id
 eu9-20020a170907298900b008835b33e019mr9195976ejc.61.1675109930339; 
 Mon, 30 Jan 2023 12:18:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+ficdhsfJLgsn4ETRcorWzo96hGHD1//1QBMuCz15fzRJU+tzaBu1tpUK6kS/V2evyMH2/4A==
X-Received: by 2002:a17:907:2989:b0:883:5b33:e019 with SMTP id
 eu9-20020a170907298900b008835b33e019mr9195953ejc.61.1675109930065; 
 Mon, 30 Jan 2023 12:18:50 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 op27-20020a170906bcfb00b0084cb4d37b8csm7422715ejb.141.2023.01.30.12.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:18:49 -0800 (PST)
Date: Mon, 30 Jan 2023 15:18:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 02/56] hw/i386/acpi-build: Remove unused attributes
Message-ID: <20230130201810.11518-3-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Bernhard Beschow <shentey@gmail.com>

Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230121151941.24120-2-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 127c4e2d50..8c333973f9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -117,8 +117,6 @@ typedef struct AcpiMiscInfo {
 #ifdef CONFIG_TPM
     TPMVersion tpm_version;
 #endif
-    const unsigned char *dsdt_code;
-    unsigned dsdt_size;
 } AcpiMiscInfo;
 
 typedef struct FwCfgTPMConfig {
-- 
MST


