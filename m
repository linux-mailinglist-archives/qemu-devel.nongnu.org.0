Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABBE2FB5AD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:32:54 +0100 (CET)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pFl-00056H-KS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1pEW-0004dd-Ts
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:31:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1pEV-000803-2c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:31:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id y187so16404512wmd.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rOKhos3585Khk13xjQm/dC8VmwzRIYx5xxh48A0GZJo=;
 b=vFM/CHvHzVfZrV6nuoM4wUoQZ5yd1S+JdpdSV7qBpYq5Wxi62AxKOT0TuE1BwvfdBr
 cWaS1wzgmFLZXI+LrOfEXxPF4rxmxO/k/wwGf+8uRo80x7Ojd6KGDQ+P1ewr66G6NuSu
 h475QeLtuAozzpSXx2uCbhV3KRv0Fv5I+I2gJbODD7P80dMrPHuF74GvthkPaTdIle1U
 dju7P3FMRQOL/Z6WpjWKwHTg0eQ/CpTn8JLQvFILJ6G+0j0R+2d3Jlqi9NeL9HLjWeZB
 O8vG4V/h0ObIJWXyJ8KejhXfbZWQBYIIBK8OjAqpqZxDBYsmLQLhL7SaEvV7LkJDrWTW
 +9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rOKhos3585Khk13xjQm/dC8VmwzRIYx5xxh48A0GZJo=;
 b=VuSO6yX2375S/W/+YDyICnMlnf3sayX4IU4S+7A0GAXtnfWgU4dmLEiHHIM5iB/vBW
 a2cpjVThJ+hcyCIu0hZPUKLTxZTKpoR6BB8kO78fxhTlI8pOSdIPxPTMWgcAAPZKaFBK
 m7MUjlxBDMmaN3b4OpAvQxG8rr8gySL3Sob/10tQ3xu7I50O61t9cHTcaMLJ3XlxlgDZ
 hUowfKUMvlqMETRW9HCTIQqn1dqZZDMRPVkinZPRhGThu5sEILc4nkjRzYd8/nzRe3lX
 unn5DfvQZ4ix5LyFvhFsS1yEuwmNuAAg2toT1dKz9vd0D2jyXdOGFfPboCIVhBd3GWO7
 g1UA==
X-Gm-Message-State: AOAM532LC6A54loFIEZvarOkV+nRfFt6y+f44IpSjF0CxVrXPyb6LlsL
 6RQ6vYSvfTk9sgUv1qhGOU1ThQ==
X-Google-Smtp-Source: ABdhPJzSUN1X1zR7U3MRFVTWumF2yyRvyQZctT6HMJlsQnxuhJ/ZbSnOfyaZnxvQaqUWWR29Wsy7fA==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr3632226wmq.163.1611055893632; 
 Tue, 19 Jan 2021 03:31:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm34813857wrw.75.2021.01.19.03.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 03:31:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46B271FF7E;
 Tue, 19 Jan 2021 11:31:31 +0000 (GMT)
References: <20210119054502.531451-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
Date: Tue, 19 Jan 2021 11:27:02 +0000
In-reply-to: <20210119054502.531451-1-f4bug@amsat.org>
Message-ID: <878s8puprg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> When using the Docker engine, build fails because the container is
> unable to resolve hostnames:
>
>   $ make docker-image-debian-s390x-cross NETWORK=3Dhost ENGINE=3Ddocker
>     BUILD   debian10
>   #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
>   #6 9.679   Temporary failure resolving 'deb.debian.org'
>   #6 16.69 Err:2 http://security.debian.org/debian-security buster/update=
s InRelease
>   #6 16.69   Temporary failure resolving 'security.debian.org'
>   #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRelease
>   #6 22.69   Temporary failure resolving 'deb.debian.org'
>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster/I=
nRelease  Temporary failure resolving 'deb.debian.org'
>   #6 22.74 W: Failed to fetch http://security.debian.org/debian-security/=
dists/buster/updates/InRelease  Temporary failure resolving 'security.debia=
n.org'
>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster-u=
pdates/InRelease  Temporary failure resolving 'deb.debian.org'
>   #6 22.74 W: Some index files failed to download. They have been
>   ignored, or old ones used instead.

I'm confused by this one as it currently works for me. That said I
thought the actual behaviour was meant to be networking is enabled by
default and explicitly disabled by the run step (which shouldn't be
pulling extra stuff down).

This was last tweaked by Daniel in 8a2390a4f47

Have the defaults for docker engine changed?

>   Traceback (most recent call last):
>     File "./tests/docker/docker.py", line 709, in <module>
>       sys.exit(main())
>     File "./tests/docker/docker.py", line 705, in main
>       return args.cmdobj.run(args, argv)
>     File "./tests/docker/docker.py", line 498, in run
>       dkr.build_image(tag, docker_dir, dockerfile,
>     File "./tests/docker/docker.py", line 353, in build_image
>       self._do_check(build_args,
>     File "./tests/docker/docker.py", line 244, in _do_check
>       return subprocess.check_call(self._command + cmd, **kwargs)
>     File "/usr/lib64/python3.8/subprocess.py", line 364, in check_call
>       raise CalledProcessError(retcode, cmd)
>   make: *** [tests/docker/Makefile.include:61: docker-image-debian10] Err=
or 1
>
> Fix by passing the NETWORK variable with --network=3D argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/docker/Makefile.include | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index bdc53ddfcf9..b65fd684011 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -63,6 +63,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>  		$(if $V,,--quiet) \
>  		$(if $(NOCACHE),--no-cache, \
>  			$(if $(DOCKER_REGISTRY),--registry $(DOCKER_REGISTRY))) \
> +		$(if $(NETWORK),$(if $(subst
> $(NETWORK),,1),--network=3D$(NETWORK))) \

which if it has we'll need to tweak both build and run steps?

>  		$(if $(NOUSER),,--add-current-user) \
>  		$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))\
>  		$(if $(EXECUTABLE),--include-executable=3D$(EXECUTABLE)),\


--=20
Alex Benn=C3=A9e

