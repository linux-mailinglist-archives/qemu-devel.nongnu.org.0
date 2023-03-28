Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0BE6CC7B8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:18:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phC1L-0001KD-CN; Tue, 28 Mar 2023 12:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phC1H-0001JY-M6
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:18:00 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phC1F-00081c-TO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:17:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so7864496wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680020269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R8EmK8b/UUvFF1czHtA7qxXZAum1aFEYX/gMIAClAtQ=;
 b=ktbB9yPaWxhjJc3I/ycGvdMPagmVfWglWeLnaw1828yJyr9F+//smCY0s/uAzIOjzd
 VzDenBpS9NZPTf/b+PZxhOXH8lLvfIIDtzqi/9P1CY1liF5eawjX+/DWjbCAy7jpXie5
 vGdhcYa4heESj+dsQR0NGv/cJOaOkPSycohBnMHA7NzbxR1XsqGUV//SIJA+Udq7Ui09
 HENvNvc/RFRFpi8mRAwrbyfCFOFGtpV+zPfjjV0HW8Un+fOlPWnxbncZa7a9CDNTi7si
 2E079RC2UPCLw+JrVzLFqF8dUbETQTM2v4iB+/Zj0OEnlc2WHZuaZgZynu0wL/zNG3Gs
 DcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680020269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R8EmK8b/UUvFF1czHtA7qxXZAum1aFEYX/gMIAClAtQ=;
 b=0Y+3Wy6vxXxqk5nb2HnnZITC95qKsGtjtR1djLEBTTjkn6byuW739T7cQLUDzZ+5Vu
 lW5CYqKZA0MuHCW8PVr7gbFZAFJXn2GQXbPZejR+Oal1MPoMIHJCEZxfCKkQ0+so6Lyg
 Fl1G2306IzOnsSj6xZlEYd/P9zq8r1WJznncIOZrizolsls2fgNxWMHTm4hbObpMsTRT
 SPJ9bFlKFLvKazC1yEvDKGxGfUGPnAY3XAVwOUkUwxH+4G1Pw3Z7GUviedTdC5Od8xbS
 jCEc7rYTUval7dfz+kdlXVgUyEkEfS0+DO5rODKxq971g4+wP6MNfmvEYPRdkhSJtcuI
 vvPQ==
X-Gm-Message-State: AO0yUKV2Q/Ls0NWlR+gvUhy1G4xc6h9+76my59omz3wxhkr4cGufJ4Xh
 uyROFbqTHM2GZTCSiRN1vxEKDg==
X-Google-Smtp-Source: AK7set+lBxYMxUFHIVufa60m/PERWBjRJ6DTuq3PwF1VU5SseLZ41SpuLTUru5fpKV4ay6hvkZMJyA==
X-Received: by 2002:a05:600c:21c1:b0:3eb:3104:efef with SMTP id
 x1-20020a05600c21c100b003eb3104efefmr12755736wmj.31.1680020269636; 
 Tue, 28 Mar 2023 09:17:49 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003ee6aa4e6a9sm13273419wmp.5.2023.03.28.09.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 09:17:49 -0700 (PDT)
Message-ID: <655f6b11-9463-d067-07fe-27773ebbed58@linaro.org>
Date: Tue, 28 Mar 2023 18:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: qemu 7.2 stable release, 2nd try
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-stable <qemu-stable@nongnu.org>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <4e79a438-778b-877d-d3dc-ad05cbab88cc@msgid.tls.msk.ru>
 <87o7ocrj26.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87o7ocrj26.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/3/23 17:28, Alex Bennée wrote:
> 
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Hi!
>>
>> After posting an RFC (due to me doing a stable release for the first time) and
>> getting exactly 0 replies/comments, I'm a bit worried, - does this mean there's
>> no interest in getting 7.2-stable out of the doors at all? :)
> 
> I'm interested - although Debian already has the "latest" stuff we need.
> What do you need though, re-reviews or just simple Acked-by's for the
> included patches?

Michael Roth was also sending a patch series before tagging
(although not RFC). My understanding is to check if anything
is missing from the picked patches.

