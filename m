Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D32DB654
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:09:23 +0100 (CET)
Received: from localhost ([::1]:34414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpIVV-0004s4-ED
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIUc-0004Cj-MJ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:08:26 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIUa-0006pa-Ul
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:08:26 -0500
Received: by mail-ot1-x341.google.com with SMTP id x13so20992886oto.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dM/PvL68o8mWvo3fZSWy65an/HyoWiTrlWj9RLKipZo=;
 b=BjzXtzBQtyV7cnnGOmySexOi01+VVA9qZoUJCZLeOEWizz2Kb/V2+pt1VISUGsznbq
 b97khq+xY4phuwalQKhsL3jnnL16NfL/IAwCAdnbYm7mYEysPWqgWx2lUczWHCdTwov+
 syeFC2aALZXDbw7yXWREC10LuRICkLDMsZ50u/Oo236ik4V50EnSmAaU/F2/eHPTJQ0G
 G7c21l9dZXrFi6nAzXDYs2oV/DMhdR7ny7VxW+1Y47bLrvmeiCaGM//BXjs5iUWehwY0
 EyGLwxdqF38A7kXtNbr2veMjKEsrYk37fLKOHSKqepoLcgpeKbwKGOLUocjG5O4EmSpo
 B5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dM/PvL68o8mWvo3fZSWy65an/HyoWiTrlWj9RLKipZo=;
 b=CSf7Zs40qI7yQDqHBntp9SmwfSOiVXP1n1cqUsF8eSYdPWVtRG6iREv4hyDBAW0Ucd
 g7tzagF3PSxsrWpaBpb85W+S3Ob/3B0sdxcXxNYPJ3nlmk/CiYBE0FSwH4/z9oiZLLG8
 PCHLTFVzpuoHzjCQpoKUdJcTLfLhc5d9axGJvT25cgdFxR2PisnBU3688Q7267JVx8B5
 fBHH+9tsUniKoHpFwSFB3NKKaj7Ct2AxUyJ/6v7bOrsw5xc8wKHzgkJ38YSO6kwyCFtf
 6F8BInHkDeSkeyp1LfZI3Ph6gi75VigOT7Pa/1G3wMX9da/bzZLIPxQjfOc4VO/k/lQA
 lUng==
X-Gm-Message-State: AOAM531Oo+6wOTnsW/NaJGQnd4htjhUuqQU7L/L+c/KIgZCYVe8i4cMZ
 Cvd6LFnRK9LWtz63WkJs3vMQhQ==
X-Google-Smtp-Source: ABdhPJzJHTofY7debo8IZ8EoS7ueTU2DRdcn9PumtwnmbnUPSsnpiauL8L/ZHNOT37vrA8z0dex9lg==
X-Received: by 2002:a9d:4b81:: with SMTP id k1mr24832671otf.371.1608070103782; 
 Tue, 15 Dec 2020 14:08:23 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w138sm26365oie.44.2020.12.15.14.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 14:08:23 -0800 (PST)
Subject: Re: [PATCH v12 07/23] i386: move TCG cpu class initialization to tcg/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-8-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95a34fb8-d662-8889-9fda-aa3b58a5fd1e@linaro.org>
Date: Tue, 15 Dec 2020 16:08:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201212155530.23098-8-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 9:55 AM, Claudio Fontana wrote:
> to do this, we need to take code out of cpu.c and helper.c,
> and also move some prototypes from cpu.h, for code that is
> needed in tcg/xxx_helper.c, and which in turn is part of the
> callbacks registered by the class initialization.
> 
> Therefore, do some shuffling of the parts of cpu.h that
> are only relevant for tcg/, and put them in tcg/helper-tcg.h
> 
> For FT0 and similar macros, put them in tcg/fpu-helper.c
> since they are used only there.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/cpu.h             |  86 ---------------------------
>  target/i386/tcg/helper-tcg.h  | 106 ++++++++++++++++++++++++++++++++++
>  target/i386/tcg/tcg-cpu.h     |  15 +++++
>  target/i386/cpu.c             |  33 ++++-------
>  target/i386/helper.c          |  23 --------
>  target/i386/tcg/bpt_helper.c  |   1 +
>  target/i386/tcg/cc_helper.c   |   1 +
>  target/i386/tcg/excp_helper.c |   1 +
>  target/i386/tcg/fpu_helper.c  |  39 +++++++------
>  target/i386/tcg/int_helper.c  |   1 +
>  target/i386/tcg/mem_helper.c  |   1 +
>  target/i386/tcg/misc_helper.c |   1 +
>  target/i386/tcg/mpx_helper.c  |   1 +
>  target/i386/tcg/seg_helper.c  |   1 +
>  target/i386/tcg/smm_helper.c  |   2 +
>  target/i386/tcg/svm_helper.c  |   1 +
>  target/i386/tcg/tcg-cpu.c     |  71 +++++++++++++++++++++++
>  target/i386/tcg/translate.c   |   1 +
>  target/i386/tcg/meson.build   |   1 +
>  19 files changed, 238 insertions(+), 148 deletions(-)
>  create mode 100644 target/i386/tcg/helper-tcg.h
>  create mode 100644 target/i386/tcg/tcg-cpu.h
>  create mode 100644 target/i386/tcg/tcg-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

