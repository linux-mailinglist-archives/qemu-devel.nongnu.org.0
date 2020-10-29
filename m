Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386A29F079
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 16:50:43 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYACI-0007re-G9
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 11:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYA8E-0005AX-Am
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 11:46:32 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYA8A-0008H6-Bg
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 11:46:29 -0400
Received: by mail-ej1-x62f.google.com with SMTP id dk16so3869771ejb.12
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KxA/Px6z93v4egH+xmjQIZULKOvVv9SLH9R2aKvoKbM=;
 b=ZGaIX3g3X+NDjch5zikcCYaDfPmmxvQwAeVH7rXKlbxWgRK8p29UhnOS9czDK6y/mV
 nlQlY51HcDC68hub7oRKrLv4tQy3hhgaxa/geh4bAKD1DjNXI33xubnrGMEqsPwu43Vq
 nhNFzCJOv+UbZ77SVz/ablBcv9fU5nOUIvwZIgm0WA4DK/HnxLCA7FvtL3a8It1DEZ0y
 OTdn94S3YlJPNnZfCRAtpcilxBAU/BTNwfdLiAJYN9fbJqyCEOoGQncx77jzswOpI+Vy
 8Sety5AD7RLUMPwOV79LC2YL/0NaeSUeLHEqL0/ExjV74cj6Rm/3OMlBwZee/UmAhMIL
 qGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KxA/Px6z93v4egH+xmjQIZULKOvVv9SLH9R2aKvoKbM=;
 b=J18pdRYbiHEkHD3mBCxFHbdNQJFsScO7OILv/R/5/35rThjddtlAImXk2Kmk36GMdo
 IDgeRgOTCj29VHyYOHxaj+Q4T4fH4b8ckt/n7Ki/dxZQkGEgK1nuXWJdXhNYySgA1iUJ
 ui2Ux5yfuav3UsUqcyanydVz4YhACgEPfW1ho0poZXIhKlrHJg6iqtMSm8Vuvta7MJMX
 mz4nXmcL0h06XXoFLpJ3w7Q71QnJu3b04Ep5eTIvrvwDvu4D7TUbo9k/VojG4GNDDWEt
 O3IXbLqcoSDeoifMv1E4J0fiTlg+nnffk+E2cv17FOkRnHRhqMRg7q9UUkr+xCtZ08/e
 Mh+w==
X-Gm-Message-State: AOAM533gXdi0ymJ/cyepYGNFBXcKeebiarwhmdwIrx+TLuk3MyBa8syc
 rksZtbIZyHR55kf577yDxuW3YZIPOnPyi92sVEwsAQ==
X-Google-Smtp-Source: ABdhPJxLJKCT5HIN59X8QJltek7+WaG1XCE+9P/vPKlDBoKjQ5hGuFgVdU/OqFBH1ks57bQa4KgfEjihcs+CZbxpVko=
X-Received: by 2002:a17:907:9e3:: with SMTP id ce3mr4748727ejc.4.1603986384274; 
 Thu, 29 Oct 2020 08:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <AM9PR09MB4643ECD51E00A54B871DED7682140@AM9PR09MB4643.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4643ECD51E00A54B871DED7682140@AM9PR09MB4643.eurprd09.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2020 15:46:12 +0000
Message-ID: <CAFEAcA8mcRhyYvfJyTZhdCmwkzP77Nhb=ehUBmYSiwZxMnSBdA@mail.gmail.com>
Subject: Re: simple example of pci driver with dma
To: Shaked Matzner <shaked.m@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Oct 2020 at 14:59, Shaked Matzner <shaked.m@neuroblade.ai> wrote=
:
> however the value I get is still 255(0xff) and not 18(0x12) probably I've=
 missed something but when the interrupt is called the transfer to the RAM =
address should be completed, however it seems like the dma_write_buffer fun=
ction from the device does not perform any transfer. What Am I missing?

The usual mistake is forgetting in the guest code to program the
PCI device to enable bus mastering by setting the Bus Master bit
in the Command register in the PCI config space registers for
the device. Unless you do that then all DMA attempts will fail
(same as on real h/w). In the Linux kernel the function for this
is pci_set_master(), I think.

thanks
-- PMM

