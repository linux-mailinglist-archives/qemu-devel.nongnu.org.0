Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CA4558DF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:20:27 +0100 (CET)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneWo-0003Of-JJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:20:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mneVr-0002iL-3h
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:19:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mneVn-00033A-Uu
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637230763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pSNA9T0f3yX0g6lo44AIKstrDCNBTiJIjgySkdgLMU=;
 b=Dg5HGg9RrUO1AZvRHpnP8fr06q3WUnzW+AZlcMIpFRObzkKLCYsXVpEKwOZppM2xLYj7NA
 uifslH8DCFZ5cmghzpeCHFnqT/cJEcOMtteK+cJMwjWZAIyQ9m5V6hjIziEnPV4xj8gcmY
 PA0CNuV3XlE/zWzNwkCuinBIIR4OON4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-fR2a-tNyMvKpQSQB2wj3pw-1; Thu, 18 Nov 2021 05:19:20 -0500
X-MC-Unique: fR2a-tNyMvKpQSQB2wj3pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B468101796A;
 Thu, 18 Nov 2021 10:19:18 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8C4D1000324;
 Thu, 18 Nov 2021 10:19:16 +0000 (UTC)
Message-ID: <abdcffc5-3e82-700b-3b14-3674764f3bce@redhat.com>
Date: Thu, 18 Nov 2021 11:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.2 2/2] qtest/am53c974-test: add test for reset
 before transfer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
 <20211118100327.29061-3-mark.cave-ayland@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211118100327.29061-3-mark.cave-ayland@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 18/11/2021 11.03, Mark Cave-Ayland wrote:
> Based upon the qtest reproducer posted to Gitlab issue #724 at
> https://gitlab.com/qemu-project/qemu/-/issues/724.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   tests/qtest/am53c974-test.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
> index 9b1e4211bd..d214a912b3 100644
> --- a/tests/qtest/am53c974-test.c
> +++ b/tests/qtest/am53c974-test.c
> @@ -223,6 +223,34 @@ static void test_inflight_cancel_ok(void)
>       qtest_quit(s);
>   }
>   
> +static void test_reset_before_transfer_ok(void)
> +{
> +    QTestState *s = qtest_init(
> +        "-device am53c974,id=scsi "
> +        "-device scsi-hd,drive=disk0 -drive "
> +        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
> +
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xc000);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x01);
> +    qtest_outl(s, 0xc007, 0x2500);
> +    qtest_outl(s, 0xc00a, 0x410000);
> +    qtest_outl(s, 0xc00a, 0x410000);
> +    qtest_outw(s, 0xc00b, 0x0200);
> +    qtest_outw(s, 0xc040, 0x03);
> +    qtest_outw(s, 0xc009, 0x00);
> +    qtest_outw(s, 0xc00b, 0x00);
> +    qtest_outw(s, 0xc009, 0x00);
> +    qtest_outw(s, 0xc00b, 0x00);
> +    qtest_outw(s, 0xc009, 0x00);
> +    qtest_outw(s, 0xc003, 0x1000);
> +    qtest_outw(s, 0xc00b, 0x1000);
> +    qtest_outl(s, 0xc00b, 0x9000);
> +    qtest_outw(s, 0xc00b, 0x1000);
> +    qtest_quit(s);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       const char *arch = qtest_get_arch();
> @@ -248,6 +276,8 @@ int main(int argc, char **argv)
>                          test_cancelled_request_ok);
>           qtest_add_func("am53c974/test_inflight_cancel_ok",
>                          test_inflight_cancel_ok);
> +        qtest_add_func("am53c974/test_reset_before_transfer_ok",
> +                       test_reset_before_transfer_ok);
>       }
>   
>       return g_test_run();
> 

Acked-by: Thomas Huth <thuth@redhat.com>


