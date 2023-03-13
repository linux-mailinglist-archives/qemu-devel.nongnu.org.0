Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917576B71D9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbe11-0000vw-52; Mon, 13 Mar 2023 04:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbe0q-0000vT-Bv
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:58:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbe0o-0006gd-PV
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:58:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7309893wmo.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678697913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nwFUy0qPgo/d7vZtlR4ypK+dZBNwx+X5FK8USi/ohxs=;
 b=N/6JBjSgzQh7Ee+P5D8sMnBh/Nzg3K6AlGFhkj/d0kq4FDg5TrFd0SBl24dc5kb2MR
 10AUniUJvCR8id8uGZ1zBsir3kWgNxFfse0cgdtdq7SgDeeDoiUXSNhYqOEW+wsZYCZP
 5OgVJhQMv9DczSwJ34FbgLOhhhf+YCi+hpCrGCJ7Or/wsT53pmWP29AbvtBsbkZM14XK
 x9slvJ2arPpH5GdICaCbfeisBXZ1FEQ1SjNPCSdEiHvh4dw0WhXH/TzfyhtqwqW0U/9M
 zwyN8Rn8UWpGACGScNf7XGS/4VyOYYMxh3qrLQrhw8wRaXQVfOjcEkSTIbnuu20q4/IC
 H7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678697913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwFUy0qPgo/d7vZtlR4ypK+dZBNwx+X5FK8USi/ohxs=;
 b=HnHyR8m3DCGIGmVJNsu8Lqd5loOLlPPB4Kp4W7Ugm/aqKxCyLWph6ry4+HnkQHvH5K
 U0i8YgX4fgTFVZ9MviCdPZpxo3gOdYXdXvEJWPOKwckNR7U35E8bfWnu9Rrbp7jEmlxi
 PiQpNVjbO8TTxGXZcJ00jYfosHL9OjlEhI0BUEJlPHGVBNfzftOK26CfDBMFZo4IOLnA
 uILFtYPh5pQqW2xGnHj2qidY7q8cS1TVXxv0EEfRw4cKCPD0x37byEUU+R4ZwuHURtbI
 KaT9CxAnxDfnheF2HKG2sik5Zk3EOxqsuMeOwI3WEQwSUOk4lCLmjdWUgNWNGyyx3evd
 0M+A==
X-Gm-Message-State: AO0yUKWeUzHIjWOsb9KVSLEFpywy46w3FWBSb6P4VgFc3Ri9roMgE62k
 PXACaND/iDkmRgtFLPMuNswgWQ==
X-Google-Smtp-Source: AK7set96KAfY9LHs0mf5f/uGqK56+xXpJb/r0UDgZ9c0ad5hC6QdM4oU767tv39ZwWmSrrmL3HuPMw==
X-Received: by 2002:a05:600c:3c8f:b0:3ea:bc08:b63e with SMTP id
 bg15-20020a05600c3c8f00b003eabc08b63emr10268334wmb.2.1678697913009; 
 Mon, 13 Mar 2023 01:58:33 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d4a8f000000b002c70e60abd4sm7390577wrq.2.2023.03.13.01.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:58:32 -0700 (PDT)
Message-ID: <71946be0-74ea-2596-3184-7ebe4ce21b4e@linaro.org>
Date: Mon, 13 Mar 2023 09:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v8 10/11] target/arm: gdbstub: Guard M-profile code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-11-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309201434.10831-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/3/23 21:14, Fabiano Rosas wrote:
> This code is only relevant when TCG is present in the build. If we try
> to build with --disable-tcg we currently get:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function
> `m_sysreg_ptr': ../target/arm/gdbstub.c:356: undefined reference to
> `arm_v7m_get_sp_ptr'
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/gdbstub.c | 4 ++++
>   1 file changed, 4 insertions(+)

This patch should come before patches 5-6/11, or become
first of this series.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


