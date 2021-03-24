Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49153482E7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:30:47 +0100 (CET)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPA9O-00067J-UQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPA7q-00059G-Fv
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:29:10 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPA7o-00038w-RX
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:29:10 -0400
Received: by mail-oi1-x229.google.com with SMTP id i3so22157646oik.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3aimERciU0CjCxuJ5m8RkjMQzP9pzwEbyZXoEGPRKf0=;
 b=ZJEEvTS/47FM2rP/4EqJBjC4LFXyPYbv8kasc1K3ZvdQtCnQ+pxwlag3xAwJNHEfD8
 4BPypTfgs54Xq6+EVDvaYJAjwG7Uh0lw6IhvqvB9/Ib2V95p3Tlul//C4rThJTkkYnWH
 qXNkk91wodzRzxWaPU+1aIz5Q6iR9+XmXF8SAa4D/0csjylXiiHoEDr65CseZPJAhclV
 DpNoTzz8vrrA4waN8OAzEU7O+lKpIyfSX/ScKaMMBWGwEdUUYrgG7P5/pUel23lRXRkB
 f0tYnIMd8rqZChoAOnhrr1klrT+17FyY4vk1qAY49HB5gYoIz620d1KUs5wmOtzszIbi
 tCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3aimERciU0CjCxuJ5m8RkjMQzP9pzwEbyZXoEGPRKf0=;
 b=CxlfcLCKE1NvXrfHxBblV7VQEC3fMyjn3EdXtaA3/whGsCg2x5HVce2WbLHcBn3cND
 CLoxKpCS6qGZOqKN6uR6Oqap5y4BWX8h6eC7KSiv1hTeMgxSXEw7pp+JDb7OUUuBMS5Q
 tOwcsx5pMkZNkAxCyI+SEeFGTsU/K0rymTeW/FjwibekpeK2uRcc6oIS6dC7lCBtlYqJ
 8pzDrkv8yEBA/q3plbVc0+czivKCSp1AXe50WXgSuIfxXPcwEt//KHYtsx3f5ByW2FID
 v2xuaxv+QkNjMuPWP0fIQmmSAyVat5pcejg3izL//tfJKYOj2Lwlw+NMR7k9wgNOiXHv
 Wc9Q==
X-Gm-Message-State: AOAM532wwA7cCOF63nseu76DbuKHoYpl+2G9GFurD9q6aExDDzO3GVAn
 2W802GX47Pj9svF2ePq2VQVCJg==
X-Google-Smtp-Source: ABdhPJwo1ifIUB4aeTMgOKp5I6a/VEcwSckVFmr92Bv35Uc0IZxcgovrC01a6qGb0m/zJ/sJAmB7/Q==
X-Received: by 2002:aca:fc0d:: with SMTP id a13mr3652158oii.133.1616617747493; 
 Wed, 24 Mar 2021 13:29:07 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 7sm625149ois.20.2021.03.24.13.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 13:29:07 -0700 (PDT)
Subject: Re: [RFC v11 20/55] target/arm: split vfp state setting from tcg
 helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-13-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f5f5c0d-f461-0862-6ad7-25f4430c5b2f@linaro.org>
Date: Wed, 24 Mar 2021 14:29:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-13-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> cpu-vfp.c: vfp_get_fpsr and vfp_set_fpsr are needed also for KVM,
>             so create a new cpu-vfp.c
> 
> tcg/cpu-vfp.c: vfp_get_fpscr_from_host and vv are TCG-only, so we
>                 move the implementation to tcg/cpu-vfp.c
> 
> kvm/helper-stubs.c: vfp_get_fpscr_from_host and vv stubs for KVM.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-vfp.h          |  29 +++++
>   target/arm/cpu-vfp.c          |  92 +++++++++++++++
>   target/arm/kvm/helper-stubs.c |  10 ++
>   target/arm/tcg/cpu-vfp.c      | 146 +++++++++++++++++++++++
>   target/arm/tcg/vfp_helper.c   | 210 +---------------------------------
>   target/arm/meson.build        |   1 +
>   target/arm/tcg/meson.build    |   1 +
>   7 files changed, 281 insertions(+), 208 deletions(-)
>   create mode 100644 target/arm/cpu-vfp.h
>   create mode 100644 target/arm/cpu-vfp.c
>   create mode 100644 target/arm/tcg/cpu-vfp.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

