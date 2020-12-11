Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B162D7E06
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:25:49 +0100 (CET)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn6y-0002Ki-Uz
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmSn-0006kH-JW
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:44:19 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmSi-0006Zx-R7
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:44:16 -0500
Received: by mail-oi1-x242.google.com with SMTP id w124so7577841oia.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bzuP0y1GZ/iwliwDYAcadi9TFabtZG8Ltw8py/4ChuA=;
 b=JFBYNmhzAGYXaDVQrJEI2XxAvKKmkkrL4wdBnJymWAwrsVg/VCeGjA5rkp4p6IqJIK
 7djqCEGx/uEnJIvr7qBBK9I8sqR10m/kOqXHjfd9s0+1SNwQzsrVS88USrg5HhCDDpoz
 EAoOo6W1Kf6M8mbbgZT/Lp/WMIRTVjGJxI5rqnw2JAdAdwWeJxouOjq1EsKD8lfC31oH
 pXuc6Y2T4FjH6R3AlWukCtrmPxGfzqdu+G7ow9Qz+G8NAB0Z/HvovnV3QiscVxBXziTB
 rc/ON5mR2FKBk290as4JPz9u/Xeq4QAeUj33nlmYMm6xF3RvagDjqXqtci/Ck7PDSjoq
 m8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bzuP0y1GZ/iwliwDYAcadi9TFabtZG8Ltw8py/4ChuA=;
 b=qk80hXamIiC4aVj8wKQNrU9DgStkTq/ipH48PJ9w+gWnAnKIdeFs4/sewoTMp2iBMn
 zS34z7qArS3XnJYyR/V1jMdueLYmhw6d9tNWXEXZfIynHwdY6b6wzHVJt48KwQv6bwgr
 8akYKjEIdIKOgmySCrNj1iUAYSuNvj/JqNszTwe2SW9ixm5lrZ3DyVSiYEXz+TepR1jn
 KW3ibCsGT+EqGy198As37c3pTm/Me+zuBgEt7MvjBoASUSgnU1QeQlKoEyaoZ6PM+TRk
 Lqga7Jlyfmry9h7SVddOt3bJxNsj8kGMj45Jgrul3D371GlcbAfFxZHM1HlFBE7k8KYE
 5FJQ==
X-Gm-Message-State: AOAM533yfVpE0KtsDpR0IOswJj3SCo7uIazke9dJhn6B292mZ36XmnsX
 2UgjUjf9stAgYDqHBXqCQno3wA==
X-Google-Smtp-Source: ABdhPJy9KO/Z68zbT6xrNphkxNqfEu2aHCYnCaY0ZNVU1Xul101UXGS9oQE4MFTlorD5rzK+faJoqg==
X-Received: by 2002:aca:dd09:: with SMTP id u9mr9533702oig.73.1607708651652;
 Fri, 11 Dec 2020 09:44:11 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w138sm1573894oie.44.2020.12.11.09.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:44:10 -0800 (PST)
Subject: Re: [PATCH v11 21/25] cpu: Move debug_excp_handler to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-22-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <607be820-257e-9f21-fb1b-49c86ccde666@linaro.org>
Date: Fri, 11 Dec 2020 11:44:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-22-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h         | 2 --
>  include/hw/core/tcg-cpu-ops.h | 2 ++
>  accel/tcg/cpu-exec.c          | 4 ++--
>  target/arm/cpu.c              | 2 +-
>  target/i386/tcg/tcg-cpu.c     | 2 +-
>  target/lm32/cpu.c             | 2 +-
>  target/s390x/cpu.c            | 2 +-
>  target/xtensa/cpu.c           | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


