Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09C6A5991
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyxW-0003xp-Um; Tue, 28 Feb 2023 07:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWyxS-0003xP-5K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:19:53 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWyxQ-0007cY-0f
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:19:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so9523439wrb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSLJaXeYeA6qqvJiIV2oSd3k581RnVrZaEsSMET38Ss=;
 b=xxGMNNFKOMv7ENpOQZBfiGThjBXuYIksb/AfStz1ZT/nTn5I+WATLL8Cnip6wPDNiS
 FZ4vxSogMVGjzph/KwfaquuglnLpZxaNKVXMLrN6/lLkHSTEhuDsxvSMnutxiIoDPLc4
 WvpPG5WqrwfBvpioI7PdInMH2aYx+Wc7LMbIlr0ZH/Y4q9KBBSVULQ1mIzHH0BwjWt14
 K81t7vk1wf3NKkeFT22/AaVNy/81cpPGScBzFWOjotrqgdUTPkGiPATZwla7CT45vJfM
 eNCfFyd+X2cLFgbQw5d9t8XBCUduQaPmfSJ9aDD4tMPmhdNetUwpr+QWHgwcTDoBJXzB
 Y/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JSLJaXeYeA6qqvJiIV2oSd3k581RnVrZaEsSMET38Ss=;
 b=3QQeqKs+RxMOi4vO6bNoYduq88eQnNBeEsM92fo3pCwdnhXCntUUXcETEUUDmKXLv2
 SjxBqd4cM3HzkPHfWyBjojoVGItHGdqsXabH2B558GUMd6vXx2If6DMXHKfQqQUevJo7
 UEe2H184RE+vE+ddHL0sbif4tzQMBtdwROwZi8RtWj2y72K66D1NyuLtEKAP13SEhREK
 IIbRW1uEgHOaZLE9Hu3EWsA81+BJTiG3UWtrkSrVnekWUmoDQWs/G+i2d0NdJDqlvd1Z
 NouynshTnvzC+s5KFb1OzhnvWXtKfyWiIrE4dG8Pw/cnJKiz1sclwzIpqGiZGPYZL3H/
 ozbg==
X-Gm-Message-State: AO0yUKXGFt39MhZlx8DLBBx6iW5Ry8xmkN5SLt4GNlXWbDiEaUtlKGMx
 /KDqjgLM8jVPUAPGZ2d3gEyI6g==
X-Google-Smtp-Source: AK7set+54s4r3WPUmKcw+5xAoqXjVMJ15ZAYq5N/7BcVOaqEHjhJjkrTStZ3b31e1QjwkrLp1MB95Q==
X-Received: by 2002:a5d:5009:0:b0:2c7:17a4:4ece with SMTP id
 e9-20020a5d5009000000b002c717a44ecemr1875691wrt.26.1677586786187; 
 Tue, 28 Feb 2023 04:19:46 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002c70e60eb40sm9764085wrm.11.2023.02.28.04.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:19:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D19401FFB7;
 Tue, 28 Feb 2023 12:19:44 +0000 (GMT)
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-5-alex.bennee@linaro.org>
 <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth
 <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>, Ed Maste
 <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, Aurelien
 Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, John Snow
 <jsnow@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>, Bandan
 Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Date: Tue, 28 Feb 2023 12:18:22 +0000
In-reply-to: <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
Message-ID: <87h6v6f0db.fsf@linaro.org>
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 24/2/23 19:08, Alex Benn=C3=A9e wrote:
>> These are flat but not generated by lcitool so we need to manually
>> update them with the `useradd` stanza.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
>>   tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
>>   tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
>>   tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
>>   tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
>>   tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
>>   tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
>>   tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
>>   tests/docker/dockerfiles/debian-native.docker             | 5 +++++
>>   tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
>>   tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
>>   tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
>>   tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
>>   tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
>>   tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
>>   tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
>>   tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
>>   tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
>>   tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++
>>   tests/docker/dockerfiles/python.docker                    | 5 +++++
>>   20 files changed, 100 insertions(+), 1 deletion(-)
>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker
>> b/tests/docker/dockerfiles/debian-all-test-cross.docker
>> index 8dc5e1b5de..981e9bdc7b 100644
>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>> @@ -61,3 +61,8 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>>     ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs
>> --disable-tools
>>   ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user=
,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-lin=
ux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-us=
er,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sp=
arc64-linux-user
>> +# As a final step configure the user (if env is defined)
>> +ARG USER
>> +ARG UID
>> +RUN if [ "${USER}" ]; then \
>> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
>
> Is that intended for local image building?

For building tests. When we run the compilers inside the docker
container we want to ensure the final binary is visible and accessible
outside the container.

> Personally I only use the image built by gitlab and mount the containers
> with -u $UID -v $HOME/.ccache -v $HOME/source/qemu. Would that still
> keep working, or do I have to map from gitlab user to mine?

Its only added on for local builds so in theory you should cache all the
layers apart from the last one.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

