Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969146922E8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:05:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVtw-0000Q4-79; Fri, 10 Feb 2023 11:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVtq-0000Mt-4Z
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:05:22 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVto-0002JN-I0
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:05:21 -0500
Received: by mail-pj1-x102b.google.com with SMTP id pj3so5644280pjb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDzH8gFRc6QSgS5xX+xi21bbMDDxvyItDJ2vn+X2epo=;
 b=O16kRZC8keuMRZLMwG6ww1TPWDKaPAjtv6Rybr+SRgCnKLFiy9nWzmBFcj/iBxOtVG
 pJLwhmtfy06Jy0KOhpO/mnjcHopViPNnEbW6NYWCIoFm3FslWsSmERX0xGJa66D1cRdJ
 Bs7k6A7hzNUuLJ13tYvPGGmYaNP/kDue2eNWJBvpoapbFHXdeNZfOuJGOWdlh+hQvot/
 qjw401uo84h9AotK1Z6POiLEaE0z4UWTRq/GLU8isKsk2TMsH7javWgExQD3pYCBMmL5
 5N7KKkkzZeyFcQn00cQTm5BvUQk7ll7wH3srSvigwVkrDzjGMftwTdlC3ZL8EasuRFPQ
 5+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDzH8gFRc6QSgS5xX+xi21bbMDDxvyItDJ2vn+X2epo=;
 b=Fx0ITK6L5lnHh+IWF5S2+INwFbtPYukjHfOE/9lkrkkWlBu/DHXeE1sIIXz72eMfqV
 DO7knc8JW5tw5AUf5Lgu7pfKZiuGMw+Z+gipa/OHVO8bsJZIL9yGzxWN3cHWORy/jhpn
 i/QK77QVn6U9R1WLVE4AgcgUE+kX2fdY7qqkdqsecR7rFMgv9F1z4/ZGcdZV0XgC2PAg
 UsC5maAOos6g/hAJUTSQ3y0H763l7XHW6fCq99GBiZrepXxJW5firR5fakrYNrGIAUne
 OgQlRqhvyIxc6RjWX+04S1mszVtlZ9iZfyPm+hQxcQYJsPQfQWN6x0JoFr2CnqCpcbf4
 7L0w==
X-Gm-Message-State: AO0yUKVLhHOGjcCaXmf4zphT/XZCp9+7j9wUv8EHGdYukAOZ9YQRHbjK
 hFVTWaNZB0Q1DOHYN7vSfcu49wASejW/nN+hMYQvZg==
X-Google-Smtp-Source: AK7set8lW2QM55HAOLEf0zQN7fcNuUnzqTtt9EPBACdfDMUC21Uaovna5SELASAloZUPHnku+VUGeqhw9qRdiw7a6KQ=
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr1711487pjn.89.1676045118890; Fri, 10 Feb
 2023 08:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20230203181632.2919715-1-alex.bennee@linaro.org>
In-Reply-To: <20230203181632.2919715-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:05:07 +0000
Message-ID: <CAFEAcA_NNfc5OAjM75-pOat46sZza81vXs3b22Ng_niuK8ovyw@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 3 Feb 2023 at 18:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
>
>   Overall coverage rate:
>     lines......: 11.2% (59584 of 530123 lines)
>     functions..: 15.0% (7436 of 49443 functions)
>     branches...: 6.3% (19273 of 303933 branches)
>
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
>
>   Overall coverage rate:
>     lines......: 11.0% (58121 of 530123 lines)
>     functions..: 14.9% (7343 of 49443 functions)
>     branches...: 6.0% (18269 of 303933 branches)
>
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.

Applied to target-arm.next, thanks. This should significantly
improve my pullreq-assembly experience :-)

-- PMM

