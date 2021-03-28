Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D329D34BDCD
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:54:17 +0200 (CEST)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZc8-0004pi-T1
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZXc-0002V7-JB
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:49:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZXa-0001xB-4a
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:49:36 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso10133709otq.3
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=88MawBo2Ff4tR7jBq0mr36K7P3DRpiHIK365aB+HhdA=;
 b=XAeUmN4DHArbwSq9DTFSnkb5qpYJqYMnOqPfo0p+p7LCY4v4b+FbXk3cwV8bvDNgQB
 WZQoiDe0UvrhD/YS0GREsjYWmm2olHj3xK0PkxtAA1A3dO8ex0jtZhifXADQTviAiaXd
 /8Y4bZOV9lNc1HkI0YnAB3yOFlzFTOrerXZOSNi56Am8ylzBxbFsIbbmhdu05NR+E03E
 AbD7LzhkkqcSqJ/jnHCIbXi0HNkzBNeAafm5a6lGlY7wu7WZ2zElfyg83W5YyHo47rwv
 FIGtkE8BdzalojHzqJoGkNM2hgl6fFjADmls850jKVlPXSKp/oYioxIyjIoX1tScXR2E
 MrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=88MawBo2Ff4tR7jBq0mr36K7P3DRpiHIK365aB+HhdA=;
 b=StB6K71HTqqPqdIhYOENSwNQBUEfubLBjqJa5yNt+02KjmlTUQWhYnzJx8Us5aFwUs
 sl8jW0sf5XFsKpPZckNh6kDiVMghcARPjtlBvJ5IjtsiHMBSW1Ms8czLCAku2k4ULTg6
 FS8coPMdg/r5rS7YoAvYe2+lXFWY/HZ95OSIQH1saqwjkUDXSrxWj3g4inmIhvBXwA0j
 GWhdsNTm9UcMVS5mmdckl/U+vNb8kho7PnnGmNo4FTNooiwVDxBpuC3L3mtb+z7K0RVe
 3MZBf7TQFo5DZFdoqPCI6VMeutWyszTq5qA2MBT1Lv/8qyIk3u/a6DJcaR19CvpqOFTP
 INPg==
X-Gm-Message-State: AOAM531CZ7cHA1gXn2SX+ttE4lYBBdt+Q7mR41cPWy9DsXvgeq8CMQHN
 FmeeL/EiTYurQGLLbcF+PsctPjGniP6+5WhW
X-Google-Smtp-Source: ABdhPJxpq8cDreyyoR0qei7dKL1axSDWIQKa1MLvMkIfH1/lm0azy1paZ4SbboNF/gh0LWG9VeUmEw==
X-Received: by 2002:a9d:2622:: with SMTP id a31mr16332495otb.275.1616953772356; 
 Sun, 28 Mar 2021 10:49:32 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id n12sm3909899otq.42.2021.03.28.10.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:49:32 -0700 (PDT)
Subject: Re: [RFC v12 47/65] target/arm: move kvm post init initialization to
 kvm cpu accel
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-48-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d4b5c64-cb3b-6428-78c1-0ec1db49e251@linaro.org>
Date: Sun, 28 Mar 2021 11:49:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-48-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.c         | 4 ----
>   target/arm/kvm/kvm-cpu.c | 1 +
>   2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

