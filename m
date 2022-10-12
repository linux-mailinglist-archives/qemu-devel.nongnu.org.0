Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888E5FC0DB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 08:44:09 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiVTM-0003KP-FF
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 02:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiVPf-0000HG-I1
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 02:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiVPa-0003tv-VG
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 02:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665556814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXH48xQ+gz3tZOKclLYoYk5Rq8QaujtWFwREynqmIrg=;
 b=DNEKtQJ1WLM+tSzE0Upprv6rJ7ClFOplWetXxpTzWNaDiLKbVhPrSgHmpejbYwzzxqDGIe
 H7fhWfVwJZ/Rdc9dRCc/XMdIDalceEWkLk6rRiRvnX9kJQNvHOtJl7KvL1Rc+Lw8oaxawZ
 Q0u/u2BbP9F7h24yWI5ieRVmfVUrt8M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-jb9j4FCkP42b1-qes2NhDA-1; Wed, 12 Oct 2022 02:40:12 -0400
X-MC-Unique: jb9j4FCkP42b1-qes2NhDA-1
Received: by mail-wr1-f69.google.com with SMTP id
 i26-20020adfaada000000b0022e2f38ffccso4625340wrc.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 23:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXH48xQ+gz3tZOKclLYoYk5Rq8QaujtWFwREynqmIrg=;
 b=WOIJgOUxdWZYObGipcSjSVxYME/N3pXG3hDFiWS3hj5Unmf6oEoNL0QI4avd3TwX3/
 ZKE/+aZ5WYBxte4JhcFzJeqjOXtno/0Jw7pHmr7ICRUdCJiiOfxjjJvCZvNWUYxhP3DO
 QfDihmP+lUkqWJQ7cV1mmix8QYXEoz+rUogQr8H/GwzHxb8eeiXC/6LGdQEtOxJUsMHm
 56ibpbr6B7YQpuDsZXhSQlTomS87qJaGN+9EfsQGWKBxHqukj7MxauB1NDPgwDb2zFxs
 +XZAzMsMDS+/aIaDqW7uUsFFKAot44FXX0PWRM85OPQ+06ki0SYubasnT5TuI4CJQo87
 K0kA==
X-Gm-Message-State: ACrzQf3Pnj+UCMRqqoqzifBYthRgjxY6ao+N2dLfkLz+YJW2G+lUNqsM
 oqGVUD1kemQeprQ2svIDIGr0KsnC/93L6w2auVB38AV+w3yq8KclWl6DJWgF9qlD5eFGZ5sexky
 ns2pemM/atoXimfc=
X-Received: by 2002:a05:600c:4f93:b0:3b4:c026:85a1 with SMTP id
 n19-20020a05600c4f9300b003b4c02685a1mr1645008wmq.39.1665556811683; 
 Tue, 11 Oct 2022 23:40:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4vxw5NVYCBtVA/y9lt2vgWIVCHCPhkyxcoCBj1K0IXP6jFKEc59meCc1h5onMVUxaNetRs8Q==
X-Received: by 2002:a05:600c:4f93:b0:3b4:c026:85a1 with SMTP id
 n19-20020a05600c4f9300b003b4c02685a1mr1644988wmq.39.1665556811239; 
 Tue, 11 Oct 2022 23:40:11 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 f6-20020a7bcd06000000b003b4a699ce8esm935740wmj.6.2022.10.11.23.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 23:40:10 -0700 (PDT)
Message-ID: <27bd3a3a-ca64-539e-0f3d-60fb4049eaf7@redhat.com>
Date: Wed, 12 Oct 2022 08:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] tests/qtest/ide-test: Verify READ NATIVE MAX ADDRESS
 is not limited
Content-Language: en-US
To: Lev Kujawski <lkujaw@mailbox.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221010085229.2431276-1-lkujaw@mailbox.org>
 <20221010085229.2431276-2-lkujaw@mailbox.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221010085229.2431276-2-lkujaw@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/2022 10.52, Lev Kujawski wrote:
