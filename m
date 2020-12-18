Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D362DE240
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:02:22 +0100 (CET)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqESj-0006Y9-5C
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqEPI-0004l5-H6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:58:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqEPC-0005XM-T6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:58:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id c133so2073253wme.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3MSM6gZ/HdloIkZ5v7afg1iOtNpcUZimcw7niD7H4KM=;
 b=z0Kbb4wTod5aKEK04V2xJ8xZ/pJ65bkY6b0CnEyS3C3uQKfYgcx3s//n/q5EaVPmbl
 RDwAVVqBYwOI10tAPVM7y/7aDVdoKpL5bLLlT7Tqbw3mcb90WFIrE3Nn0K8xdD3smBuw
 jfxBCg4ksPtsPOjyLvmOkiWyHJAKy6XqplGeDo7LkHoYxHiFDXydkMg/FcvfrHoZMMU4
 UIPVOnM4qMnsM6Soqx+IdQZHm/w/F9s/s2Tj2rPWScz4prPJFiCPU8GAn7rrApp4cAiO
 9T7JkqCVSbvjq4Ujutw5ulkJitnkvVCuOZkN1GdwwOlmYtOr3wovL1g8OZHPD/hYtT+y
 7FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3MSM6gZ/HdloIkZ5v7afg1iOtNpcUZimcw7niD7H4KM=;
 b=SwUz7NN7wlc3g0M0JcJe2v2DNjXEEMbDvV0lhe8M4rTsNFR0dklTwM6OPwOodJo025
 zOuh4oKaQyJADZkOOXSYAy9UNYviUW5ewgxG4kWBNh6/CT/4xa1pyunm+cygTx3dTMtb
 klRycKfiuEF5oV/8jl9OiuUTr7kARhVKAcDFkx0RQ2AemQgTzle7OAqOPivenZ22Pt3P
 qw62gB4atIilbm/qvjHrAplXMSiSeEbpBWR/+6A/ZlIWVA7yEkyf+wq7ObwjanfK/Ud3
 tZCYqRVdNS1bYKZMppjfR1IFBWS/XdY7GYAjEPbidvx3MxgK6J0VDKMDP9h5H8QCaHiU
 TcZQ==
X-Gm-Message-State: AOAM533dsptrrOi0iCyLjzIpvLGwdv8efG9KFquY2VFGlPG9UMZSV66S
 KD5k9RiHppvGE+gnVGGbyaC33g==
X-Google-Smtp-Source: ABdhPJzxz2xsh9X3Wjx3RuUXZwTfjicmVpQNsMi3VD9yNVxh4BjtviF7J0oHBIpHQAWLWxS2phvBXw==
X-Received: by 2002:a1c:3d86:: with SMTP id k128mr3852927wma.66.1608292721221; 
 Fri, 18 Dec 2020 03:58:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o124sm8451111wmb.5.2020.12.18.03.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:58:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34CBA1FF7E;
 Fri, 18 Dec 2020 11:58:39 +0000 (GMT)
References: <20201216013646.40799-1-gromero@linux.ibm.com>
 <87bleut3si.fsf@linaro.org>
 <16b08946-9f96-200e-231f-40e24bb21734@linux.ibm.com>
 <87y2hwqpd2.fsf@linaro.org>
 <9d350192-db21-82ea-1246-8f70e5c89b36@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Fail when specified cross compiler cannot be
 found
Date: Fri, 18 Dec 2020 11:57:49 +0000
In-reply-to: <9d350192-db21-82ea-1246-8f70e5c89b36@redhat.com>
Message-ID: <87mtybqqa8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: gustavo.romero@protonmail.com, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 17/12/20 18:56, Alex Benn=C3=A9e wrote:
>> To be honest at the moment the information is a little hidden at the top
>> of the output. It would be nice if we could teach meson to echo it in
>> it's nice coloured output.
>>=20
>> Paolo,
>>=20
>> Any ideas for the cleanest way to do that?
>
> The code in configure is pretty small:
>
> (for i in $cross_cc_vars; do
>    export $i
> done
> export target_list source_path use_containers
> $source_path/tests/tcg/configure.sh)
>
> configure would place the cross-cc variables (which are really just=20
> command line options) in a file, something like config-cross-cc.mak, and=
=20
> the Meson translation of the above would be
>
> env =3D environment()
> foreach k, v : keyval.load(meson.current_build_dir() /=20
> 'config-cross-cc.mak')
>    env.set(k, v)
> endforeach
> env.set('target_list', ','.join(target_dirs))
> env.set('source_path', meson.source_root())
> env.set('use_containers',
>          'CROSS_CC_CONTAINERS' in config_host ? 'yes' : 'no')
> message(run_command(files('tests/tcg/configure.sh'), env: env).stdout())
>
> For a bit more polish, one could make tests/tcg/configure.sh print the=20
> result in keyval format, parse it back from meson as a dictionary with=20
> keyval.load(), and pass the result to summary().

Don't we already have this in the form of tests/tcg/config-$TARGET.mak?
Shouldn't we just injest that into meson after configure.sh has run?

>
> Paolo


--=20
Alex Benn=C3=A9e

