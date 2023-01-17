Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5B66E329
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoZE-0000d4-Tk; Tue, 17 Jan 2023 11:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHoZC-0000cc-12
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:12:06 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHoZ6-0003oQ-OK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:12:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so5219150wml.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YSR0iQEwD9EgWKmRmAZGWn3JdFWBjFQQSIwNBvSDN5I=;
 b=a7XVmi09yzkfdXNR3IOmo1aG52mWS6j5hu+/JBLQWnWluza29G+BMPowNzq23v9e5q
 D53512AMWR4m7xFVQTD+wSW6TbIFv+FBMlWzLROOlXeUMvURvW9LJIilD3qX0dwT8AI7
 /HmyubwbBvkCPXOGH3Sq15PlXXfBXXrb7HctegwkGwsJ2jegq71TcewBmEWIJaipQzLB
 BCkGsSRDV1mrQlJTXm8nUVU/LM8DOxapR+XmuEHFC4+eyQn2ETpgAVPh7PBGv//yy8Qh
 cKPztKQubX6Xe5j1D6iVIvoZ8g37Ua11hevNKN6tbGx+UMnpT1GNXujTfJNg3bQEfjd/
 1EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSR0iQEwD9EgWKmRmAZGWn3JdFWBjFQQSIwNBvSDN5I=;
 b=soEDB5x15lgBpTVSJQuN+TOOpkokQop2w07NrdrOo8FD44gxkZ76Beog0WJz++vP1y
 ka7s+rfiLmw6oS3Zy+s7LSDGsYPLDYVPaIwsWxHcxJqRP0NEjgLtugZfTgGtp1EXxsBN
 XVQQFUfJg4Cxe2R//R73LP9xGlEJVt/90aV2Cdj+i5tGgAzCtVc30d1d3SrvWZFJwXoZ
 cG2OPBP7prOWHjBM0Ezk5/3lkIJNYQ/7YseEC+aB7Xvi2nM8lL6v+sgPebzg477TCuvo
 iQdCKQhh8tq9anVZ/I+J6c2kBa1JyQxIVKiuhoicHTBU6K6GuzjYQIvmmya+qKHZHR5N
 66Ag==
X-Gm-Message-State: AFqh2kohUlfGkmlLiqMVi8040hng9xQ1mZm+N/EE94hB6Qn9j82w2wQJ
 nR/6vSBqbSrRuiXCVXJBPCr/+Q==
X-Google-Smtp-Source: AMrXdXsgo9yFEU6A0YYroAAGV5vfgZow8m+xgYNMW7Lg2mzRtETwLcKjFRPHK/SwNmNgKNfdWUYELw==
X-Received: by 2002:a05:600c:4910:b0:3d3:4406:8a3a with SMTP id
 f16-20020a05600c491000b003d344068a3amr3613016wmp.30.1673971918918; 
 Tue, 17 Jan 2023 08:11:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a05600c3d8600b003d9df9e59c4sm34213553wmb.37.2023.01.17.08.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:11:58 -0800 (PST)
Message-ID: <7115ab30-9093-7cbd-e2a3-c57d3a1e7d46@linaro.org>
Date: Tue, 17 Jan 2023 17:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 04/28] target/arm: Move PC alignment check
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-5-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 13/1/23 15:03, Fabiano Rosas wrote:
> Move this earlier to make the next patch diff cleaner. While here
> update the comment slightly to not give the impression that the
> misalignment affects only TCG.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/machine.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


