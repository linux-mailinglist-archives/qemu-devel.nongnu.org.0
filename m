Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2DB1F173F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 13:09:55 +0200 (CEST)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiFf8-0003w9-3N
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 07:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jiFe1-00034l-M6
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 07:08:45 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jiFe0-00071c-Jg
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 07:08:45 -0400
Received: by mail-wm1-x341.google.com with SMTP id u13so14946461wml.1
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 04:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=x2xeVixd84Zn45cuy7QOJ/Uix+75kL3G8XVkLr+JrV0=;
 b=gV9Ysinto+5bq1UuLiUocRIk7bssf76HzT6NFvKKjimQ1czCPDtMc3nG54aBEPuyy7
 jzeq/kp0gYvOy6hkekYcjVT1XKK35GujWoTDB867ZqCo81wr0C2U7JLNFFJ4vAZGE7g2
 9jvk90/qD5P6yxLIooGJABNR/5nZHc4M9WU6Ja0tJEM+xmRv9QEslMEpm/aB3zrlMtgH
 ls/nsKAfrK4w/uRucHFm7CKvtD3/mlzZoH31FXyMMpHqMKKi0GAlYd2B3lYr6eTV7smz
 w2EESdLOmEztC0XnTScNl2D0SuJKTmAs6jo0hjC/Wfft3z/H5jJecObIw0LikquUGioq
 uTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=x2xeVixd84Zn45cuy7QOJ/Uix+75kL3G8XVkLr+JrV0=;
 b=cJbWiKoVh+wahOg32EYAAfY053DDpI5O8t/wZfqLORVNyOmFbSC9ri8fO3medzcFdm
 IRWHUeRXDa6HOHvqj2JX2HIuam0bURwBkzf8ElQQ+rkryK9oNObXy9JZafBxCGQE6Av/
 QKu1o9bDFVpEPgxaAHFoP8ysFKtODKApR9vVwlwWPbXO44sn6eQJL1o9NFS4tdk1uklo
 4YJ9HWKWuqoZXLUXyF5U7rGn+ohvY73NPTMFtdtgI8+qG6bRZ9yE4m1WnYJT9EDs5Fj0
 74DR+tH2ns1J6e+ECfBnpRdkGGSYGcWHPPQprHzrR07H3Ki6KvcaemLB/7e4NEYyZZKp
 lCeA==
X-Gm-Message-State: AOAM533bo27lsUKvyTM4ZXU1HG9/1cyH4+Mld3MVQeWk+WREJmZS4kuy
 Mx9lgRPIgE61nJWNLyt6G3iejQ==
X-Google-Smtp-Source: ABdhPJw7tQ39zLVGcOuo4jTtKRdU7eba/sseSEPKem+ec+OqtaYfXaIvemedNH5ahxv57jH4Q0TW/Q==
X-Received: by 2002:a05:600c:210:: with SMTP id
 16mr17058191wmi.185.1591614522947; 
 Mon, 08 Jun 2020 04:08:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 138sm23103991wma.23.2020.06.08.04.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 04:08:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70B6C1FF7E;
 Mon,  8 Jun 2020 12:08:40 +0100 (BST)
References: <20200605093256.30351-1-philmd@redhat.com>
 <20200605093256.30351-12-philmd@redhat.com>
User-agent: mu4e 1.5.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 11/11] accel/tcg: Add stub for probe_access()
In-reply-to: <20200605093256.30351-12-philmd@redhat.com>
Date: Mon, 08 Jun 2020 12:08:40 +0100
Message-ID: <87d0697r2f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
> probe_write() was added in there in 3b4afc9e75a to be moved out
> to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
> as probe_access() in c25c283df0f.
> Since it is a TCG specific helper, add a stub to avoid failures
> when building without TCG, such:
>
>   target/arm/helper.o: In function `probe_read':
>   include/exec/exec-all.h:362: undefined reference to `probe_access'
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

