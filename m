Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C525EDD86
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:12:25 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWrQ-00076j-La
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTau-0003T5-V3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTat-000457-2Z
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664358186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ3Ev4kTcL3m1jfKj1cq5rfkwtsXF2IXf0ChgEuV5iI=;
 b=VTQGQ5df4Re8iZwbNSo4KJigEkmYUNVcNE0ajA6Q0klC8b5GtDobW6BYWnf4W+bJU4OBFy
 MSat1yiMRQsiYEanEdnfMNyUdZZTLGiJkrL4HmA5ABdLVqE3a1ZQiGAqMuHczgQQYxKApG
 /zhqQ8jpO9/P8LJyruCU855Sld/zfiQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-xft_9xxSMFmW5JkAnWiiYw-1; Wed, 28 Sep 2022 05:43:01 -0400
X-MC-Unique: xft_9xxSMFmW5JkAnWiiYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so1520554wmb.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oQ3Ev4kTcL3m1jfKj1cq5rfkwtsXF2IXf0ChgEuV5iI=;
 b=P63F7kT0KbxfDBUaOk/VOvozAkvgtahGQ2mFvm2ZiZC7vwB041gx/4VsHsDlJowoVy
 ezCtC0xVf4e5+z1FWKUqQ1VrOmbejFXla5G9JU1FyECoz1s+C6qUzJsEX8hQKKTShYQc
 Fp1Qsgat1Ivr3CL/7hLjex/5NIF6DkzVnjdAzo+/+fe1O37jd0ZnyK5WBVS52ZUEpmtS
 fluRCxh0TQ3F6TU3FDvJRaalvOx2+oJIAbYsHWBOYJvLxonRHnuMKX7vZEPCHj+kSFa0
 rA3S7RV/GBp453xZqTnkTIN3LC3Zy3BGPOPs19JTSQ9kSC/RKsLeVaTy42Nv2Gu1uzqP
 TB6g==
X-Gm-Message-State: ACrzQf1lQZBlsF/MhnzWura9dS/jFkvKiKjvRUdneBa233YLI2pP/1k7
 bHscBOfNKsI6lgDK48iktxmlLe1V+iStajNV8JUAOd5fu+m5dMxaiQlLQ65F59bNMVVHP32NoIf
 FIxWTX3WV9nY3u7c=
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id
 e18-20020a05600c4e5200b003b4a8281d84mr5827358wmq.143.1664358180879; 
 Wed, 28 Sep 2022 02:43:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IjZy3MqpZzlm3O2mo7N8BjKMcS/eubOArKgZ5tJmQ1KwiDNcguE9e1Dt4lnUtil/Rh43pbw==
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id
 e18-20020a05600c4e5200b003b4a8281d84mr5827341wmq.143.1664358180550; 
 Wed, 28 Sep 2022 02:43:00 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 a5-20020a1cf005000000b003b4764442f0sm1245718wmb.11.2022.09.28.02.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 02:43:00 -0700 (PDT)
Message-ID: <8b15887b-686f-3b59-ce2a-899c22b53458@redhat.com>
Date: Wed, 28 Sep 2022 11:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 35/54] tests/qtest: libqtest: Install signal handler
 via signal()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-36-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927110632.1973965-36-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 13.06, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the codes uses sigaction() to install signal handler with
> a flag SA_RESETHAND. Such usage can be covered by the signal() API
> that is a simplified interface to the general sigaction() facility.
> 
> Update to use signal() to install the signal handler, as it is
> available on Windows which we are going to support.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> (no changes since v1)
> 
>   tests/qtest/libqtest.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 269d622fe3..f0ac467903 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -66,7 +66,7 @@ struct QTestState
>   };
>   
>   static GHookList abrt_hooks;
> -static struct sigaction sigact_old;
> +static sighandler_t sighandler_old;

This seems to break compilation on NetBSD (which you can test via "make 
vm-build-netbsd" on a Linux KVM host):


../src/tests/qtest/libqtest.c:86:8: error: unknown type name 'sighandler_t'
  static sighandler_t sighandler_old;
         ^~~~~~~~~~~~

  Thomas


