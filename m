Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84C40D96B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:03:46 +0200 (CEST)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQq7F-0007uv-L2
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQq3f-0006Po-0u
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:00:03 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQq3c-00085G-F2
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:00:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so9068194wrb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RuuMHracPQA6J4gTHFCFbuTFO31MGbcwnN6iafFSFGM=;
 b=Ob1EVF5PdhRoMbZe3jegXqRjp1KB76XXxBMRx67Y+JF1YbPGHdvPopfplTpHMQnisN
 xbiQINlJzgJSpq9uzrgmPBqglaUvPzQT0ym4KspjyWXtt/e0sdqy361NEJ85TMvuG7uN
 jzuJmzdcxziwoLRxLfh58LfvqeE5+Rwu1UvJeXwjQBA06n8qmWNeL9aDrNjC24JDOucM
 5Jx5OZ92tNMD4V9to9Lu8iOQtVSShRA9YTDhNPW2tSjfKwDXtKQ8D4g1lHH8rrgTSb+1
 SLTTF/4le7qsBcOu9jhJqupGq0cJtljqUs3D8IzkVbZKai6Gc/W/lkhXdPgkoKnsZe0m
 /ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RuuMHracPQA6J4gTHFCFbuTFO31MGbcwnN6iafFSFGM=;
 b=09GjPE+d+i6+Y9aTl8LVnrc3GqGuhW4hBl60zfc+aTg7buTsLUHexa3m7Ius2MRCJq
 P7ilylFepK8u9vLus9o0l6u45/jDbdgZ857WFtWamMdlEQ1mMWObqo3MNnHNt19nSmM2
 XbQ5pPWRn0j1w8CR06wqYhXZFSYcP8c/JHyeGww4A+Na2CTrAnwH2rpHNi2/7IuXelnd
 SCyUqWQHKhymo3d6RRbkl5gAOFeltOaiS8CMoJwpg97mCRsXZ1Kd7tBWTnVQvbqR6H6r
 yAcBqjYi7t+goQ3Ugh1eD0pfOJkTeZqZTJfHzAm2r6Ubke9MO7A53lnPrgWSngLitnAp
 y0pw==
X-Gm-Message-State: AOAM5326RPllFOXzMMxOkYJMKw23hZMqp+nAWVWadxxtiDWYZf25YJEK
 LRTTMnOqY+nEPZliy42LUcD/dMHv0c9Z+YEamrpPnQ==
X-Google-Smtp-Source: ABdhPJyI1ONvwYM9TzvrWQT196KQxfFwgcZ+vKQdm9Fs2o0Dp/MEE+dr78obgIN5HlR0UZSCFRcfGbTqKdGpRT9XMQw=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr5649945wrr.275.1631793598048; 
 Thu, 16 Sep 2021 04:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-3-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-3-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 12:59:07 +0100
Message-ID: <CAFEAcA9e+tnF56J11AWcsyKGH+h+3VKKADOFGaM37JhYR_HqDA@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] hvf: Add execute to dirty log permission bitmap
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> Hvf's permission bitmap during and after dirty logging does not include
> the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
> instruction faults once dirty logging was enabled.
>
> Add the bit to make it work properly.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index d1691be989..71cc2fa70f 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
>      if (on) {
>          slot->flags |= HVF_SLOT_LOG;
>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> -                      HV_MEMORY_READ);
> +                      HV_MEMORY_READ | HV_MEMORY_EXEC);
>      /* stop tracking region*/
>      } else {
>          slot->flags &= ~HVF_SLOT_LOG;
>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
> +                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
>      }
>  }

Makes sense -- this matches the premissions we set initially
for memory regions in hvf_set_phys_mem().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Should we change also the hv_vm_protect() call in
target/i386/hvf/hvf.c:ept_emulation_fault(), for consistency ?

thanks
-- PMM

