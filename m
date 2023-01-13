Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD3669B28
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKwy-0007ix-NP; Fri, 13 Jan 2023 09:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGKwq-0007gM-HX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGKwm-0006Qt-Fx
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673619738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp2RZ1DNWGnPOCNuTdafHAOiadCqKFsfZ5OfEbcFHeA=;
 b=RY5AMnqq3iw1xdJY7uMkJ4alpE70Qrmu/LKP6D4oaHTEl5p0a14lSwjBD2yf+0XEebV66m
 FexpA4tac2EF/5CRHTtihMi+aOccsCtfVFrVuIVduk3gp/TJVXVyvNDEppPtd/LImZVGdS
 eXIk9GSBG8kqWCuPj4yRaUGj5RcHTqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-qflQDedDNMm8myVapyGrTA-1; Fri, 13 Jan 2023 09:22:16 -0500
X-MC-Unique: qflQDedDNMm8myVapyGrTA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso4944520wmk.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lp2RZ1DNWGnPOCNuTdafHAOiadCqKFsfZ5OfEbcFHeA=;
 b=eg0tl77QJVhIhVC03gctK104KHOfkM7ckoOdPk7K7rYJrbKJczNWDJ7q5GHFFDcQ5l
 pvxfr/Ji3KtMPSo++li2D+cTnbA422n69+tBAWzGg1cxkPIDH80eiD7R9xMAOmNMqBGH
 JkyYSjjXA2undKzBvcLNU3J3bHCUAq9+hr4Y4Xzn4jjJgH7/bixuwBZ7Q4h4j8SH0tWf
 /mKIw4M9SQQznUdRzS41b1JFXKzMgr5T5q+Q0kRb+z5AXrTFxVEG+9qlalskqcJXl+QB
 WcgSVyDEcXTLIyKhTnUMOzpYgR5eaKqhXRY4q++SDwil025+4EY6vnvmErSaw0Qvmg96
 wb4g==
X-Gm-Message-State: AFqh2kprc8jb+zG0O1u/770IxpBT1ubvBQkqssLtyfWrHHIvoHx2//Cy
 9yVjZ7X0Sx2xASdxAseWlDsZDl6XNPwJUhBPWgT86X/Nw9FU8SHf1ErcHqVqKGk2KFWfO6Q31PG
 nKtyKyQHEcrAmcRE=
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr61861525wms.9.1673619735705; 
 Fri, 13 Jan 2023 06:22:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtn6sHp/nXLTcLfdndlwN5d4RPk9Nss7697G4Lu3DnPztr0BWjBInN1Z6ZWYm9ZQXJDmI5DrQ==
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr61861501wms.9.1673619735500; 
 Fri, 13 Jan 2023 06:22:15 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de.
 [109.43.177.39]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm33110641wmq.33.2023.01.13.06.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:22:14 -0800 (PST)
Message-ID: <81895ce0-ce46-bdff-9865-0721dd4accf1@redhat.com>
Date: Fri, 13 Jan 2023 15:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230113140419.4013-22-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13/01/2023 15.04, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 4be1415823..9a052e41fc 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>       qobject_unref(resp);
>   }
>   
> +static bool tcg_disabled(void)
> +{
> +#ifndef CONFIG_TCG
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>   static uint64_t resp_get_sve_vls(QDict *resp)
>   {
>       QDict *props;
> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>   {
>       QTestState *qts;
>   
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support disabled in this build");
> +        return;
> +    }

Could you please use qtest_has_accel("tcg") instead? ... that's what we use 
in other spots in the qtests for checking for valid accelerators already.

  Thanks,
   Thomas


