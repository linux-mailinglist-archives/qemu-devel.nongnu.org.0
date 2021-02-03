Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B130E6C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:08:15 +0100 (CET)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7RFu-0005dA-1B
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7RCW-0003lZ-Jf
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:04:44 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7RCU-0004Kn-NG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:04:44 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w14so838380pfi.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=xe4NL1OpCVAj5D6XNTjcZ7THukYgRk4kWYzzgI6naCI=;
 b=X2W1XRBD0JiDlRBDPHbxKXGvhIqH4MS82K/LXwrpMU87J0R0YPmXZEAqaQj+Ymj3Bo
 FEIvlvgmtTKp5rh/RHM97iJ39CN1+xwKA/xA51wpBKj1hEt1lE9FhpLQNBbZy71OsmGx
 sxScAu181jU90bnuDRZEVCljpCNE3jO53YDykUpQeel9QMPeE/0pdbwliNJ+tjCaDRYm
 5uAPm/ZoCTWVBzUuWF93nmGJ1iq/duQON7zvaDmzBhkEy0+HJtSxL0De3uxIYDlznzXv
 wZ7DZuD4ByqQ3oGczB5QHYI8eWgkOhj+mixCBMrF6cGawuJodgG7OEm/A02rrfZxhGks
 AjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=xe4NL1OpCVAj5D6XNTjcZ7THukYgRk4kWYzzgI6naCI=;
 b=Mq3KtH0t8zLv3G7dtq9t0LwS3ulrMqRgPOOMyej1YZHFSEPXyQ+GT6tZU5lRTZ8Ja5
 t7vBLxeQaIzKNnwNOwQR3szqPUUG12GrVZr7If13hi/2LLpdhxDsQZZ0GjwuKdhaWdiI
 6HHmIWvIRT/NzzH6a5Dmq1kQ7UvoultjD6KWB6maHosPhxfNIgYCnNl7IMFK9L7SwT1L
 uBHP4FAQjogD7WQVHod1KUedbgt6YMwrb+KT2hfZY6NxcysKvIC1vXSThwPScdTex7s4
 gBjp8s3WTCx6dkWiQNQ7KIn2NKos8B2TeWv1HYk5zUk2CEI1wtDmmXb4MDVqRrjWDjdK
 2/Iw==
X-Gm-Message-State: AOAM532d0u3N5fZizZJuG/kDdfPu5tG+KbdW0Zw/it2Iln72lN1o2xK/
 Yo6qGGQmi1Pu/Amx6GwKRJvlPg==
X-Google-Smtp-Source: ABdhPJxeREQljIqPS/L3XFqOX38x0+/WHX9DOerCRGx57ZgVyks4pDW+97/EKxbFDiCUO5KoYiDOlg==
X-Received: by 2002:a63:3648:: with SMTP id d69mr5971676pga.155.1612393481197; 
 Wed, 03 Feb 2021 15:04:41 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c189sm3514028pfb.175.2021.02.03.15.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 15:04:40 -0800 (PST)
To: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: gitlab containers are broken
Message-ID: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
Date: Wed, 3 Feb 2021 13:04:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Something has gone wrong with the building of the containers
in gitlab, because *all* off them are installing Alpine Linux.

https://gitlab.com/rth7680/qemu/-/jobs/1006336396#L155

I presume that IMAGE is not actually being passed through, and alpine.docker is
lexicographically first.

I have a strong suspicion that it's related to local "make docker" breakage, in
that e.g.

$ make docker-test-build@fedora-i386-cross
/usr/bin/python3 -B /home/rth/qemu/qemu/meson/meson.py introspect --targets
--tests --benchmarks | /usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
make: *** No rule to make target 'docker-test-build@fedora-i386-cross'.  Stop.

which certainly looks like the docker-TEST@IMAGE format documented.


r~

