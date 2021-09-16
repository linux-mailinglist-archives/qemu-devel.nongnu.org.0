Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2740D9C3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:22:04 +0200 (CEST)
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqOy-00022L-0u
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqMD-00007h-4f
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:19:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqMB-0007Jx-4L
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:19:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so7247494wmc.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6+2J429AKKWmA7iWiebRHTPC6uL6qahB8bMeVZb9zU=;
 b=H3jOEU1sqM0YyUSCbfQKN1S4HIxkuvsEKfA8RX8cqcHsQN46xcLwyJ3kqkLzsMuDmk
 JNMZEorHMdChl1sIkeDN1g4ZfJ+TjdeGD+hHF11cpbAyhINriTWHCUgIq7XqGtYIqhNw
 wbddWJ/xDap8lWdskaKv5818QWweCLJbhMlpQu1yjLMSV3QlZ6QYV5sH+r450ihvELHj
 sDL7eBJhZbED+oiOs1pIe0fuVYOS5X8Jwuy7Xnll9psckp/IY+Ghfz9dYxHmX2YrnMVU
 jkpCwmfISuVHv9AgwW901TP23KvyVCQwmkj/uDC5iaKR8N4ifoTkOCnIO8/mdqWwojBX
 I+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6+2J429AKKWmA7iWiebRHTPC6uL6qahB8bMeVZb9zU=;
 b=t+v8WGMSsUy8rbq/q2FAH+L7XJD5YF7epL0BmureQHKC5BW8RrjqbKxSUKBB4KzQVI
 gg8LqfXDK3izsMf4mEU44RTs8EoWfTJgFK8MRO8HTSlqI/qHfDgbKDoVVB8cJTdKri5Q
 6boNfOGcV7P4qsOCmapiblHZNREbDd5a9pJwAdGo3xk53hFUAuDCqN+qmfiLYacFOQcO
 8+qzI6qUG6fIHHV/w8fC9JuTwADS8XplwIn+5AdrtCaHqRJUB98KfdcvnB0iAeI6MSxV
 3+L3UgWeoTRp99rxRGMiX5o6xdsyEdXZnn3zR1AVul0mslYhdIaVdCsMlg/gFpwa6xCz
 k64A==
X-Gm-Message-State: AOAM530J6zaV/acQhQAWz73HDXvenOMOeWG6wgJQaWf3qCp3tSg9Y47Q
 iPRNSuAJed2vY8ChVHb6QokMLwBrj8ha1L7LngZamQ==
X-Google-Smtp-Source: ABdhPJznfEZdxkev+LehJmdGEBd3RElm452l814NxzltMH5ec/CDPrgsB+w4/JbQh2HO/vipB8PX9Q3LpVW367vzqxc=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9626908wmo.21.1631794749402; 
 Thu, 16 Sep 2021 05:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-6-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-6-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:18:18 +0100
Message-ID: <CAFEAcA-gYow+rkW+LDgGPE0tWP4EJVLjZu3yMtNBcfhuNmhh7g@mail.gmail.com>
Subject: Re: [PATCH v11 05/10] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
> From: Peter Collingbourne <pcc@google.com>
>
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
>
> In this implementation IPI is blocked on the CPU thread at startup and
> pselect() is used to atomically unblock the signal and begin sleeping.
> The signal is sent unconditionally so there's no need to worry about
> races between actually sleeping and the "we think we're sleeping"
> state. It may lead to an extra wakeup but that's better than missing
> it entirely.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap,
>         support vm stop / continue operations and cntv offsets]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
>
> ---

Other than the points Philippe raises,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

