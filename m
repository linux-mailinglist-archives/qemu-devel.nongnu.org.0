Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB4534CA7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:43:47 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuA1y-00024z-0l
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nu9zP-0000F2-5l
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:41:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nu9zN-0004lX-Cl
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:41:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p26so1135383eds.5
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQ9TdDmvndRifu9Q1AzU0IyDm+RfYCESOWzT60Epzos=;
 b=e+PbGzppUSkqX+5ssCWX1qs6cfUjoSnDw085Uwf7xljUWJ6p8xh9PuPDjKF0NJ4ncP
 HoW+YW0Kcxkti21AS3iPWgKjpLPnKC31HT21GtuFc8UjCdjieqIlhdfEzCs77Pkr2BSY
 Szn6RbuVBrLF9ETvIUr/9Ly3XzdPPRKRL4QbmSkZDrvAw8zaAxaaPAYS+d2Zm8HLiObH
 Mvj054MtIXnh4+rHCkqM7JaooJscjyp/gymR1ibA9u1NQxINEhZlxkwe0zqUAgBuofWR
 mOc4ez5hqt8fvYnPoMlUXl3sGrWIavzC3GtHEuG/5tjTCRhYm0qMJkhQKtw4fYLYYt8U
 jB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQ9TdDmvndRifu9Q1AzU0IyDm+RfYCESOWzT60Epzos=;
 b=WJW+amuwdHZugs7OZ339Wz7fI/zayl24+eP8cowIJjJaxtDORqklPbEMfgs8apUk5I
 1Lwx5BYG5bItYKf46Zj6tgfcMPyeK2lnU67XRPDA4XSyEyeLeUwUM5nTpsyJOa9+35s5
 pZUlWohwQrEGZe83UlDa8VegUQsn1sEETrWdFPLeFrsmSqglQuRvDF5P2aM5FrU4EViC
 s6tRQm5agaKuDtu50IK2wF4+VAiEGIQJQzjHgHWn579opig3yBWCrh+yL/nsxQ9D1SbW
 kqldNWWs743DCbehlABgubP/HkFsnJyWbff5SzIk503GNYJGJGDkdEQSALGSCCWCP/6U
 KBMQ==
X-Gm-Message-State: AOAM5335lKZ/yz3NFZMISG2ORZcAaykOrxFlzljeNzPPme3KMU/rajVm
 c4Uemb7mA6fcnmaIrr7Endw=
X-Google-Smtp-Source: ABdhPJxZf9m0IK1WgqskJrfs2DvBB25Ka771Tt7evRArj8Ndv2VGcTXVDPRhedh/elQwKOlSrFiVcA==
X-Received: by 2002:a05:6402:5251:b0:42b:3574:f1ee with SMTP id
 t17-20020a056402525100b0042b3574f1eemr29745668edd.269.1653558061404; 
 Thu, 26 May 2022 02:41:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 w4-20020a056402268400b0042617ba637bsm607807edd.5.2022.05.26.02.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 02:41:00 -0700 (PDT)
Message-ID: <04b4715c-e5e8-038e-e3e1-179ff9085d3a@redhat.com>
Date: Thu, 26 May 2022 11:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 4/9] replay: simplify async event processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, crosa@redhat.com, f4bug@amsat.org
References: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
 <165355472374.533615.18197241124455918315.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <165355472374.533615.18197241124455918315.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

On 5/26/22 10:45, Pavel Dovgalyuk wrote:
> +
> +typedef enum ReplayAsyncEventKind {
> +    REPLAY_ASYNC_EVENT_BH,
> +    REPLAY_ASYNC_EVENT_BH_ONESHOT,
> +    REPLAY_ASYNC_EVENT_INPUT,
> +    REPLAY_ASYNC_EVENT_INPUT_SYNC,
> +    REPLAY_ASYNC_EVENT_CHAR_READ,
> +    REPLAY_ASYNC_EVENT_BLOCK,
> +    REPLAY_ASYNC_EVENT_NET,
> +    REPLAY_ASYNC_COUNT
> +} ReplayAsyncEventKind;
> +
>   /* Any changes to order/number of events will need to bump REPLAY_VERSION */
>   enum ReplayEvents {
>       /* for instruction event */
> @@ -22,6 +35,7 @@ enum ReplayEvents {
>       EVENT_EXCEPTION,
>       /* for async events */
>       EVENT_ASYNC,
> +    EVENT_ASYNC_LAST = EVENT_ASYNC + REPLAY_ASYNC_COUNT - 1,

Why not unify the two enums into one?

Paolo

