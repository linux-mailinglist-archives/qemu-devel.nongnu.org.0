Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E52E814E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 17:55:44 +0100 (CET)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv1El-0004up-Gr
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 11:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kv1DH-0004TD-AH
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 11:54:11 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kv1DE-0006Y0-OF
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 11:54:10 -0500
Received: by mail-pl1-x636.google.com with SMTP id j1so10228778pld.3
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 08:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CKfheC59BGt/6C8UT2qsOGgSTCopxYQWqnzmELqJLzQ=;
 b=Viio9fHIZ/ljdj0PcgUEMAcwYVskZS3487/IldWUDM8QWLqh2RSVQyIPhg5CDMZwUv
 kd+AltPDuWGo2AVdraVO0e45upbeYtq4ahtnzLVqDJ6jf/OGC6OYBLIgEMJwkSVGOrqY
 5UZknS+Z9zNZGGBPwyrH9iMyHHo50YRH6I5Q+oVtDnS2HvGSLRHx29TWtIpcCCMf0Dzd
 4eVUKA2Yr5KJ2uuUEScbYlMx+vhuEJwAefztQyokop5RdMBHUW6grHRetaPMAbThTQBg
 IblKWcUo1m5rZALyMBGYdlPrDZVdIH+tOvwrUz6sY6ZTGLe0HntwI9wJSWq8Z6+kQO+z
 bEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKfheC59BGt/6C8UT2qsOGgSTCopxYQWqnzmELqJLzQ=;
 b=shk11T+W7pcFle63rh/jsnlMl8NE0YIPs8OOgj+rp3eSHtJGs1MErk6DMFXf4tcfYJ
 ysFdH+fAUxKt+bYwJJDD3PpIHVjlzfEYtzQsCJ05KH1xI6sMpUkg6C2D+TIvRJAjkK9a
 pRyqqqGrqBT/mNsvA2lC2hojMQ3Sd7lXDkPhNH9G4HBnk+FjR+jI+Z4hG1EoNf2h4qXh
 7da/u6UiU9wJk5EVNfmMCZmrtBI8DQNNf8kPP0G7yWyW/E5E5TWQIfPdLeCxDWP7fBll
 kPCilviJkxyCl5vroz8L51eBvg9EOmcTitgdJJV2WfcLiBAGx8LW9oUIrAgnyggbUOp6
 iQNA==
X-Gm-Message-State: AOAM533Mlchyv3wh/MqE4z6b6n05RyNogwOxptMuC61tnNXJ8tKMyTs+
 zU4T4RtKCHJuJQ+L9uqg+bu5tv6rXo2UCw==
X-Google-Smtp-Source: ABdhPJyRwJgwN4gFb+0DFeSBeiVRVz8XhWYyhXP98HkR3DBux1k3q8Dd8hsFLYGdSFtqIEHo3MsgUg==
X-Received: by 2002:a17:902:7d88:b029:db:7aa4:864c with SMTP id
 a8-20020a1709027d88b02900db7aa4864cmr35687143plm.34.1609433647058; 
 Thu, 31 Dec 2020 08:54:07 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 gw7sm10902133pjb.36.2020.12.31.08.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 08:54:06 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-1-remi.denis.courmont@huawei.com>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
 <3026104.eZJBrJkB2l@philogene>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78facaff-d2b8-fcb0-bec9-537a84a3c3b5@linaro.org>
Date: Thu, 31 Dec 2020 08:54:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3026104.eZJBrJkB2l@philogene>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
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
Cc: qemu-devel@nongnu.org, remi.denis.courmont@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/20 1:55 AM, Rémi Denis-Courmont wrote:
> Le jeudi 31 décembre 2020, 00:10:09 EET Richard Henderson a écrit :
>> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
>>> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>
>>> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>> ---
>>>
>>>  target/arm/helper.c | 14 ++++++--------
>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> The patch does more than what is described above.
> 
> No? It removes generating negative values, and handling them, for translation 
> levels.

But the removal of generating negative values, i.e. the mask with 3, is clearly
tied to TTST and makes no sense by itself.

Maybe the whole thing is clearer all squashed together...


r~

