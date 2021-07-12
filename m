Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF013C5F4B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:32:23 +0200 (CEST)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xuw-0002Iz-8u
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xsP-0008B9-Sx
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xsO-0001GQ-CU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ep5ZBj7fpAexXevKctBAGdbjDmVGcCNbPyEOzyknjoM=;
 b=O60RyVX3ulw2JG+UCpWSfOityQLBuCtZ7p5TrUSBjwCcWpHCuRGm437jY7RinJRYiCYxoU
 Fwr4vcfCzuGsKpW9OUMd2fLyHPrbhQhituZKeyCHmosD+25JGDCKVsj8bxaewlsTtg3x6w
 1HSH2FNYFno94mR3RKIAJDQHgCPp0mY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-vHlaIRhiOA-Ov0pFO52tCg-1; Mon, 12 Jul 2021 11:29:42 -0400
X-MC-Unique: vHlaIRhiOA-Ov0pFO52tCg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so7238889wrs.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ep5ZBj7fpAexXevKctBAGdbjDmVGcCNbPyEOzyknjoM=;
 b=tA2UeyNasesgulRtQQWASc372bNDrMtbclWtjptyQBgK3uPaV/bUDeeohUbr9oRby3
 3IDv/aRkAv/CTzvSSZVAdJ5UKimD7AuvGQyyh15nV7h2Z18DTiJM0b0fony4AY6MpYWr
 nSYQ8nRXTP4iDmDYFBHAvdb+yc/lQOr898p3rJ+3s7WGZ/H5WUvxJuMMMASEXAE1MXtU
 9LdIB+MRlKcs+n/SeyFeQJ9mrbemxFCmroxRTt9o5CGpXihmKlfzipym16G5Ka4boxpR
 nRU64+j8v4XMKtpMHFEVVlSUTNTltXhAE5vot2gNkLO7ACOrTA2rCmIlJ/H1dUOfM736
 NJ9A==
X-Gm-Message-State: AOAM5310trlF2MJmpy8YTyaFrtDxHXl85VieBJnAK+MqqUnCWmcH9mhq
 QRNDQJAoinJDU/evIaCyEd7Sm0b8lN+QOlQCvUo57AHbudvLZS7APltV0csfsx2f7uPwu2AspmY
 KiiC80Kcr6l2r5Jg=
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr38874403wrs.187.1626103781506; 
 Mon, 12 Jul 2021 08:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdmjGmLsgiu8UCRUeRMzCiptRfESN7ydHDQl9A5OaTl5S/zgKRTylKvTbtZKWoLvIVPxKViA==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr38874382wrs.187.1626103781322; 
 Mon, 12 Jul 2021 08:29:41 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l15sm4498051wrv.87.2021.07.12.08.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 08:29:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
Date: Mon, 12 Jul 2021 17:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 7/12/21 5:09 PM, Stefan Berger wrote:
> This series of patches adds test case for TPM 1.2 ACPI tables.
> 
>   Stefan
> 
> v3:
>   - Define enum TPMVersion for when CONFIG_TPM is not defined
>     affected patches 2 and 6

I think in 11fb99e6f48..e542b71805d we missed an extra patch
for qtests. Probably (untested):

-- >8 --
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ee7347b7275..eeaa0d7302b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -60,10 +60,14 @@
   (config_all_devices.has_key('CONFIG_USB_UHCI') and
                     \
    config_all_devices.has_key('CONFIG_USB_EHCI') ?
['usb-hcd-ehci-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ?
['usb-hcd-xhci-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] :
[]) +                  \
-  (config_all_devices.has_key('CONFIG_TPM_CRB') ?
['tpm-crb-swtpm-test'] : []) +            \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test']
: []) +              \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ?
['tpm-tis-swtpm-test'] : []) +        \
+  (config_host.has_key('CONFIG_TPM') and \
+   config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] :
[]) +                  \
+  (config_host.has_key('CONFIG_TPM') and \
+   config_all_devices.has_key('CONFIG_TPM_CRB') ?
['tpm-crb-swtpm-test'] : []) +            \
+  (config_host.has_key('CONFIG_TPM') and \
+   config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test']
: []) +              \
+  (config_host.has_key('CONFIG_TPM') and \
+   config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ?
['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test']
: []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ?
['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] :
[]) +                 \
---

Cc'ing Paolo/Thomas because there surely exists a clever way to do it...


