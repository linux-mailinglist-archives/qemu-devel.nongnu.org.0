Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894E472E41
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:57:09 +0100 (CET)
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlpE-0001iH-FW
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlU1-0005f1-Rc
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:35:13 -0500
Received: from [2a00:1450:4864:20::434] (port=35393
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlTz-0001m7-UK
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:35:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id k9so9287947wrd.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+TkSm0+KLWoR1q//+dPfXdpTO1ySBtnGKGve84kJrXw=;
 b=pivv1zYIVFcogZ6rxEUjuYvtfc4j/UiuoupqZD9XtvAx+QJNVHBkx26t+gfQFatmSl
 UdgkIIiIy9CRe0VcKEmUWDmkFq3a7SccaM6KVyOgTCOrNGmACnBzmLEhmUulOLY3mYjJ
 fiKhvE/Oqql2EqG4GepnEykJlzVvdCmNVXkCQY6DZH95onTHuRaDS+lxbmBR431P9PWm
 U8f24HEFN0Nur/tlcGebk1c+5ninQKENDSeiqECTNz3au6Z692h89iyhMmDHoAp8+0r6
 k1uNaw+rb71uh2l/PTg4bgFDfnT0SqKcdRqZTty+WUOXhgWMaceEWzDC+VFyVrK2BO/e
 5VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+TkSm0+KLWoR1q//+dPfXdpTO1ySBtnGKGve84kJrXw=;
 b=mkdJSp9r/EVleGuZmRUjDzEhMVxcNanQrRenPxsWeCFSgdHEbSjSkk1jQN70Zy1AHN
 2Q8YJ42ULS/nnUtP7dJyFHzMsI5NA7Q7wlVXULNkiUfzecYAHGXRSozTbWJEM3+J5R9l
 fbVHQbpzgCfIFLrr8ttRtv3/xA2VhZO8h5yNp3eZRub+3fFmP725/7Xbp/jKaL4yCoWt
 JbmNxmaQ+P2rcjsyh21SG2DKWAJ/b8a6IzytBd9sI24rThoTfUwzpa0W4YZJO94pLIK7
 SrCzRru8lRZkoXOZsiOQNQX96nzl6j5O2VQ7tef+uhFbsw9hdjFknX4ABwNJNvdebDXp
 cgTQ==
X-Gm-Message-State: AOAM530k0dJjRcr6BSBycOkFMbJeWAoe8EQV3GNMJF2FO2QQdX/x+wcf
 /hP5WYeaMhYrWYDIQdHAoQSg4A==
X-Google-Smtp-Source: ABdhPJy1yziyZd05rH3kx6rpFk7FyprxmadYVA1plV52zsLQsO0RsaYAFCPnyr0Xxdfx2JpbYKXShg==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr32327267wrf.383.1639402510376; 
 Mon, 13 Dec 2021 05:35:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm11025798wrt.66.2021.12.13.05.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:35:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 029A61FF96;
 Mon, 13 Dec 2021 13:35:09 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-15-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 14/26] hw/intc/arm_gicv3_its: Fix various off-by-one errors
Date: Mon, 13 Dec 2021 13:35:01 +0000
In-reply-to: <20211211191135.1764649-15-peter.maydell@linaro.org>
Message-ID: <87h7bcljar.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> The ITS code has to check whether various parameters passed in
> commands are in-bounds, where the limit is defined in terms of the
> number of bits that are available for the parameter.  (For example,
> the GITS_TYPER.Devbits ID register field specifies the number of
> DeviceID bits minus 1, and device IDs passed in the MAPTI and MAPD
> command packets must fit in that many bits.)
>
> Currently we have off-by-one bugs in many of these bounds checks.
> The typical problem is that we define a max_foo as 1 << n. In
> the Devbits example, we set
>   s->dt.max_ids =3D 1UL << (GITS_TYPER.Devbits + 1).
> However later when we do the bounds check we write
>   if (devid > s->dt.max_ids) { /* command error */ }
> which incorrectly permits a devid of 1 << n.
>
> These bugs will not cause QEMU crashes because the ID values being
> checked are only used for accesses into tables held in guest memory
> which we access with address_space_*() functions, but they are
> incorrect behaviour of our emulation.
>
> Fix them by standardizing on this pattern:
>  * bounds limits are named num_foos and are the 2^n value
>    (equal to the number of valid foo values)
>  * bounds checks are either
>    if (fooid < num_foos) { good }
>    or
>    if (fooid >=3D num_foos) { bad }
>
> In this commit we fix the handling of the number of IDs
> in the device table and the collection table, and the number
> of commands that will fit in the command queue.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

