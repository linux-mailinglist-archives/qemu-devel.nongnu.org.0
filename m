Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E66A606B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6cu-0002PP-8N; Tue, 28 Feb 2023 15:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX6cr-0002MY-29
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:31:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX6cp-00035W-H9
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677616262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szJszfypPy+Yy8Ya4ONncuHJBOuB6y1Vk1gk1txkx7M=;
 b=IOiGLjGpc4u1IL3No3rEKnG3NC2zj2jhgeF1P5t1BZBmcACTpde0zRy+QKGCzQR+KjQeNI
 CYXAbvulavQT5BYm623KUXBoWGPLiUYqLDD6pi/LmUeIW0NL/mF78w4Q/D6LrMXNfJ9XjK
 edcdJkMimuiRdmxtCbfszV08aUcgWYI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-S0VAHIEvMM6YxV7pDXolpw-1; Tue, 28 Feb 2023 15:31:00 -0500
X-MC-Unique: S0VAHIEvMM6YxV7pDXolpw-1
Received: by mail-wr1-f72.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so1867067wrb.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 12:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=szJszfypPy+Yy8Ya4ONncuHJBOuB6y1Vk1gk1txkx7M=;
 b=lv+mGScz1fKJc40F/AtQT2QnNylYsEmZYS8NP+XEq0VosndIaNQyTrAi5y3IWbke/x
 pwH0rruthExn6uYkONis3jrr+ef9/BiEgOyy+trHL8n5TCICZ2VK0YjMtGkEEPItji5f
 ZQqOoB31ksN14O8Jv1BDEKFEse2biF2/Te/3Rcfc3cOmAnFe2aMOz+IaSIAEqUNg35Xp
 cpMzjpxHAR7xgBpd+4X9lCNHr1NY3ZP+XxMev6Iwl1wJqQci2hxfK7TGLUrgdR5K6ucA
 N4TjO1eTN20LGVxyjOavlYQVBuvPU+5B9QqYfsohvevnxXIoJOEioykowKvGvu3UqeqU
 zIQA==
X-Gm-Message-State: AO0yUKVKgGKnkkf3IucpbWSTN2ChUoYpX9VtXlSjFn/xkVlSKqx+vIu5
 taELf1Klb/MPw0aXJlbusTwqV7z/q7v2BgRLWNGog9zN40m8W8AeWwxRnucM4rImng1sI7PM+XJ
 HprN1aQrmzrc75RE=
X-Received: by 2002:adf:e48e:0:b0:2c5:7de8:212b with SMTP id
 i14-20020adfe48e000000b002c57de8212bmr3081119wrm.45.1677616259383; 
 Tue, 28 Feb 2023 12:30:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/BL6fR53zw7iG+SWHbPTUXMcRFs008TsbugkMAzAhDLnSD4cAQe6Nwsw4S9CoTh8Yr4QHUag==
X-Received: by 2002:adf:e48e:0:b0:2c5:7de8:212b with SMTP id
 i14-20020adfe48e000000b002c57de8212bmr3081096wrm.45.1677616258976; 
 Tue, 28 Feb 2023 12:30:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-112-221.customers.d1-online.com.
 [80.187.112.221]) by smtp.gmail.com with ESMTPSA id
 k10-20020adfd84a000000b002c55551e6e9sm10811300wrl.108.2023.02.28.12.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:30:58 -0800 (PST)
Message-ID: <6e28af8e-3e71-9888-8832-786550b81983@redhat.com>
Date: Tue, 28 Feb 2023 21:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: alxndr@bu.edu, pbonzini@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, fam@euphon.net,
 lvivier@redhat.com, berrange@redhat.com
References: <20230227174019.1164205-1-rjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230227174019.1164205-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/02/2023 18.40, Richard W.M. Jones wrote:
> These two tests were failing with this error:
> 
>    stderr:
>    TAP parsing error: version number must be on the first line
>    [...]
>    Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
> 
> This can be fixed by ensuring we always call g_test_init first in the
> body of main.
> 
> Thanks: Daniel Berrange, for diagnosing the problem
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
>   tests/qtest/rtl8139-test.c         | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index a9254b455d..2012bd54b7 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
>   
>   int main(int argc, char **argv)
>   {
> +    g_test_init(&argc, &argv, NULL);
> +
>       if (!qtest_has_device("lsi53c895a")) {
>           return 0;

Could you please double-check that the !lsi53c895a case works fine, too? 
(just temporarily change it into a "if (1) { ..." statement) ... I'm a 
little bit afraid that the TAP protocol might be incomplete without the 
g_test_run() at the end otherwise. If so, you might now need a "goto out" 
instead of the "return 0" here...

  Thomas


>       }
>   
> -    g_test_init(&argc, &argv, NULL);


