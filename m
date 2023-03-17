Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFC6BEF94
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDnd-00088u-1S; Fri, 17 Mar 2023 13:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdDnb-00087p-74
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:23:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdDnZ-0001zM-PD
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:23:26 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso5570617wmr.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679073803;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjVwRmqHiqjATDmp7gXchu/uri7n09a06LCVDDM4dqE=;
 b=SITDI9I87fVlKlhD5tYY62z6x1hZcRjB/+PEpdiGz35gl1Hi/t0KI7fJPjH7y1bYaC
 zeDhErWmIuUoSiXyw5lQxPf8ImOgV0OJpHAKdJPtUBZE0mpK3hyIsPlrXYiwS3WDRFjt
 /6VDIaYNNI//l/q8HgT8IeSeCgoMULcxzUqyaYjPQDOB5Wg1O2pQJTmbHNe4v/RNe3gT
 Qk7EZZq4gnCsw37FVHt5o5nf5ya+flT4ivCK1p6iYQwyju2sFNGA007urNtb+PKv4sUB
 zUsnSl4qpp110KZZnmFmjyVd9kMk9PTl19cQhvOMhhTE9VH9LO4kPRC40B4bRXCn19At
 0SyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679073803;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UjVwRmqHiqjATDmp7gXchu/uri7n09a06LCVDDM4dqE=;
 b=ybqj59lnUz9fG4itkTuaWuB57XEu6kq4YSWBc61H3DZVx1/YYpbbZfmSw+wYGap3cP
 6Au9u2JkE/HeKN3hAXJaDI+bhvTwui7I7ouMWK5ujxpuoiTifYmw3eOUVEb4IQDMI3FV
 e0G7V36NG4u/8APQVGz9LDLhrDgrSGT3aeZB2Gb50f/WDeQXaXIJ9Dq6lLu/nmxiG1NZ
 Gg9sRJ3kJ2xa6c2Wg9JcznsPMhmejH8XDSySmGS3DH0MBTQM22F71oXXI1C1iRG9ZzZ8
 d0C46SiGLRIfA8dhHfRkICA+2HpfjxlhzjGsRv2PpG3djyd5QXc7b2GdGlz349yUWLeU
 soKQ==
X-Gm-Message-State: AO0yUKVVVOVYKTBkfQBCnjVumlToDQ9wAvgSvbgStEzv+3lte3C+bZWl
 6P2Xv2kC5pV37VWqwJMUA1xasg==
X-Google-Smtp-Source: AK7set9XhIqHPsxWZXfScezB3X8PABYE8/GH6fu9njNy5/+YBALd5LQ9LQfmWzafo4LMcV+oE6CBGA==
X-Received: by 2002:a7b:c8da:0:b0:3ed:9a09:183 with SMTP id
 f26-20020a7bc8da000000b003ed9a090183mr1063372wml.2.1679073803233; 
 Fri, 17 Mar 2023 10:23:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003dc4480df80sm8328321wmj.34.2023.03.17.10.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 10:23:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E1571FFB7;
 Fri, 17 Mar 2023 17:23:22 +0000 (GMT)
References: <20230317165057.1522743-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Luis Machado <luis.machado@arm.com>
Subject: Re: [PATCH for-8.0] target/arm: Don't advertise aarch64-pauth.xml
 to gdb
Date: Fri, 17 Mar 2023 17:23:16 +0000
In-reply-to: <20230317165057.1522743-1-peter.maydell@linaro.org>
Message-ID: <87ilez70mt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> Unfortunately a bug in older versions of gdb means that they will
> crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
> gdb commit 1ba3a3222039eb25, and there are plans to backport that to
> affected gdb release branches, but since the bug affects gdb 9
> through 12 it is very widely deployed (for instance by distros).
>
> It is not currently clear what the best way to deal with this is; it
> has been proposed to define a new XML feature name that old gdb will
> ignore but newer gdb can handle.  Since QEMU's 8.0 release is
> imminent and at least one of our CI runners is now falling over this,
> disable the pauth XML for the moment.  We can follow up with a more
> considered fix either in time for 8.0 or else for the 8.1 release.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Queued to pr/170323-for-8.0-1, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

