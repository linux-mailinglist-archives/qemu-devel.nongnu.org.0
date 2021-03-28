Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F634BE48
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:38:05 +0200 (CEST)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaIW-0000W9-Du
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaH3-000834-SR
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:36:33 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaH2-0005XG-Cq
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:36:33 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso10178334oti.11
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1+kDBwPbIjxcya66VY6yih2YWLwj65RXWp6MIw0QccA=;
 b=Dn82agCLY7td7S7fTYXiSscRl4rL0lv1UreMuzfxPyJ1fQstF8mSCptwwh61L7cZy7
 YozceMSvwZKsiHTYP4dD2XUNE/qdSrmrPqRi3EPJmkxO7eoEl1OT4qleUYltkXta8lHJ
 eIgWm7XstwT/i864sbajnmZbSj8K6op9jiP+oyu9PkVO6o2rfBj7khdtB3XixQlJ9Gpf
 8ME/PktI3E8S41K5TofH5483IxI72JFEywoO0IMZH8NWDOXZnUfuViTks7knWuYcOYXn
 aBhCqXpCulsTJOi6f3dnNh/+1FUlx5uXBueh2nGXFIjJUJrJduJE3FxfeMhfR1U9HkWg
 U6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1+kDBwPbIjxcya66VY6yih2YWLwj65RXWp6MIw0QccA=;
 b=bpazM71B4aLS8H17HNNDh6Z1zfLZ0m3n7wJs4R2xEkhVlsQSDdzz/NFGSFpZBULuMP
 YO/XwJputrJGIqRmlQfTjFiDnis6+CokAPFm17Idn+HRUgjPA/Lnpt87uSMVqy2pWuhb
 z4RZglNCryYtXR3R1ONv1tis0c227+EWd2yvTQEOwMTVzigc76R9pX4Ad7dn4bVyGlk5
 sLokY/rZpV4Qm5gOdry8J2oTubh/HvtdRSBfrj1cEMv+EagAOWEDQdaN65wYEthkAiXC
 RmxvjD87uPcA6LAQ0nbXW8WybvEsx/rW4oWMdtvfidhDQpNozM3wTTZNRzsgBBdlyL3M
 ufYA==
X-Gm-Message-State: AOAM530MPnPPCEFnIS/1hOF4h5/OLzluO6xH8Ar4Juhsi1ODGgYaAaN2
 FlkiIRfkUGC8NnH2Nq2P2hw/ow==
X-Google-Smtp-Source: ABdhPJyM4Sg4WCEnyM2ft3BXNI4IblGmG2cJVia35mxMXdBTnye71lkFZoJAGOTK0b8kLs7YAsNkmw==
X-Received: by 2002:a9d:740c:: with SMTP id n12mr19793749otk.21.1616956590876; 
 Sun, 28 Mar 2021 11:36:30 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id j35sm3780171ota.54.2021.03.28.11.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:36:30 -0700 (PDT)
Subject: Re: [RFC v12 54/65] target/arm: arch_dump: restrict ELFCLASS64 to
 AArch64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-55-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10219619-736f-f70c-301c-c817d6ac5ee9@linaro.org>
Date: Sun, 28 Mar 2021 12:36:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-55-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
> this will allow us to restrict more code to TARGET_AARCH64
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/arch_dump.c | 12 +++++++-----
>   target/arm/cpu.c       |  1 -
>   target/arm/cpu64.c     |  4 ++++
>   3 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

