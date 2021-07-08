Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D239B3C1733
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:41:53 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X5z-0008QS-EO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WG8-0004an-5X
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:48:17 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WG6-0000rw-Mo
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:48:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso5498856pjx.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/f1rmNXkPlatetwoWBvy9GGqKC2+Q6v6Nkw5BQ5lKZA=;
 b=KOKSi6Qz82s+rcrT4Kbg1hOok5ExEnAsSUcFmWH6JPosldf4uvY+Vz6iyJTsViEahV
 cJSnYtcT68k3opj0w15DokVXc472PEDa0aOxJ06h1fGl6Vpu6e8gvTbS/hP2YkQ3F+BA
 J6sMz57DENpKO7o9+EfJrgnDhyGHQck7s8NxCueMUzgJhW38RGfBQdbzPoZ6ZI5SO9rf
 J2WRl1zwt6OTVUnXBuM6KApdIbBGAq6FHfZXADNQ7Sp/b1Tphct8EdviX3DXMJAx1ocb
 loSgcjw5tKqrCkUNa7w/DTZFwFWkd2rHYaKi+NkOfvbJrrxpBnNjhNZO4K8FYq8VKFGO
 lHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/f1rmNXkPlatetwoWBvy9GGqKC2+Q6v6Nkw5BQ5lKZA=;
 b=oyQP3o+FodZN28lgxz2xb+Jrlq1zM0cY+41cbX9/a28W6LGBuD/q41lB01aH7xeuC7
 2TQSsACT3HE2uyvpb2agcAYd0QmasmpWLQHUe2X+0OtJNH5mtX3prTbn6tsfNY537Bl1
 UHxma5YhJfJTRnsj9L1i3nmRPc+DjZbgQ1FOltF/1/30yCQklnGfcLmLEdAV4QQDAXTw
 O9bwCo8LTNEMcYPK6YMIITT248/RPnVcP7VYrkFPff2JUVmG1s+zVvlGUUwyUY0eAR9K
 I0UORka7bSWiBYoauljmMPNa104KVj1CMaVtJ7gVMqwFaqwz30bgouU2jkw0Re5wLPqv
 FYRQ==
X-Gm-Message-State: AOAM531JLixtxErysKOAv8zSAe3WetjqgIY0YVX+N3RgAqyETzq2n72P
 gmWe3OCsoBRfBH4dkiuIt+GOEg==
X-Google-Smtp-Source: ABdhPJzhWTklDUmMUKqCYQJthLC/DlZqZb+vDZFk9c7So9sUWKkSXRgON+FwYQpHv3uJv1rj6qDgMQ==
X-Received: by 2002:a17:902:bb83:b029:120:512b:86c0 with SMTP id
 m3-20020a170902bb83b0290120512b86c0mr26653326pls.32.1625759293143; 
 Thu, 08 Jul 2021 08:48:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k10sm3425013pfp.63.2021.07.08.08.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:48:12 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] linux-user: Simplify host <-> target errno
 conversion using macros
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-9-f4bug@amsat.org>
 <d3d8214a-69f2-af60-324c-db4196ff7dae@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8567ef72-e1d5-6789-ad3f-fdefccd2a7d2@linaro.org>
Date: Thu, 8 Jul 2021 08:48:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3d8214a-69f2-af60-324c-db4196ff7dae@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:30 AM, Laurent Vivier wrote:
> Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
>> Convert the host_to_target_errno_table[] array to a switch case
>> to allow compiler optimizations. Extract the errnos list as to
>> a new includible unit, using a generic macro. Remove the code
>> related to target_to_host_errno_table[] initialization.
>>
> 
> Is there some performance penalties by using a switch() rather than an array[] ?

In many cases, definitely not.  The compiler does notice the identity function when host 
and guest errnos match.

In the other case, I would doubt (without evidence) there's much penalty.  The switch 
becomes a table lookup + indirect branch + immediate load + return.  Or a really good 
compiler transforms to a different array lookup.


r~

