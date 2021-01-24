Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E088301EE9
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 22:25:34 +0100 (CET)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3mt3-0003uG-FC
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 16:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3mrr-0003TK-HK
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:24:19 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3mro-0006yd-0R
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:24:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so10354757wrx.1
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pxPM3BUwktffJZMuidDQRZab2FM5sGOxGs+gXEVw228=;
 b=KXsQmYVZhwOMzscv+x30d5HSyjy5VNlizziEWg4ovnOcoqcKA0oVO5vJGebjuDN/BR
 o/ihJE5fHMgwxvmM+QwMbyHxS8bfghEqJH6c02D76LsfAyDxUaPkFjHiGcmI59Ovapxm
 qYLp9/jprPMlW9ZlXaHvX6RMvZ0/9/2eJpmOJqB2phnX25MYbOD5ZYs4zvxfprsQXQ1Z
 ZfkQCunZTxy450l04W5Ruqf9cU/6/fhPXjm8rWowgZzXk2R0HHFbAIl6XtsPHWiUqNnr
 EXXxSTsn30PnsEqmIU0OB4UXzrhBMpWyy5+j0LvwUl4Hy9iJvQTlGGr/6itKjj2gA5cR
 +heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxPM3BUwktffJZMuidDQRZab2FM5sGOxGs+gXEVw228=;
 b=q7luDvFrv7ZpY1sMjLl8HKPKVbcFcRe4MhKi8iEFFatmx6ExGlTcZ4Dtn7Tbjf8qUk
 NRaUnqKMe/Ilv6BiEJOUuFhM/jQQ5U03VPUT9uP+SmUIe6eLaefixRTapR+XgY69inuM
 pbx4W7HtJHGIfDDUJ8R/93GYj7Zq+oOMf70wMuDfRM/v6dBC9U33PS6fpRFHTCZs2vWv
 h97I7FcM+NG4dbOlNQjmDE1La5hGzLLn1pOtVq8+43myA8A6AJEOY0SD9XjTl3oNgENY
 iIY4aGC/HBsIBFFVb8zP+deGoo2k9bMk5J1Zz/DKjk6QlDcEOll59v1WlG4SI1ON6qXU
 9fIw==
X-Gm-Message-State: AOAM531XnumhLCI+MIIMGkLtBPwOZZ2GDeeq8xNUUZx85CiWm0r0+fBl
 qFCLrfVgAoxeXADT78sxOOg=
X-Google-Smtp-Source: ABdhPJzsI7V2Ezebs5tsGWgOxu//KYvbi3ylJWB4f3l42UaEp+ui/OdnqYZ25KAKdTcGYQLu4iYc2Q==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr2804519wrr.69.1611523454354;
 Sun, 24 Jan 2021 13:24:14 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u3sm22591832wre.54.2021.01.24.13.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 13:24:13 -0800 (PST)
Subject: Re: [PATCH] configure: Fix --enable-tcg-interpreter
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210124211119.35563-1-richard.henderson@linaro.org>
 <d4c96584-430c-1f34-95a7-0d05808c9370@linaro.org>
 <21318b73-a3d0-1c48-5c53-4c85b4d51899@redhat.com>
Message-ID: <5c685f0b-5d12-b4e5-241e-22676fe966de@amsat.org>
Date: Sun, 24 Jan 2021 22:24:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <21318b73-a3d0-1c48-5c53-4c85b4d51899@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 10:20 PM, Philippe Mathieu-Daudé wrote:
> On 1/24/21 10:13 PM, Richard Henderson wrote:
>> On 1/24/21 11:11 AM, Richard Henderson wrote:
>>> The configure option was backward, and we failed to
>>> pass the value on to meson.
> 
> o_O
> 
>>>
>>> Fixes: 23a77b2d18b
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  configure                | 5 +++--
>>>  tcg/tci/tcg-target.c.inc | 2 +-
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> Bah.  Of course the tcg/tci/ hunk is unrelated,
>> and snuck in with a git commit -a.
> 

configure part:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

