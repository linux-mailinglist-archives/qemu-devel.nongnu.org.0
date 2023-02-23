Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D75D6A13C9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVL25-0002Ya-Gp; Thu, 23 Feb 2023 18:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVL20-0002YK-D1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:29:44 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVL1y-0004Wz-TV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:29:44 -0500
Received: by mail-pl1-x632.google.com with SMTP id i10so5989179plr.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b59+K//DAxee/IbD31kb6sc3cnVQLNpkf9eZvsQCovs=;
 b=QsJQLYWv45EWCLVelobXAxHbyBm3prJDdWnM0gC8WgYU76GIy4mpdQEldhI/Sm9SY0
 QCKZXeIqv1JuZUcadxoOQ7Ji+/WfEiNT9Sux/8qUBSmBrReQLmXvKmmiclwFbfoYsddf
 0ewQ06UTI4ERf+4iOxhLgeDq/ZjXSB7QkqiLTVTM7sIArffp9m7sce5LIY8R6fpgEVdZ
 Qh9RKCfhAVe0QD9ZlVC32TUzrjByBfaIviFRBw0ogqlypd3+lsEDtzqSzL+4Xu10lxEh
 /Cv4YyMYDIT3TcPuWQJeFmgiOQF6PiHtAPvJHF6bgO6P28zsEqHcDSCgpEQjDHcYyGYi
 lNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b59+K//DAxee/IbD31kb6sc3cnVQLNpkf9eZvsQCovs=;
 b=gRXPMGYPm3tg0IieeGFQ6V/LO1YVDumA5Wx63/lwtxeWCvUUlizfG3iQX7IasWDQNl
 /IC0JQGF0OKiyPpq9pqOhlPZTd/PspSwHrQkY5Q07xzEQIAZmgFFSlKkxaMKQMXpYAqH
 apyTuQ/jv5KzGTIAxEM8tl4MJcKq8S2d7NLX/yxO5QcE9DsYk4pBI7fekKaY4hX3cohK
 a8035YeyeXT1B7/DENR4Iu7zCPFytuTc8vqBf1lIqoO996YkYFGprnc1zBSVfNtjupzO
 BIjXO9Dx6Fw41NyFO8MUfATNqPZXZWLTw8b90a7t6Cf++c9XswIVZFQicqf3mtpPDIRL
 XwcQ==
X-Gm-Message-State: AO0yUKUeCldzjWtzEgpWWvKxX/O4IJ0qX9AJVKVXXQGG+hHz3pWujDnh
 KJjGuLh7zw7OPKyg76vxChf7XEFLMfWOv8ERe8o=
X-Google-Smtp-Source: AK7set8IOHIpVO4H7dfaIUsa3eJiBKZo8M+Ds9ufRiPho5M2u/sXtnCUs3btvFf5mVOnXDy2ETo36w==
X-Received: by 2002:a17:902:db12:b0:19a:7622:23e5 with SMTP id
 m18-20020a170902db1200b0019a762223e5mr17813194plx.4.1677194981123; 
 Thu, 23 Feb 2023 15:29:41 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i3-20020a170902c28300b0019a83f2c99bsm2219664pld.28.2023.02.23.15.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:29:40 -0800 (PST)
Message-ID: <8ed9670b-163a-3437-7465-bf3de0c5d384@linaro.org>
Date: Thu, 23 Feb 2023 13:29:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/7] dump: Replace tswapN() -> cpu_to_dumpN()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> All uses of tswap in that file are wrong, and should be using
> cpu_to_dumpN, which correctly tests the endianness of the output.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

