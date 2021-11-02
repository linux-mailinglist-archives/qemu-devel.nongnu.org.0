Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC9442BE0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:52:44 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrPG-0003we-3X
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhrNX-0003Br-GG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhrNU-0005IF-Kx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635850251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rEe+T+oxkMPNTk9iX+eiW8Gq5yNMsRXb4Wr7xkxvQQ=;
 b=TwFUXZY/ENBkQKhKVu9WU6njUt6m73xPGMNyHCn5p3BJs9/+3gqLkwipb+lpYjDeyLTP1B
 Zpof3xG9OksQSDXWTU1zT48NTWbUD5BD9548kzRIm4Qbe0QSTVnpAj46Lm/L0KS/N5MN5R
 6e7MFLsktma9KTd/s6xyFHf2cQSmT40=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-z0ZvOQaONA2w4fQt1_DIxQ-1; Tue, 02 Nov 2021 06:50:50 -0400
X-MC-Unique: z0ZvOQaONA2w4fQt1_DIxQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so4062677wrj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2rEe+T+oxkMPNTk9iX+eiW8Gq5yNMsRXb4Wr7xkxvQQ=;
 b=OntY63TTlp24S2DDnzqpkN6vNpqvS9IFE7F2XFyASWcWK+vlmckDLBmkUXQIy313Pq
 Ay54yRrBxqDbtcr54FzsOq1YhvaQvhKP/3tkSMJDENwDOzE0KzDDATyh+7C+UZ2mJiPB
 NBZWBuFsYAufZ2sIoH7qdwddEeyfF4ZJ3GH+PEiuZ/FXvqlr/eqap2NuJSSNW8NB3+Tj
 1gFQVeVjyF09275SJpKrUYi+86y+Qi90+qcRM5I2vuzHWPEfusp4yi6KtzjDZ3d2FKBz
 6YN9H/BZ7WkYQ9Ka67bIsPGD47SjfwU2yCoBIPaY0EuVOwWxNZTT1i6QL4ZYmXBxt0bK
 OJaA==
X-Gm-Message-State: AOAM531gIieFxMwdq7A/7o8RzeyFHnagFhH+MXCIcrb3GVEagyFjXk0H
 c4FMVilmjNdI4KJIH6RQowYds3MohTY61IZb964WRmZPEANY+qIGs35y39wC0BaHhv8wmBOnCQl
 xhfpCNPJ7JPIz8L8=
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr45308438wrp.96.1635850248993; 
 Tue, 02 Nov 2021 03:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwda53Ftp77idIF+Poa+n2/7BFChsi/xWTmgS+tirQIc+py1sRh2kS/6HLldrPFc9RE0ePNNg==
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr45308424wrp.96.1635850248798; 
 Tue, 02 Nov 2021 03:50:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x1sm1734534wru.40.2021.11.02.03.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:50:48 -0700 (PDT)
Message-ID: <987465be-63fc-1cd0-db62-3b8345a34442@redhat.com>
Date: Tue, 2 Nov 2021 11:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] qtest/am53c974-test: add test for cancelling
 in-flight requests
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, fam@euphon.net,
 thuth@redhat.com, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20211101183516.8455-1-mark.cave-ayland@ilande.co.uk>
 <20211101183516.8455-3-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211101183516.8455-3-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/21 19:35, Mark Cave-Ayland wrote:
> Based upon the qtest reproducer posted to Gitlab issue #663 at
> https://gitlab.com/qemu-project/qemu/-/issues/663.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   tests/qtest/am53c974-test.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
> index d996866cd4..9b1e4211bd 100644
> --- a/tests/qtest/am53c974-test.c
> +++ b/tests/qtest/am53c974-test.c
> @@ -189,6 +189,40 @@ static void test_cancelled_request_ok(void)
>       qtest_quit(s);
>   }
>   
> +static void test_inflight_cancel_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +    qtest_outl(s, 0xcf8, 0x80001000);
> +    qtest_inw(s, 0xcfc);
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xffffffff);
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_inl(s, 0xcfc);
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xc001);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_inw(s, 0xcfc);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x7);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_inw(s, 0xcfc);
> +    qtest_inb(s, 0xc000);
> +    qtest_outb(s, 0xc008, 0x8);
> +    qtest_outw(s, 0xc00b, 0x4100);
> +    qtest_outb(s, 0xc009, 0x0);
> +    qtest_outb(s, 0xc009, 0x0);
> +    qtest_outw(s, 0xc00b, 0xc212);
> +    qtest_outl(s, 0xc042, 0x2c2c5a88);
> +    qtest_outw(s, 0xc00b, 0xc212);
> +    qtest_outw(s, 0xc00b, 0x415a);
> +    qtest_outl(s, 0xc03f, 0x3060303);
> +    qtest_outl(s, 0xc00b, 0x5afa9054);
> +    qtest_quit(s);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       const char *arch = qtest_get_arch();
> @@ -212,6 +246,8 @@ int main(int argc, char **argv)
>                          test_fifo_underflow_on_write_ok);
>           qtest_add_func("am53c974/test_cancelled_request_ok",
>                          test_cancelled_request_ok);
> +        qtest_add_func("am53c974/test_inflight_cancel_ok",
> +                       test_inflight_cancel_ok);
>       }
>   
>       return g_test_run();
> 

Queued both, thanks.

Paolo


