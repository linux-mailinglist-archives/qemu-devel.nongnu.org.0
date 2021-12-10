Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF64700EC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:44:21 +0100 (CET)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfG8-0001Ou-BX
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:44:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mvfBX-0000X1-Hi
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:39:35 -0500
Received: from [2a00:1450:4864:20::52a] (port=40740
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mvfBW-0000Va-5z
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:39:35 -0500
Received: by mail-ed1-x52a.google.com with SMTP id r25so29068601edq.7
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 04:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XzVPzRVQTi5Tvk3zA69f/v+j1zqFyzWbjw5Phv6ioms=;
 b=RwvNxspkA1Xa/jUxOuCFjjWds3bWK7H9p4HwDyigkj8/DCOUyEsgnXX5RgdILFa4yQ
 Tlt5ffJWaVsrHKmrQdeRSY6uw9XojZbfizoeD2QRoViUUXrK7u0OE7nyYtjQHWz8hCnY
 3N33Z8RqVLn8jiERkHYL0owlqLVN5d0mP1ewPy5J9hi3tVwICIja7CvS6eRJKyK99C5p
 VJsAiL2uNrqLQvGRnipUWLRxnGTg8WJ1kuSN6tsGvwKQn2WDXl0hPSy42QEQtWaITWFX
 RyUAZ+L32SAkDb7MZ7JfpWKbLzkrgd1xdSSB2OkaZS9XONbbwdCrMb7Jb9zNB3DRc2i7
 uilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XzVPzRVQTi5Tvk3zA69f/v+j1zqFyzWbjw5Phv6ioms=;
 b=7jSymmFSOz6VC3QZQLQXoyLmYiSgt13jeS0LZS1oZoRW4tc05XFDjs/F0R5YMokb23
 vqGRrLhtXrjlanxDJrhDgPWsP2pRMJJ0CymjNTPVuAgxQqLOtgadSkMXTSAFDLxPIPsh
 /yBS1Y5565DqitJXk1JwVK9bI3R2lT6Z+YHlgTTuK73kQBuxfiZlhoflQv5pvN4U86iH
 1oIy+wCMNyZaQHdAui8P06qlp/Bx6KCz3CdHyhBfVD2RiWfh69/zSddA+/N1jcaTFtmC
 tHsS+t8/SsGSwbQvYC+pffJ/r5dYu6wgDPVTbUTus/ZuEWNbG3289s82efFZ+rwQMn6i
 UA9A==
X-Gm-Message-State: AOAM530Md2guvwuByaLfyDawxlPGVlNVT4oexww4GjcwooyNTcCb+XoL
 ABIjq6ifj8g4epBPj07uuQWAIA==
X-Google-Smtp-Source: ABdhPJx4sqS8BhUkEZ/3ielY38tM7bXJUEdJzFJwbv0K/1I410h0+MbNt0OTeykknDMM9yNbLhsw9Q==
X-Received: by 2002:a17:907:7094:: with SMTP id
 yj20mr23857584ejb.265.1639139972223; 
 Fri, 10 Dec 2021 04:39:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h10sm1389612ejx.32.2021.12.10.04.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 04:39:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 487761FF96;
 Fri, 10 Dec 2021 12:39:30 +0000 (GMT)
References: <20211207160025.52466-1-stefanha@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] tests/docker: add libfuse3 development headers
Date: Fri, 10 Dec 2021 12:39:24 +0000
In-reply-to: <20211207160025.52466-1-stefanha@redhat.com>
Message-ID: <87h7bgk519.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> The FUSE exports feature is not built because most container images do
> not have libfuse3 development headers installed. Add the necessary
> packages to the Dockerfiles.
>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

