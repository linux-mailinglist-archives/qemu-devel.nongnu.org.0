Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DB50B2B1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:15:54 +0200 (CEST)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhoSG-00038M-Ub
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhoQ9-0002Qh-Gc
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:13:41 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhoQ7-0002TV-QC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:13:40 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v10so4332172ybe.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5un3GGVpRP6lvN/15IwulcKdkml5kiELgGmYH6Q2mKI=;
 b=TU8Rzi+QTRT97HF4DqsRfFURgCa1LfpUhAwGCu6kkzwyR7kiovVRutlPg3lpt9eWHn
 8fu+Tbq+VTdI113c+xck8ytqIo94+LwpdEXYKtQY3nFFo7fbSnQySgeC7s3YkXu9fNbt
 VqnJxDja8O/kPnrhMVq+6N7QWSyOftvDKPYK6c+LxU+JDwT3V0+UXm2uboXiVyaLJGzH
 NPozf/6bxIndX4lZXpCK9/NHWyiQ59u1SKj39A9nDE+MNmXgnTbmmORZm+mbSslnnFGn
 lrpOEL6vBSsOMpSQQBoptDVDpNeZFMF1z0EtD6EvWObkvI9zJSX7bbeWMAoX6fguwKtL
 PUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5un3GGVpRP6lvN/15IwulcKdkml5kiELgGmYH6Q2mKI=;
 b=VRtJvhlgnExj8GdjTOPEciFmErQlNlvq+jXHvRfiRq+p3x4ZAGkW1kz0frqKE1EBUe
 c5bu+gvYc7H6XTz2Odby3EUHqTL2gdiDGQ5WDWjeXbRp4vR0SqANqfxaGyY3BS5uzx3R
 vptlLCS4Aq1V9lgQVLmak1p+X5yCxHN3L5CH0h6rktbF68En6LujYiE3aY0QZZbNxDGo
 L4AFp5gPIoyRKTSdEH98u3E7LX0OBcguw9YJCx418wg8EO0A7gR2kpFFa/FhawT+TUFQ
 VkNSS7i8QsG9Fy6jzW/nYbXfsitD18eIMMBKmciRw3F/WTVZ9R9LYKvyEOkmAtNym9H9
 FdzA==
X-Gm-Message-State: AOAM530VBQxWQUMBOVt5VC0EFGMwIgbq1OcubdNmAJF3HF7HV7SuDttR
 8MCxVtKuRncIdtfeGqnviPZPwrQFRFj+mNI6Bl07Rw==
X-Google-Smtp-Source: ABdhPJxHdEH4QMWfgIN3kc4YK4pl7nNp4ExZsTQNk6bo1LMdb9CkDVxDQjTrdXGrrtcwsEMfo8qctT7f8vh7iydlaEw=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3290999ybs.85.1650615218497; Fri, 22
 Apr 2022 01:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220422055146.3312226-1-wei.huang2@amd.com>
In-Reply-To: <20220422055146.3312226-1-wei.huang2@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 09:13:27 +0100
Message-ID: <CAFEAcA91EnBT9t6ZvLj7F_=z9mgsjN_QPvQPoZ98WR3pXQo=nQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/i386/amd_iommu: Fix IOMMU event log encoding
 errors
To: Wei Huang <wei.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: eduardo@habkost.net, Suravee.Suthikulpanit@amd.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 06:51, Wei Huang <wei.huang2@amd.com> wrote:
>
> Coverity issues several UNINIT warnings against amd_iommu.c [1]. This
> patch fixes them by clearing evt before encoding. On top of it, this
> patch changes the event log size to 16 bytes per IOMMU specification,
> and fixes the event log entry format in amdvi_encode_event().
>
> [1] CID 1487116/1487200/1487190/1487232/1487115/1487258
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Wei Huang <wei.huang2@amd.com>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

