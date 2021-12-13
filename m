Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F8472DDB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:50:59 +0100 (CET)
Received: from localhost ([::1]:37646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwljH-0000Xk-0T
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:50:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlWF-0007cd-3j
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:37:32 -0500
Received: from [2a00:1450:4864:20::533] (port=36813
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlWC-0002QY-R0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:37:30 -0500
Received: by mail-ed1-x533.google.com with SMTP id z5so52846126edd.3
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uNERgpk6A8RCdL023tRgYZHuF05rXZpLfZexxY4CgTI=;
 b=mA+aOac+AvQdKRxBj5ksszkMUBjKUdluMuj3U8Fblru8w3iZ6koxvXf+K4yrMrml57
 gj1RBR8tihnDi2w/MynAJ8IztqdqlrFqMpiJeXvfe5vJz7Xn3wuXQUVnGRTAjcNOznzL
 Uok2AugA2Vb2wmIwhAhJszvsLhyC3rMZTQ3e0QfsjOgwegnrWPmKJry4R0hpIHYiaXft
 DJ8TCdmbblrD1PjTmKTsKd+firunqwvQQjO/T7zilX32CX2L1hhWwkIF6Hf78+nJuDf3
 UP3S5a8xYF5QrbpZFLXU+Jwd4m+Gp+dw0CIJBRHGfNEAmPa7sicgv3iJMuPq2u8EIP7b
 2/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uNERgpk6A8RCdL023tRgYZHuF05rXZpLfZexxY4CgTI=;
 b=mz5gA4cKSN4ukhPnFzBXKpH87arDe+WikOeYjK20Z4fn6FH71kas7DlnXWf4ChABGu
 CmKlxLXjch4MqP6bOshwBr8hQ7VhnWbpHJiDMHj9n7ybsVtfSiUngKdA8pszNKx0Mc9C
 aPTzfdD1rimbQtpWU3uXElfBISTystJen8SLeu/uwA7xUmY7U7j3O+tAGhxol+GdYWhD
 npcM6qPxUBy5H2yoKqmoP5ikqC0M4M2xIHuQDsVqA2nKMfRUZ6Pj8l3xmvmJuODgt32D
 UydVFwd0Bn/DxGSHIj6hDIvz7wijVEHpQyrB1dSLhrrr6HbpGt17mMiBvHCNN6bUD4ah
 MyiQ==
X-Gm-Message-State: AOAM530LK0OCbKhCLT3Hrt0DHdqNspEkrx15WpG7GuzznbFM8Z4qtAyn
 YEyjmkQlzHCJ7Tzv7aHc4/zJCA==
X-Google-Smtp-Source: ABdhPJyP3Rf9CcKUTadkZcvdB8Yz3GNwadrK98cxIVWVCt+KlxdwogBZuSAucuGgv7qqWd30ZmkJ1Q==
X-Received: by 2002:a17:907:2d10:: with SMTP id
 gs16mr42723231ejc.353.1639402645848; 
 Mon, 13 Dec 2021 05:37:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ga37sm5784422ejc.65.2021.12.13.05.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:37:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E2821FF96;
 Mon, 13 Dec 2021 13:37:24 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-17-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 16/26] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Mon, 13 Dec 2021 13:37:12 +0000
In-reply-to: <20211211191135.1764649-17-peter.maydell@linaro.org>
Message-ID: <878rwolj6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention, fixing the off-by-one error.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

