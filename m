Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808B457BAB5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:43:50 +0200 (CEST)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBrZ-0008MO-DL
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBnJ-0003YH-Dx
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBn8-0007xK-Eo
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658331553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X62KeXFAnDPdRwDCU1eetsAZZGnqdbIq56S7afuXvZE=;
 b=dMFEAsx7xWioLOfboZtSfs1Wk6QqpXswM1UwVkXqRsPisbylL2YBuwt3JnIfbwn8Aaegj9
 15bA4sqfLs9r42nysQSqOUTrFSodQ2OUSOXkLZItN0oT1V6QWA4Tr0jH636BhtRFuHbKRF
 3FnxPseeFuPZ7BTGItiiafvs+upEH+E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-8PluwaEWMSy9_TL1rJ9MrA-1; Wed, 20 Jul 2022 11:39:11 -0400
X-MC-Unique: 8PluwaEWMSy9_TL1rJ9MrA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h189-20020a1c21c6000000b003a2fdf9bd2aso8546656wmh.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X62KeXFAnDPdRwDCU1eetsAZZGnqdbIq56S7afuXvZE=;
 b=tQ5kNo3kuLdpA0/4blYc8qCRXskLR/CGERRnxQcUkWLvGmobVNxuXs+kaPxd4wIjRq
 6w1vTyq8/CpoF5bccG20XSJeYesaVvuONtYux2IHD3LRaTeIYxpAklzVbxAYl01u8gKg
 yRAXHvmN1THOtJlfX5r1r1K9kI0coF1fVM1nnXPrk4Np8o+Rs+MYNVeo5Ug6OMlmEZBL
 Pq9jfU4S92G+5gnW9VfCyx0p7q6uuu8ZWY75mDJ2EQ5Mk0I/2cS1KcoCiK1fB813KCoM
 6yLDJ5n8859vWpHpxoSFbjDM7w/3SksNcrFpzNIQHs8bic4zN1CYap1RYJ85TaDKSu19
 lkBw==
X-Gm-Message-State: AJIora+gWacVg9Mqn9f77lBOy58qT+7/B1kklfH+YJ7LgNarH6nyPwap
 OT9cW0J2/aeZRyMYMnNNoLN0oX98zyTQykHzEQrInwFgD7xgfvsPdy0Le/CEC16R2qydAfyrBi7
 JU9O7zxI04pO/vjk=
X-Received: by 2002:a5d:47c6:0:b0:21d:97dc:8f67 with SMTP id
 o6-20020a5d47c6000000b0021d97dc8f67mr31981364wrc.372.1658331550274; 
 Wed, 20 Jul 2022 08:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7Zcy4iaiJyUtfNh5mjYHE8CJIzAYrp/H06uI2gd9VKS1gzHWZBuDGOUnq1nkoShbNLX6e6w==
X-Received: by 2002:a5d:47c6:0:b0:21d:97dc:8f67 with SMTP id
 o6-20020a5d47c6000000b0021d97dc8f67mr31981358wrc.372.1658331550086; 
 Wed, 20 Jul 2022 08:39:10 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b003a317ee3036sm3942163wmq.2.2022.07.20.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:39:09 -0700 (PDT)
Message-ID: <26c89926-5d96-bb9c-130a-2e5052de1a1e@redhat.com>
Date: Wed, 20 Jul 2022 17:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/5] configure: Avoid '==' bashism
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-6-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720152631.450903-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 20/07/2022 17.26, Peter Maydell wrote:
> The '==' operator to test is a bashism; the standard way to copmare
> strings is '='. This causes dash to complain:
> 
> ../../configure: 681: test: linux: unexpected operator
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index d0e9a51462e..2c19329d58c 100755
> --- a/configure
> +++ b/configure
> @@ -678,7 +678,7 @@ werror=""
>   
>   meson_option_build_array() {
>     printf '['
> -  (if test "$targetos" == windows; then
> +  (if test "$targetos" = windows; then
>       IFS=\;
>     else
>       IFS=:

Reviewed-by: Thomas Huth <thuth@redhat.com>


