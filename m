Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7C2FB679
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:47:30 +0100 (CET)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rM1-0000ET-8x
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1rF4-0002ft-NJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:40:18 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1rF2-0003Ss-U4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:40:18 -0500
Received: by mail-ed1-x534.google.com with SMTP id u19so21565751edx.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k9mBDNmPRPn2SD2NytXC2JYwsbhhqMI1dZAryujjBmc=;
 b=OsKvXgibwyreG/yKz3oeCmaFPMB56zI+F2md1WH7XjLbl0Vzf9zFAc8vSdIKwU8KSv
 La8G9SICgc+hvWk/vu2uQ9CNAyPeiztuTV3KTj74UzwXJrJwfxeuT073pMjDEgEKAl6D
 sPYUK7W8vYcQ/T0IMI7sbxOE99P3bE4nn+w3K3we7+DWw2Girxmtfra9YoSpQYHJHiQ4
 EXh3VUT+Et7Qc5iyVwlE8zi26dsc2pr11n0zwXk1LEXnPFdulPo9zSysj/1iNhJWZV20
 hPHeyfgVo0a8DDXSR6dWI3SYXykEgXlWMnfNOOzuh+JyHkJQZtLao1JpsMy7JSoEC3iO
 Trfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9mBDNmPRPn2SD2NytXC2JYwsbhhqMI1dZAryujjBmc=;
 b=PZq/1vJLu3AB+bzLg9b4Ldei7KGWhUQdayjNtqeZacKM4xb9yviJMpvSWdgj2Q5N9Q
 N2a4Qr2jag4i8Vdl2E5OUSVMVRtdOqJzEqJ1auqGuD6/YhXlU5sgwT+7ip+YQK8U9xsq
 SeubVLxCJ6GV/Q6G03MvljhGQ9K0jiBbe+/PPZyli7b5V2soCETcGkacrgm2C1mPOkEi
 ZiYnDjazoMc6RUaEQ7qGfcLA3JkQ+XO8SFjqEMmaskNPuBtvBZkBylIvIuWberAiTpQZ
 tfRmuWfOUA+jQZ640yd43VWSOh3uOTw2fsIPEuYoKW/gXFvzA5Fev0er514cJ0in+o55
 oruQ==
X-Gm-Message-State: AOAM5313Dy01IpNVHBsgQHCrjfkDTwLGQG0/czPu76pTpTNhYZ1wJN4X
 KCyXSKWJzMrw/7MO34ruCxo=
X-Google-Smtp-Source: ABdhPJxhy61aurzuBp5Oca8Pv2YFCX52VRM/7N6vrW/79e9z6f4boFKjXI06CbShlgqzRvy+fSLOgA==
X-Received: by 2002:a05:6402:2048:: with SMTP id
 bc8mr555237edb.292.1611063615638; 
 Tue, 19 Jan 2021 05:40:15 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n3sm6223236ejd.85.2021.01.19.05.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:14 -0800 (PST)
Subject: Re: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210119054502.531451-1-f4bug@amsat.org>
 <878s8puprg.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f34c7ff5-cd02-83b4-d3d8-c2ec7ac4334f@amsat.org>
Date: Tue, 19 Jan 2021 14:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s8puprg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 12:27 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> When using the Docker engine, build fails because the container is
>> unable to resolve hostnames:
>>
>>   $ make docker-image-debian-s390x-cross NETWORK=host ENGINE=docker
>>     BUILD   debian10
>>   #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
>>   #6 9.679   Temporary failure resolving 'deb.debian.org'
>>   #6 16.69 Err:2 http://security.debian.org/debian-security buster/updates InRelease
>>   #6 16.69   Temporary failure resolving 'security.debian.org'
>>   #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRelease
>>   #6 22.69   Temporary failure resolving 'deb.debian.org'
>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster/InRelease  Temporary failure resolving 'deb.debian.org'
>>   #6 22.74 W: Failed to fetch http://security.debian.org/debian-security/dists/buster/updates/InRelease  Temporary failure resolving 'security.debian.org'
>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster-updates/InRelease  Temporary failure resolving 'deb.debian.org'
>>   #6 22.74 W: Some index files failed to download. They have been
>>   ignored, or old ones used instead.
> 
> I'm confused by this one as it currently works for me. That said I
> thought the actual behaviour was meant to be networking is enabled by
> default and explicitly disabled by the run step (which shouldn't be
> pulling extra stuff down).
> 
> This was last tweaked by Daniel in 8a2390a4f47
> 
> Have the defaults for docker engine changed?

No idea as I'm not following their development, but TBH it
becomes harder and harder to use without tricks (I had to
add systemd.unified_cgroup_hierarchy=0 to kernel cmdline
to keep using it).

Maybe I should switch to podman which is the recommended
engine on Fedora.

Cc'ing Marc-André who added podman support (Daniel is in Cc).

> 
>>   Traceback (most recent call last):
>>     File "./tests/docker/docker.py", line 709, in <module>
>>       sys.exit(main())
>>     File "./tests/docker/docker.py", line 705, in main
>>       return args.cmdobj.run(args, argv)
>>     File "./tests/docker/docker.py", line 498, in run
>>       dkr.build_image(tag, docker_dir, dockerfile,
>>     File "./tests/docker/docker.py", line 353, in build_image
>>       self._do_check(build_args,
>>     File "./tests/docker/docker.py", line 244, in _do_check
>>       return subprocess.check_call(self._command + cmd, **kwargs)
>>     File "/usr/lib64/python3.8/subprocess.py", line 364, in check_call
>>       raise CalledProcessError(retcode, cmd)
>>   make: *** [tests/docker/Makefile.include:61: docker-image-debian10] Error 1
>>
>> Fix by passing the NETWORK variable with --network= argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/docker/Makefile.include | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
>> index bdc53ddfcf9..b65fd684011 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -63,6 +63,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>>  		$(if $V,,--quiet) \
>>  		$(if $(NOCACHE),--no-cache, \
>>  			$(if $(DOCKER_REGISTRY),--registry $(DOCKER_REGISTRY))) \
>> +		$(if $(NETWORK),$(if $(subst
>> $(NETWORK),,1),--network=$(NETWORK))) \
> 
> which if it has we'll need to tweak both build and run steps?

I suppose you need need networking for git (submodule) clone?

Personally I don't require networking when running because I
share my QEMU source directory as a volume, so it never bothered
me.

> 
>>  		$(if $(NOUSER),,--add-current-user) \
>>  		$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))\
>>  		$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)),\
> 
> 

