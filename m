Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7231A58000A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:39:12 +0200 (CEST)
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyIh-0002xp-L3
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyFu-0000WC-30
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:36:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyFs-0003ec-Bn
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:36:17 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso9397327wma.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OfmxjlbQnb3FijvcGAPT5HeULIx0pKRwdVq8SzMfjSs=;
 b=KB9whdl/t5xEZC8fgKLrbI3NY+xsGfMT8IKoUHltfTslsSf369wPqfefBvdaTpOofd
 68ZTv9M6T6JiaKwOXjEYPgh9v4bS5PEtAbCYLrNfM3xdqeztKsM7aPc6V4L5+RQmFe8n
 CD/ZAiI7Ur5CwrqpVH1+cyj8mnWGHnwvv3t1sxOTIYgep8OOcGUlKU7iz4GdXnSinsWk
 hf9dqlLHwX7t8u+h4d7b4uXJKtNdNcgpUBwJJryvlaQV7l2qHuGha3Ume61zRCZa76wv
 tC2SHbyHGFhd8DgLKlfYM+IyiRegWS6wR7zfrLWzdIJqG0KDDUfL3bY3VS3Eg7NFyL4i
 zOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OfmxjlbQnb3FijvcGAPT5HeULIx0pKRwdVq8SzMfjSs=;
 b=yj6tgNzhOTIGDmUIvyTn1ZtqN/iGvIbGdZB3k0qYxp3QTnwQUjYLdUxMec+pEJYH/P
 fynvCvIeG9vN/Tq1M8chlJOR2sskGb+lFgSH5TXlYtuqOH8G39qVq4uQwd9xpJ41xGC3
 cA+XCIF6FCBV27lfmqHFGZYFY510zTVEhWiizSfl+H3WHB9s9Mkc/gNJLhDG48UaKxtW
 sSf7JJHgDj3PCqDzL5R3isiYqhlC1ER++dL9IlnBQtAIA+92ejRb2OUu8/ZuvPO7JDTH
 4rSE0oOaMUPf4JahHrT4qLCYNJSfQ8dspcHMAh6lwY4t3ZJc/a8seuTj+khEz2hYb8nQ
 ZfFQ==
X-Gm-Message-State: AJIora+SNpe6YVGhnPMCgpZm+erqPNCiCYC8h21PEOzcuwEIAAkVT49B
 K7VuwkPpkO4pRkh3Vxwob1A+eA==
X-Google-Smtp-Source: AGRyM1vznrB7z6yoQrpD7twpdkIkFJ40PxuHbX2E5VOqrVrcrDnONvsmpYyMojc3s0myM7ijZLrC+A==
X-Received: by 2002:a05:600c:3786:b0:3a3:19d4:293f with SMTP id
 o6-20020a05600c378600b003a319d4293fmr21883832wmr.116.1658756174379; 
 Mon, 25 Jul 2022 06:36:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a05600c384300b003a2d47d3051sm16304328wmr.41.2022.07.25.06.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 06:36:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B1741FFB7;
 Mon, 25 Jul 2022 14:36:13 +0100 (BST)
References: <20220707151037.397324-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] qemu-options: bring the kernel and image options
 together
Date: Mon, 25 Jul 2022 14:36:06 +0100
In-reply-to: <20220707151037.397324-1-alex.bennee@linaro.org>
Message-ID: <878rohiab6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> How to control the booting of QEMU is often a source of confusion for
> users. Bring the options that control this together in the manual
> pages and add some verbiage to describe when each option is
> appropriate. This attempts to codify some of the knowledge expressed
> in:
>
>   https://stackoverflow.com/questions/58420670/qemu-bios-vs-kernel-vs-dev=
ice-loader-file/58434837#58434837
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20220622145052.4012981-1-alex.bennee@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

