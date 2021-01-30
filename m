Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679330964A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 16:39:18 +0100 (CET)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5sLE-0000Km-Iw
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 10:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5sJh-00086A-Qj
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 10:37:41 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5sJf-0007rf-VB
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 10:37:41 -0500
Received: by mail-ej1-x633.google.com with SMTP id sa23so1180812ejb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 07:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=78kOyNsh9PFQ35W6G6J34UFL3WJ0plW3fjCLydvhNGU=;
 b=evI+JCiN4q9fC6wQYJuhNtFMDoH0y/ah6iDJRi+XmLvWYdNKZghG075xgvVS6nEH63
 QdOKU1s/tbYWcdHwDvDugZGRZzCkn/NBqE3cYw+ytxwNgNK7h9d4lF1nfdaX2dqkhC1s
 m4+eSEQWVVB2kCpgZVbmzfVhV2dfOIYlq6Vn8FQITksyJmROd5NLThrkFBPHH5OqjzTl
 COIOuFHypRtV5TiZdLH/9lecUqz5sRcjDl+DEHJb6ojwly5a2AJDEb3Bk7F64IO5s7Q0
 DlGL1cp0xxiiP+UvlIJqJPxke6LXOQduMAUGGia1Z027oaon4bMF7R08U/DuutijOrQs
 ViAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=78kOyNsh9PFQ35W6G6J34UFL3WJ0plW3fjCLydvhNGU=;
 b=f5vJzJMCJnWgxRozWRZc1o+awotOE+gy12g01OmXeO+xmhKmOy0/4uUgMBlaszbRgX
 PFWgPW0xitNkVNvo80MUgabrp0XCM05BAD/o9Fxs4mpScr2sDqKhDMRCq5k195eI/AqB
 utZ4buio7OJmTS2Cn/vaUpk+v2vFiMYtf1QfvuxwihjEjCooI3g7qYWfO2s6f/WRrXIe
 +scc8HNyhYJEbguojc/mw7hOuzaugDoPS84YCdaK+GerYoaHEJGQ5ZNBiQoQEzc/pYdi
 1VhJjW+gBxMm1pJYSbI/iBhd+97wuNXosaEHFZ4D2vxvnE8NAF+mkXRZldw1C4r4zfEs
 omMw==
X-Gm-Message-State: AOAM533FoVAPANehNCHIFsMjMEnmAYm0tcnLmdNlrIsIfkudxmAzquZO
 o9MZDgc3eqwgVK8LyDX45UvorWD1mf9IrBGQIgOAOA==
X-Google-Smtp-Source: ABdhPJyD++UlciKvmROO24kS3r/XXDVKijRu1H7xIYaJRV48MHyTsJtFtdfA1zpizwOdbfEwhqs6mx4IqJ20F8mkBMc=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr9386002ejz.407.1612021058129; 
 Sat, 30 Jan 2021 07:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
In-Reply-To: <20210130015227.4071332-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jan 2021 15:37:26 +0000
Message-ID: <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> KVM requires a cpu based on (at least) the ARMv7 architecture.

These days it requires ARMv8, because we dropped 32-bit host
support, and all 64-bit host CPUs are v8.

thanks
-- PMM

