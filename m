Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F17F45BBA2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:18:42 +0100 (CET)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprEX-0006w7-3S
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mprAw-0005No-Pl
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:14:59 -0500
Received: from [2a00:1450:4864:20::334] (port=34450
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mprAu-0007xi-Dr
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:14:58 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so3958053wmb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 04:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=N7pi2+is6P/Q+5qaJjYbQg6ovqPou00cKifoB4sggbg=;
 b=l17IDE9BlOxKEzwMnevT28G21T4l4mUnhYJzKF3DlGfGBbAlSI5JV/dzULACu5zssd
 i05mgjlkvU975/G9XY90W8vo1rwrDkgUhEK8QDMPGJbGVA7dqAA6QJUx2FMbuSYGugB7
 LD6eWaosQonu/OoQuAQGbxwkFgHI5XK9/8v1oIA8EIS3GRZGndeWJZQPv1nt8594TbuT
 6fPPsUeAjTIHHXJ5D1z6Ct4nfnImCw8KkRpYzaX5ctrw0ylHvJPohnYGTYBXeUFEtas+
 IEbEGE/54zRSOfB1aBdMxQnIy1BQ0EHB8bElP03j50a8n+7yXMovWKPRsRLODlIjKDjj
 24Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=N7pi2+is6P/Q+5qaJjYbQg6ovqPou00cKifoB4sggbg=;
 b=dm48AykQuyPE0t0L6vEFmKpvNz4WWTodLew85gFovOqEyFDVokI2ignBmWJHo3BISp
 wBVjCUlfRLX5rDUNnfwxZeScpjXNx8BoQB5TU8FrGCpWENbZPv6kVEnUKc3v8UP2Mv07
 YJFmj8dPoYPfWd0Gco586nY1devkafJKs9vpa1U00EAMburTCIRJRAfzpuNcP1J31h7D
 wJSwPvavtUWjZNQiGvFb1J/HUK7ne00rZtRuP0uKSTjrNFI/IM6HNBqrT/mkrJljkoGB
 g1LKlc0BoNpEZK/QUVxAVkEEVKUYQilDnzl61QmDhVIv3b7cLmMfhs/wIHgvKVzBr6SU
 8C1A==
X-Gm-Message-State: AOAM532bdPr9HaN3EWIn9Q5MJI5Er/Hd3bhcOYj2j6luich4evXe2tWO
 peqMmQ8V4oPwY3SIK/+e1nCn4g==
X-Google-Smtp-Source: ABdhPJzrtniwc+CkQGxIZ7UYaPkvj76INtO0aC0XltDlnVAlnJg2TY9wzfVOc/Etr2eYt6svl3tqXw==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr13655685wmi.173.1637756094544; 
 Wed, 24 Nov 2021 04:14:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm18896346wri.15.2021.11.24.04.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:14:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 818131FF96;
 Wed, 24 Nov 2021 12:14:52 +0000 (GMT)
References: <20211122104201.112695-1-git@xen0n.name>
 <20211122104201.112695-32-git@xen0n.name>
 <ba910daf-59aa-f0be-82c7-73a08da20a08@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 31/31] tests/docker: Add gentoo-loongarch64-cross
 image and run cross builds in GitLab
Date: Wed, 24 Nov 2021 12:13:31 +0000
In-reply-to: <ba910daf-59aa-f0be-82c7-73a08da20a08@linaro.org>
Message-ID: <87pmqphhs3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>,
 WANG Xuerui <git@xen0n.name>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/22/21 11:42 AM, WANG Xuerui wrote:
>> Normally this would be based on qemu/debian10 or qemu/ubuntu2004, but
>> after a week-long struggle, I still cannot build stage2 gcc with the
>> known-good LoongArch toolchain sources, so I chose the least-resistance
>> path with Gentoo as base image. As this image is not expected to be
>> re-built by CI, like hexagon, it should not take much maintenance
>> effort; also it's expected to be replaced as soon as Debian is
>> available.
>
> That seems fine.  I'm familiar with gentoo (only remaining distro for
> alpha), and it's a good way to bootstrap a new system.
>
>> +docker-image-gentoo-loongarch64-cross: $(DOCKER_FILES_DIR)/gentoo-loong=
arch64-cross.docker
>> +	$(if $(NOCACHE), 								\
>> +		$(call quiet-command,							\
>> +			$(DOCKER_SCRIPT) build -t qemu/gentoo-loongarch64-cross -f $< 	\
>> +			$(if $V,,--quiet) --no-cache 					\
>> +			--registry $(DOCKER_REGISTRY) --extra-files			\
>> +			$(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker.d/build-toolchai=
n.sh, \
>> +			"BUILD", "gentoo-loongarch64-cross"),				\
>> +		$(call quiet-command,							\
>> +			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
>> +				qemu/gentoo-loongarch64-cross $(DOCKER_REGISTRY),	\
>> +			"FETCH", "gentoo-loongarch64-cross")				\
>> +		$(call quiet-command,							\
>> +			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
>> +				qemu/gentoo-loongarch64-cross --add-current-user,	\
>> +			"PREPARE", "gentoo-loongarch64-cross"))
>> +
>> +
>>   debian-toolchain-run =3D \
>>   	$(if $(NOCACHE), 						\
>>   		$(call quiet-command,					\
>
> Note the addition of debian-toolchain-run, handling the boilerplate
> for this for microblaze and nios2.
>
> (I haven't converted hexagon to this, because I had expected to be
> able to replace that with a pre-built toolchain.  But then the
> compiler turned out to be buggy, and that patch got dropped.  I hope
> we can revisit this during 7.0.)
>
>> +FROM gentoo/stage3:20211116
>
> If I understand correctly, this should be the fully qualified name:
> docker.io/library/etc.   Alex? Phil?

Yes all external references should have fully qualified paths to the
registry from which they get their data.

>
>> +"$CROSS_EMERGE" -1 --onlydeps -j4 gawk
> ...
>> +"$CROSS_EMERGE" -1 --onlydeps -j4 qemu
>
> Why the quotes on CROSS_EMERGE?  Use $J, which you computed earlier.
>
> All minor nits, as it Worked For Me.  Thanks for putting this together.
>
>
> r~


--=20
Alex Benn=C3=A9e

