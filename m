Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FD48491C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 21:11:15 +0100 (CET)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4q9K-00085m-9J
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 15:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4q73-000712-1D
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:08:53 -0500
Received: from [2a00:1450:4864:20::534] (port=36769
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4q70-00051d-Qs
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:08:52 -0500
Received: by mail-ed1-x534.google.com with SMTP id q14so145071515edi.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 12:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mr7yqlDkmU7Tg/Vzj3dbohquUeTUBk9e5ESFXebR3J4=;
 b=flLMJjFb1UOjdkH6GAW7fLJrBKEGxO65XkK+WYGj4Ck3PyJ83zCw0VdTMXR9Jc1Arc
 jKFiWLOf3PRYiqplrR1Zqe2YVteW8iERy3pUoiFr5XVkKsGxwl1cT4dPnMelqcMDLPu0
 WBwZUzHXwm6XXgaO8NWeA6DdQv6ZLB9ql7WGhjll8gBvMARZjj1H11ydk9u3ain/TPZi
 sKMEQ4R+LjxVX593fBKUPzfzJt/p5XlKbZeji5sTARbMPh1tBisc+Zr0KISopPJgUSDL
 oQpKpkOsaNzFO0HnEscVfr7jlLrJMrPLYVlsDIlGXqbWToUerewoIeLqD3WE24/NU0g4
 v3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mr7yqlDkmU7Tg/Vzj3dbohquUeTUBk9e5ESFXebR3J4=;
 b=MAmyTMMExPloGI7sAoXracCtGuGcBjNlJHZreJxhNo6QFUgToD+nRgh0MJj5N9ZF1w
 ZsU6+VkEs5BljDNz5wpmKlap5bkLRjNcHuIGqNtaPgnVU7XrTbYzg/PgeNErddQJOg8r
 0onhorpdNPDw/df059IUvUpypEmI/WhVXJMZW+F1pAkG2oFuzrBMruBH3huUz7LQfR1X
 3NzpGo5oT6KBkwZZbf+t83glvsJn8lVcAavDFbfJgeKCykzLsXgnS0s/zXcsVBCNgxpD
 C9IRK/UV5UIok/QeU3ZXnubjMTOTNMCfkXb4MBUl+L79xTWQipv2KWF7f00INeR3zfme
 bUew==
X-Gm-Message-State: AOAM531rMCRSNVwbGY4tfqM7Nak8YwxJQ+i9M/Ce1k9eZsaw2d3rh1lr
 HKB0bJ0K7NWriwJD5u5xKrI3SA==
X-Google-Smtp-Source: ABdhPJw770SmjyZzqbm7fdF49iz2c3Y6UVGvhz193BOrCtLsYE//8bbbYfKGmbfi/Ge0iGEK+iasrw==
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr44065239ede.362.1641326929271; 
 Tue, 04 Jan 2022 12:08:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w11sm11858036edd.21.2022.01.04.12.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:08:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 691821FFB7;
 Tue,  4 Jan 2022 20:08:47 +0000 (GMT)
References: <20211224035541.2159966-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/2] tests/tcg: Fix float_{convs,madds}
Date: Tue, 04 Jan 2022 20:08:42 +0000
In-reply-to: <20211224035541.2159966-1-richard.henderson@linaro.org>
Message-ID: <87bl0rl0vk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

> We didn't read the fp flags early enough, so we got whatever
> came out of the guest printf.  With careful review of the
> hexagon output, we would have seen this long ago.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