> Verify that the ATA command READ NATIVE MAX ADDRESS returns the last
> valid CHS tuple for the native device rather than any limit
> established by INITIALIZE DEVICE PARAMETERS.
> 
> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
> ---
>   tests/qtest/ide-test.c | 47 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index dbe1563b23..c406e6752a 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -37,7 +37,8 @@
>   /* TODO actually test the results and get rid of this */
>   #define qmp_discard_response(q, ...) qobject_unref(qtest_qmp(q, __VA_ARGS__))
>   
> -#define TEST_IMAGE_SIZE 64 * 1024 * 1024
> +/* Specified by ATA (physical) CHS geometry for ~64 MiB device.  */
> +#define TEST_IMAGE_SIZE ((130 * 16 * 63) * 512)
>   
>   #define IDE_PCI_DEV     1
>   #define IDE_PCI_FUNC    1
> @@ -91,11 +92,13 @@ enum {
>   enum {
>       CMD_DSM         = 0x06,
>       CMD_DIAGNOSE    = 0x90,
> +    CMD_INIT_DP     = 0x91,  /* INITIALIZE DEVICE PARAMETERS */
>       CMD_READ_DMA    = 0xc8,
>       CMD_WRITE_DMA   = 0xca,
>       CMD_FLUSH_CACHE = 0xe7,
>       CMD_IDENTIFY    = 0xec,
>       CMD_PACKET      = 0xa0,
> +    CMD_READ_NATIVE = 0xf8,  /* READ NATIVE MAX ADDRESS */
>   
>       CMDF_ABORT      = 0x100,
>       CMDF_NO_BM      = 0x200,
> @@ -562,6 +565,46 @@ static void string_cpu_to_be16(uint16_t *s, size_t bytes)
>       }
>   }
>   
> +static void test_specify(void)
> +{
> +    QTestState *qts;
> +    QPCIDevice *dev;
> +    QPCIBar bmdma_bar, ide_bar;
> +    uint16_t cyls;
> +    uint8_t heads, spt;
> +
> +    qts = ide_test_start(
> +        "-blockdev driver=file,node-name=hda,filename=%s "
> +        "-device ide-hd,drive=hda,bus=ide.0,unit=0 ",
> +        tmp_path[0]);
> +
> +    dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
> +
> +    /* Initialize drive with zero sectors per track and one head.  */
> +    qpci_io_writeb(dev, ide_bar, reg_nsectors, 0);
> +    qpci_io_writeb(dev, ide_bar, reg_device, 0);
> +    qpci_io_writeb(dev, ide_bar, reg_command, CMD_INIT_DP);
> +
> +    /* READ NATIVE MAX ADDRESS (CHS mode).  */
> +    qpci_io_writeb(dev, ide_bar, reg_device, 0xa0);
> +    qpci_io_writeb(dev, ide_bar, reg_command, CMD_READ_NATIVE);
> +
> +    heads = qpci_io_readb(dev, ide_bar, reg_device) & 0xf;
> +    ++heads;
> +    g_assert_cmpint(heads, ==, 16);
> +
> +    cyls = qpci_io_readb(dev, ide_bar, reg_lba_high) << 8;
> +    cyls |= qpci_io_readb(dev, ide_bar, reg_lba_middle);
> +    ++cyls;
> +    g_assert_cmpint(cyls, ==, 130);
> +
> +    spt = qpci_io_readb(dev, ide_bar, reg_lba_low);
> +    g_assert_cmpint(spt, ==, 63);
> +
> +    ide_test_quit(qts);
> +    free_pci_device(dev);
> +}
> +
>   static void test_identify(void)
>   {
>       QTestState *qts;
> @@ -1079,6 +1122,8 @@ int main(int argc, char **argv)
>       /* Run the tests */
>       g_test_init(&argc, &argv, NULL);
>   
> +    qtest_add_func("/ide/read_native", test_specify);
> +
>       qtest_add_func("/ide/identify", test_identify);
>   
>       qtest_add_func("/ide/diagnostic", test_diagnostic);

Acked-by: Thomas Huth <thuth@redhat.com>


