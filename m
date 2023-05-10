Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3ED6FD776
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:54:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdha-0005HU-LA; Wed, 10 May 2023 02:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdhV-0005Eo-4b
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdhR-0006Ql-VH
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683701600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8gU5qEphim6PTuiCIdnH8nGYKsNoTBmHxeAGcULDF8=;
 b=BzCLCa4F0C3vCGFLYUYHJBoGibMWxlwgfANOTPh6X/pdS4SS7VUfHqiycN2vt1wYkutLRH
 gcrWdnaPqwqXvYslQb/qtHG2lH7QqhBOAbHA26jCpY80Iycz6bRwhDpAR+yJQWYIhEFArD
 npnOG6JhxkzXPMoL+GHuEsBmXnJh6DM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-cMCMoAkkMMqvPanWVPpQ3Q-1; Wed, 10 May 2023 02:53:19 -0400
X-MC-Unique: cMCMoAkkMMqvPanWVPpQ3Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-96a2ea9c409so28350966b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683701598; x=1686293598;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8gU5qEphim6PTuiCIdnH8nGYKsNoTBmHxeAGcULDF8=;
 b=Yqkfyn0We6koHGTbquvHHXVA6HGzZG2T8+H4s8mw+qbiamViJQb8jeoRzu3UAfn2tj
 II0BbGq4JO78eukBXRQjQntidJ35AJ6v8RtJfY1RKm0dCo2cjdmBaoPR7IIRZdRcnUNC
 kbnAvpepEBlBVTHmhxq6KtCR+HantjsAgqoBtYmASgZwLCZ9YKwhMGEhi1A8PW9/4c5Z
 HWIE3gZ0yWLZeR+T5jmOTdrfbcHG94sTzwPAxohOpMzqthYNPtmREBot6xvvdaPMHQTr
 VzUcX3DLPjYAN3eszcb0IUoAW64/aS8lPl1zt9fwqfjqVIyLQQebfHAIgRE63gAt0O9T
 9lwA==
X-Gm-Message-State: AC+VfDyRggD6qyAjcIE939nmfekBBPeEOzU39qgoC6CqHVfdXwDb9EV1
 KCV70agkz5xOgSDlkC9cuhd7mhBZiwEoq4c8DaL+wJHeXTan9rgDBGnKjl/3a9YEDWWpFP9i2TC
 mTLerpX4JXiDJfqj8bDuX0AQ=
X-Received: by 2002:a17:907:3e1d:b0:94e:dd30:54b5 with SMTP id
 hp29-20020a1709073e1d00b0094edd3054b5mr16787097ejc.6.1683701598580; 
 Tue, 09 May 2023 23:53:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5C1HEzw9J1xza4THCNCsE0beiUkn5eXWgbRNGM7W1J/e9lONBQ1jBWcelKXEPwb45t722Row==
X-Received: by 2002:a17:907:3e1d:b0:94e:dd30:54b5 with SMTP id
 hp29-20020a1709073e1d00b0094edd3054b5mr16787082ejc.6.1683701598264; 
 Tue, 09 May 2023 23:53:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 gs13-20020a170906f18d00b0095ef7268ba9sm2242912ejb.41.2023.05.09.23.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 23:53:17 -0700 (PDT)
Message-ID: <b62ab9a2-fad5-313f-518c-29626b0d57c3@redhat.com>
Date: Wed, 10 May 2023 08:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] disas: Move disas.c into the target-independent
 source set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, philmd@linaro.org
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-6-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230509163326.121090-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/05/2023 18.33, Richard Henderson wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> By using target_words_bigendian() instead of an ifdef,
> we can build this code once.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> [rth: Type change done in a separate patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
...
> diff --git a/disas/meson.build b/disas/meson.build
> index f40230c58f..2ae44691fa 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -13,4 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
>   common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
>   
>   softmmu_ss.add(files('disas-mon.c'))
> -specific_ss.add(files('disas.c'), capstone)
> +common_ss.add(files('disas.c'), capstone)

I guess you could drop the "capstone" here now since it is already added to 
common_ss now three lines earlier.

  Thomas


