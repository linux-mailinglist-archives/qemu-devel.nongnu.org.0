Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42665136C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 20:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7M4a-0000lB-21; Mon, 19 Dec 2022 14:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7M4R-0000kZ-7F
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:45:07 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7M4P-0007RM-L4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:45:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id co23so9764580wrb.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 11:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/l0LkD8FflOEchpyuPg4onD0XedAOSRwniRqv2lGoE=;
 b=KTs3hdatEQPKIc9C1wA6ci4Pr5xvY1txCNmr9I7y8+D/QsT0mlk/WxwO93vzk81jmc
 qEvE4YtHhqtKPin5eT1suK2IOCjYsfCeEaz0c3nj6ge2CEvl/B79OGbspBwnHhtpTdJ/
 SKv1KkGuHxamDyYgzZjQzC4c+oOhIEtrzT4Rf9fWarLSdfIatDFnicVp4nAO39+6WP/z
 XajfTge9WJYmyrILfGVaH3w62u5a+fARH28ne2LxATTfmPTnFQBtIQAmttRFgwvOFmMy
 YpH+zac42Js4/41pmudUXuMPnTZZL9voSEt9JYYxnWusZSfTBN5FXJ/kS4J5qKTTmtIg
 Zz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I/l0LkD8FflOEchpyuPg4onD0XedAOSRwniRqv2lGoE=;
 b=vHyDD5sf7fYbTAWpbOjf+C88WMDlXeim7LKQ3hpwKgv6KmJx3Af1I/T1oItVHegHYT
 6aRkD4no7z6Q+tXUH2GO65+9WcK1hrQS4K6yhW8yZhBUg5oOIFjkVrML7MnOQc2HBtGQ
 1iv+Uv2xJsjKEAnuI8l4KOTLmQUbrtuknCmhB606hIYRLTNgrHXCxUi/V4HZw/jb9Y+i
 zrRXPq4hqzE4On5ZRW1pBDTmoPlwkCteCFM+9YpKAunappMaRm8WMKu6RfCasBqOnVQ+
 x8Hi6S81gI3V/kRfGsdfnky2z7KIBFT3Ku1ZVkwSVwh00ZqwI7/a630naZwz2BE4EMyJ
 ojgg==
X-Gm-Message-State: ANoB5pmz18SluVsrs5DK5Eo74v66lRfHyr4sZmjeyAAoYvvpR40gzhdo
 JrQbywusPeNT6eelMG8bNgqipA==
X-Google-Smtp-Source: AA0mqf7UsE0decm4S9XIRgslJP+ap59xH3oPr/Cl0vpvwNODZFU+1e7II9J+d3iKwuycn+FVyyKFxw==
X-Received: by 2002:a05:6000:124e:b0:242:2b66:fcf9 with SMTP id
 j14-20020a056000124e00b002422b66fcf9mr26207553wrx.27.1671479104091; 
 Mon, 19 Dec 2022 11:45:04 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056000118200b0025e86026866sm7528542wrx.0.2022.12.19.11.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 11:45:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66DD21FFB7;
 Mon, 19 Dec 2022 19:45:03 +0000 (GMT)
References: <20221208101527.36873-1-thuth@redhat.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH] gitlab-ci: Check building ppc64 without TCG
Date: Mon, 19 Dec 2022 19:44:56 +0000
In-reply-to: <20221208101527.36873-1-thuth@redhat.com>
Message-ID: <87ili7i3eo.fsf@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> Building QEMU for ppc64 hosts with --disable-tcg used to break a couple
> of times in the past, see e.g. commit a01b64cee7 ("target/ppc: Put do_rfi
> under a TCG-only block") or commit 049b4ad669 ("target/ppc: Fix build
> warnings when building with 'disable-tcg'"), so we should test this in
> our CI to avoid such regressions.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

