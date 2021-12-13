Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FA472FDA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:58:25 +0100 (CET)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmmW-0005Ol-Ht
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmgP-0005zy-8d
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:52:05 -0500
Received: from [2a00:1450:4864:20::433] (port=43782
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmgN-00014r-GF
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:52:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so27457373wrw.10
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qv8m6iUphH1xOuSxUduPwvh3jaNKzV0oWuVMs/7GtL4=;
 b=G+1P3jubyyH5FT0Etya7kNn4EW0cVu6102YWvDFr3ybKSSLWMda4Aem+njhYkZz7qM
 KVS2kdPAvRJEPYyaZsccaVDLUvNq2Pj8CDcL3mMJBnJGCYHBUeD5xi2WVqCGTZQogHIg
 4dP70en2+4HA9BRvg978xqYRPAg8OLlACjvZKlA+P1Guby+7fC6Z7UhhPcGhd+wBl09x
 K4k/WRaAJ3qJi3435oYhw13jc/cNK+QLCJ0RuFfLg1R4Tam+/n6Tvn5gvFtHm/MY3jVS
 QBPgLJN8NMvH22WTP2vZa+BhNH4TLSaLOD/9avIsaO7oUFm9zF0LtTwd+QAwggJ+UWGE
 /d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qv8m6iUphH1xOuSxUduPwvh3jaNKzV0oWuVMs/7GtL4=;
 b=6FCYFTMCvJjRak1rnENHFe8J/8//FuYjKLPRScF0x4g8h7SInsPYdFhWkrhkR0vU22
 c9/CnnwJPT0gr3uIexLwmedInXdruY9nXsJe4Q9cT8Tlr57DGPgeH2G9NqrlbQalVIEP
 XSXCkiYISK6M+Cxxg3f+dIVMaLlplcmWDCBlv59bjat+UHB+Yj1al+nIp22EH9eUk7q4
 2O3IaKUx7Y64mM5/cLEPxfzaSmXtLCryni1ECoWOSyqBckEl2R3hHIyEgSTu+ZqwGXbo
 uhdkJ1EgJLJqno9qljnI9LHpZDGyKKAUqEZTAPeKHxu5rwpRg2Mr5fZyyTmNfeJ0pfn8
 zhLA==
X-Gm-Message-State: AOAM533lWK+pI8Kwvp79zkpAh/ocTkJI4w3ybCOueD7Aw3Z597MNnBpg
 z5rAh40V4CeEFruLalqbbi7beQ==
X-Google-Smtp-Source: ABdhPJw9ANg0qow9HW/xQIxDcXDz3ZBPddIafWZVk8cjnn7Va0V7Qq3LSdBpUpmXzQUSVZRFly5Pzg==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr31726296wrw.591.1639407122158; 
 Mon, 13 Dec 2021 06:52:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm9177731wri.103.2021.12.13.06.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:52:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D732C1FF96;
 Mon, 13 Dec 2021 14:52:00 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-26-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 25/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapd()
Date: Mon, 13 Dec 2021 14:51:56 +0000
In-reply-to: <20211211191135.1764649-26-peter.maydell@linaro.org>
Message-ID: <875yrsk167.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> Fix process_mapd() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

