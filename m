Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B185B6C4DA7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezSH-00035x-G4; Wed, 22 Mar 2023 10:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pezSF-000352-GV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:28:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pezSD-0001qe-R7
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:28:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so8811038pjb.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8vd+RUTEaRsp8cPm1kIzeO6q63+NjMP+0S3hPHQpZrw=;
 b=CLS1ePNfTc8fB+949PTUdTgBxszhkYXlSSabJNj19SB+oHR/mD1MkcnjuCut9pDCmN
 PDEkZ+jP5IW/tU4SSYluTeBacFbEqyHns+w+t8qgH9g0m0VGWI9Ljl0MuxiSMWIWZr85
 6p68CqewzZrZP1yvZxm96JPBcD5CEeWgN2orGb8ydzKnf85RPUJEHWtikXrzYWdRvZKP
 YI59Fk1m10lFPJUcmF3mdOKdIRV2JsbHkaJE8O+JfXyrKat2eZFGWXWzm9xbL+Bk3Zp6
 VfQxHACaOOIKHI9vH4tMn6kBNT9RXCEQOrr23gwYSDBot2SQy8r6/iavBPRxeNI8TZEj
 uBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8vd+RUTEaRsp8cPm1kIzeO6q63+NjMP+0S3hPHQpZrw=;
 b=jqWo7aqKNruX4WYM61tuumouA/1RHXd3dVHkYJKuY68w8EPZ2H1X041hJHzR6IRi3O
 DpwR4k5hTYL2ww5F4SNKajxJ8ED3LLyAlZiuF2aHr5YjihnEsRL1pF1eqRTstlkOqWsu
 p4052PnSPogcQo5JzYG4JvxqY65IKbu1NF/iCyLL9u8wV5dRo2mn9zjx4cl5AjwBhyq6
 drXh+83C+q0G7QVtNQ6MR//TIn6zt2vOr4gXT0MZNb8DgQ7MydPtv3d33g2k75ru3BZ6
 x/GQD+9YuYVauNvs25LPwXhWKn8i4cy7BqJRTICCLT6kfjfelgX3yLW7PAvcxVbdu7j5
 iurw==
X-Gm-Message-State: AO0yUKUQx2valBcmD9tfkCcZ7YFcYYp7/Ph4F9u1as2L3PR8Y7PX2imk
 PTQ7ZebJfIob1rjGT5M1XbeIqA==
X-Google-Smtp-Source: AK7set/AW/nBTU+Ac7zy8r0TrWAI7oE3ShMxcLZvoLuvBdPwj6+WV1DMyszirgfL6KY/BBpToN+qWw==
X-Received: by 2002:a17:902:f1cc:b0:19a:a815:2858 with SMTP id
 e12-20020a170902f1cc00b0019aa8152858mr2429466plc.51.1679495319831; 
 Wed, 22 Mar 2023 07:28:39 -0700 (PDT)
Received: from [192.168.7.29] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a17090274ca00b0019c2b1c4db1sm10639601plt.239.2023.03.22.07.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:28:39 -0700 (PDT)
Message-ID: <f32339df-9554-7cc2-e6bb-33dc9e599d11@linaro.org>
Date: Wed, 22 Mar 2023 07:28:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] ci: Remove cirrus-ci & cover SPICE in MSYS2 at
 gitlab-ci
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230322135721.61138-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322135721.61138-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/22/23 06:57, Philippe Mathieu-Daudé wrote:
> See individual patch descriptions.
> 
> Based-on:<20230322075256.2043812-1-marcandre.lureau@redhat.com>
> Supersedes:<20230322110521.59949-1-philmd@linaro.org>
> 
> Philippe Mathieu-Daudé (2):
>    gitlab-ci: Cover SPICE in the MSYS2 job
>    cirrus-ci: Remove MSYS2 jobs duplicated with gitlab-ci

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

