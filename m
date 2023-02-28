Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47576A61DE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:55:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7wd-0000as-Dj; Tue, 28 Feb 2023 16:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX7wQ-0000Us-Do
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:55:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX7wN-00044O-IH
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:55:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l1so8241049wry.12
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPsXpXKV8MlbzyMnVLtVJEXyvnsz8pIZvmBo0eGWytc=;
 b=Kszukd1cCNWYkxLyV5881LZlHfAPo9DDHJAxC/7Ii0XS+ANGuqCa+Oe5x0q9lVX+rG
 +ZaHF3vMUBQjjf8CwHd+oPto60eQhRjLfhv0/u893oE52NUqPFXelRSNgh+K5791G8+B
 ptM6vrjWH27YpAqQh8GAc/DG8ky4Tl43WW72Pw8B7y2lnFGZN6rAmnFDucaqvaILdA52
 bczg6ydY56cIOimg33veVxQ8n98ERIpd/IOo5NySrA0j9sYtV4QKkvCnWPYE7Yp8+sco
 2PYwbpqdVOCMFeyjYNo+F0qFACBpX9ntvpzitB8w+065dhSWgpiJ/SEQtMhZ+TVJzR0b
 NzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sPsXpXKV8MlbzyMnVLtVJEXyvnsz8pIZvmBo0eGWytc=;
 b=MlEb+Wr1UJL86RloT+zMJQAnmYuaJ0Q+22sxmBrERXqVlKlw8DJHqWTKcFvAwhDb3+
 sNIyxOj8+GMhitwo244gtAeaMzLkYmdtJBhTeoJ2mDPZ+NEs30/BK33SrR3fkwkfod3/
 ySR4efE/Vs0TkbR6H7lcXz3c2W/zw/5fqK3kjBB6ix5HhXFB+KvFBfZU+PJ6Jc3THWNa
 XtnGyR9vI+gK95pYI4vgRveAok73I1F8Ysl+9/rPXW4Pmb8wBT65tTdSkXAXi0WygRyy
 W0NDUUYKLmo/KCtfxf0D9dApYPN648CHqcf++VCWu7rnhyKO49fqIHVn2WmSHf22IHLM
 DABw==
X-Gm-Message-State: AO0yUKXlb/dqSp0XY+7yss5N1kmRmWObUHkw30PsNicCnU/sZFKPqa8C
 VRso79qSD6v/mg3QR2fA2JGRVQ==
X-Google-Smtp-Source: AK7set/B8rI1KqujtGsm9Iw9TrC/o/xbe0kC4oeE5t119lRI1etivO9d3h0G7JdZB94XoTCdGw4fEg==
X-Received: by 2002:adf:fd4d:0:b0:2c5:4c7f:c91 with SMTP id
 h13-20020adffd4d000000b002c54c7f0c91mr3103660wrs.66.1677621317321; 
 Tue, 28 Feb 2023 13:55:17 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adff586000000b002c56179d39esm10698375wro.44.2023.02.28.13.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:55:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C5681FFB7;
 Tue, 28 Feb 2023 21:55:16 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Kevin
 Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Aurelien Jarno <aurelien@aurel32.net>, Markus
 Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Yonggang Luo
 <luoyonggang@gmail.com>, qemu-block@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Laurent Vivier <lvivier@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Date: Tue, 28 Feb 2023 21:55:05 +0000
In-reply-to: <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
Message-ID: <87a60xe9q3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>> To avoid lots of copy and paste lets deal with artefacts in a
>> template. This way we can filter out most of the pre-binary object and
>> library files we no longer need as we have the final binaries.
>> build-system-alpine also saved .git-submodule-status so for
>> simplicity
>> we bring that into the template as well.
>> As an example the build-system-ubuntu artefacts before this patch
>> where around 1.3 GB, after dropping the object files it comes to 970
>> MB.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>   2 files changed, 46 insertions(+), 51 deletions(-)
>
> This is still kludging the fact that 'make check-qtest' rebuild
> the world even if QEMU binaries are present. Still an improvement, so
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Is something being missed by:

    # Avoid recompiling by hiding ninja with NINJA=3D":"
    - make NINJA=3D":" $MAKE_CHECK_ARGS

?


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

