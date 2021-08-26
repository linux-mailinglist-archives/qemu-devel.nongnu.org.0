Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EB43F8943
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:43:42 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFfR-0002ML-Ge
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFIf-0000Z1-1x
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:20:09 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFIc-0006sv-3Z
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:20:08 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u14so6143832ejf.13
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VcB6UPUv0/aefkn21WKvLPnZynKgM5JWfyphg6syXCc=;
 b=evH4JPeVuIxkidqquobJskpIj7Pi7vQE5nbm6B/vVDb8cQ1fWolOw4YXa6Jzy8RfhA
 ltzoJBHL6BjJYfdWOR2V2tt8kxaQ2RHblX8BICVWGEihniF119Jkn5FUbNGk3m3M43uW
 B+uDCzmsf7s07imu7ZmeMEI8HfvqJnKYp+iM7kS4z51S4bhw8e7p3rR0gU6XZdMIjR1h
 yQOxabr/sH3YF5dFoaiCK2g00PzOkFKwC8au6jAIMG6FaDoV+vN88oNIk5JdOHf37scc
 kzONGxUJ1D11SEdz8nSHoh+XMEvcEujQrpWqgd/XbQGJwK7nSMoSGu+7EdFtmFbj9IAc
 D+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VcB6UPUv0/aefkn21WKvLPnZynKgM5JWfyphg6syXCc=;
 b=oPDDF1OLfZwjRtMFRy/BVkz7BAqBvGCHR0ir6pxHyNZ18Jcns536IL6OvwYIrgN7JS
 2D8djZVk+CwkxoSRQuXtQnzT2vtD1KsPQs+wzKp4Ng5Uy2Ura3cirSFSq66+/n6Wwoe1
 VivmZAmb4R/j/E9r6YhjMDrqAfhzuXUiLbMd1rycXSYGsCBrTMGg1nYZzFQCkIWOkgaD
 hj4x5lBM9CJuNJMHJMe1BXIBPE+SEavCygypyrqenv12uPXP+8gobW2kedmcxF4skkLZ
 ipnGRhwYHUSJc6CIMiZiZsLjIQTqB2eY32b8B53hY5Dyzyub6vkNKWfcdwt4FPbCWpba
 YtWQ==
X-Gm-Message-State: AOAM5323V14p7MoUtAq6l/jxkVtdUp4HegyECKM2FDb40ogRztu7nPCA
 uvHcjX9oY65W8x6jnzBz6v5e/DCNx7eFLUWUee2l/A==
X-Google-Smtp-Source: ABdhPJwh/2gn6ZpZjlkqWsM9qA3FsyQVBsBf7KgjLnlUNrR0UhzB4NqGCQdP0QkEyUsiBTJHvSkduqWqolkVIeJGge8=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr4340252ejn.56.1629984004616; 
 Thu, 26 Aug 2021 06:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:19:17 +0100
Message-ID: <CAFEAcA-n6VmzGEp3SCEgziEC6TkcbgunTVqVmJ3iyfVCpRbbzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/dma: Always expect 'dma' link property to be
 set to simplify
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 17:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Fix a qdev realization ordering, then simplify a pair of DMA
> devices by always passing a MemoryRegion property to the device.
> Doing so we can move the AddressSpace field to the device struct,
> removing need for heap allocation.



Applied to target-arm.next, thanks.

-- PMM

