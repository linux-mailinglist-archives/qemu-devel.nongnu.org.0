Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC84398FF3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 18:29:20 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loTk7-0003wH-AV
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 12:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loTiw-0002XH-8Z
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:28:06 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loTiu-0003Ml-Jr
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:28:05 -0400
Received: by mail-pf1-x434.google.com with SMTP id g6so2615431pfq.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3FE9Vr348M4JNOzZzwjWmfKOommZ6lFk5XJoriAEga0=;
 b=ijZo8DINauZfbG7uWoggwAtGPc8yMPaNyRlEr/kNM7sca/LTbKpnb0wAWgaY0zk7mh
 dFj3RdrykCVrflxqgIFgjaBGrYtugCP+Rrub9flzpdkhNDjgv4X7wD1vlvNqqUgv4Qli
 DVoSgHvlBgbdUjz8mWd0NJr/aCXy43FIs12KZVDLVD1bisuKdN5SqECbhQUv82szZs7M
 EZfLW3ybytagbCOcs78QFD73AymAKJgrIOxaBh5sGqDnSnxjDGNIC4hM4dlVZR2L5SeX
 1CNoVVm/MhO3g9SEVpBHLbHtn6voa3RayloikcEMU7VriK7w7qA29rs92EdCg+gU0ZN3
 3DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3FE9Vr348M4JNOzZzwjWmfKOommZ6lFk5XJoriAEga0=;
 b=pXPEityoWvyjODkVRJUedbxOUbFhyk4Y37tUinSwsmhbnC7LdOirFrghy6miRD9Xuc
 HuLXVe+fSRy0F179JOvv4FYpRE+D5kGacSnKCl5QcdHb+n7EAGkSb22v9HQe7nvXeWbv
 fPXiQuX214Ng8zGMQNbpZsHKfmU7KrA6z70HniwHN7rDy2S0v8P1HxZnYscEUGOYUPiJ
 oaizTX9iJGqRntOV5g5jxTuTEXd3RbCZ5lSVy6AMunNxe7izoKHGawsyUEh4Ub8z/RyU
 lA2Y+TTyr9kC4sBHcwma8GsTm+eEYo8xQUSvQs85Zky3f0Jb9wrLE8tNhD8l+ZwNo7X+
 Vx9Q==
X-Gm-Message-State: AOAM533Ox+qeW+FaYlGR6vwiFolQGPeCfDSwq0fEsfO5mJLAkvvSro+Q
 ykJZw/HJVqcAjD1S85DeZuMjQQ==
X-Google-Smtp-Source: ABdhPJx/kjnqZHAlWaMxpK1tw4UgkJH7pgfDW3TsZ9n9xSyPbM+dWKIW9JiYP9p6OgdxmDuzMuiJBw==
X-Received: by 2002:a63:bc19:: with SMTP id q25mr34845271pge.211.1622651282909; 
 Wed, 02 Jun 2021 09:28:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n2sm244840pgl.59.2021.06.02.09.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 09:28:02 -0700 (PDT)
Subject: Re: [PATCH v2 03/28] softfloat: Move uint_to_float to
 softfloat-parts.c.inc
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-4-richard.henderson@linaro.org>
 <8735u0bish.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8353d16-9423-575f-63ff-8edbc05d2ac7@linaro.org>
Date: Wed, 2 Jun 2021 09:28:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735u0bish.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 4:31 AM, Alex Bennée wrote:
>> +        scale = MIN(MAX(scale, -0x10000), 0x10000);
> 
> here but it does seem weird to have an arbitrary limit here
> 
>> +        p->cls = float_class_normal;
>> +        p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
> 
> where it's really a limit on fmt->exp_max. Are we just limiting it to
> something sane and relying on the eventual repack to detect and overflow
> condition?

Yep.  This is before and after, mind.

r~

