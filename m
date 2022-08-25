Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D25A105E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:26:02 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBvt-0004q6-2F
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBsj-0001vv-05
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBsg-0005Bw-UV
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrYFfpIP3JW+I+8JQWIhl0AcXbWcuIm2hgnoBPNNOEM=;
 b=F4mj2JbDxjAR6kOrlGiguhOnoucKV262wjemJl08C0qhR1Tql/NQ5NvbDFSa70AiYJNCH1
 vyIQTJBD9p9d5NzPYV4szFtk3+CzrpHWBH0vM01v8TH0vfKkrxeZ8686VpdfNef3YGJyCL
 /QGL76nWq09s1sy0UMeE39zyj8Os+Yo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-EMAPgbGsN-yRs6O6IApgXw-1; Thu, 25 Aug 2022 08:22:40 -0400
X-MC-Unique: EMAPgbGsN-yRs6O6IApgXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f18-20020a05600c4e9200b003a5f81299caso10865290wmq.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JrYFfpIP3JW+I+8JQWIhl0AcXbWcuIm2hgnoBPNNOEM=;
 b=UOhtmG8wjxsnoG/jQIK+X+OWB0MT4AkDXL+8aSwLJPp3JgH6OEocpIMHRmuArntbwy
 fU9fiDSskjnxuS0YDsCGk3+gtTGDhBwrC6O8b4IqcSNwKEjYevniM1Y19dhf8NkBhFjL
 jUPrwrI81q1RTC91hnHh7dtEmipOyuwRyAF+OEq+We3nRzpAhsRo5FtV0fUpBDLXJsA3
 BtdamL/Lonv86rmHiTcXwgWaplcBgZrwACCyXNVYV75dHOiuhgRQfAS6VnN/ApDIvwqc
 2Fj5hwVyxR2u0xG4estSXK4LvDXGAGZ2DHd+s1XK21z2FYUjJBakGSxu0iLIId1vmTQI
 WmHA==
X-Gm-Message-State: ACgBeo0vWZInwUsaRG1G9xz2u6oweyfyiUvZQI/lhhR40MfNU07MeYjt
 O4XRiPs9RYRzvTzZuvFPBXd7qMUdWhV2HNIuW0Rth+jtWASQ2NTm1uMBLrq2bFLBW8XtVJix76S
 eZE1CrW6VFQonnAc=
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr2224113wru.439.1661430159842; 
 Thu, 25 Aug 2022 05:22:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56yLI5y4m2780pkbtiShbxMMgjTwbXZpwgWPTZOpfMvWWxXx3QR0kOjQX/bnpV4QAxcFaYLg==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr2224095wru.439.1661430159587; 
 Thu, 25 Aug 2022 05:22:39 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d624a000000b0021e6c52c921sm23123291wrv.54.2022.08.25.05.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:22:39 -0700 (PDT)
Message-ID: <c093327b-e561-3394-96aa-fd191deff310@redhat.com>
Date: Thu, 25 Aug 2022 14:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 36/51] tests/qtest: machine-none-test: Use double quotes
 to pass the cpu option
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-37-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-37-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Single quotes in the arguments (e.g.: -cpu 'qemu64,apic-id=0') are
> not removed in the Windows environment before it is passed to the
> QEMU executable. Such argument causes a failure in the QEMU CPU
> option parser codes.
> 
> Change to use double quotes which works fine on all platforms.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/machine-none-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
> index f92fab479f..31cc0bfb01 100644
> --- a/tests/qtest/machine-none-test.c
> +++ b/tests/qtest/machine-none-test.c
> @@ -81,7 +81,7 @@ static void test_machine_cpu_cli(void)
>                   " add it to cpus_map\n", arch);
>           return; /* TODO: die here to force all targets have a test */
>       }
> -    qts = qtest_initf("-machine none -cpu '%s'", cpu_model);
> +    qts = qtest_initf("-machine none -cpu \"%s\"", cpu_model);
>   
>       response = qtest_qmp(qts, "{ 'execute': 'quit' }");
>       g_assert(qdict_haskey(response, "return"));

Reviewed-by: Thomas Huth <thuth@redhat.com>


