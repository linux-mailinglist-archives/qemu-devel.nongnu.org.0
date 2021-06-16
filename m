Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CD3A9C32
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:39:41 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVlc-0008FV-Fh
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ltVj1-0004Iq-88
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:36:59 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ltViz-0000jW-QU
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:36:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id s6so2704717edu.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wTdih7hnpNlcvcwYcZwIgD/RQy/dyIVzmvcIiCzOoUo=;
 b=dcK10oX6wmvlPS64Zug0tgxjR7Zs/fDYkVXh5LELAwS1SVWlLD3M601TTaJkplWGCZ
 GfokfuiJr3KsYNlozTOFtDsMzNPYw5qMfMEvEwAhjqhA56x0uNOcAMn06pUNFKzDHsT+
 ukdRKbX/G08Qn7Y9xvGFw+85P5Cv5TLxGQ5CM5USDRo/gqrZtTZUGpIzcGfiUpNKXV9z
 gRifCeU4Vi708kHvduX6HKObdVruD47ATJRXayrpX4jtGUygASbHQJqENAG3oN03MOfb
 FNH3EH6AWT42W1WesaEePRBQUtaOGBorZXf2boi2zFKBrnp3JvnJUnlxjWL0Q9qXQsIp
 2wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wTdih7hnpNlcvcwYcZwIgD/RQy/dyIVzmvcIiCzOoUo=;
 b=VW9DeAoa4aalCDXnR1/UMytf93r9rVbMRUW6tfLyB9WEoYusFtwt8cBDk7Fw6WEn3S
 vzHnvFqDFLDYRP8o2tkRT3g0X+SGN5wL8Dne5Y5V3BKQtj9RdNFaJ91LD81LfuHJnUUo
 rIYBcB3ifhVLYtcYQ2Yvi92iCYKS10pJZhuR4tPb+qSdxnMz+/O++HkDCmwfshl04s3Z
 in6tIy3lrvHQ7LlBL45LxT0f0N28VhPb0HjvzPcwPuDWSJK6YfV1537DH8hMBR6Mnm7/
 KQL74HYA1WAnOrEuy8zMiUn7e4X7vasHVQeO3rFNoH15Hw1Gokh6ZI3Zs61rJQIAyuOD
 vKHg==
X-Gm-Message-State: AOAM5315Pd+imqUoIzaT5tkNnkwQHqO1zBALgBtfePWIqndIVOP9UH5S
 Sw5z7zSODWPinkB1FxuNTaPLdY7FcoK7QkDUjL03uOrAZ3YF5Q==
X-Google-Smtp-Source: ABdhPJw4AfpESDe0TXxARa+yhq5kuzn+8irvDbozseb10mT8KGAxIMqOuHTjQpCyDsR0ddAKZlsDxcEFTPshLDCRrQI=
X-Received: by 2002:aa7:dd0b:: with SMTP id i11mr4180447edv.51.1623850616340; 
 Wed, 16 Jun 2021 06:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-2-richard.henderson@linaro.org>
In-Reply-To: <20210616011209.1446045-2-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Jun 2021 06:36:45 -0700
Message-ID: <CAMo8BfKEyJOURcR72=r9_7taPQLfh7-npHdoFkqOuL4jsX+L0Q@mail.gmail.com>
Subject: Re: [PATCH 01/21] linux-user: Add infrastructure for a signal
 trampoline page
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 6:20 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allocate a page to hold the signal trampoline(s).
> Invoke a guest-specific hook to fill in the contents
> of the page before marking it read-execute again.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h    |  7 +++++++
>  linux-user/elfload.c | 17 +++++++++++++++++
>  linux-user/signal.c  |  3 +++
>  3 files changed, 27 insertions(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

