Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3963AE1E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:54:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhOU-0006gv-Kp; Mon, 28 Nov 2022 11:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhOT-0006gV-EC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:54:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhOR-0007Cg-PG
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:54:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id w15so4663835wrl.9
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJZ2+CIf9rdBeaXd7WJ1IOzvMXtHf3dd2DocN+kY1tY=;
 b=qyqsEfMWh2Q9pyYbJfhQ15IasjVh36MPYNtitUtFjU2huDBOeERokv3d8npUS1axk5
 Pe3RpQYXbITFyF5XMD26upZjzCqiD0jYLooeaMfnvSq5+35orgriTvqVlviZgiKofw/o
 jaNNwZlPAYuvVAoLlKmSOx39KHXYsbCeE6Y44S7iNnntTn8IWLbfe8gueuTalBqp/zk9
 iaXpsEzGpvUBG8e1L0aa6k+RUDPQDghekCwypCPy7NC2+tYx9pHGcjK0rS6GD0szSY3n
 hKWMpEG2QuVNRbo3wVOH1sRr/xBE0r1mtzThDXbQTTnt5SuMWamZL/qeNhKutnyrIOlE
 lLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OJZ2+CIf9rdBeaXd7WJ1IOzvMXtHf3dd2DocN+kY1tY=;
 b=t23wwZP8MktuScrej1r6AlYjp7OAY4GwZT0XzisUx/E4bMtei20V63eM8IJVD/KZxF
 PI1ImzI/KzQft2A7ep6VvSxuXS4tX2ToOu+zhn1RpMRmoRkX/P2l8aVdacTYnJ2ANj0j
 VVWQt4nsXXROykRUd/fE6EFzNb6CUUVbBWIi0o13KyFtVmliV7ocosMbmywYl0UjEgE/
 R40Ao8+suqNaCBjxPyZc81xvl/gcbXWdcjt1GXcGs+ShmTYBawPGpTcc2//a2uiZLoax
 MjDTrjuHGUxTzyQrT3jSL/LbnnIBP5pZIL/xavkHIypDIZiXMn8i12xAxqzbp3a8aPIe
 EKfw==
X-Gm-Message-State: ANoB5pl3+XfB/F/3gyROWCM/AbFZBwL1Oh6DkKMx5a1Ss5V32PX+KzJI
 /ALBIMExcWEfTINduyzCOognnw==
X-Google-Smtp-Source: AA0mqf7JmiCE/mDKcYbWIhzLWNMQiUxPS9wUYQEY5LikVGhmTF0d1DOEJoO+tKY4Af9wJ6yIt9rPuA==
X-Received: by 2002:a5d:5233:0:b0:241:cc24:b65c with SMTP id
 i19-20020a5d5233000000b00241cc24b65cmr25020229wra.545.1669654445860; 
 Mon, 28 Nov 2022 08:54:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b003c6d21a19a0sm16863020wmq.29.2022.11.28.08.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:54:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBF3C1FFB7;
 Mon, 28 Nov 2022 16:54:04 +0000 (GMT)
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-3-thuth@redhat.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 for-8.0 2/5] scripts/make-release: Only clone single
 branches to speed up the script
Date: Mon, 28 Nov 2022 16:54:00 +0000
In-reply-to: <20221128092555.37102-3-thuth@redhat.com>
Message-ID: <87k03fxbo3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> Using --single-branch and --depth 1 here helps to speed up the process
> a little bit and helps to save some networking bandwidth.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

