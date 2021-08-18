Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5433F0E41
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:36:40 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGUAp-0008GH-UZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU9A-0007P2-Vz
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:34:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU99-0001iO-IJ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:34:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso6050516pjb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KAGdQV+ismaIDXwhFeZdEHvdIemIi1LZHinOqqZVrAA=;
 b=Jjbu3wMa8DFzicQKA2ENsE08yBoh5hK8kqGD3/7vMkV1vf8ImDnfz3nhEBkWD9ZzPJ
 5Kn02tdWIuljjc8a1tRF6D0YbpUV+qHQPAVrmMI8iv+LM7RL1Umwimbu7swNY93aLWI0
 5xxRPOsKnBwdoHuiEonnTOWPRPkXQ8zAEVep6a3k7QoCpFRZLHwnBN/K37v7eGyPot4/
 jvulC80uox3exkqPj8q+QPr5/Ltbt94Y/YsiXPxTnS7y9CVyAXEc1dO+2z+q5STT75s4
 /rwCnsz0RnRaeEBWhstOHkoh94Gi07zCHH4y+JCejFXQg7Dyf3ERIT1udm/9pJkPDK4g
 fh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KAGdQV+ismaIDXwhFeZdEHvdIemIi1LZHinOqqZVrAA=;
 b=a1lDGE7IanydTktPKxwMPU+W6D+n3X6DDxXUeQbQN3Pd6knd6LQF8Og+ufXahchVwI
 MKAZ6wkXlQnljqUBb8fAJjR1FepGZglelnhm7dtUbHlf09vYf/UFtHValhpCcVGCEEbK
 1yQzuz72vP44OhhznhMOaHzpiayMjZPsOudm3K5ABDWNxzoF9ZxW0ltqL5HdDg/doHxA
 LYUg60LrHuYGmA0CgiPka+JPC9BJI8gur5099nVu6JZQxW8oZtQy0fNIrlkCJK9WuqPq
 k0hAIS6VXi+VluiSeZ277Elj5C99y0BToEUwT/iA6LWwnkR7F9bu5o4If1KF26ThVe/2
 HCLA==
X-Gm-Message-State: AOAM533XcRK0u3yyTPJ3GHInORvMqL5gn2G27FRYwIPUQVRDtRPWoO5v
 DV9xCK9q8U0+nSBW+cDlBMQXkw==
X-Google-Smtp-Source: ABdhPJylr6HjNIVzNq0a+PRkeCrV7ohE+cSL2e+pKGW7HOzuQZU6rgO6y81hT8zLNt6qbJee1y7T1A==
X-Received: by 2002:a17:90a:bb13:: with SMTP id
 u19mr11386827pjr.42.1629326092922; 
 Wed, 18 Aug 2021 15:34:52 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id g6sm804271pfv.156.2021.08.18.15.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:34:52 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] target/mips: Call cpu_is_bigendian & inline
 GET_OFFSET in ld/st helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818215517.2560994-1-f4bug@amsat.org>
 <20210818215517.2560994-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9df60ab-094a-6136-4997-75ffdc9a4211@linaro.org>
Date: Wed, 18 Aug 2021 12:34:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818215517.2560994-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> The target endianess information is stored in the BigEndian
> bit of the Config0 register in CP0.
> 
> As a first step, inline the GET_OFFSET() macro, calling
> cpu_is_bigendian() to get the 'direction' of the offset.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/ldst_helper.c | 55 +++++++++++++++++++++--------------
>   1 file changed, 33 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

