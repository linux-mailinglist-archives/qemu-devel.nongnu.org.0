Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228C67F334
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZAq-0003dM-03; Fri, 27 Jan 2023 19:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZAn-0003a0-Vh
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:34:26 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZAm-0008H4-0P
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:34:25 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 nn18-20020a17090b38d200b0022bfb584987so6261483pjb.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+riGDnnTyCKxHbDh4Xpce9MLdZMG/QvSswxcb+9gc7Y=;
 b=lXBj7jxvCYOKTcwGkZhrwsGk6TcCucB7XN0oMuUibpT4LW76jgLETC3TnOIhJph3j3
 pT22RKjnxJXslki3dqjkV7uV0S0ox31tuImRlR2LItauCPBmJghkhH5timCAG3VU9zm3
 +MFEb8cD+wmge5eoCqz8VW+o973QVjYn/jfHziGX6yZFcJy/OjYJpxmp1N0XXjVfXUxJ
 WKAak+shtntRbUyuD9BPxZsmU+/p5IQQ2sqovsLT6TELE5zJYpRLSwdEF5kCYq9VTLGM
 JRzqN3PPWupQKCkCTnxSUW1Im5T0zuif5qGFyMzba7wq3N3BOWIgwpOhnJKKyIFG2f/6
 5qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+riGDnnTyCKxHbDh4Xpce9MLdZMG/QvSswxcb+9gc7Y=;
 b=iV6EbcdmWB3GHQ5K6iGTDPPOyLi7924mNvWUY5ZZP6DwzycEqUJQQ9UeHZUwNuq3rw
 8/gH4rRRdm4cf9sD4UxU1aICSnxeccyW/y33+/P3FXcCmkT7g74fG4N+YA9E0Fr+aEHE
 ZsM+x8BtsQrMV5qXXUUjMDRVxVN9EW+bNnaYrDADSiUcHPQC3HK23xQdJSq05DrFIWfg
 YvZCOSliYO95O/+pCKvNUaBpiMopajm2ndXvD7jTF4Fi+Gz1ojgITaie0MSnIusu2l2g
 tkI9K0C407emhdSWUW/zZvl7tRJ4R+Fpr3wGMs9gTHpB4Hb1RdAgDBu6BlAwgmpI1kXo
 NA0A==
X-Gm-Message-State: AO0yUKWtaWaDxWF7Ztppqp3W6yGgnhwBjQFfo94byxuudmz5u5DYmhfD
 E2c1PrtzUtzX+vRQAEOhjtoKXA==
X-Google-Smtp-Source: AK7set941AapHrHLUFx2RVTASspmx1IWxBGT6ge3/6nF4urcTVNg/fFtuTrifVUKy3hl5nYg1B55FQ==
X-Received: by 2002:a17:903:124a:b0:192:ad82:dc98 with SMTP id
 u10-20020a170903124a00b00192ad82dc98mr248321plh.34.1674866062467; 
 Fri, 27 Jan 2023 16:34:22 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l10-20020a170902eb0a00b00196503444b0sm2226532plb.43.2023.01.27.16.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:34:21 -0800 (PST)
Message-ID: <9c2cd343-cac4-3944-0638-2a3e9d7f49f6@linaro.org>
Date: Fri, 27 Jan 2023 14:34:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 14/16] target/arm/kvm-rme: Add PMU num counters
 parameters
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-15-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-15-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Pass the num_cntrs parameter to Realm creation. These parameters
> contribute to the initial Realm measurement.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   qapi/qom.json        |  5 ++++-
>   target/arm/kvm-rme.c | 21 ++++++++++++++++++++-
>   2 files changed, 24 insertions(+), 2 deletions(-)

Modulo the comments vs sve-vl and use of more specific functions,

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I see that the KVM branch you referenced defines but does not implement this.


r~

