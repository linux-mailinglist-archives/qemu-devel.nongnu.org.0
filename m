Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25033EF5A9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:19:05 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG7QG-0008Pv-PZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG7PD-0007YJ-7b
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:17:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG7PB-0007X5-Sx
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:17:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso989499pjy.5
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eftd/mW0n2jtT2bgs/6VuS0pVK3ms5OQWOYs7rMQZqI=;
 b=NGu1rVK0EDw0LL8gnBu41T10YvBHAmS/Rcn4r7GL0HfXomfU88uiG/2SQOWLeoaMEb
 axLYhtJxc7vESZXyq/iXKKUVR6RPFDl2NShyQgFAMKkZiUqO2A+YinJLZ3s9KhUZipei
 lKbX5MsgBQ27hdg/9C40vGPjka18FK0ShPn9fU4QY5vbGyft/ZHgrVF0j/MBUVzkjmTb
 M7dBKdCXKSgIGrwdN4o506rvQkbJ1G/y6T4t25+4NlMmVjMHIiGlJQ4jaDIq/P46gxq0
 6yeHgUjTrtfdb/PPaphpd3q1migGsFUSLTe4wIS+HzVpOq8WqaQdHSjG75WJlmSPbmUB
 76ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eftd/mW0n2jtT2bgs/6VuS0pVK3ms5OQWOYs7rMQZqI=;
 b=e98dxdl+//A5DKzhbExU1ObGvo0Ky9Atc+9lozWlkvL9Ly7PPv9INt97oJ8fY4QZos
 597S1cJebMqHvpDfh0p2VwHSmHOb3LZ3R1sLvX5qEbW+BD+NlFVtq6y2yhsupYwGv1bZ
 IKA75Ed1iEcthIuvFDP8Jbrn9ga86XXyiKynRC6CINniSd1+sal2mQQl7BsDzLKFcxuv
 dOJxTfBnl8SyaWCYVhu9olcT1XIgMMacQVZAbmoUM0AIuybe9/8Wf1YnRxRYhwzceLe9
 GIb9EO2MpK4HX4uxQd4MBB8rp8snBWeTVkV9ByQU/xQ6DbzqynMQMBvO6DkOYlM9zrRY
 qUmw==
X-Gm-Message-State: AOAM531mKzn3vRYtYgCgApj5ZyGnonCM4lKUsw0icUgeHstDE3Dn37RX
 ulFm1bc6MTfQY9th4FJ/oUngnJBlB0v3LQ==
X-Google-Smtp-Source: ABdhPJxozUGbTbpjnUgorrCh2vIzD10eCNmUaqpM6PW9Tk7kocOb1auOfXHFW3snddKphsvE9qXinw==
X-Received: by 2002:a17:90a:a016:: with SMTP id
 q22mr5899260pjp.34.1629238676297; 
 Tue, 17 Aug 2021 15:17:56 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q26sm3686046pff.174.2021.08.17.15.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:17:56 -0700 (PDT)
Subject: Re: [PATCH 0/2] target/arm: Implement remaining HSTR functionality
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816180305.20137-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d9fcc66-2551-e45f-6c0b-66314152f1b5@linaro.org>
Date: Tue, 17 Aug 2021 12:17:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816180305.20137-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 8/16/21 8:03 AM, Peter Maydell wrote:
> Peter Maydell (2):
>    target/arm: Implement HSTR.TTEE
>    target/arm: Implement HSTR.TJDBX

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

