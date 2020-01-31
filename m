Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974F14F0AC
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 17:38:19 +0100 (CET)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixZJC-0001Ij-M7
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 11:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixYe0-0007Mm-27
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixYdz-0005e2-1t
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:55:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47873
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixYdy-0005cU-UG
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580486141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ni+Mjjroqo37ab3NJdQhsXcR33AUVVEulRv0JhcZBg=;
 b=FV7DM1J17FHo9AgGYEA7GfIG1Q+Cj4BDmJXKrAyLIlb+C48alB9C/0N7/Wf0n5d6S/Ag81
 jLLhtgelRqxEgtavJ9aRHUNw1O1h7//+rIMQewWoTnKwZcAGI6t1QdK9Selze/TLlG4zgr
 d724RssAbCV7S1uqBUfY0eJ9MyIPxnw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-3dKBWXfUPOienz2_lalX_w-1; Fri, 31 Jan 2020 10:55:38 -0500
Received: by mail-wr1-f71.google.com with SMTP id 50so2680528wrc.2
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 07:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvWEUUq8uaf3wSjrAJUdy6Gyk4HvFShvcLglmnjEmYQ=;
 b=pkUymai8JPIlkIoBdMSVrYNQgpAwk3VQ6PhUdwGGwFGPZUDaKrXSUE0Yeg/d/K+Z0G
 HyRxXDRnxL29M701pkcOBoFjmX7jPt6SQ8ufw8aXRKw4JTlOPPpJlBaR/jwxM5e0jc4u
 e2kfbIK/6JYYlhbmqIP9ThElLxrm+b71LVIkb8vjaai/Z92sVP0Dv0poaiGwBwln4HwP
 E34IZEOLCuWDJRhhO3t+5zanyFMqhtS87IbTGjd8sVuxfC8hw+JXs5NYjrYWqk+wnNo9
 pL1zOR4OO7eNEZ/9J02Nvwg9/F2PykfhNnIZ2UhXHBTEmgVBr4zaoTcg7wWy0HD8dNUH
 OVgQ==
X-Gm-Message-State: APjAAAVBs/eT7+mXMzKkZfunuJz4lk177k9RukcLOvjAaqAekx2EPGL/
 aNSaiPFHarbW2fLoP1uTxStcPzMYioyoE5b1xVL6p86JX1MmfDSzFdUOjPlgAKZfwFZz5tVGm5g
 Plz1qSGq18AmL0XY=
X-Received: by 2002:a5d:6284:: with SMTP id k4mr13166427wru.398.1580486137604; 
 Fri, 31 Jan 2020 07:55:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2n4z8ezxSCWzMRByMICXfZ/a4KWsCVztZSG1V3ZhStboWAoKQk9hg31euj5moWWwpb8h8Kg==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr13166407wru.398.1580486137369; 
 Fri, 31 Jan 2020 07:55:37 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id a26sm11746852wmm.18.2020.01.31.07.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 07:55:36 -0800 (PST)
Subject: Re: [PATCH v2 12/12] .travis.yml: limit the arm64 target list
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200130113223.31046-1-alex.bennee@linaro.org>
 <20200130113223.31046-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b30243fd-c95a-9199-4a7f-16f9df1e9a9b@redhat.com>
Date: Fri, 31 Jan 2020 16:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200130113223.31046-13-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: 3dKBWXfUPOienz2_lalX_w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/20 12:32 PM, Alex Benn=C3=A9e wrote:
> Even though we can do a good multi-threaded build we are still
> exceeding the 50 minute build time while running the tests.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   .travis.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index a600f508b0..71bf650b1d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -426,7 +426,7 @@ matrix:
>             - genisoimage
>         env:
>           - TEST_CMD=3D"make check check-tcg V=3D1"
> -        - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_=
TARGETS}"
> +        - CONFIG=3D"--disable-containers --target-list=3Daarch64-softmmu=
,aarch64-linux-user,arm-softmmu,arm-linux-user"

We should split this job in 2 using --target-list-exclude, like on=20
X86/debug:

   env:
   - CONFIG=3D"--disable-containers=20
--target-list-exclude=3D${MAIN_SOFTMMU_TARGETS}"

>  =20
>       - name: "[ppc64] GCC check-tcg"
>         arch: ppc64le
>=20


