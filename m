Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF226817F0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 18:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYDk-0001VF-6h; Mon, 30 Jan 2023 12:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMYDa-0001Um-Br
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:45:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMYDY-00038t-Ur
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:45:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r2so11865143wrv.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 09:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OsCcBigu8ZKC+iawaCKNGmI7perzvFKpJOeTuMRE5T0=;
 b=ohA1XtJItEHQNQXNSjPGYu/RLSCnJm/V/PzC47ibEjAqFM0unn3t09GI9uB5Hw91VC
 0Lt/UeisCAz3+Lb3GWkTadZlQtVT1jXCWl5r6r3+Doi1tLWmKerY+kkjPjVzK/VherqL
 mLSyMiwWJixb4xJF4UfMHT/b/cArQqCHFH66aI1BG0ygfEKQuQZ7t0aIGF2o/SffEWik
 cTzXCgc8VpRqznsKpCUMt1G0vuaD/G9tKDh+IdLhOhAEKguBYkDoC9lk/JuWI43bnvXP
 oLfLnyZo+ArsanD9gk1NvmYj79bBNMs3CQW1M7446nn2VQBLfjp3wE3DAvfv+rPXBCLu
 eHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OsCcBigu8ZKC+iawaCKNGmI7perzvFKpJOeTuMRE5T0=;
 b=lm0GEfqlVHQ5TURAZz8qcQJyjpD2FvGSYDYt3MM9WZi4gRA8QWyTE3s+55+rWT0KTD
 cegFqGo5XRTb8F/KO5kkvobANeFtUUOcTEaytMTPEm9cAe6RXOtW+jHLaMfkoxJkjgnP
 H45pmnQUmX9dpor1hlmStDkvH2hNbbeRG0J0qdm4+rryShggFMs9kRx9AHoksh5hDdxE
 WVwLV971ZhxCNxRRqk/+PS6j8LO/qPCgq5O9DLWXZzfP8T3mfvYkeWg1/0LuLSYMaAKw
 FFe1YtN824L/N7DqcK1h9SVyQE5eWkZGA/GehTr9cCfxquyQfsif/WhT8PZprn31w82u
 9Vdw==
X-Gm-Message-State: AO0yUKWan0RDb+F0nOuTa7SDJJE0VPNOBZaT+s7Bo46wjADN08majOOA
 5sOv+neQ9Y8SGfMvgUCF/l9cxg==
X-Google-Smtp-Source: AK7set9HxQDYoJPwcbBqV5K83UIZ/ME4mMx+DftwITEvtWcVE8bdK844Sn+BIYlmDBho7CFZsOvlJA==
X-Received: by 2002:adf:a504:0:b0:2bf:ae0e:23d8 with SMTP id
 i4-20020adfa504000000b002bfae0e23d8mr23136984wrb.32.1675100719357; 
 Mon, 30 Jan 2023 09:45:19 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d4284000000b00241fde8fe04sm12510952wrq.7.2023.01.30.09.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 09:45:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82CB31FFB7;
 Mon, 30 Jan 2023 17:45:18 +0000 (GMT)
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-5-thuth@redhat.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Stefan
 Hajnoczi
 <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 4/6] gitlab-ci.d/buildtest: Merge the
 --without-default-* jobs
Date: Mon, 30 Jan 2023 17:45:14 +0000
In-reply-to: <20230130104446.1286773-5-thuth@redhat.com>
Message-ID: <87pmav6hn5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> Let's safe some CI minutes by merging these two jobs. We can now
> also drop "--disable-capstone" since the capstone submodule has
> been removed a while ago. We should rather tes --disable-fdt now
> to test a compilation without the "dtc" submodule (for this we
> have to drop i386-softmmu from the target list unfortunately).
> Additionally, the qtests with s390x and sh4 are not read for
> "--without-default-devices" yet, so we can only test mips64 and
> avr here now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

