Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9996663005
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:12:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExYS-0005kY-7x; Mon, 09 Jan 2023 14:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExYA-0005fB-G0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExY8-0004yq-Rd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cWDs15ipPvaB2cpG3+j+iKQSLbI3/K1GKs9AP/gQGIE=;
 b=Yn00Gdd3ud9NtJRk2e2O8YZTtJsq1vt+m1SSkHXeg40XQfM9/mwndtupMrKjuSW07CtLVu
 bpTr8sErgpbPQGFcGnLaQEogu2qR0+2bo/ewSgGNy4We5wToKsreIQHXk/yhV1+9iHRCTV
 B0+2pr2j+TiGLspJ4k8rga7RFntGMRo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-P6y_CZd1OBilx9JPCYHY-g-1; Mon, 09 Jan 2023 14:11:10 -0500
X-MC-Unique: P6y_CZd1OBilx9JPCYHY-g-1
Received: by mail-lf1-f71.google.com with SMTP id
 i13-20020a056512340d00b004b8825890a1so3419729lfr.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cWDs15ipPvaB2cpG3+j+iKQSLbI3/K1GKs9AP/gQGIE=;
 b=noheoNcFlgrcf+DKLlcQkGCxoZD5ySFTL1nAGglYMIEXAhjkdwvHTT4jotmEmWDnpw
 hFff65NQXm8YQ0w4adISX2qCwH3siVaS8z/LCpJb/OXwyXVrKafcatfPe3YIFgCN13mS
 1kj7KQBYPgMI+Jzu7D1/R7W6KIqGYFN0jG6fLUqfiDiI4UnaFC4kZMQBHeLYul5RqS5G
 MdJ/GpQSPEiUujhLxLD4u91+oOAVxSmnRb0z7zxMUthrdvY1EVWmryEXJiIlDdHaUy3P
 Hm/lRG+lOk95VCmcPIkj4IqtUBmNdr1Ynv0D17hwdoEhccrgyqpGlQHY255+2lLgBIrA
 ez+g==
X-Gm-Message-State: AFqh2koQ8u4uKXLGf/Oo8bTTHqLKlIX2RYdYCsD9hyqjhRDklNj7SPEM
 CY+MiL2sTluPdROXfmDkGlVN4phNW2osX6+sRKzHfBXyuAPdatgDJ43lU/x/Ikga0nvixL5O/VT
 Yo1hxa8npjmZJBOuN4UocY0Zh3gtpTxE=
X-Received: by 2002:a05:651c:1028:b0:282:9ddb:546e with SMTP id
 w8-20020a05651c102800b002829ddb546emr611865ljm.6.1673291469170; 
 Mon, 09 Jan 2023 11:11:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvk8OqM9gIIJ+ulFVzfRdaGezCnvtU1+DvHP9td+Fz4wVeW2yfFALStWfdqCWAG7WCkhEwjAr3GLdYKHxJ/Snw=
X-Received: by 2002:a05:651c:1028:b0:282:9ddb:546e with SMTP id
 w8-20020a05651c102800b002829ddb546emr611857ljm.6.1673291468942; Mon, 09 Jan
 2023 11:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20221010085229.2431276-1-lkujaw@mailbox.org>
 <20221010085229.2431276-2-lkujaw@mailbox.org>
In-Reply-To: <20221010085229.2431276-2-lkujaw@mailbox.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 9 Jan 2023 14:10:57 -0500
Message-ID: <CAFn=p-bYDhBLZ8WjTEY-aVv8LLk6D+BH4PygYJrYrfUq-38BKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest/ide-test: Verify READ NATIVE MAX ADDRESS
 is not limited
To: Lev Kujawski <lkujaw@mailbox.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Mon, Oct 10, 2022 at 4:52 AM Lev Kujawski <lkujaw@mailbox.org> wrote:
>
> Verify that the ATA command READ NATIVE MAX ADDRESS returns the last
> valid CHS tuple for the native device rather than any limit
> established by INITIALIZE DEVICE PARAMETERS.
>
> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>

Does this still need to be staged or merged?

--js

> ---
>  tests/qtest/ide-test.c | 47 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index dbe1563b23..c406e6752a 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -37,7 +37,8 @@
>  /* TODO actually test the results and get rid of this */
>  #define qmp_discard_response(q, ...) qobject_unref(qtest_qmp(q, __VA_ARGS__))
>
> -#define TEST_IMAGE_SIZE 64 * 1024 * 1024
> +/* Specified by ATA (physical) CHS geometry for ~64 MiB device.  */
> +#define TEST_IMAGE_SIZE ((130 * 16 * 63) * 512)
>
>  #define IDE_PCI_DEV     1
>  #define IDE_PCI_FUNC    1
> @@ -91,11 +92,13 @@ enum {
>  enum {
>      CMD_DSM         = 0x06,
>      CMD_DIAGNOSE    = 0x90,
> +    CMD_INIT_DP     = 0x91,  /* INITIALIZE DEVICE PARAMETERS */
>      CMD_READ_DMA    = 0xc8,
>      CMD_WRITE_DMA   = 0xca,
>      CMD_FLUSH_CACHE = 0xe7,
>      CMD_IDENTIFY    = 0xec,
>      CMD_PACKET      = 0xa0,
> +    CMD_READ_NATIVE = 0xf8,  /* READ NATIVE MAX ADDRESS */
>
>      CMDF_ABORT      = 0x100,
>      CMDF_NO_BM      = 0x200,
> @@ -562,6 +565,46 @@ static void string_cpu_to_be16(uint16_t *s, size_t bytes)
>      }
>  }
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
>  static void test_identify(void)
>  {
>      QTestState *qts;
> @@ -1079,6 +1122,8 @@ int main(int argc, char **argv)
>      /* Run the tests */
>      g_test_init(&argc, &argv, NULL);
>
> +    qtest_add_func("/ide/read_native", test_specify);
> +
>      qtest_add_func("/ide/identify", test_identify);
>
>      qtest_add_func("/ide/diagnostic", test_diagnostic);
> --
> 2.34.1
>


