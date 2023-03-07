Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E16AE1F6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:14:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZY4a-00012d-4y; Tue, 07 Mar 2023 09:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZY4X-0000zT-N7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:13:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZY4W-0003Zn-3i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:13:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso7272754wmp.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678198422;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVhhv72PdrilxdHdYntuv8mB81jvkxkCYQnXDOGbEQI=;
 b=UXKhftMBnWrI6MVq/VLWMvtNPsBygFxxsCd0LFIKSOZoGvUhdBMfZzibGuTc7rThSR
 watJ+ok21AJZC+TVESMLlXVAnjCnnkfq20zT+QwLkEl51+2q3Kx0wYIja5XKdjorCrle
 6KVA4+GUGZWn97EZRalpqOClSFQSQ0X/YoLWO3Gb82ojP+W5wuOzDY7nVtRYW9Tfv0T/
 utmjtk3DsnF0h0zOrir9smMR7b4fvrUsZumL0eSdCWd4mgl7ThogqsVeoHcBl5Vx7srn
 1lhxNqlzlcUH0LpG+nTttQcXOxxbN6x8TCayNqEBKkr0rmEWGHrrYSdj8UKU348QoYJk
 Dnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678198422;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YVhhv72PdrilxdHdYntuv8mB81jvkxkCYQnXDOGbEQI=;
 b=InDek9TstEK3QiBaAyUkYPvWTuND7eY4TVzDFJH+ZTasWnFSzQRPsSBjEpfWMPNPVQ
 o9noac0VRPhUeph2rdDWJ436rcZiECxWrKnBUxGL+k4yYNa6ae2KgEbp10kuv8cfKzZ6
 z5CjxbVuny3EwOpMa88fj3oH0HBDjlwr3q8b9Vy0SH0L/LOAqLXZNKV8cQ5zsEwjCMCS
 1f4cWJ2r2ob69K/vSOY5M3P37rFSrFTaTIYY3G3+ZWU2uovIoaxvTYzc7PjpdUY6zLRl
 6sHUSTwgMHubWMndFuHDWlWvLVa/NPdLkCVbvzU/kdkpT5K8vasOqjrfgReabXovk8XF
 K9OA==
X-Gm-Message-State: AO0yUKXb1/60ROOBBgQhDE/8RhVIO0lLhtvm9yo+u3VGhumbR6n5qfm6
 0M98sMPezpPbHf/MWvdWF8JdTA==
X-Google-Smtp-Source: AK7set8b2deWr+t1hPSLcygu99XneSobHoB3ENX2FRMrDOvxLJyRDluFbXodBtQoEmE4Jc6PJaPuLg==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:f0d6:5d37 with SMTP id
 o5-20020a05600c4fc500b003eaf0d65d37mr12640724wmq.8.1678198422192; 
 Tue, 07 Mar 2023 06:13:42 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm18515691wmq.5.2023.03.07.06.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:13:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 898081FFB7;
 Tue,  7 Mar 2023 14:13:41 +0000 (GMT)
References: <CAEYj55Jsc0NUOwj9VsfVuLjoCmoP1QAPg+nY-ptU8eXzLCXvzQ@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sidrah <sidrah12a@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Requesting help for the Outreachy contribution Stage
Date: Tue, 07 Mar 2023 12:58:49 +0000
In-reply-to: <CAEYj55Jsc0NUOwj9VsfVuLjoCmoP1QAPg+nY-ptU8eXzLCXvzQ@mail.gmail.com>
Message-ID: <878rg8r6ne.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Sidrah <sidrah12a@gmail.com> writes:

> Hello,
> I am Sidrah Ahmed, an undergrad IT student. I've had my initial applicati=
on to Outreachy approved. I had '
> Problem Solving using C' class in my last semester and I have 'Data Struc=
tures using =E2=80=98C=E2=80=99 ' class this semester,
> worth 4 credits each. I believe I possess the skills listed on the websit=
e for the "Implement native library calls
> for QEMU user mode emulation" project.

Are you familiar with the process of dynamic linking and how a binary
calls library functions?

> Could you please help me know what I should get started with, something I=
 might need to install or something
> I may have to learn to make my first contribution?

  https://gitlab.com/qemu-project/qemu/-/issues/?label_name%5B%5D=3DBite%20=
Sized

>
> Thank you,=20
> Sidrah Ahmed.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

