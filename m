Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F84855A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:16:52 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n581z-0006E8-6b
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n57zQ-0004fp-CN
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:14:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n57zN-00065d-K1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641395648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpfrqPKxWtjcKpVc8z4XMlJF3b6JoSe2raKcStT10eM=;
 b=aVMiyXhBhGc5br+rz7b0/ndhUKT+hrZG1P1CF4gsHEXfAaSw0X/XpGz0hxyArjwyrzCn+q
 Ko4W4CZf1qHn6UX9CVLzmp5eCmfuLl6SmakCkMGmH2qOmc1HUPf7uwTAPsAVvsL6ZwWddI
 s1EDn19YfaJDqw8NN37Nm16xT5d2MpA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-pZJGF2q-P7WJ-rnL6uCJWw-1; Wed, 05 Jan 2022 10:14:07 -0500
X-MC-Unique: pZJGF2q-P7WJ-rnL6uCJWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j8-20020a05600c1c0800b00346504f5743so1937083wms.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 07:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MpfrqPKxWtjcKpVc8z4XMlJF3b6JoSe2raKcStT10eM=;
 b=6hA8OsdT8PCvpzpyvjpJrK52KctPHo63Iid+ptx1/uMjzPWMvJJruDaCm29U4jtjov
 iqxf8SsiejBYJsUyfZa3N6bQXSAoWi51Gb/zTzAnpivywklJbdktxOAOKLgVJ2DLhw2O
 KIpX71T9/P7FScDvIQYgswTsHvGKYQaTqMtolVVrRjykE6sTvcZRfLs75eWtSbvqSRl+
 pJrp/M5KhDMYwGlFGAmXGZj683+kiCcUmtlAF2iNCcwmX78c86pMhKleuL68XwtBj7EW
 /9OnH/DZPoN1YmcJCncaPxiAN9ldDtOXAisUG89G26TT6JnHFk60ngkq8nYesbXvelDm
 9MzA==
X-Gm-Message-State: AOAM532j5EmOXZgGio77fUreeSgh0v9krxJAMeIWnIWaI4tT6Xf40fXm
 kTtrLdGJxi9RMtfllH67gZ3sWltUkUaT+rW/3M+OBuly+6XBoYypMsk4MH4AjsQVCvJcFEz/f6P
 O+2fpvagnmkqOwhI=
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr3288475wma.50.1641395646209; 
 Wed, 05 Jan 2022 07:14:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLpCyMjRIlq6thK1ouGHxlfmh+SW3CKmaulVtJ1T9G8P//4XFRuPsJmjwJaez++/aMcDyTVQ==
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr3288461wma.50.1641395645995; 
 Wed, 05 Jan 2022 07:14:05 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id m35sm6233271wms.1.2022.01.05.07.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 07:14:05 -0800 (PST)
Message-ID: <644970a9-391f-30b4-2ecd-9a4bf1e27459@redhat.com>
Date: Wed, 5 Jan 2022 16:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 05/34] ci: explicitly skip I/O tests on alpine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220105135009.1584676-6-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 14.49, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The block I/O tests don't work on Alpine because their alternative libc
> impl emits different strings for errnos, which breaks the expected
> output matching. e.g.
> 
> === IO: pattern 102
>   wrote 512/512 bytes at offset 512
>   512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
> +qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: I/O error
>   4
>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
>   Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=0
> 
> Currently the I/O tests are skipped as a side effect of the Alpine image
> containing a minimal busybox 'sed' binary, rather than GNU sed. This is
> a fragile assumption that will be invalidated when the dockerfile is
> changed to be autogenerated from a standardized package list that
> includes GNU sed.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211215141949.3512719-6-berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 7e1cb0b3c2..e77aec873e 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -24,7 +24,7 @@ check-system-alpine:
>         artifacts: true
>     variables:
>       IMAGE: alpine
> -    MAKE_CHECK_ARGS: check
> +    MAKE_CHECK_ARGS: check-unit check-qtest
>   
>   avocado-system-alpine:
>     extends: .avocado_test_job_template

Reviewed-by: Thomas Huth <thuth@redhat.com>


