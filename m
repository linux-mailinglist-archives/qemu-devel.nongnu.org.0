Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E15E69DBF0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUO33-00005X-Kl; Tue, 21 Feb 2023 03:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUO2x-0008Se-SC
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUO2p-0008S5-Tg
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676968238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjSiJdFAHlWwcP/WmtB+x1VQu3HJ1Nrqt325A8RCUM0=;
 b=WgDQpNIb5WHYMajzbPmsdocf9zDWr2fAU9gIFvKQuiWVbNB1j37ndZzr6PZahA96P5rvJ9
 IhXhGPF6kOwMCI1nIt1RN7mmKL/BM7acEaCPPu3t/zttqdw5qMQltP1NeEhL2ETiO6OV+R
 LfUGAn16i84kJNKy6jFxAUZNAfYdiZ0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-EGzxHqN6PdCjEc66sfrc0w-1; Tue, 21 Feb 2023 03:30:37 -0500
X-MC-Unique: EGzxHqN6PdCjEc66sfrc0w-1
Received: by mail-ed1-f70.google.com with SMTP id
 er17-20020a056402449100b004ad793116d5so3258891edb.23
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TjSiJdFAHlWwcP/WmtB+x1VQu3HJ1Nrqt325A8RCUM0=;
 b=vTKq69gmn3jLl2dfZLsY+258ex8drcdRN4JC/9lQS5gQ9Hqu7HmnMl+Zf8N6PKFLu1
 7op6hRh5c4CAATlfLNq+YhbrGfv6eoPliqnnZiehotmDfT744WbdtysL6khBO/gNwulf
 6br5QWc1T1gHjbV+41RrdAqTFH6WZj+ugFSbFszsx3U9G9zjXdk6RADMG9jhIk1hnJAs
 UqyIC7H9fNfXX4yA6BZjwfQtkZ2OpiXrSCqcCyQ/jM1ZbMm3JJW8s1DUcJB8U0KWp8kt
 8RZ7ZhBzbZrbAAiJVj/Hqx4Xc20nrYDqu1BU+mrgnZrzqB8ZxVT63gIakmtT4HFbsFyK
 jQnQ==
X-Gm-Message-State: AO0yUKX8wBRReR2Mffm9ZU0Rhv6AvBj0QCWD2+x+lij0Xwkq7II0wJOg
 qx86uGe4dwFUWlE/3ZAeootbYF+Z6iXg/eZK8cdtCeNAQ3bXamnKtI5UmbLUwyAD5JlKI3ba8G7
 PI+CKqnCBfGM5n8k=
X-Received: by 2002:a05:6402:35c1:b0:49e:1f0e:e209 with SMTP id
 z1-20020a05640235c100b0049e1f0ee209mr3416269edc.10.1676968236116; 
 Tue, 21 Feb 2023 00:30:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8qRuM6EzDL2gnYDOXVMOJnlkwVV4hJtf4H1/GkcKsy0Tiiv60r8lO8g1xuA8dSKG7FbSDAyg==
X-Received: by 2002:a05:6402:35c1:b0:49e:1f0e:e209 with SMTP id
 z1-20020a05640235c100b0049e1f0ee209mr3416255edc.10.1676968235844; 
 Tue, 21 Feb 2023 00:30:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 o1-20020a50c281000000b004aef4f3bc26sm2917991edf.87.2023.02.21.00.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:30:35 -0800 (PST)
Message-ID: <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
Date: Tue, 21 Feb 2023 09:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/21/23 00:25, BALATON Zoltan wrote:
>> I think fundamentally you need to check for the condition
>> Size < mr->ops->impl.min_access_size in memory_region_dispatch_write
>> and then make a read, combine the result with
>> the value and make a write.
> 
> I neither know that part nor feel confident enough breaking such low 
> level stuff so I think setting the affected regions NATIVE_ENDIAN for 
> now until somebody takes care of this is safer and not likely to break 
> anyting (or if it does, much less widely and I'm more likely to be able 
> to fix that than your proposed changes). So I'd rather let you do that 
> but I'd like this fixed one way or another at last.

Sorry about not replying.

The case of impl.min_access_size < valid.min_access_size is not
supported in the memory core.  Until that is done, the correct fix is to
fix acpi_pm_evt_ops to have impl.min_access_size == 1, something like
this:

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 6da275c599c6..96eb88fa7e27 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -429,20 +429,35 @@ void acpi_pm1_evt_reset(ACPIREGS *ar)
  static uint64_t acpi_pm_evt_read(void *opaque, hwaddr addr, unsigned width)
  {
      ACPIREGS *ar = opaque;
+    uint16_t val;
      switch (addr) {
      case 0:
-        return acpi_pm1_evt_get_sts(ar);
+        val = acpi_pm1_evt_get_sts(ar);
      case 2:
-        return ar->pm1.evt.en;
+        val = ar->pm1.evt.en;
      default:
          return 0;
      }
+
+    if (width == 1) {
+        int bitofs = (addr & 1) * 8;
+        val >>= bitofs;
+    }
+    return val;
  }
  
  static void acpi_pm_evt_write(void *opaque, hwaddr addr, uint64_t val,
                                unsigned width)
  {
      ACPIREGS *ar = opaque;
+    if (width == 1) {
+        int bitofs = (addr & 1) * 8;
+        uint16_t old_val = acpi_pm_evt_read(ar, addr, val & ~1);
+        uint16_t mask = 0xFF << bitofs;
+        val = (old_val & ~mask) | (val << bitofs);
+        addr &= ~1;
+    }
+
      switch (addr) {
      case 0:
          acpi_pm1_evt_write_sts(ar, val);
@@ -458,7 +473,7 @@ static void acpi_pm_evt_write(void *opaque, hwaddr addr, uint64_t val,
  static const MemoryRegionOps acpi_pm_evt_ops = {
      .read = acpi_pm_evt_read,
      .write = acpi_pm_evt_write,
-    .impl.min_access_size = 2,
+    .impl.min_access_size = 1,
      .valid.min_access_size = 1,
      .valid.max_access_size = 2,
      .endianness = DEVICE_LITTLE_ENDIAN,


This assumes that the bus is little-endian, i.e. reading the byte at PM_EVT returns
bits 0..7 and reading the byte at PM_EVT+1 returns bits 8..15.

If this is incorrect, endianness needs to be changed as well.

Paolo


