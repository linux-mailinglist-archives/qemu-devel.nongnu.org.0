Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6159C47005B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 12:57:06 +0100 (CET)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mveWO-0002kD-TZ
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 06:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mveOd-0006rg-Rq
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:49:03 -0500
Received: from [2a00:1450:4864:20::52c] (port=39789
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mveOc-0003so-Cg
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:49:03 -0500
Received: by mail-ed1-x52c.google.com with SMTP id w1so28923761edc.6
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 03:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JwASdhaZ8avzSdRFeS/S7mRDaPVmXPKEjYKK5JnWnQM=;
 b=hXqYxcEvJvCFKQ8CKNb+IOra0iF1lXsLPg00TGZreSvdNfBscoRnBccTKQ7fr5R9ht
 Nz0FSn9tnFgtwi29M+yrmBJGyT6bkKS36OxlpB7FDfKCOpThP2q9usJ/qJXvjBtmYuYa
 PtbJjDAqYVLKZrGKiwdz+3m7pIAXVzjCnRh9yuEXjiwPRIW7dKIOrIWbMUZx2Tkbtn81
 /pzzl7h/fFMf2/04KiZMrQU1d8+OmvBNc29JTSDKUYqA9GyQ3n66zU5yQVG2huZVcQCX
 ywj1aAkvxpu42mWkHAUCjaDSLKn9LU2l8bfIse/EPJGor+UT0hJiA+EHif1KU8L6qnz+
 LnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JwASdhaZ8avzSdRFeS/S7mRDaPVmXPKEjYKK5JnWnQM=;
 b=vTVFdfgvyRNQ8urs1PoxwlDJ7+GOdSB2ndqMc59HBay+tg2gaverOhI8Cc1254ssaw
 iqqjBdopn9cNK8Noy55avS0JoCXgHBY9mBRzn9zXHohkJeNxBojT1xh1C6JxBgDzfh70
 jtRhd8nemN4+IEBZBb1B9afKmp5laOdLGbKCWPGIEf+iYDyFdOzxryG0MlcJlXWq8ivm
 rysnuQGJ1z4OqMd06rS9RiYSA/GYmMJv+VcRUiKx6VcasLo21xm35MT9NytaYbAI1uuW
 RgjPewgGNyNcExlFYLtZe/0xYCaNjIr8C9e0HezXFMYafs4n0STZEi9+widv9BMUnPhO
 gyFQ==
X-Gm-Message-State: AOAM531f/rnUfFnTkvK/bFYxamusopQ7NnGty1YG9bpt6K3/JI+vUWMl
 iK2pOzGa/4O+GtUm4t2797b/obccOMz8DQ==
X-Google-Smtp-Source: ABdhPJxL7BSOi6yGKO+kARXqbYVm08k0ge75WcRZk9bub3C+7eAnL5rpPk4tHobWYkuqaSJfa6CLyg==
X-Received: by 2002:a17:907:2d10:: with SMTP id
 gs16mr22402806ejc.353.1639136940237; 
 Fri, 10 Dec 2021 03:49:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm1367352ejd.91.2021.12.10.03.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:48:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF3661FF96;
 Fri, 10 Dec 2021 11:48:58 +0000 (GMT)
References: <20211210084836.25202-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/tcg: use CONFIG_LINUX_USER, not CONFIG_LINUX
Date: Fri, 10 Dec 2021 11:48:53 +0000
In-reply-to: <20211210084836.25202-1-pbonzini@redhat.com>
Message-ID: <87pmq4k7dh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> The two more or less overlap, because CONFIG_LINUX is a requirement for L=
inux
> user-mode emulation.  However, CONFIG_LINUX is technically a host symbol
> that applies even to system emulation.  Defining CONFIG_LINUX_USER, and
> CONFIG_BSD_USER for eventual future use, is cleaner.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

