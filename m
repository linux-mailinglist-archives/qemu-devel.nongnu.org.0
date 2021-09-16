Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343040D7D1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:50:26 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoyH-0000fi-KJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQou6-0005aP-Nu
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:46:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQou4-0002WP-1v
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:46:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so8701148wrc.7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2q7fvYaIUiVbpbgyORmLtkXjsgAfiFfJ33FclJyfCPE=;
 b=OrR4RncqwJ1r3zqo1yrsbNly9XVgDVFtr/lbJAaLFsRWqhSyaXCVgz/XUxwk3vGvGP
 gff4GZxX8VW5BeAbHEzVdneAaUmvCbvuCFZzbJ07lVBFlPtsmqXBZ7W3iMmUgGs7OTYv
 hI6rvzabq5n9ZGzMFefw22NbP5tezRFxoln8P3bdu0b1nKZgEGDZgiLwgdbBdvvXRdWe
 wk0cAfuDEhJf+vJ3kIIuki2WLYfkyDRjPyt2dXm0b4OBfYdwRJBfZuAN2FYJEQkn3Eoq
 AkJF62lR78XnQNTqMqmRTP171Uwz8tS990l2H9LQUHjM27N+8QtNfPK952DYd8VH+SKu
 l3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2q7fvYaIUiVbpbgyORmLtkXjsgAfiFfJ33FclJyfCPE=;
 b=dVdSvdg9PYht72yUTcdOJd+QnWNUYyUgPJYSK8AyuStW9R0Q7WkQbyNA3UOVGAXdgw
 W2qaSWDooVy7Juemhktpj64pCnPjciCHALD5NHXLOPuJGoDXcqhpoVqLE1E4h8NRKK93
 55bMxh7/Hu8hbuYHvoR7VzXlm+dWEYjh58YWVRoYX87UOkcppRZ2KBUKO+rjwgjCqXWf
 lnKDN4oR9j7enEgZEGgJ4QJ1sHtbzlpWnBvnRuyIt2iyx/etrXTB+XZxx6n8NWcRK8Yr
 +uSR/EjuoiCoR58JK9KS5kXZTPQcyu4XLUT7ZVxI9UbMuAPCkF6tQI9+B2S02csGdPSo
 ljng==
X-Gm-Message-State: AOAM533FDjqKGletiaJT/P5KvJ89HbtZzZPQBazf808hYn+5V9LqjPwd
 obgyytd/SWlmAVihv6ORgZwnrmQEmNyA705XhpL6dA==
X-Google-Smtp-Source: ABdhPJxSlGh7lhBNFQNVMJe9VQ2jkY03Ro5JbPT1bD3u7qZTHC1YLKOxzk1dr4T+rAoKOkA8DFyG/vaSIquqE+NQHh8=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr5268325wrr.149.1631789162369; 
 Thu, 16 Sep 2021 03:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-4-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-4-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:45:11 +0100
Message-ID: <CAFEAcA8gOtHMOLSPKyhAMCPxtTE-JXTmUvy-HgGw+PxDrbqsdQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/10] hvf: Introduce hvf_arch_init() callback
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
> We will need to install a migration helper for the ARM hvf backend.
> Let's introduce an arch callback for the overall hvf init chain to
> do so.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 3 ++-
>  include/sysemu/hvf_int.h  | 1 +
>  target/i386/hvf/hvf.c     | 5 +++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 71cc2fa70f..65d431868f 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -324,7 +324,8 @@ static int hvf_accel_init(MachineState *ms)
>
>      hvf_state = s;
>      memory_listener_register(&hvf_memory_listener, &address_space_memory);
> -    return 0;
> +
> +    return hvf_arch_init();
>  }

If the arch-init fails this will leave various things
that hvf_accel_init() just set up not cleaned up.
But kvm's init function doesn't seem to bother to do that
cleanup either, and if we return failure vl.c is going to
call exit(), so I guess it's OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

