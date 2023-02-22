Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE669EBFC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 01:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUd3g-0006xU-GC; Tue, 21 Feb 2023 19:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUd3d-0006ww-Pc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:32:29 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUd3b-0000Ty-Rd
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:32:29 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso7011462pjb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0tDT2bvnax0BSbh+fepFQow1XH0rsSPxoNpijHgS518=;
 b=p5bMQKP9oS3QXxPQZjMm2OziMS8RZf5yl6m1exYUojFJKVZeGGP1Uki5+/KbsG/2LS
 9dbuyBNsnfCxSRHN47jIxXpg5ydaovDQC7iUAqEI4Gr03W6UQPjKFmmHQ+Dqevq9jfHr
 h6p9ak60niP3iipJqC2Jh++YHRCIDZACoJ+5jZD7pw8SNZSoY/D6u+4qjzy4y3fsqr6o
 ErUfXzQvty07qvU42cPfPmf/U00GButmRqd0ntWXkK9ae8Cy0ClEkIIlaWRHaT/rpm4Z
 Te31szCa7WgRBuJNBnGEH4oyIGSsyzKz5VkfUEvURNm1/t/fa9iNR4Rh7f0Kmxuj2lm+
 Us2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tDT2bvnax0BSbh+fepFQow1XH0rsSPxoNpijHgS518=;
 b=2T+TvMAbjl4/9RLh3VO2SSHTX8o4UttIxKh7dz1GO4v5fJUdRCZvDGD38+uzVoWH7Y
 LVNljyxsd0nGCEY1CBW4ewQx22CCsgvKgT+LK5GMMejXwMQ3baTltr2V7ypOz0TB1oAQ
 SOkY1BMBWAstJ0dDOXCs6zqZveoVR88vTJw26Chz6707SRHPU8fYyJwC0yMO8Cv2Ig8F
 l49i+J+HBD2TBp6ogSu5wzU+VeMB7OHRh3JZJpWY9gFD/7WQh6r3Fg2mkBUtC/wNMs55
 GzMDYPCMgxrnVSaEyDd4ahL+Fl2HG2//qpNGJwFjV0gYYEGYbKreSOj/nIGJxXq0oJjH
 ZJsA==
X-Gm-Message-State: AO0yUKXqUOpbh+Efxm9byin2vUIoiFbKO2NN5QGgUPcifAwIKBuHQDT+
 EotPIa044y9JV9uS8bLSk5thhQ==
X-Google-Smtp-Source: AK7set89sL0TkKWwIMugyT9aGPOXAIfM3IU4NSG7GURr8ZnOZXd2uNaA1G1ZHbem7f4senH0qOuiAA==
X-Received: by 2002:a17:90b:350f:b0:234:86a5:f800 with SMTP id
 ls15-20020a17090b350f00b0023486a5f800mr7326925pjb.34.1677025946354; 
 Tue, 21 Feb 2023 16:32:26 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h191-20020a6383c8000000b004fba32949c3sm4088908pge.16.2023.02.21.16.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:32:25 -0800 (PST)
Message-ID: <30249b03-a861-72f3-95db-f1ba0877b757@linaro.org>
Date: Tue, 21 Feb 2023 14:32:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 11/24] gdbstub: rationalise signal mapping in softmmu
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 12:52, Alex Bennée wrote:
> We don't really need a table for mapping two symbols.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   gdbstub/softmmu.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

