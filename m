Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7AD582019
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:28:24 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGaWt-0002i5-DK
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGaT8-00009K-Ep
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGaT4-0006S0-Nz
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658903064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjCGozTLQ+bCeV4Cutxdj8M2yJOMrYfoJgrahp3WJ+s=;
 b=FBkPLbqWhRZVSVCDWTAdgfFrf1jAEem051j8h3zldCZtegLZSHCU4ghJisFGO2McbVBQSq
 SCNJt06HDJwxclsjKQ0oEKqH2dTqbD/lqPF2olp1yJhEak1YekSV67zV08H11fqJumUubT
 wimGUHF05gA0/Dez14Crkv6Y+61qhDc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-eOYAbWeGMQaEq7YRx-Ad_A-1; Wed, 27 Jul 2022 02:24:21 -0400
X-MC-Unique: eOYAbWeGMQaEq7YRx-Ad_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so203446wmb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UjCGozTLQ+bCeV4Cutxdj8M2yJOMrYfoJgrahp3WJ+s=;
 b=ONTxzDO7uA89dBhRCbUMcTv2JE60fNe+/By4u9M+mnNVrMKrqIF53RN+dCIlKXkWvD
 a5W92fgrCQFYly53O4GQxZigH15CaKUw7CjJX4Gwb7Qemi0FNWgL6JCZCVtddH0JGoMp
 ektjAex5nVv3sSJzuL+YiNfUgjSD6j5sIBV5eth2xEcaOZn4jycsvqzqjIuyx4W8o7o+
 XGsroBYSidOHQ77TxX0i/xMyaoevJsOUcawhzj5t9j7HgiZakbb7fGNfOzSGBf3WC0Rm
 5wmXaq8RM5mYal7hpEABz1nb7bDNSY5fQ/apOfxPYIktk4CHkcwgxRlruRJSFxLsyYZe
 ZLUQ==
X-Gm-Message-State: AJIora9cTwb9Ueei9sZi2lk7G782vbqg1FJq9hho8h/MlhdjxMFdLUO5
 r2OvzcpcuJhi6ArUQZloiF5LOjvyhWsK7+SiWf4n0xnZgRYT0ywlhB3VvFL9eJjOrlaUQKh/KMY
 ISGnNr/tUEAsWvTg=
X-Received: by 2002:a7b:c3cc:0:b0:3a3:8ec:d69 with SMTP id
 t12-20020a7bc3cc000000b003a308ec0d69mr1788457wmj.78.1658903060774; 
 Tue, 26 Jul 2022 23:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDGqJsA3qf9dJ7c1Talx7C/mpkf967HBnvJyvjlhlQPanRGSu4Z2MJZcOBexndZbAJkt6pXg==
X-Received: by 2002:a7b:c3cc:0:b0:3a3:8ec:d69 with SMTP id
 t12-20020a7bc3cc000000b003a308ec0d69mr1788438wmj.78.1658903060435; 
 Tue, 26 Jul 2022 23:24:20 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-164.web.vodafone.de.
 [109.43.176.164]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b003a3278d5cafsm1166141wmq.28.2022.07.26.23.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 23:24:20 -0700 (PDT)
Message-ID: <c33192cd-2122-2491-015b-620906b63712@redhat.com>
Date: Wed, 27 Jul 2022 08:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 14/21] tests/qtest: add a timeout for
 subprocess_run_one_test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-15-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220726192150.2435175-15-alex.bennee@linaro.org>
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

On 26/07/2022 21.21, Alex Bennée wrote:
> Hangs have been observed in the tests and currently we don't timeout
> if a subprocess hangs. Rectify that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - expand timeout to 180 at Thomas' suggestion
> ---
>   tests/qtest/qos-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> index 7e1c8fc579..ac23def284 100644
> --- a/tests/qtest/qos-test.c
> +++ b/tests/qtest/qos-test.c
> @@ -185,7 +185,7 @@ static void run_one_test(const void *arg)
>   static void subprocess_run_one_test(const void *arg)
>   {
>       const gchar *path = arg;
> -    g_test_trap_subprocess(path, 0,
> +    g_test_trap_subprocess(path, 180 * G_USEC_PER_SEC,
>                              G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
>       g_test_trap_assert_passed();
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


