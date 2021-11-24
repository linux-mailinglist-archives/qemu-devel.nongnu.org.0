Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A458645C571
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:55:49 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpskW-0003dt-Oh
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpsSa-0000B8-6n
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpsSR-0001zw-1h
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ns88UfsxhzqT4uvdaGJgiRdXr6UBU2TNNplFkWKJYmE=;
 b=KVmjpkGO20LJiYu8fmm6FmebAdLjRBkcleT0RtGftBLFoNGEqt2ChDdY6feZ4nFPAcuPyX
 sqewocENwgQi9gau3BLxb4wvLL6G7GCS1GfxvqECeZruFKFAYX7/NErv6uExHNykhKQA+W
 zh9GjyvGqxNCjq4S8kG7X4N7pYu5S3E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-FF5rmi0rOROIhlYFCOZOmQ-1; Wed, 24 Nov 2021 08:37:03 -0500
X-MC-Unique: FF5rmi0rOROIhlYFCOZOmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so1452984wmq.9
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ns88UfsxhzqT4uvdaGJgiRdXr6UBU2TNNplFkWKJYmE=;
 b=kXj4xshsj5EXFIgykINdxNEkSpwLTt18Te0IAX9CbjEuEMd6qzHc/A8NCs1rimi4K3
 BLmZjGTkWw6Hd9PEeNgipy61iS831e5lrtQH360ADcsB0MWgt2xJuruIDPltPrygqkLi
 hrPuGay1Q8sFfW1eHoWAIcJoVuyHRrP3A8B4zpaw3OTGZZka4TUMxMOrnNGCyajGdYrX
 LVwptnR2OrARjFxvFANcBRxQj/zgkUGK765hZ1mL7zP3oqkBB5xEkqHQUyDWryvMuYML
 6GDD+I2937SsSFohZlmhQh/uQDBAqlPnhe9XQeitjBDMIiHh4yk1IVbttl64fx/W42Si
 J6wA==
X-Gm-Message-State: AOAM533OxAtnje9nRVwyIqybgy3hwhv+aAtTvYxYu/VSd5tnbyp0NWGP
 n66y7dmMbZMnjVQruo+l2gIIOFbsuzyoJ5BB423P2TH8K4k67xh/U/L4kvq4XUEejlFCNgQIXz6
 meE54CVCt34tB7To=
X-Received: by 2002:a05:600c:2e46:: with SMTP id
 q6mr14987947wmf.6.1637761022189; 
 Wed, 24 Nov 2021 05:37:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSHJ85JFkYqY05iPdvtLvshWegl+RQKYgym2dnt1HdP7ZBq9J7RGqIAdKhw2N1NmUkqQtyiA==
X-Received: by 2002:a05:600c:2e46:: with SMTP id
 q6mr14987912wmf.6.1637761022004; 
 Wed, 24 Nov 2021 05:37:02 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id h18sm16696187wre.46.2021.11.24.05.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:37:01 -0800 (PST)
Message-ID: <fb749701-0dee-8ae6-da2d-f7ed2c09004f@redhat.com>
Date: Wed, 24 Nov 2021 14:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/18] ci: explicitly skip I/O tests on alpine
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211124130150.268230-6-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/2021 14.01, Daniel P. Berrangé wrote:
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
> containing a minimal busybox 'sed' binary, rather than GNU Sed. This is
> a fragile assumption that will be invalidated when the dockerfile is
> changed to be autogenerated from a standardized package list that
> includes GNU Sed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 71d0f407ad..e1fe37e563 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -24,7 +24,7 @@ check-system-alpine:
>         artifacts: true
>     variables:
>       IMAGE: alpine
> -    MAKE_CHECK_ARGS: check
> +    MAKE_CHECK_ARGS: check-unit check-qtest

Hmm, that's just a work-around ... what if some user wants to run "make 
check" on an Alpine installation that has the real GNU sed installed? ... I 
think this rather requires some fixing in the iotests instead - or maybe the 
related tests should simply not be in the "auto" group anymore?

  Thomas


