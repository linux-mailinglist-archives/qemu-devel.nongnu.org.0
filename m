Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FB4955F3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:28:29 +0100 (CET)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAeyp-0004eR-JI
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAYzy-0001mB-V6
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:06:05 -0500
Received: from [2a00:1450:4864:20::32e] (port=39719
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAYzs-0001nl-Li
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:05:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso8076280wmh.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mRD2pj5OzgauYVwhz3f4/rloNXXqRLicIwcFRO3vn7M=;
 b=i/Grc10Cj3/912MWfLEKbtfej2KqPBuESlYT3+3MSplH54czuDKoDSJ9XUfNVXcHaO
 Cy3UY+EpxezMMkAuPGSdrPh1b4B+VUqCtkkyvr41sJ8pUj4X6/GyOpMhfKqw1Aq8ROBh
 fToujbI5lRGY2xfCNoJJ0oALAAgBO9bL24xywgscb+p4MmRVGwm6J8CLFGQbm9+GUJVQ
 HM3iM11MI3BniIGWOMqxoTTnMxdi0OSOkEIV10dvkwgUqekr2QPCBRDMyoRQ5xbqx5Os
 2saRSPz6nJUbMj6xLLuH+qQhlw59/kEdZZTGQwxc6xO8uSgZ9v6s9Q2bP8wLGxDCLUVR
 BuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mRD2pj5OzgauYVwhz3f4/rloNXXqRLicIwcFRO3vn7M=;
 b=xC1YZrNgUtSbh350cCj3gP8Ivjl0L3qnVqEiwn6udi0YDpnRafwpkH6AZd0c6Ozqg/
 WbTvolYLGJk3Bqp4UDlXcxUKKr/J4kQQlnT7JF8JaW5ylxdeokAuGxu4RU58hdLegLYi
 txBcTEC4EXyCBiE+5nv6iad7fr7SOzpUqC1XUH2vwDXwHG1WDquvFaBZNug6x/XWSXqD
 PhlX654oMbL9fzMY0Psp5H0rhdMvINiMoYvnOz3NcXv/r5f4xUDGF8/8xoKpIQ6NQytp
 s2L9Kj6We+fUa8nGMZAzq3AUCU/AdXXtq8GSh4XyV72TA3MaF143c/SnS060wV5I/Y/P
 6ExQ==
X-Gm-Message-State: AOAM5321jjQe0jD9vtBmXADQkidxEqZk7+tii6UwVP0W+7LpXVre3aOZ
 VfOa/BcmC5dqZKJpFrKEh9Bc/w==
X-Google-Smtp-Source: ABdhPJzl458toJQmgnh17r+bCVvj9m4itbywUCEVwRmin/dcu0LHCqY80nclRXSDdCg/jRJoD53d/g==
X-Received: by 2002:a05:600c:4e4e:: with SMTP id
 e14mr9276060wmq.98.1642691106485; 
 Thu, 20 Jan 2022 07:05:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o1sm3637733wri.19.2022.01.20.07.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:05:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 978901FFB7;
 Thu, 20 Jan 2022 15:05:04 +0000 (GMT)
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-3-eric.auger@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/6] tests/qtest/libqos/pci: Introduce pio_limit
Date: Thu, 20 Jan 2022 15:04:59 +0000
In-reply-to: <20220118203833.316741-3-eric.auger@redhat.com>
Message-ID: <87r19278in.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 mst@redhat.com, eesposit@redhat.com, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eric.auger@redhat.com> writes:

> At the moment the IO space limit is hardcoded to
> QPCI_PIO_LIMIT =3D 0x10000. When accesses are performed to a bar,
> the base address of this latter is compared against the limit
> to decide whether we perform an IO or a memory access.
>
> On ARM, we cannot keep this PIO limit as the arm-virt machine
> uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
> are mandated to allocate at 0x0.
>
> Add a new flag in QPCIBar indicating whether it is an IO bar
> or a memory bar. This flag is set on QPCIBar allocation and
> provisionned based on the BAR configuration. Then the new flag
> is used in access functions and in iomap() function.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

