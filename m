Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BE6A4081
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbam-0008Tf-VP; Mon, 27 Feb 2023 06:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWbaS-0008SA-I2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:22:34 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWbaQ-0002oi-EP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:22:32 -0500
Received: by mail-pf1-x433.google.com with SMTP id ce7so3285687pfb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DQWABr4la9lWyBC8VV2hOC9X7IoJzOyIRvpxoSCyx0Q=;
 b=Gb/hvlRSDfYyx15oaPmPsEIe1bvRkf1edWeOnB/A+QW/8Hewt5QESb25vzKUkh/Ej0
 ENzpjDYUanrTOTy1bWrCL5CvJk04IWVraG95w/u9ylXS6+LHFsPIT8Gu/b90RjEqmyxR
 bVgSUh+iVy1a7JuRnlHOd0dBDZB/HRGGRTWMtHY5Y5oclktr1t3Mds+CQKwt035DjLqh
 l0K3LAvD2XD/WnkNZAWrO4c6JYsDV4XJkf6xVN1bvz8oR+jyOyvQnM4x1oRjNuRp6bS6
 v0mgMNvw9dLkzgnY6IWC+3R+M3bsRSg17eAHluSFE8ZepoLUDAOJd79GpHWlx709Qcq6
 C5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DQWABr4la9lWyBC8VV2hOC9X7IoJzOyIRvpxoSCyx0Q=;
 b=BdKnPWtVLmQWEwdbf9OYVbl+bpOfkxzK9w1ef50cpKqxRklYllVzD4UtxVgNpEHExc
 uysO1xAeZ1g+8uGb26vvaBkrME54KV5LmYkxQs1u/Ve889ORSGZnZkEYybwtxfs9msSh
 4cRr7GMjiDxZBuS20a88XdxEL0v1CbTrSh0xPnkY6/1hxgGO23u33azvZ78+UkGTO7Aq
 /4kSlu9wFcfY32+4W2eUA/WqU80FTOtebF5DIJwsEaR+uWTowGOPZgh+oqrNGQp7Eu9D
 i5L5S+C/Iv/pQaG7Lr5DOS7UVPSHgSjDqliQwjbzAmooA7wzsfSULPRLSQjz9plZsq4i
 2JXg==
X-Gm-Message-State: AO0yUKW4OnWo8f3wb7LrZ945GYWwacVPGEWmh/JJFwMwu18i0q3QQoYK
 8VwRJR9Yxi2KKRce2r6z0aKdmZBL7kFD7Us0RbY/+w==
X-Google-Smtp-Source: AK7set/nzvzNNhB9eRCtmhkHIW1Eqrhx825rOq9t2TOhpdQFQxn+czJti/unsm4M+FSDsfbdX8lDPhAPWoc3vO5+q74=
X-Received: by 2002:a63:3c0b:0:b0:503:4a2c:5f0 with SMTP id
 j11-20020a633c0b000000b005034a2c05f0mr1068568pga.9.1677496948765; Mon, 27 Feb
 2023 03:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20230223185146.306454-1-kwolf@redhat.com>
 <CAFEAcA8uYhS=MoOuGpYo90uF7mCa1JH6fapy+qvW8iCsNMmBfA@mail.gmail.com>
 <d6280636-d40f-a79d-ead0-4b94a0628f10@linaro.org>
 <ea176722-9dee-0df6-edf2-b8ff8e1193ba@redhat.com>
In-Reply-To: <ea176722-9dee-0df6-edf2-b8ff8e1193ba@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 11:22:17 +0000
Message-ID: <CAFEAcA-RYu559EK1j_VmZOTQTOuUko+e9udY5HjcvscD3ATBtQ@mail.gmail.com>
Subject: Re: [PULL 00/29] Block layer patches
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 09:12, Thomas Huth <thuth@redhat.com> wrote:
> Peter, in case you also have a github account, could you maybe enable the
> Cirrus-CI for your gitlab repo like it is explained here:
>
>   .gitlab-ci.d/cirrus/README.rst

Sorry, no. The Cirrus-CI signup wants more permissions on
my github account than I am willing to give it.

thanks
-- PMM

