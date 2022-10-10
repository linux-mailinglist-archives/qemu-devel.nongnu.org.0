Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8B5FA14E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:42:14 +0200 (CEST)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuuz-0002DB-Jx
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohui2-0002Wx-Nr
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:28:50 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohui0-000705-Uq
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:28:50 -0400
Received: by mail-pl1-x630.google.com with SMTP id c24so10697213plo.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+DOhMwYzBOvnAvdo2W0uOjepVwSD3PGWt+5OiuOV55w=;
 b=rZ+UH8XCQdNqDR0p8l0oTHVxugojgF/VH0qLZD9h7s3lW5jhdhr4d3sSt2WyfF7hsh
 E/EnHwpHb9IPtUniuSfFlr14qqgdNIpGwwd+6+IdQK/HAw5RqC+O/mq48GEV+GOrnru3
 hoYb9RxqjgF8XoQnaDCQlxZwfiYTBualj3hbhgevYJgeh87YaKDx+Ur/GN1tFJol77Yq
 S6XQ6fQCkCNnxYB6c3Z1kyInn1xb1Zyf6XSUQq3AJTYyKoDae3V/AGUxZ3Ri+6aXONwH
 SA0SoVVOICk8xgdbgRERlGhxgdIEgBofrhqyF49y9yGyYl+fRl0KkAGkY8J7w5y44OGe
 V6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DOhMwYzBOvnAvdo2W0uOjepVwSD3PGWt+5OiuOV55w=;
 b=vpApWFv/J0QtcsCjegFLsR69W6HDZY7vIyqcxlVg1J3ClUmBGmWrhNotHo2vnbUW9Q
 mwzrfB5tVrIuznr5AhxAhROunhRwcFKTT2fjskbVPBJp7XBim9/4tF62J+ZmrXHod6fB
 fA/p/QYIMr44bs+uE36/rrNSF0o/rndrqcYtzPTy6cWK5F5GyzIvfy6JHBN0KajnTXLS
 3+7mXTvF/xBZgLX41Bf0pWhMCgL/A05kIRTjUbcPzVxnqrDkfnldbi68JlPcInBY+dV/
 nvWZWBLfZS+dIoGyFKqmvTrrHXKUs6G7iNPYNZffzSNTre0c8yjf7OEBzTPj0q8Jz70L
 5uBA==
X-Gm-Message-State: ACrzQf34QoOIwG8QfkQqvhZs6u2mubSwKpJ1TIKiP65J26fa2+Ahb6Qv
 pzJugWD6KftltjPhv6LY7BFNdQ==
X-Google-Smtp-Source: AMsMyM7uZN99PsizHteMWS6GVDRsjPb5fD0dPadk+SL7o/o6Dmp6W3KIbHn4BgcNon7m20eyo6HK/g==
X-Received: by 2002:a17:902:d50f:b0:17c:1b89:20ee with SMTP id
 b15-20020a170902d50f00b0017c1b8920eemr19812427plg.60.1665415727379; 
 Mon, 10 Oct 2022 08:28:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a63214b000000b0043a18cef977sm6247640pgm.13.2022.10.10.08.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 08:28:46 -0700 (PDT)
Message-ID: <f59e7cae-93bc-7df9-93f4-10b7d1637b2b@linaro.org>
Date: Mon, 10 Oct 2022 08:28:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] linux-user: i386/signal: move fpstate at the end of
 the 32-bit frames
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221010142127.295676-1-pbonzini@redhat.com>
 <20221010142127.295676-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010142127.295676-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 07:21, Paolo Bonzini wrote:
> Recent versions of Linux moved the 32-bit fpstate towards the end of the
> frame, so that the variable-sized xsave data does not overwrite the
> (ABI-defined) extramask[] field.  Follow suit in QEMU.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   linux-user/i386/signal.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

