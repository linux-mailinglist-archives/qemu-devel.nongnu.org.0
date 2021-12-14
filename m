Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D31474532
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:35:20 +0100 (CET)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8ti-00066h-Mp
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx8sn-0005Gl-Kv
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:34:21 -0500
Received: from [2a00:1450:4864:20::52f] (port=40837
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx8sm-0005yV-3o
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:34:21 -0500
Received: by mail-ed1-x52f.google.com with SMTP id r25so63133974edq.7
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wzhoHe2yIViMpFVxwpjFXu4RoD17jqcz3vpqseJuhgU=;
 b=syv4nJUMuxOn91HA1NzyaUO9ngEFsIQZWF6mMLBwWIt8rZWOPbI26RkYwyVk/Ri2Nx
 PpCzGku9QdI3/020sepsv3pUWPqdzpl46h3kRRIjjov/Hxs5xTJMPDLdkCC+gV4GIqUM
 voQf8Q8Zpz4TCVHi4DDUvACRSCBSzazYy1jfBeVCmt6onir2o960EVDiBdJv10v/iR9w
 +sslaCZPMMUFJqcaSyEBIyfwdO4VZEDBdWiOx9XeB/SH0k5Zjp92GjzEhQjJk7ZQsln/
 scXTZaAG0oKIhurOsix1HMogVr1TUfAKQUojx3cchYS+er+lIm8u5DW0HgvJh37Qh30t
 PpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wzhoHe2yIViMpFVxwpjFXu4RoD17jqcz3vpqseJuhgU=;
 b=EzBvPVpYZ36N+eQNYFzNafno3R37t+51ojp4eW5ifeW85v8W/0aOx6rhs7rMaFkWxz
 d81Fp/+povdzSQA74j4hTowPkLkBMKKsnhXnW2VXynNw1OAylWZG35gq0jKC/47lhaiA
 fkQF6KJ4jKqipQlLtI8cVsMQQl/nIInkeHWdhlnOGIzrR+xI+4fCMcVfoBpm+f1cixDQ
 +K0KcyUZeURqu6JVyRYIZ7knQ9F13VTa65/Huq8yfIk/bJhZNHvOBKy5x3tcOGSsgIWM
 rKkTT/NG8ETswV3n3AOyWB0McKscvtU4og4YEZ4l+jCgUj/IfEtPrwKs2eeYyPJfMnkz
 dUtQ==
X-Gm-Message-State: AOAM5313jhp7HGOO4kQMTZZNB6OAH9R7zrGEbiUK/DIzhV+wr1VCu5po
 PgEJt60XZO5vQZTVKF3sZtyRxA==
X-Google-Smtp-Source: ABdhPJzXVj1POZgbOi/zDQb/JLDoOIAktev5yvYKqo99scxuhdVjMn7wSBWUuIollW8RoJ9BzwLe4g==
X-Received: by 2002:a05:6402:50c7:: with SMTP id
 h7mr8347372edb.277.1639492456181; 
 Tue, 14 Dec 2021 06:34:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n10sm3892646edx.3.2021.12.14.06.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 06:34:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FF9F1FF96;
 Tue, 14 Dec 2021 14:34:14 +0000 (GMT)
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/6] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Tue, 14 Dec 2021 14:34:10 +0000
In-reply-to: <20211208231154.392029-2-richard.henderson@linaro.org>
Message-ID: <87fsqvi7bt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Without FEAT_LVA, the behaviour of programming an invalid value
> is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
> minimum value requires a Translation fault.
>
> It is most self-consistent to choose to generate the fault always.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

