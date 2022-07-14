Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AD575160
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:03:50 +0200 (CEST)
Received: from localhost ([::1]:33092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0NY-0001QJ-U4
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0KO-0005qT-AK
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:35 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0KI-0007ZU-S1
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:31 -0400
Received: by mail-yb1-xb34.google.com with SMTP id f73so3623714yba.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kMUzLwTFHm/QVns4ICjbx9F9rASaAPYyaAjqdfCibWg=;
 b=bCuO9MstrurrLg9zaKImbcZzHoSW2vomkkz4ofFqap6B5SpSWhAxRv4LZ/uS6qyz34
 AjuJWVMWTQBEEaoT0SG95+oaQjtVfaY+E99QFZ+EKsIkFqMLN95rqnRPgg0g5jkFywqg
 YWzjaL6X/qQZ03Qi9CTpZsUq0osT+G0HYYusGtBkgDpKwbzbvsY6osLZPD8xyuhpYOH1
 Gx74djxUL9BAbDAanQA7Kp7+SlKaJXgCvCNDqhSxyiqPXPi1m7/PSYNmGO6R/pv04lRP
 sulkjL6dsh1FJbtidTjs2o7lBNYS9uAWLrniu3gpSLHTvahjcsVP7cKAhHSRcgNGKTcR
 m1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kMUzLwTFHm/QVns4ICjbx9F9rASaAPYyaAjqdfCibWg=;
 b=ooIOqcWVUVBAHFRAEl6rpxLVcohh3aOrLldFRU9IcfC7su1Vl5tbPJkcneS7oCfmwb
 xW086HKH0YOV4sl/CbpHbpLD2FMmL0+cx3cHhpoEt5M1ZMmMVGFjxx3hxbQCCSBx0ysi
 +7Yk0c/CGfgj8FSPiLsPRchMGqyRY3+/ZyhxZ4R5gJRX8PleSbQxMyrtn1yKkaFBjUef
 ARJFrZ7HUisi5r70+HwX6WLe9oUbY7joS/pT4dlYwy2l4eebAm2LqBVzgFR7J8KIXdny
 RkFcvmcjnW27doP/uPOD/s/FVKnrkFvv2TiDD10h4951F/ANyEDiX7AozjSjxAS1R7rB
 4tNQ==
X-Gm-Message-State: AJIora+IK6QpdrXI6nrn9rTUylRAjvDg1Nq2hObQ1o781LTm+M0aKAF8
 x3/ywyTuw6FVZIKvcHlyPqeRdoc14BGOtUp/KyppEA==
X-Google-Smtp-Source: AGRyM1v7A+JpK/3hblYNpGWcGi5HXvRf5UYUQQdbUbuolbyRrpBIFo6eQ6OVfn7HaywLBIJoL4Hjey4ZQnMveOSl9mE=
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr9923084ybv.193.1657810825724; Thu, 14
 Jul 2022 08:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220713081735.112016-1-shentey@gmail.com>
 <20220713081735.112016-3-shentey@gmail.com>
In-Reply-To: <20220713081735.112016-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 15:59:46 +0100
Message-ID: <CAFEAcA88_N9wjA_HgF51UCfeh_DX__8cQ-m5sFiwiNyVJq7zQw@mail.gmail.com>
Subject: Re: [PATCH 02/11] hw/i386/pc_piix: Allow for setting properties
 before realizing PIIX3 southbridge
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jul 2022 at 09:36, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The next patches will need to take advantage of it.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

