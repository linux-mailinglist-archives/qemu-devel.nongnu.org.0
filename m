Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41AB537636
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:08:04 +0200 (CEST)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaRX-0006nw-Ui
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvaOx-0005zi-Lt
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvaOM-0004SR-W5
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653897884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PA7X/FwjcuprGSb4qferaf6ljRnURB/567TMz41Wk+U=;
 b=a0obW/ynmD13a02rWTXhlzADVQv6IZF7iZmeHDFYeZ0sSzhRcvzd+laN1lrhNVM/Qv6Xwi
 YfPDg8djb2Hg5X1sl09iF65Wvggp+TfArjByVH0pfof9x+7pqD+zAoBoSMwFXQ1t/awftU
 5KRcuC0bpMegtPCOC6SfJ9kvPMur+Pk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-UqKR9DjfOy-8eChz4m630w-1; Mon, 30 May 2022 04:04:43 -0400
X-MC-Unique: UqKR9DjfOy-8eChz4m630w-1
Received: by mail-qk1-f198.google.com with SMTP id
 f20-20020a05620a12f400b006a36317a58aso8223393qkl.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 01:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=PA7X/FwjcuprGSb4qferaf6ljRnURB/567TMz41Wk+U=;
 b=vwG1L/cpdc7xNIOuWfDpgNtf7tlHcFDsz5TCE42Me9UEsDiz5LV7nwXn6uIjhVAkWR
 26sT2OHHEAL+CnaYGY9wk2rj3M1iVQwcmgbUdzdRdcV6ioeKrGOEG9dl6oHuEGAaCK/K
 G/r7OR0S/ONx5m2KnJTcPKhte7SEu9H6tO5M7x+dUnmjRh/nLIu1/5LDtLHQkTQZdu3M
 6PJKKyVehulGL9dlS3qoSGbtZphdHDE4BGOYDE3pSZhIJLSRcq1AOlMuT0SbvuZwFIbE
 njPvpN24LTGzphJWwkM0/arLJNiORpJuOKauMxRshqlJivPByqu64Kan+11wmTwoeSw1
 Hlug==
X-Gm-Message-State: AOAM533/EfdsInPKtkztiLhFwgIjpkP20LFRz8O7xPggSY8nkmwoRlg4
 t29duHQzeMYN5bbOwDs5SHYnEB8gvKCF99ie01EVO9DdMaRecreH6P/fVBG3BBzCG1fHHV6e/GS
 WrFaqX9iVZ/V0Jf8=
X-Received: by 2002:a05:6214:5282:b0:443:9905:a58f with SMTP id
 kj2-20020a056214528200b004439905a58fmr45055450qvb.98.1653897883035; 
 Mon, 30 May 2022 01:04:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyClh1Qcz7Nr0HYtB+SZBrZQo+rVyq2Eu79vcetUFYChIHgMgwnIugs79OYGAXlV2SRfcYRRQ==
X-Received: by 2002:a05:6214:5282:b0:443:9905:a58f with SMTP id
 kj2-20020a056214528200b004439905a58fmr45055437qvb.98.1653897882827; 
 Mon, 30 May 2022 01:04:42 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 w3-20020a376203000000b0069c72b41b59sm7392462qkb.2.2022.05.30.01.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 01:04:42 -0700 (PDT)
Message-ID: <23b7e5e6-1d46-b032-3207-af2d30453cba@redhat.com>
Date: Mon, 30 May 2022 10:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-31-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 30/33] gitlab: convert static checks to
 .base_job_template
In-Reply-To: <20220527153603.887929-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/05/2022 17.36, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> This folds the static checks into using the base job
> template rules, introducing one new variable
> 
>   - QEMU_JOB_ONLY_FORKS - a job that should never run
>     on an upstream pipeline. The information it reports
>     is only applicable to contributors in a pre-submission
>     scenario, not time of merge.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220526110705.59952-4-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
...
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 5734caf9fe..9a0b8d7f97 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -16,6 +16,10 @@
>       - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
>         when: never
>   
> +    # Jobs only intended for forks should always be skipped on upstram

s/upstram/upstream/

With the typo fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


