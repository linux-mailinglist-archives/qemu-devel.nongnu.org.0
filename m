Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B0E32488B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:33:16 +0100 (CET)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5Wl-0004wA-Sq
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5U7-0004Eu-Sp
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:30:33 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5U3-0002FP-O1
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:30:30 -0500
Received: by mail-pg1-x530.google.com with SMTP id g4so2742402pgj.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mj224NqF2wPx1qbpG+JIZYsgvXtv2VDyMuudIERiRq4=;
 b=ZTxsjxI4q1gy8EgIufy8lUB+8ZiuvcBkVHQbkFUMLc1fn5/RRcS4vdCic/I02Forhy
 kn6AeN7O8cyioAlK9M9dVg/RAUC/04PkK8d3AL2uB66loKTQRWpfGSX/GZqY9ZvVZVVx
 Ae3QQxekyhmKf/0YCAo3NB4xPPzG2zxxBrJRuZp4fDFMyDgqxoxRTZJvnFSdhGiEFf4K
 kou297xe264MI+mMLSvagWI9mP/dvZmcblZaM+DmMaw6l9p8D/HL5XPy1YzagnE+01IJ
 pzmqURCfktuqG5SSwGqNfavoEkT2WpSkXT0VVuLAYFiuAe1o/cksY/QZ2yegi5/9z7PS
 U6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mj224NqF2wPx1qbpG+JIZYsgvXtv2VDyMuudIERiRq4=;
 b=qXJtCIwbaAfdtS14QVV64aT3CDogEwRinwJj1s4QAg1RV3ldpDhJJqAgu7bXJwX9/R
 f75vyGo4l7+LICI5uQTABmdex9nZnMYAVEGoBA2XZ4MgmFofu6v5yc7RRw0Wt4Mkx9Pk
 inKkK2C6nziJLaTSwC5oolZyC2i8hgDjig3u2wIcPB7Zp4OfXZNCa1jDQG9CMVtGI1yg
 v9iX9VbUz1elulq0Dfrr+66N0l1FsejaJnD9QkmkqtJrKvNnpUXiIAsvTHXuCJHYPM/G
 O2JVkm/XTsyJxQKlAU5Xeq+Il5c6Cbm99ZYt+BxHNDo/08JfjVKLK+JSRfRHE/Ae6XT6
 +9Rg==
X-Gm-Message-State: AOAM532YMHNtKty+SD5HWrdNYTDh1oeJhMtIfsh27TB4hS4L/XOAr7eE
 kdUNGZHsJG9OVP4CcgqnxJgJjfmHXMrGFg==
X-Google-Smtp-Source: ABdhPJwwJj4fYqEimHycRAQMQz6QL+jxqZEIii9hCYe+lWSeHQlQtKvj2bZJ3RbxEnONKb/0krnxBw==
X-Received: by 2002:a05:6a00:9d:b029:1ed:c1d6:5042 with SMTP id
 c29-20020a056a00009db02901edc1d65042mr762657pfj.71.1614216626126; 
 Wed, 24 Feb 2021 17:30:26 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id f3sm3895637pfe.25.2021.02.24.17.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:30:25 -0800 (PST)
Subject: Re: [PATCH v22 07/17] i386: split off sysemu-only functionality in
 tcg-cpu
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-8-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0db92fb-8b68-b3e9-dc27-70e49be89887@linaro.org>
Date: Wed, 24 Feb 2021 17:30:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-8-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/tcg-cpu.h          | 24 +++++++++
>  target/i386/tcg/sysemu/tcg-cpu.c   | 83 ++++++++++++++++++++++++++++++
>  target/i386/tcg/tcg-cpu.c          | 75 ++-------------------------
>  target/i386/tcg/meson.build        |  3 ++
>  target/i386/tcg/sysemu/meson.build |  3 ++
>  target/i386/tcg/user/meson.build   |  2 +
>  6 files changed, 119 insertions(+), 71 deletions(-)
>  create mode 100644 target/i386/tcg/tcg-cpu.h
>  create mode 100644 target/i386/tcg/sysemu/tcg-cpu.c
>  create mode 100644 target/i386/tcg/sysemu/meson.build
>  create mode 100644 target/i386/tcg/user/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

