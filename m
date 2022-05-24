Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BF532EAD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:12:47 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX9K-0007nW-VR
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntWkC-0003R5-Jp
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntWk8-0006Fk-1N
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653407203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ejcjmb578npCw1cx3vPBWcmaxbZvcEH3IuM8m7K0/4=;
 b=Huw4WhZmw70Tf5XCyBqzenMu+L7q8DjJDbDvyp5rxwzTFFanfxjHkR+c+AwMsEnlyYUeYt
 R14cN4+MNN9zGODfXvf9luloSo+P6GAyX+9CDOpmrGrVV7gFcdCc+5yyUo3LJWaqfv+ekS
 xr9oOm9uZ5IB/GzkVJKXXwlgrzI5+gI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-7RHqk1HUPruGq4PWcd3QYg-1; Tue, 24 May 2022 11:46:42 -0400
X-MC-Unique: 7RHqk1HUPruGq4PWcd3QYg-1
Received: by mail-wr1-f69.google.com with SMTP id
 a4-20020adfe5c4000000b0020ffb06bcaaso258822wrn.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+ejcjmb578npCw1cx3vPBWcmaxbZvcEH3IuM8m7K0/4=;
 b=igEYRg9cwgI92KcibGmz2MgWpFJcoQfgUaHOUPZ4MNoHKRfos6D76q/LSI8Y1hyU2q
 xklBNWwYil6rLl/kczDbNROepQ32YYf9Su5KOPHMy79o66D+GO0nuAZ+uoTUc7S0dNxb
 XrVYWcoQS4MZcbp0eY7T98DUmyH7hqX8pQ9Aj1Xcqv/z+oGlx5Cj1PYUP/5+YSA1kaTe
 RudChyFS4ZQQZMGJtEWcell9EC0kJ4LUnUpt9EvUAwaiebffrzY6MB1O7EFktnCjiqGy
 RbXt/BVuaYBw6hno2Nv02Z78J1zNe3P7/1IIVJDM/5w6wo4Ncp/Ne6YuRaJNtR+d8PRf
 aPWw==
X-Gm-Message-State: AOAM532BN9dyS7S5tpm8bmsBj/U330mDIBBr4MWam3uZOG3A1zgJRgX8
 FEUIOVeTZSdJNWpY/+cdgtTx6XTq3A3lvWMIVhNXTgU/qpHErlVN1Md+8yUUqrXuNSKnfMSQs51
 Ule9TwM5s/vce1Vc=
X-Received: by 2002:a05:600c:2b8f:b0:397:46f2:7a10 with SMTP id
 j15-20020a05600c2b8f00b0039746f27a10mr4214563wmc.75.1653407200833; 
 Tue, 24 May 2022 08:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8+CTdHk4ta2/xUQwuVeKTEFyNSVFXvoecW4HVXhBrJ1cxqqv6pCKglIH4yY25eii9Unn8iA==
X-Received: by 2002:a05:600c:2b8f:b0:397:46f2:7a10 with SMTP id
 j15-20020a05600c2b8f00b0039746f27a10mr4214552wmc.75.1653407200669; 
 Tue, 24 May 2022 08:46:40 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 o30-20020a05600c511e00b00394351e35edsm2849871wms.26.2022.05.24.08.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 08:46:39 -0700 (PDT)
Message-ID: <eed37275-dff1-419b-ed01-6f3952273480@redhat.com>
Date: Tue, 24 May 2022 17:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/15] tests/qtest: add a timeout for
 subprocess_run_one_test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220524154056.2896913-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 24/05/2022 17.40, Alex Bennée wrote:
> Hangs have been observed in the tests and currently we don't timeout
> if a subprocess hangs. Rectify that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/qos-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> index 7e1c8fc579..46623da731 100644
> --- a/tests/qtest/qos-test.c
> +++ b/tests/qtest/qos-test.c
> @@ -185,7 +185,7 @@ static void run_one_test(const void *arg)
>   static void subprocess_run_one_test(const void *arg)
>   {
>       const gchar *path = arg;
> -    g_test_trap_subprocess(path, 0,
> +    g_test_trap_subprocess(path, 60 * G_USEC_PER_SEC,

60 seconds is not that much for a slow test running on a slow and overloaded 
CI host ... maybe rather go for 180 seconds or even more?

  Thomas


