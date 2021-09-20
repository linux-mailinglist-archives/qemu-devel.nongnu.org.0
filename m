Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92494112B8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 12:13:45 +0200 (CEST)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSGIz-0002ox-0J
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 06:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGHP-0001w3-2r
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 06:12:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGHM-0006Lo-2A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 06:12:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so20990227wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AWfNgHzJqScLiNg+Y3WSNI0s/hxR2pfb5B0L6Uyrzo8=;
 b=vFNzSg37633yE27Pr1KnKHloC3H5XPHlPtkTq+F9KRRsGrhbpqwp0uvcpWlsUsd6re
 DHilHp8BZn910WusUFiWj0vVpvjckP2vZC7HkPDBR3AsmKQt3lx1wXrmCD7iQQ6Ghxfl
 MrCFco9J92032mG4kgoBToFk1afABnqcLP0uIhmyOctbYxQtZJY7QfBhNufcpIU8QwbD
 jkOF04x6fhesDUTmdf/x0+f/jeGkYYGIRQpK3U6VDcbsiHLF5ZMX481p16AzM9aDASFd
 jewU3YnWkNvHmZ7gdOsnsYrk2cz72xRX3dcQK4HtiJEoq5JpZcSOawJtWxIfCrfEeSMI
 mNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AWfNgHzJqScLiNg+Y3WSNI0s/hxR2pfb5B0L6Uyrzo8=;
 b=dyZxzma0qVtbpuSI9B7n1a09sYsVSFEjQTOa4o20UlhTuPzWNKvg7LXV7rgDQYZAt7
 n7GLW6umKSbpI5+yNTmSIDJtwpy8Ku+cve3GTiYUmteUU0eBxjYZOxiRYXJpZzFEqaGo
 bon2QH8elCktrSPgPVM9Lo4+U4k12shqByok+zRNY5P3ZvLOZCPIMaEfAO0cSZ31am/e
 5q8Ab7mkttjKnBkY2p1aQCfU6u0/77vNTkuwIpjrNKSdEqB/FRIw872Fv+niCFPVhG9f
 Xa8E3IU+NNsV0J+OpKCXBI/6YJ+nPfe1WLeZd5awisUmKBCSzf3awkrgwTcb/8W9CQuR
 rnPg==
X-Gm-Message-State: AOAM533f3VwftLh0L4USol1q0SzNI1vJR3W0jNvUd9KNIeb15cVTr3gd
 iqyqvPtbIIUC+quhlvCZipp+R8tPWA94X9+5+9QrZg==
X-Google-Smtp-Source: ABdhPJzTsJ9y+K4fB9iBybXIoiWzx7mIBQNptCdViyEZjvE0VeabXxeWE6w95ytT6GlNiQqUzX3CnDUvCKeNhrP4/wk=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr28522527wmo.21.1632132722320; 
 Mon, 20 Sep 2021 03:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 11:11:10 +0100
Message-ID: <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
>
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
>
>   - gdbstub debugging (breakpoints)
>   - missing GICv3 support
>   - Windows will not work due to UDEF SMC implementation
>
> To use hvf support, please make sure to run -M virt,highmem=off to fit
> in M1's physical address space limits and use -cpu host.

Applied to target-arm.next, thanks (with the unnecessary #include
in patch 6 removed).

-- PMM

