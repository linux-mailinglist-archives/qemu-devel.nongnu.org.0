Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826367F333
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZAF-0002iw-U9; Fri, 27 Jan 2023 19:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZAB-0002fy-U1
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:33:49 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZA9-00084V-PG
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:33:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x5so3138280plr.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bceFme0wvDbnZhOW7mvUZDJn6AR+mq1r2XbzWS5aS1o=;
 b=xbwWU7csSrnXJGKnoiQN1IusBekUp4P1A+3dTFA1wGXGm9tduw+CE9Jy+KZBZbPzuG
 cwDIpexfHq19EYZyzT5Fec+iADT1Zf1pr5X004KDPxfWTLtav0EiF4rzpJXflhshoDfK
 z/jmoLoY+VGgk5+jNqm1bIgmYKiPQm4r0cJerq8x4OPMju4FQCkzREc+crgZNP++gbEL
 JpUUzozSiVQMkO9c8k+YY1cteEZE14hfb7JOoo7htlWFJlNqBj7IcBhw1C/rLjw/A00X
 cV+bhnDSnbH5236Rnvbqi5rMLb4JxLg5Pdu52Zo8+o0C795s43QV6o/8bBaB5YdGV0ZM
 xi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bceFme0wvDbnZhOW7mvUZDJn6AR+mq1r2XbzWS5aS1o=;
 b=vQbDdT083ThlPM9cZMgNCeUFx4Fh8dVVk9+fJ8sozORjbI24arEI8LZZ8YYjCT+HXm
 UMUiZyXAcyuYBMoPRm4eNPoGc3y99PQ1GCVQcSlouGNzO8hEH8wtt3UuRd5gYYCxfGkT
 y28GZOqIBA+TMieBIGA9WsrZrUy5LLSZTYVq+aUYIFDKya70Eieo8A+grEwhHc+21I7p
 0YJ7xWPpX5JeIB5bhOY2b6OBDQsJpuUwURlWA9/E2A0Y4OXZFZjz8lM7femEeQplkyhs
 DB2tituyE6ehEX1uC2QUnuyNo1sxx2V8x53aYG6JGvill9OWVGsYQ0eIp6y+Piw0cuPC
 XhqQ==
X-Gm-Message-State: AO0yUKXJEV7erQKHFY1kPqlkyEx811gIl0hZ8UNc6hUOpoRnx6fqgcF/
 3pL7lYn7DNdyOCYfD29i8du5bw==
X-Google-Smtp-Source: AK7set/LRV5zb/U7VGjvn8n1Z/AyUWNk0TGaAhNEFKzffKaVGc9Q/fmVHTlqWzUJW2/OFN0I63W+Ng==
X-Received: by 2002:a05:6a20:ce49:b0:bb:9aee:f6d3 with SMTP id
 id9-20020a056a20ce4900b000bb9aeef6d3mr16147079pzb.46.1674866024062; 
 Fri, 27 Jan 2023 16:33:44 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 s5-20020a637705000000b004da425922c6sm2859419pgc.74.2023.01.27.16.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:33:43 -0800 (PST)
Message-ID: <5969a459-eb33-630d-447d-3481e3b2744c@linaro.org>
Date: Fri, 27 Jan 2023 14:33:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 13/16] target/arm/kvm-rme: Add breakpoints and
 watchpoints parameters
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-14-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-14-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
> Pass the num_bps and num_wps parameters to Realm creation. These
> parameters contribute to the initial Realm measurement.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   qapi/qom.json        |  8 +++++++-
>   target/arm/kvm-rme.c | 34 +++++++++++++++++++++++++++++++++-
>   2 files changed, 40 insertions(+), 2 deletions(-)

Modulo the comments vs sve-vl and use of more specific functions,

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I see that the KVM branch you referenced defines but does not implement this.


r~

