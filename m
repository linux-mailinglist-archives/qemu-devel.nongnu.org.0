Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF966C668C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 12:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfJ68-0002kv-LM; Thu, 23 Mar 2023 07:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfJ64-0002kI-So
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:27:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfJ60-00014f-S4
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:27:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id y4so85026144edo.2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679570823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=na3vfhMV/9RU+XBpFi5fJnfv6Pf/vez3GlZkp/8INEo=;
 b=aeB/6P/PXvKWOQhVY1V26ki652mRbZYqUVA3yCW4zbXZBgz7LYk4w3hW5Fw+zAe8ne
 r0BspDXaSvIOBEFRVyISor5SlCoqeWxVdFHkuScLaj9L9C4dPIDsFtAgpC8cEG7iZRio
 la3jO54pz56ZueQYC07+SrloCp13JfYHNJdHAbAM7znY3feFSOPYIb7sgbhUSK7vfzCW
 IEe4lkNHYYAqSBIk8Rea1qPlHzge+XRj5r8cHQI2YxzA8smq38cscXNHgODHBDM/Imqa
 cvxiS6pR+jkNy0kDH9geE81hJBlnASqoxJDCkR+rG1UvMurTOr87KzikLDF5fJ2ZbVR2
 p1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679570823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=na3vfhMV/9RU+XBpFi5fJnfv6Pf/vez3GlZkp/8INEo=;
 b=KrDVgb9uSrXigBXvPtKzpSDDSwS17ir/PDSxSCoYXfCdx8/N4VjFNbBgFYPb8qXoU+
 8DHNT4FvUthixBOCoiLa+6BF2FYBk9knmkpZEKZhWW5SgrTr5jJEzHcvj368jopDaIwM
 FF90CIdlq45Vm+mpHSbb97v++AEyoXGTRYCweaZMfs/lepnrs+UYOkKYMhq+JvW4VXgF
 m1kkbxQiHW1TFWCngxPMcD6D4v2x2CSIKGfyfofEewkaKnvDIVjleaxi3RnK8w7xia2M
 TQ5J7ZEnV354JFA8RvljqypLEfnqKT8xkvNvgvSh79i9I7yqI6LNb/DR0YKx7UKH3Vvy
 gGWg==
X-Gm-Message-State: AO0yUKVS7IOJOa7W21zIx8qpaBsNTgsq3bG5pa0uQVDSoUK2veGcHIQR
 F+GLH7esTLMrKLtHZsWoKyO8N64QgMSrABH1Xb199A==
X-Google-Smtp-Source: AK7set8/M85DJHDrKg172YHLGA/JPAN312SX7n2fm7n2GdDFo4h0NBliZ+YpaN3EQq0u46yAGfL4bSlbi+kM+MqvQRs=
X-Received: by 2002:a17:907:788e:b0:932:4577:6705 with SMTP id
 ku14-20020a170907788e00b0093245776705mr5151875ejc.6.1679570823093; Thu, 23
 Mar 2023 04:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230322232704.206683-1-venture@google.com>
In-Reply-To: <20230322232704.206683-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 11:26:52 +0000
Message-ID: <CAFEAcA_ftH3N5NJWfBMCxXW6T+OfA=MmpKMi=_DvrNk9u2WTxg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: support both pl011 and 16550 uart
To: Patrick Venture <venture@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 22 Mar 2023 at 23:27, Patrick Venture <venture@google.com> wrote:
>
> From: Shu-Chun Weng <scw@google.com>
>
> Select uart for virt machine from pl011 and ns16550a with
> -M virt,uart={pl011|ns16550a}.

Firm "no". The PL011 is a perfectly good UART widely
supported by guest OSes, and there is no reason
why we should want to also provide a 16550.

thanks
-- PMM

