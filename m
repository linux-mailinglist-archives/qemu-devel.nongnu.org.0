Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F45E15B227
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 21:50:01 +0100 (CET)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1yxM-0004sF-7F
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 15:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1ywJ-00040k-3l
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1ywH-0002uX-LG
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:48:54 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30764
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1ywH-0002uD-Fc
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581540532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZmtRw9DW/ZCa8ZYWW9RbgvZhQW+Bg5lWIJmLhQGc0U=;
 b=MmKjskx7YdyfcSJuV+fPXu6Q5fdtW2SYn0sK4buIcjjywiQsSnKczZnO52Z1PcKcF+/nxv
 i7zUrNDfwwISlE6bD/PvM3dSx4zrMchgsmdxTwJsZZB/zWJ8Vx022Zek5xT0TxMf5WP2JZ
 mbjo//RBfFtr817gkRTgIDc25eJEdU4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-R-mzmwDMORaI-JZ2518aNA-1; Wed, 12 Feb 2020 15:48:45 -0500
Received: by mail-wm1-f71.google.com with SMTP id u11so1225059wmb.4
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 12:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LbKg41ezxZmLtqZ9C8QMcqV+67n7ypXRiVE9XL3Bud8=;
 b=pmIsUDdtlRX1QeQmYjY3hS+3AevrWmp+2I3LTdeLypYCMdXCBumqGPStq3fU7KFaPR
 BYnPwLgQNMJbSuqdx3lVJK2iiTTXZQhEvu4k3/V1YzUkeCc3RJ+NHDL8pfyq1TU4Wp+t
 gP82PpmuNezowZJBz5RU6lCyTyA7wRPbATQHPzB+c2KYPa72F2tb66i7/OYEyowsSR9m
 GJe253xWwNirWeDeMf/1g0EL5Rv7LeXBCjnb6t68AsQc6JGMiud+7sOihyesG8DSWAiN
 YtRn5Wqj+uXXnniH2YU8WabBiOcg6sSqO6WhoX17DYbDFgrNHE6TVsgX/dKB+HJ4jTQS
 6XLg==
X-Gm-Message-State: APjAAAVOlPZ+irbTUCwThWYLZxbeROr7ouPwvA3pShY4+Sd2p1j/R/Zn
 9aOJHhRz40NVowPHgXhF1Fs3cg/DLlF/KNlHn+YuwgJvXD+dJ6b0NRFUSIwKCUK+caqxc/zQwiD
 GesmO21US+CSHt0Q=
X-Received: by 2002:adf:fa87:: with SMTP id h7mr18046194wrr.172.1581540524816; 
 Wed, 12 Feb 2020 12:48:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZYUvSFJsS6Xsicxi2oy/Xt9TZnWFGqKRjS1oYQHcRApJoHjIB8NPJuputchmpDEZXrkAj4A==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr18046170wrr.172.1581540524617; 
 Wed, 12 Feb 2020 12:48:44 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a13sm2082066wrp.93.2020.02.12.12.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 12:48:44 -0800 (PST)
Subject: Re: [PATCH v1 5/5] travis.yml: Test the s390-ccw build, too
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200207113939.9247-1-alex.bennee@linaro.org>
 <20200207113939.9247-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6b47f020-fadb-4814-4dc1-37c3cb0b0357@redhat.com>
Date: Wed, 12 Feb 2020 21:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207113939.9247-6-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: R-mzmwDMORaI-JZ2518aNA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com, Cornelia Huck <cohuck@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 12:39 PM, Alex Benn=C3=A9e wrote:
> From: Thomas Huth <thuth@redhat.com>
>=20
> Since we can now use a s390x host on Travis, we can also build and
> test the s390-ccw bios images there. For this we have to make sure
> that roms/SLOF is checked out, too, and then move the generated *.img
> files to the right location before running the tests.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20200206202543.7085-1-thuth@redhat.com>
> ---
>   .travis.yml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index 6c0ec6cf69f..c0eeff9caa9 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -508,6 +508,16 @@ matrix:
>         env:
>           - TEST_CMD=3D"make check check-tcg V=3D1"
>           - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU=
_TARGETS},s390x-linux-user"
> +      script:
> +        - ( cd ${SRC_DIR} ; git submodule update --init roms/SLOF )
> +        - BUILD_RC=3D0 && make -j${JOBS} || BUILD_RC=3D$?
> +        - |
> +          if [ "$BUILD_RC" -eq 0 ] ; then
> +              mv pc-bios/s390-ccw/*.img pc-bios/ ;
> +              ${TEST_CMD} ;
> +          else
> +              $(exit $BUILD_RC);
> +          fi
>  =20
>       # Release builds
>       # The make-release script expect a QEMU version, so our tag must st=
art with a 'v'.
>=20

Already reviewed/tested [*] with comment:

Maybe remove the trailing ", too" in subject...

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg677641.html


