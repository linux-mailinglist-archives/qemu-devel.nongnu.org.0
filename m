Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65986344C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:54:32 +0100 (CET)
Received: from localhost ([::1]:45188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONp1-00046i-5O
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lONnh-0003It-HI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:53:09 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:33550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lONne-00041R-A5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:53:07 -0400
Received: by mail-qt1-x836.google.com with SMTP id 94so12874031qtc.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GZ6bmem4X/JYuDUXEGgF0WqqxO2+uoXRFat+sdKRWEQ=;
 b=O7Kdj7Zb4n0RGOkg9bypG2eTxUKq7lSVx7YvUlaSIKQ3zlpBHXVPZLu9Cs9WI0s4g5
 +h36LTa18msKhUbrqJ0aR699rsv8N8AlG6LNMM2MMvO/Vct8zcQoOV1CigA9NbCNBdWX
 YFOzya04PNHGJEE3RhPMTfaymDLMRVJpAMkwDa8EsEAtcTmqfDB0ojTa7/53Y2Oh8Mu6
 fxtBc03ny0n3jkG4jbp9n9Mc9BGdg8g6daz6EJc2tMPMKxP9xqflHM8EZ65Ud04UxJbS
 6v6+Dd/nYGyT35jGfl1rU07Q8o4FukkC/t7n1+PGb+VieNVgDCkzp3DVJsJkerkgKeJP
 Glwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GZ6bmem4X/JYuDUXEGgF0WqqxO2+uoXRFat+sdKRWEQ=;
 b=sfa5r/vXj6UqdiU26Q5CQh0890Iz/f4h8Hgu9QZagFUPxXaJlKntle9FghBHmZIPxm
 6lyoxrFGnT3tdJyk4+2JI9v+ApzCzS4gLH3g157i4gGM+1S1FO80l7VT1uD2l88+Brg8
 bYE0KXLm6hJuTOMHcD870JyjJdri9n2GhryNkFh6YJwwTZhzYtGUAldn4XxuRRjkeZVp
 f0KzxpYOnNfhMCK/JmxDqqV3gQqY484k61srIFE/A0mJMhYtf0dcqE5/oyeeRIdJytfO
 gfp+10Hpn60ngcxPHFj5i1Ei5sQA6PCBW5BZD2nVhHwKmJuFEY8A33a8LfGaMd4y36oZ
 20pg==
X-Gm-Message-State: AOAM531hWA+TOPmibkuojkS8JxFrVwy5A8CQyOj8tbyGu/9sn8OZUDSf
 TpTnpobYQPmhOL1xR8acRhHwpg==
X-Google-Smtp-Source: ABdhPJyxMqVyTVb9MLXym0YXI9V1NxeJ606x272SOLM9H5+wln9hoU17m161CHE7Fl1tk6b7E/OZIg==
X-Received: by 2002:ac8:5212:: with SMTP id r18mr766223qtn.290.1616431984438; 
 Mon, 22 Mar 2021 09:53:04 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l27sm3008090qki.133.2021.03.22.09.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 09:53:04 -0700 (PDT)
Subject: Re: [PATCH v4 03/17] target/ppc: Properly sync cpu state with new msr
 in cpu_load_old
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-4-richard.henderson@linaro.org>
 <d54aebb1-59b6-cea2-556c-4434845bf0c3@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1548d17-042b-3959-ac31-254fd0cc724b@linaro.org>
Date: Mon, 22 Mar 2021 10:53:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d54aebb1-59b6-cea2-556c-4434845bf0c3@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 2:15 AM, Cédric Le Goater wrote:
> On 3/15/21 7:46 PM, Richard Henderson wrote:
>> Match cpu_post_load in using ppc_store_msr to set all of
>> the cpu state implied by the value of msr.  Do not restore
>> hflags or hflags_nmsr, as we recompute them in ppc_store_msr.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Could we add a common routine used by cpu_post_load() and cpu_load_old() ?

Will do.  David, would you like to unqueue this one, or shall I send another 
patch on top?


r~

