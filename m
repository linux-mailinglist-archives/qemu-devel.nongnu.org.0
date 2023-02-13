Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E4694D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:51:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRc2N-0007DY-GK; Mon, 13 Feb 2023 11:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRc2D-0007BY-7e
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:50:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRc2A-0005Gt-NK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676307023;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjhdaFFgnmqHymwkmWoJkLQQlk8VxnXMaojuygbN39g=;
 b=KLoyPSXMyKfrE9/ZTCR4lY6vgFQ9tKxJRxwW9l8n2A8avFbYUkTasSAphXah3qyRZjebHK
 Y/x60kKMJkSNRfakcUQK4+WenagP5Jw29nGtbJ7c2gsBDBnzMuT3JvIzaBxCkFhSDqUaqg
 fMEWOFf/0qeLugvJjXqEXd2/76Ki118=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-6aiPHDmuNA6Tzs96KULh3g-1; Mon, 13 Feb 2023 11:49:39 -0500
X-MC-Unique: 6aiPHDmuNA6Tzs96KULh3g-1
Received: by mail-qk1-f200.google.com with SMTP id
 s7-20020ae9f707000000b007294677a6e8so7825380qkg.17
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SjhdaFFgnmqHymwkmWoJkLQQlk8VxnXMaojuygbN39g=;
 b=qwhLG79bE5oJc6VWao02FdEhWOeOoBBG5xLtuJo4f0ugeGYjaJ1xNrP3pgDhWICyaQ
 GL3/kd042LIwzknp4mw+T8XvRrTYI9LWvxro9KBbL/9z6btfwvNiMEfJ0qOP36cQX0Ko
 iPDw9r0D+UxkJh3du2wMGNBsii4BqXH1m6B81k5pgE7J6zxrVRfxZHV75AIyD9YK66M0
 m+0XxNtLh/ACNjp3IaGaoJTn97/r74cCH5Ab/eVQwDlUaLwcAH/x+wI3sSUXJuJRuUga
 yi46ryiJrU0L/WT8SNXWJZynfZffNXrLTesobBrdNIuiULhetHJtf/AKaq5PZGAgQb0g
 PN9Q==
X-Gm-Message-State: AO0yUKVY+53JDGJvlX8LCaFc3jcw1fBRf3W9f+COD2kKGqJNtj7O4Fiu
 RtPhKPyCz3FdzPl3GsxKpU4pmcfyj9bRkt7uhba4jp8Gk+Gfs5P8cfxcFIMyf3/MPuEh31dK3Z7
 ajBUttq5ymsg8roc=
X-Received: by 2002:a05:622a:196:b0:3b8:73c:15e6 with SMTP id
 s22-20020a05622a019600b003b8073c15e6mr46266005qtw.18.1676306966657; 
 Mon, 13 Feb 2023 08:49:26 -0800 (PST)
X-Google-Smtp-Source: AK7set97ZVCGlPTla3gCFCQR645p8RMYSHYpb5fLYeR284IBjSyZO/iQNQTABZhMMxjQ3N4b33HACg==
X-Received: by 2002:a05:622a:196:b0:3b8:73c:15e6 with SMTP id
 s22-20020a05622a019600b003b8073c15e6mr46265970qtw.18.1676306966420; 
 Mon, 13 Feb 2023 08:49:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac84e1a000000b003a5c6ad428asm9395954qtw.92.2023.02.13.08.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:49:25 -0800 (PST)
Message-ID: <5c61304d-d41e-3da0-e80f-31747db8b996@redhat.com>
Date: Mon, 13 Feb 2023 17:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
 <2de9abc0-8354-0cc1-dedd-5d4692afc54c@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2de9abc0-8354-0cc1-dedd-5d4692afc54c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mostafa,

On 2/12/23 00:34, Richard Henderson wrote:
> On 2/10/23 12:19, Mostafa Saleh wrote:
>> +static bool smmuv3_gbpa_needed(void *opaque)
>> +{
>> +    SMMUv3State *s = opaque;
>> +
>> +    /* Only migrate GBPA if it has different reset value. */
>> +    if (s->gbpa != SMMU_GBPA_RESET_VAL) {
>> +        return true;
>> +    }
>> +
>> +    return false;
>
> Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

With this suggestion, it looks good to me.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


>
>
> r~
>


