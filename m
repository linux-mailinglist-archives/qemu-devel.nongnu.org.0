Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E931A489642
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:23:44 +0100 (CET)
Received: from localhost ([::1]:52140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rq3-0002qm-QK
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:23:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6rnc-0001jL-5w
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:21:12 -0500
Received: from [2a00:1450:4864:20::529] (port=44907
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6rna-0004WW-Ev
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:21:11 -0500
Received: by mail-ed1-x529.google.com with SMTP id w16so51462046edc.11
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GNQpIfCsHVphaqNMZVyiGSijlwscDz7gqTYsCwyEhoc=;
 b=xWvVajNL2IjVRtjUhqSf07dndIP/f9HG6L2t2Y+GP/Q8OgltfiIHBZ0VTsnc3G0ncT
 f6yUb50FYm149qlLONjZBbFMhqBGwUqcKekjuPVOr7RSgQZ5rwCEFy6WJMN7bI5r4TZ+
 VJkoURkQrg7WV37Q9XM9ka1dBcCnSHvBch7ZNWiKqOgbFjGcgN8HklIaS5IimrPjsJlH
 fDJ9tpExyjO/rlAHT0XkE3CHDFxXI//G7AWmtDWFrxquzzGwRQqTcSU7I5QlKGiSdHZN
 m6MKVVDJoHOvIc0Gf+we3iTkvEfok119LpjSR+Lq7jrQ9B2sfAX9QTCGrYx4H9KMQbQL
 FPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GNQpIfCsHVphaqNMZVyiGSijlwscDz7gqTYsCwyEhoc=;
 b=we7kvbldiuxSuKTXfzxaUJ5v1N419DTuKfkaYvb17MfCV58LKpBzHXk3rQIDTw8R5D
 qWHkCjVJZY57mJ2tYHlZxIPy22GP9MBC0zImqWMrJGrwLdc9GOqC2wXmTOk/kRYFgrJA
 AyR5W8/WoRXDonUaPTVMIS/e43lwu7VLU2NsMAFYJn3XcxBTuPm12+rLunBXUqcmONar
 qvciZB/LSV7BPVNBH255ju/IP5Ogle1zPe6WVcJ9wysVpwCuJQPw3skWWxM2veQTL92d
 WjcmbgY7g2L40wLkhJZx59nHx9+luSJu2x5356x/YEqKHfUFk6HJSpiYYXzSCUfXUOxt
 u9gg==
X-Gm-Message-State: AOAM531QMdHeJW2iQMh8+jnC20cu7eCSIRKZ/BDJ+OpCYUyx5yIcGZzJ
 4/sZFF2mvIfu5oLC1huqUNhjcA==
X-Google-Smtp-Source: ABdhPJyosLFM5QIzVhcYFsAR39AlhGfHUCqcvkGMGlj62zpLm1+iAZAs6stGSUOMbzPe0zemkA0yJQ==
X-Received: by 2002:a17:906:2a41:: with SMTP id
 k1mr56270764eje.512.1641810068398; 
 Mon, 10 Jan 2022 02:21:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v8sm3317558edt.10.2022.01.10.02.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 02:21:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E128C1FFB7;
 Mon, 10 Jan 2022 10:21:06 +0000 (GMT)
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-28-alex.bennee@linaro.org>
 <54a910ca-586d-9bb1-de7d-aa4578b019ae@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 27/34] tests/avocado: add :avocado: tags for some tests
Date: Mon, 10 Jan 2022 10:20:22 +0000
In-reply-to: <54a910ca-586d-9bb1-de7d-aa4578b019ae@amsat.org>
Message-ID: <87pmozdh7x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, fam@euphon.net, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 1/5/22 14:50, Alex Benn=C3=A9e wrote:
>> This stops a bunch of tests failing because of a lack of
>> "./qemu-system-x86-64" in a build directory where you have configured
>> only one non-default target. I suspect what we really need is:
>>=20
>>     :avocado: tags=3Darch:host
>
> This doesn't seem right, these tests are generic...

This failure went away after I nuked the build dir and re-ran configure
so maybe the failure was due to stale data. I'll drop it for now.

--=20
Alex Benn=C3=A9e

