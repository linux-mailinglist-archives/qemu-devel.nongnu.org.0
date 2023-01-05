Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C671A65F2E9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDU8b-00059Z-5f; Thu, 05 Jan 2023 12:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDU8V-00056N-Rz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:34:40 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDU8U-00048f-7F
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:34:39 -0500
Received: by mail-pf1-x430.google.com with SMTP id c9so20959499pfj.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9SaT61HOYH75jZrr8MRMbszQ+Ws1fT9/d8v9TB2X+PQ=;
 b=S1YjxtOU0+s3X/L8mNUlCvctsZri0tY/ISxcacYDXcvHtIvdY9Uqc6Rk5RLwxOelBv
 xA6ExmPdLGF4aHH5I0UXIkYLjvLTYGgggzNq4Xpj8sSSdZwV2XGr10gmERHNwQrSSRvB
 pMBMquIDpIWJyqEnjq+8T+638UDs/Ud4o4kXTl6KrqpXsvwyfZp+SBhKSjWTHhdh/ZdH
 9mlFBd/MZGZjrC0peTYny+4NAGWjlZUN9hUL9nDrVCKa9lVjfF4z0rySzV5Q/6r0ttGK
 3/qS30eOOwKRd3qFZ4vA0OuYrUdk7k9gv1mv0AiDAkv6EZm0a3+NpFZbvg0SS99JCRdO
 s8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9SaT61HOYH75jZrr8MRMbszQ+Ws1fT9/d8v9TB2X+PQ=;
 b=UUUl3pNakOFsJtWT9yRgg4cDfeCY+4gZRKVg/sf37speiuM2UBzNcYpLzD3Yj5u7ij
 5RpjYcDKA89mOjKuaupqxKNVvJL3EvyhTw9e12nWLhlOTe8xE6jyCOaRyuvIM6KRWOuL
 JJl8hr/5kY+ZKwXrHlMlhaj5OAnPRbxlJql6TeENrEdN392M5h6WJXlj7355qybd9DbR
 ebhS7glLD+IOrUeLEiBSfdYknTbOge7gZi9TWahNKulGmNQ9OtRFxnFCymy7LDLa2/2S
 vzFQlKZh9H7dhcrmGOR8g3eBJYMBkyGYRqYaaITTNB7z4Sq/205pa/n9zVY7OtR583rX
 91dw==
X-Gm-Message-State: AFqh2kpI+FWYwgiOXarde/fzNAUQG3KfNah/+zuH85Q6EviM8F0U5x3O
 u+YQ6B8GnQHEk1wN6/rmiS8AapRhtnCXb0TLoGIlDA==
X-Google-Smtp-Source: AMrXdXsw4aT4/br/rWhqnDKzlTDM67z70qm5vBM3QarEV6QYEPySgKCfDlvA8DO3Z5Ea613+rec6CFPrcWOGyiruq/s=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3304534pgh.105.1672940076725; Thu, 05
 Jan 2023 09:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20230102154630.211785-1-rebecca@quicinc.com>
In-Reply-To: <20230102154630.211785-1-rebecca@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 17:34:25 +0000
Message-ID: <CAFEAcA8b8PCp_JVcrSFNYsOYTNWaAedkELENVNcVH9_mc-Go8A@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref.c: Start APs powered off
To: Rebecca Cran <rebecca@quicinc.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 2 Jan 2023 at 15:46, Rebecca Cran <rebecca@quicinc.com> wrote:
>
> For the SBSA-REF machine start all APs in the powered-off state.
> This reduces host CPU usage until PSCI_CPU_ON is called when the APs
> are needed.
>
> Signed-off-by: Rebecca Cran <rebecca@quicinc.com>
> ---
>  hw/arm/sbsa-ref.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 4bb444684f40..cf0af35c7807 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -753,6 +753,12 @@ static void sbsa_ref_init(MachineState *machine)
>                                      &error_abort);
>          }
>
> +        /* Configure all APs to be powered off at start */
> +        if (n != 0 && object_property_find(cpuobj, "start-powered-off")) {
> +            object_property_set_bool(cpuobj, "start-powered-off",
> +                                     true, &error_abort);
> +        }
> +
>          object_property_set_link(cpuobj, "memory", OBJECT(sysmem),
>                                   &error_abort);

This board disables QEMU's own PSCI implementation and relies on
a guest EL3 firmware to provide PSCI. So how will that EL3
firmware implement the "power on" to bring up the secondaries?
QEMU has the APIs to allow implementation of a model of a
hardware power controller (target/arm/arm-powerctl.h) but
as far as I can see the sbsa-ref board doesn't yet implement
one, so if you start the CPUs in the powered-off state there's
no way for them ever to be powered on.

thanks
-- PMM

