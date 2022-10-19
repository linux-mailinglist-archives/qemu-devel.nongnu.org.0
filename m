Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE50604BBE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:39:39 +0200 (CEST)
Received: from localhost ([::1]:58654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBAO-0002Rs-Qr
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB1p-0003rQ-Nm
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:30:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB1l-0004Br-FF
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:30:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id j7so29748737wrr.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9sLJKZqBFmzMARQVcMdEs7bjHQvOmQDikmk8KH0qKo=;
 b=HpOHExNczMgL3LmI6E1kgDnFJdEJ5inC308e51ilFXf6YQQd8ILdI35RR+i/TOpBth
 Fh06I6TWRT/yXPQq/VsMAC24NbFsv1wDr0gny68B+b2gom2hX20txmM1y+aWVvE2W1vX
 La5fJk4u0a7LRCekGlZyAoYmuwbTIvlvJWsnObA2H4kTPpt1AlyOMKTLyeESIuK1apmE
 0mgmo7MXAitKLnV4kpXCviNJMg/+xBjhlLFDcqIxZhL9A6s1TKvjAZfPDA4g6oZwU0J0
 Jh9CWm++bFvuPufrnHSVGhxs5G3IjhVYiFWEP4bpIVOxZ1Msu8ixuBMe3xil084mK8g9
 SvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k9sLJKZqBFmzMARQVcMdEs7bjHQvOmQDikmk8KH0qKo=;
 b=3UsVaWbVXC6K3nwvNCHc+TzAoE4DuinQP5jNvQNW9jiWzNRIRnHX2JkMUb5118Q+P0
 8MOMXUhRwp+/eUqCgPFokEJu/IxRd3Rs7P/urbyrhR3hU4etF716iLmdcptUOyOV5nlq
 EPAMwharEqL39RpJQ6bQ8W3LOS9UAvTeTuyPNXHJdGMFx90BUh+kMg5lUB+NXtSCpSs5
 IRYiYI+L5bMz06dfSitYKyAem9rwg2tCGYRzfFcmv8RLmx/Wz8/hebDydD/Entdz9e9J
 o7sPZ6SNfdl9F6HAStW7MR9qSmHVdVZU6XOgkHdH0eAXri3SWi5deKaGOmON3l3nxe4x
 C3/A==
X-Gm-Message-State: ACrzQf2WIN5uIqEZXbr1ej4peZuwu2nzuCJTJ/jQs722QEPbql1bnYmw
 PfqkQxkCZJvXSImt+8hYNiVzzA==
X-Google-Smtp-Source: AMsMyM6gVkhRUfSpXgazoxVEdhqYG2BCLcG4vx/MJbKWJ4rPYof2xx2ibV4g/98Fl9P6b2ppBkDwsA==
X-Received: by 2002:a5d:64eb:0:b0:22e:48df:f1bb with SMTP id
 g11-20020a5d64eb000000b0022e48dff1bbmr5447272wri.262.1666193439545; 
 Wed, 19 Oct 2022 08:30:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d468a000000b0021badf3cb26sm16790610wrq.63.2022.10.19.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:30:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C3D571FFB7;
 Wed, 19 Oct 2022 16:30:37 +0100 (BST)
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-3-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 02/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits tests
Date: Wed, 19 Oct 2022 16:30:31 +0100
In-reply-to: <20221019025828.683113-3-ani@anisinha.ca>
Message-ID: <87bkq7bzky.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> Added the SPDX license identifiers for biosbits tests.
> Also added a comment on each of the test scripts to indicate that they run
> from within the biosbits environment and hence are not subjected to the r=
egular
> maintanance acivities for QEMU and is excluded from the dependency manage=
ment
> challenges in the host testing environment.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

