Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B453F515F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:39:52 +0200 (CEST)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFNc-0006zr-2W
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFMC-0005Yx-88
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:11:40 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFMA-00073D-Mb
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:11:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id d11so39049405eja.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KntA0y1r7+ryrvDp6zq59PJfKZmonmKW4Vo+BnEu4OA=;
 b=i/+9IlsUQbHWakuLd05NU0MVYuctN+B3n8pMBRmHZvpaRL3G2WtS8qYKko7pwxVhqB
 E7QZ/jhLwVBXHcDf4PM5jnAuh8jtMMlpyEMMWCRqGBPTm1hA7kMVaBQvQmWVumSah1BC
 HJe/8e1kdBxDb4Vd2+5ffJ8R+muwSfKuTsFK1TlRzDoGG14h8UTMI8ELKp93hUom8Wu8
 UmIHOXVGP4SPiVAW3x2CiiIWo+fCLAxmhgGvcWpwapeMjJuVe8oF27gMOjYmRAsEAZ/b
 UKX8wfRyzBlXAkrMcR4PlME6eEtJCd0tzhRmy7COqCLaMkOOKHLfy+16HQi1OuWIh1PE
 i9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KntA0y1r7+ryrvDp6zq59PJfKZmonmKW4Vo+BnEu4OA=;
 b=QYdSvw7z3Y6912fgsGKTWi9G5EweZRkC6IPsxLd0NcFyTwjxr0CoXZs1pfTjYAci6Q
 rYngIQoLnFZz1l0RJSq40D8nT/7MtXAA4NDwFXTHpwuHw8PpammEsmDg6wFlQMQxtInX
 BUb5XXOPCvfK+WQbSIRgD62yXVU99vIbOaEvXSH/Dss8BIDjw9O/PmAUvLoihn3/8TWT
 QUL4sqUUI8uNztBQB0W9/51uQiLBpCjS1P5UEGhDn5qv8CqtUTnrUXovhLIpf9c62h8V
 uSlVwu9SE9cJmu8BPmskW5HmSd6rI9O/RUR4DR3r5dBu1W7EwEItc4cy7fjW42EyzlsJ
 I4Dw==
X-Gm-Message-State: AOAM530U9TAeByGwckY4moH/zdbu45x0JQocDoW9HW106I0Zu9AzkhSt
 7pfKVCVB5i5b7lKIFbcpP0/uL0DvxzNkHrZ4UOxIxFah63M=
X-Google-Smtp-Source: ABdhPJxx6W7ZGXAy9+EPKGst+dK8B4z/qQ0peg9BB4iS8lAPu1CaPH88rNIhv4Ks3Gk79Bgyn+idn1anLgg4BukvmmM=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr37960090ejn.56.1629745897255; 
 Mon, 23 Aug 2021 12:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 20:10:50 +0100
Message-ID: <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This series aim to kill a recent class of bug, the infamous
> "DMA reentrancy" issues found by Alexander while fuzzing.
>
> Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
>
> - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> - MEMTXPERM_UNRESTRICTED (allow list approach)
> - MEMTXPERM_RAM_DEVICE (example of deny list approach)
>
> If a transaction permission is not allowed (for example access
> to non-RAM device), we return the specific MEMTX_BUS_ERROR.
>
> Permissions are checked in after the flatview is resolved, and
> before the access is done, in a new function: flatview_access_allowed().

So I'm not going to say 'no' to this, because we have a real
recursive-device-handling problem and I don't have a better
idea to hand, but the thing about this is that we end up with
behaviour which is not what the real hardware does. I'm not
aware of any DMA device which has this kind of "can only DMA
to/from RAM, and aborts on access to a device" behaviour...

-- PMM

