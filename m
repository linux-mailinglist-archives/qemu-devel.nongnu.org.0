Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA243472E8A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:09:20 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwm12-0000Q4-3B
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlbd-0007Tf-3X
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:43:05 -0500
Received: from [2a00:1450:4864:20::429] (port=38897
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlba-0003Qc-F0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:43:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id q3so27107119wru.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9tmaIkI+mSbBZrLDsHoNzw1tugkInnC1QSYTAAifuXM=;
 b=Qi1SEkQDkJJOqJLyG+LYiy/8Li0PiXid4KMbPSpKUF+IwO4uOcyULqf50qXg08SF6o
 /tsoy640rDEmRzE/KzVAHfiH7+YL6mi+2Owp+NxlFD8pFHxd/68Q2NwMcMYMpgQ+1Out
 l7S0aYGiGQCnEI6LDG4q8Yg0iub8sx+TohHdL6yYJ11GBLDVuDN5p2NxlHkCek+YJgYU
 p52n9vuorSTj8nr4UOEEJM2lFqOv9JDvVzxOkJ08OpBOW4CSeKjFafxcHq5pIBvSvE80
 6eRkzPZcwDmAmJKgwpg0Ng1mW0w60rBmIdBSqNwg1mvdI4TbmF1rv2yHpPMltPFeyMof
 9YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9tmaIkI+mSbBZrLDsHoNzw1tugkInnC1QSYTAAifuXM=;
 b=fdgLWCj3F6z6QVD7YZDtl8HWO2v16HMAFM5EmJhi7B0ksF/6l9+QYBWEoskZkrbnz5
 rx6duQdgqcBULBUTGI+syl7EO01F1rK77zat8tulOwG+XxYVSDrzZe4YxEl1Jzx67waP
 UoBII0zO7RVDXbAJj5HApKjz0B8CPuu9W/ysVzup/f91CA/1riMcnb0GtMA7pygI7UnC
 36pLyL/IkrhuQpMdmEw2UiVKGGGLRNRmU0Qrmslkqqs39EK0QthA5cNUavCUR28RjIbQ
 R8G/jwZmU9CRfPErEFiZl+TQq0CjK9FVrNLpobW3M/AiFFNI6Nrmz6HOcw+66qA1sqfq
 CQlg==
X-Gm-Message-State: AOAM5307Ht9HAg0zGx+fQCy3oYEWT3ZX3qX2FhGN7azOd+E4Q+opQMPX
 TTicdV4VJO+LW5kKw90B0TlFag==
X-Google-Smtp-Source: ABdhPJymVqJZjd1KhNyn9dJ36vR2KKjfwC3ZINnUaU6aUE2n6WDRw5X8jod5y5VhWogY3dewBpJoNw==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr32169492wrn.135.1639402980789; 
 Mon, 13 Dec 2021 05:43:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y12sm11099737wrn.73.2021.12.13.05.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:42:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2216B1FF96;
 Mon, 13 Dec 2021 13:42:59 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-19-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
Date: Mon, 13 Dec 2021 13:41:17 +0000
In-reply-to: <20211211191135.1764649-19-peter.maydell@linaro.org>
Message-ID: <87zgp4k4d8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> process_its_cmd() returns a bool, like all the other process_ functions.
> However we were putting its return value into 'res', not 'result',
> which meant we would ignore it when deciding whether to continue
> or stall the command queue. Fix the typo.

Arguably having to generic result types is confusing. Naming things is
hard but maybe it should be a clear:

      MemTxResult memtx_res =3D MEMTX_OK;
      ItsCmdResult its_res =3D CMD_CONTINUE;

?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

