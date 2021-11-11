Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD9244D354
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:45:10 +0100 (CET)
Received: from localhost ([::1]:45330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5hl-0001VJ-1C
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:45:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml5gg-0000mW-MB
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml5gd-0007HK-HN
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636620238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSkJiK09GX4OvphUg30xUiow8mZDmzmMSKldcKufpc4=;
 b=Z0Mx9Wmw0sTI9bWYbRYK/TcBXEAlA0PISTDueJSBMkpIzep9WaM9oPKZhdNeFNJqZo0OEJ
 GTC5CJkvuvTGHsBzba+PjPnjnc4kORXkUhV6/VJSnMwzqmEGdXh/opM1ekpiCA9uY47rF1
 zN2H0zkBOu7IlHJH6XXyJ8p3oD/HEQ4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-wEV_NNfkOumyMyCRx7-izw-1; Thu, 11 Nov 2021 03:43:56 -0500
X-MC-Unique: wEV_NNfkOumyMyCRx7-izw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so4774427edx.15
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 00:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gSkJiK09GX4OvphUg30xUiow8mZDmzmMSKldcKufpc4=;
 b=WnUx5WOczjp7o4sRR35AH+hDwUXD0Muk4PonavRQ7lxXI1qF51IAmdFS058TRfk/uo
 5tZWYQYMFM51hh1Uc+7Ho8JdBpQNqpj3TxeRdapujPqeesxXH3Nf9QyJZBDm3mLbIAmR
 VZ+j6kbRpyoyHaKZjeyb1DJr139obSBkSmJ6sbFQC6fswMbi7cWbh+JsDIFiHSA8OTkO
 1TnOWkHPhZOnhkp6GXI0Lkk5zKF0Y+TXw4V4mZI4MqellNPE68c5Ci9NrKZquLlCi3h8
 KFGp9B80hbSDHl6zrIDL+Bt164iFfGWEcqFBe2vUIHFSDFVlEQ0t6103Lp9BYiKs/tuT
 Qoxw==
X-Gm-Message-State: AOAM533mS0ZlnYFfMrk/fpGPwjY08HFvzx1BNqCGOpipPjhuUzndd7Tt
 ahA9hlNWQepRzgct9yn50wycACiUb9t27jUv6XvwHvhAaeFvWIwKMNQ3NJGmAxofxIU5pIrkauD
 agyIKyKpZfHJygkU=
X-Received: by 2002:a17:906:3b18:: with SMTP id
 g24mr7233930ejf.27.1636620235229; 
 Thu, 11 Nov 2021 00:43:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqb8cFYTHnZKR0NUG5Sv4oY5zYcx+AHnsBijYCxbfhIwnQGEjq8OLdGuxYj5Lv3yyUdYY/eQ==
X-Received: by 2002:a17:906:3b18:: with SMTP id
 g24mr7233901ejf.27.1636620235048; 
 Thu, 11 Nov 2021 00:43:55 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id gs15sm967226ejc.42.2021.11.11.00.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:43:54 -0800 (PST)
Date: Thu, 11 Nov 2021 09:43:52 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 2/2] tests/unit/test-smp-parse: Fix a check-patch
 complain
Message-ID: <20211111084352.4ursyjrrkekqo2jt@gator.home>
References: <20211111024429.10568-1-wangyanan55@huawei.com>
 <20211111024429.10568-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211111024429.10568-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 10:44:29AM +0800, Yanan Wang wrote:
> Checkpatch.pl reports errors like below for commit 9e8e393bb7.
> Let's fix it with a simpler format.
> ERROR: space required after that close brace '}'
> +    SMPTestData *data = &(SMPTestData){{ }};
> 
> Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 872512aa37..7805a34b29 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -514,7 +514,7 @@ static void test_generic(void)
>      Object *obj = smp_test_machine_init();
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){{ }};
> +    SMPTestData *data = &(SMPTestData){};
>      int i;
>  
>      for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
> @@ -548,7 +548,7 @@ static void test_with_dies(void)
>      Object *obj = smp_test_machine_init();
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){{ }};
> +    SMPTestData *data = &(SMPTestData){};
>      unsigned int num_dies = 2;
>      int i;
>  
> -- 
> 2.19.1
>

I just did some googling to refresh my memory on this, because I recall
{0} being recommended at some point. From what I can tell, {} is ok for
gcc, maybe also clang, but {0} is ANSI. The reasoning was that {} should
not be empty, and since element names are not required, '0' is enough to
assign the first element to zero. Also, as it's not required to list
each element, then that's enough for the whole struct. That said, {}
seems to be more popular, so we can probably assume the tools we support
also support it.

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


