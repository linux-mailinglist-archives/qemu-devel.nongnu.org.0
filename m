Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91DB324361
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:54:21 +0100 (CET)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyMe-00081R-JC
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEyKo-00074J-7E
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:52:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEyKm-00087p-Ay
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:52:25 -0500
Received: by mail-wm1-x334.google.com with SMTP id i7so3689123wmb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 09:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=aoKKodzTHGKxY/yunBf5SOr80Xm8JqpPU1ZveOAVytY=;
 b=dWErt7C0x2l52WfbXj3erX6P5xaSQgQKqzz+Yxyts75h21pv92pMDg2uibkE7+gpW2
 1MybQOS4h5S6wTQqqNjJAUtnLHnxvKxU7c9dW0U8QFifCHAjkq+o8wNtDzyGArVX6f/W
 VJjHg6BPKSrsVuGhCDRdWbG3PAsXwPQaVVIse/gsu3bEWB+cZfB+evBjoS5MSbep8Yf0
 F5NzXhNeUYThYoOuezB/SiJKXA/lMs3L+uYhzeM2NtBJstCUlUcOpdlBhIl41L7tRRV9
 r75mLbi+15CUCwpg8sfD2wWUWNON8AGAIYuuQ1crcz9zmmQOdCA+EmUDAKLn3n6i7LYP
 BpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=aoKKodzTHGKxY/yunBf5SOr80Xm8JqpPU1ZveOAVytY=;
 b=YDq7Ba69ewQ/kvuNiqxeq3tYABRgt6KHeJ97KriI6Gxq3p6eCiStyKeVMp9RbpGoUc
 TRDu5d4ZVhqAyl564uhajVkm9BO0LxbgnX/vdqwcAkBixu6gOf+FrDEIzhtyIPnXiaz/
 yEL5Wkx1csDUWIeQhl6k/9PnZouLC7bfVy092ohBYhCVcvnTYM1tuNnDuoAVwUL5E1XP
 jqdeiSyNUyj3neg6TjVP4RpYVFvDg6NETXOMDz9VhENTFv2EjtQHa18s/cNJeSAHuTwh
 OMEz0x5QrrTVZ0KkU7o5tDkGCcnaBTP04SdXnXPjJZQEZJzqtCjjfN13/ipGk8/kZ/u5
 2dgA==
X-Gm-Message-State: AOAM533GUz5dPU8LnAH5vZOMLyF9cej5/kyPh4DvTiBtJ7puwBpA1Ade
 UbNaA1ATb5hpFPl2nZKscsKFk3ZDj0Xb8A==
X-Google-Smtp-Source: ABdhPJyfVjEaPYDmwLeCCCW3ka1NL72E5lImIRXX8nKLlcE7hlHOnb5oYERxqtVtrFkvKNJII9gqrQ==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr3971793wmd.36.1614189142145; 
 Wed, 24 Feb 2021 09:52:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h22sm4546216wmb.36.2021.02.24.09.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 09:52:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FDE71FF7E;
 Wed, 24 Feb 2021 17:52:20 +0000 (GMT)
References: <0a40bb78-76ba-ea37-911d-c511ac785ec8@suse.de>
 <YDZ1WtyHEyP9iher@stefanha-x1.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: link to User documentation of
 https://wiki.qemu.org/Features/Tracing is broken currently
Date: Wed, 24 Feb 2021 17:51:16 +0000
In-reply-to: <YDZ1WtyHEyP9iher@stefanha-x1.localdomain>
Message-ID: <87ft1lbbfv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Fri, Feb 19, 2021 at 07:31:21PM +0100, Claudio Fontana wrote:
>> the link to User documentation of https://wiki.qemu.org/Features/Tracing=
 is broken currently:
>>=20
>> it points to:
>>=20
>> http://git.qemu-project.org/?p=3Dqemu.git;a=3Dblob_plain;f=3Ddocs/devel/=
tracing.txt;hb=3DHEAD

I should not I recently fixed the {{{src}}} macro to point at our new
hosting location (although the breakage was due to the rst change).
Perhaps we could add a {{{doc}}} macro to the wiki for this?

>>=20
>> and that to me gives a 404 - Cannot find file.
>
> Thanks for letting me know, Claudio!
>
> I have updated the page. The latest URL is:
>
>   https://qemu.org/docs/master/devel/tracing.html
>
> Stefan


--=20
Alex Benn=C3=A9e

