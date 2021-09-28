Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62341B117
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:47:30 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDSD-0005XH-Jk
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mVDCk-0004sE-Ey
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:31:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mVDCf-0002U0-B2
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:31:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id s21so18050269wra.7
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WImsCFG4rvDboNNzUINbxxZJfKLTvuOiGuGjZI5bZww=;
 b=yWEchs5jRr906UbXvDEXdRmr2aDmGiLJCve0y8W/l9rGhTOh66gvZdFkNf0h6lNAUS
 bP0mYINR1L8YD1evbz450sUVT3UmcfUky9Teprs+Tb+jjw1hKlj1VZgOCHN6bUfzYP47
 z3Og8eUUDK9jl5relTNWxeI1vZgBWPuf3ygJ1x4H5uqU2AC6RxOJ5lwt5pPj5vYjjmzV
 tUTpK1lbx4nIHDsf4qilneh8Y1CrK4A2oHiNSIALiBnXbLyzt5WIaJzG92+9mom8I5ig
 yyg/YPicC362eTl11hOtbpJgW3GgCHB9sHjqs5VGwG4dKDCsXWyNFPZLIX7n0jRusqAM
 p12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WImsCFG4rvDboNNzUINbxxZJfKLTvuOiGuGjZI5bZww=;
 b=yQnl2sQdIlrefuLSfRXdjCIH9tGlfzflYBJJE2Et0OIWVhaDJema3SvJcGiPY3puAT
 w24jLLAk1Uc15ML0UlNZf4Y40Avz6XF5fU+K9mG3VOb732tRRolTma3A5rmIA2QmYAQU
 iVRRX5fZEc/OUlV7SJxv+/A1eL3TDIoblWm6RyydpM0blzoNnrm599Z1vB+daMqJ1ue+
 nCJDiIEepTSp7KRUQScZys8Uyr+jcSS8Kk9qBtFiTI1kQHqBXr7v3abE1fbqSUyojC+3
 IlOUdf6cxpjKT32Z6dEtn6KdcZzgAfG0uUHkdmqmdfoi9cpjsYwt9Be3YDDVBWlEGqqT
 Xxig==
X-Gm-Message-State: AOAM530QGfIo8H3Ou9QHxUPNxTWMBNDVjj8Xq4QlZDDZPb4Uxjt99OB2
 WvUGa8a+9MS6Se8uoaeK9DPDxw==
X-Google-Smtp-Source: ABdhPJyvAhSX7SEK9+qul3O5uqiWxz8uIyKLE+KnGAPOta/4PrC1xCQdAKUn+Sx/hMOmeSEmI/u1Eg==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr6782102wrp.397.1632835881301; 
 Tue, 28 Sep 2021 06:31:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm2811604wmi.1.2021.09.28.06.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:31:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EAD31FF96;
 Tue, 28 Sep 2021 14:31:19 +0100 (BST)
References: <CAFT0Dp1CmK9zKcKrpRO=pQKZTUD-ax1zVg-uEofjnior8Fi_YQ@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niraj Sorathiya <nirajsorathiya101@gmail.com>
Subject: Re: Emulation of IOT hardware
Date: Tue, 28 Sep 2021 14:04:29 +0100
In-reply-to: <CAFT0Dp1CmK9zKcKrpRO=pQKZTUD-ax1zVg-uEofjnior8Fi_YQ@mail.gmail.com>
Message-ID: <87zgrw7ro8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Niraj Sorathiya <nirajsorathiya101@gmail.com> writes:

> Hello Team,
>
> Would you please give me some suggestions on how I should proceed to
> build an IOT (Internet of Things) emulator ?

Maybe look at the Musca boards:

  https://qemu.readthedocs.io/en/latest/system/arm/musca.html

these are based ARM's IoTKit which are modern ARM M-profile boards for IoT =
development.

> What aspects do I
> need to consider ?  IOT can be anything like a smart light ,smart bulb ,s=
mart lock ,etc. Here smart means that the device can be controlled
> via the internet.

It really depends on what you are interested in modelling?

One area where we currently fall down is how we handle GPIO type setups
in emulation. While we have models for displays and backends for network
and block devices we haven't got coherent way to represent (and change)
arbitrary IO pins.=20

--=20
Alex Benn=C3=A9e

