Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384434053E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:13:48 +0100 (CET)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrX9-00079n-L0
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMrUJ-000667-SV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMrUH-0008RK-QP
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616069448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbuiSL5fIzHtPsolCppMYzTbSi4tPwTmvmkmUgsPnj0=;
 b=Nr03RdS61ZBJcZgchyJNKS7Hv9uwALbmMgbOIXLg7VSqSbMe4tUOBF3YEHhvmMUFn55hak
 2H/Te8hqqQSzuYvHlpxmvDawiyL+jSW742M9B5TXpa7wU3MOGnVkw/T5dRk/jc31WJffhf
 TAbU9j6MkNtIEPe3b+E9noKSTIoqBcA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-fQhM8XknOKOQ9oG9Wb1qXQ-1; Thu, 18 Mar 2021 08:10:44 -0400
X-MC-Unique: fQhM8XknOKOQ9oG9Wb1qXQ-1
Received: by mail-wr1-f71.google.com with SMTP id p12so17421978wrn.18
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 05:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbuiSL5fIzHtPsolCppMYzTbSi4tPwTmvmkmUgsPnj0=;
 b=DZFF1tIFiG1FP7sG1D65+nayWoI3Pe/CEs2K+UrNubiavzMrtAuuRMJFU4wAcvU+df
 OozgDE0OP6+IXPgy6clygNSYtnlTbIjjRS41GpKJzbo7FnJr8OCEidSP0tEDWs6fFc4+
 Ny7kZn0wuKOJ3PJYSdXzXHp2y/hHG6ZjPJcAJUkIKjuZWuaYQQK5Em+iTY0Wrzgmkamu
 DazhDaTOE0y47CSg1R9j96S5mEnE/Rb7TBSIzrnDqybx8LkKt+2DGYWU6XrHmwUsjBbJ
 kdqPzsdzU62omeZA1CTMXw9dEnYRCzer/NOZ0g87pFOWgyrYylmksapJoGAaKR8c6I3Q
 Jvxw==
X-Gm-Message-State: AOAM532bab+EPQCAk7Qqg26VkJcgo+j6551JrSA5KI02HeK4GJCDzXzE
 oFqkUwOrA/h9c4+xg1soq8EFltkDMstxQGiUZ1+XIsRJFeNOvNf7QZKnYWQE1Iey7iBi9fP1Zc0
 m0oVAy4S2bl595lM=
X-Received: by 2002:a1c:7fc9:: with SMTP id a192mr3223208wmd.15.1616069443191; 
 Thu, 18 Mar 2021 05:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKOHzqJ1lLq771RI8vZV57txN//4twrTN1K/NPUmkuFH/a1KJTAc4VLBdX5gfD/1CfWhPjQA==
X-Received: by 2002:a1c:7fc9:: with SMTP id a192mr3223194wmd.15.1616069443000; 
 Thu, 18 Mar 2021 05:10:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h25sm2556384wml.32.2021.03.18.05.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 05:10:42 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] tests/qtest: add tests for am53c974 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
 <20210317230223.24854-7-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c598a154-8c9c-0947-5688-f10158d0700f@redhat.com>
Date: Thu, 18 Mar 2021 13:10:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317230223.24854-7-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 00:02, Mark Cave-Ayland wrote:
> Use the autogenerated fuzzer test cases as the basis for a set of am53c974
> regression tests.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Most of these should be easy to change to libqos, but it's good enough 
to have them like this so that there'll be an example in the future of 
the conversion (I'll take a look myself).

Paolo

> ---
>   tests/qtest/am53c974-test.c | 122 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build     |   1 +
>   2 files changed, 123 insertions(+)
>   create mode 100644 tests/qtest/am53c974-test.c
> 
> diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
> new file mode 100644
> index 0000000000..c90bd4c187
> --- /dev/null
> +++ b/tests/qtest/am53c974-test.c
> @@ -0,0 +1,122 @@
> +/*
> + * QTest testcase for am53c974
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later. See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqos/libqtest.h"
> +
> +
> +static void test_cmdfifo_underflow_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x01);
> +    qtest_outl(s, 0xcf8, 0x8000100e);
> +    qtest_outl(s, 0xcfc, 0x8a000000);
> +    qtest_outl(s, 0x8a09, 0x42000000);
> +    qtest_outl(s, 0x8a0d, 0x00);
> +    qtest_outl(s, 0x8a0b, 0x1000);
> +    qtest_quit(s);
> +}
> +
> +static void test_cmdfifo_overflow_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x01);
> +    qtest_outl(s, 0xcf8, 0x8000100e);
> +    qtest_outl(s, 0xcfc, 0x0e000000);
> +    qtest_outl(s, 0xe40, 0x03);
> +    qtest_outl(s, 0xe0b, 0x4100);
> +    qtest_outl(s, 0xe0b, 0x9000);
> +    qtest_quit(s);
> +}
> +
> +static void test_target_selected_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +    qtest_outl(s, 0xcf8, 0x80001001);
> +    qtest_outl(s, 0xcfc, 0x01000000);
> +    qtest_outl(s, 0xcf8, 0x8000100e);
> +    qtest_outl(s, 0xcfc, 0xef800000);
> +    qtest_outl(s, 0xef8b, 0x4100);
> +    qtest_outw(s, 0xef80, 0x01);
> +    qtest_outl(s, 0xefc0, 0x03);
> +    qtest_outl(s, 0xef8b, 0xc100);
> +    qtest_outl(s, 0xef8b, 0x9000);
> +    qtest_quit(s);
> +}
> +
> +static void test_fifo_underflow_on_write_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xc000);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x01);
> +    qtest_outl(s, 0xc008, 0x0a);
> +    qtest_outl(s, 0xc009, 0x41000000);
> +    qtest_outl(s, 0xc009, 0x41000000);
> +    qtest_outl(s, 0xc00b, 0x1000);
> +    qtest_quit(s);
> +}
> +
> +static void test_cancelled_request_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xc000);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x05);
> +    qtest_outb(s, 0xc046, 0x02);
> +    qtest_outl(s, 0xc00b, 0xc100);
> +    qtest_outl(s, 0xc040, 0x03);
> +    qtest_outl(s, 0xc040, 0x03);
> +    qtest_bufwrite(s, 0x0, "\x41", 0x1);
> +    qtest_outl(s, 0xc00b, 0xc100);
> +    qtest_outw(s, 0xc040, 0x02);
> +    qtest_outw(s, 0xc040, 0x81);
> +    qtest_outl(s, 0xc00b, 0x9000);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (strcmp(arch, "i386") == 0) {
> +        qtest_add_func("am53c974/test_cmdfifo_underflow_ok",
> +                       test_cmdfifo_underflow_ok);
> +        qtest_add_func("am53c974/test_cmdfifo_overflow_ok",
> +                       test_cmdfifo_overflow_ok);
> +        qtest_add_func("am53c974/test_target_selected_ok",
> +                       test_target_selected_ok);
> +        qtest_add_func("am53c974/test_fifo_underflow_on_write_ok",
> +                       test_fifo_underflow_on_write_ok);
> +        qtest_add_func("am53c974/test_cancelled_request_ok",
> +                       test_cancelled_request_ok);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 66ee9fbf45..a44f612a34 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -63,6 +63,7 @@ qtests_i386 = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
> +  (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>     qtests_pci +                                                                              \
>     ['fdc-test',
>      'ide-test',
> 


