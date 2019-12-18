Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE13D124933
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 15:13:15 +0100 (CET)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iha4g-0004gP-Cj
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 09:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iha3X-0004B9-HT
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 09:12:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iha3U-0000sl-Sq
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 09:12:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54193
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iha3U-0000kR-Gk
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 09:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576678319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JmH9HmIasu9Su4S6ANjnST1BAPzWxY4NzwlONSfyN4=;
 b=FxoUUVDaoapDCQ0dXuOkMaCAyoy/0LFUqWQvLKFeOx8R3LXzcv/HHOSxABRPaHRF8CtL3j
 JwcOTS+5vR8AUKfzBsAbS9SHc/5KUXOrjhSL2KT691mE9m1Hjv3xTOQ22HI8nsb3hmaFD3
 lpL7PlbJolLcu4W3T7PkdbNMbhJNbrM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-n0ceQl-XPEuR-I9iLE60xw-1; Wed, 18 Dec 2019 09:11:58 -0500
Received: by mail-wm1-f69.google.com with SMTP id q26so530052wmq.8
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 06:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ejht0wHaQfusLNocMp6DF6/wo2JUdbDtx9vGQV2UfeA=;
 b=jA/THst3MO2uVqtPyYb2ys6Fa7YvJGEzsn9IEVOPbaUNNxNI6AS7TjJ5c/teFzEMpR
 QC8GFQl6UBsXq5q4VrZdVE9nJsIu0QoE8YWESxXsQV4w4lfHYcTKrYkapWwrOvcny9mC
 vmrB98d3thZeYEoGBIQbp7O4+85vfkqFpL1FeXO2Ye1PCU/t5qY006n/bMnohPQZNz+7
 HAVFPfRYN5PTVvdbCRjuW/NSLT7yszN+fIfnN9R+YUX5oBqmk8D/tPLKgqFBqyTmNwol
 REChD0N7CXD84XqegK7OwmPNtPrwUoKf8fQJ0CsSWn1ORNH//9iuQHchNDlBNL6zXoiv
 9HVw==
X-Gm-Message-State: APjAAAXKJ3rPWnRO37Jmn6v8FnFvAIsEM9wX6w7k/MfB3u8wQwZIIvn9
 /aP7SsiwEv4opLKUnYr+6cM+pV8ZXEK9h4mirS4jauWadot/ThJXeB/qFRLwNBptL67FSykqilh
 9y6s4Hc3BatMMvhw=
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr3092021wrn.155.1576678316464; 
 Wed, 18 Dec 2019 06:11:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyeknss3XITu/nQB3KEMaF7j/BPsZVI+GOsyWlxezfgE4Cd3J5qIDiz7/MTDSccOpZ5oH+PWA==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr3092001wrn.155.1576678316204; 
 Wed, 18 Dec 2019 06:11:56 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id x16sm2611163wmk.35.2019.12.18.06.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 06:11:55 -0800 (PST)
Subject: Re: [PATCH 2/2] iotests: Fix IMGOPTSSYNTAX for nbd
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191218104855.42566-1-mreitz@redhat.com>
 <20191218104855.42566-3-mreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bdc23d5c-089b-8db6-ef24-719b10bf7d98@redhat.com>
Date: Wed, 18 Dec 2019 15:11:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218104855.42566-3-mreitz@redhat.com>
Content-Language: en-US
X-MC-Unique: n0ceQl-XPEuR-I9iLE60xw-1
X-Mimecast-Spam-Score: 0
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/19 11:48 AM, Max Reitz wrote:
> There is no $SOCKDIR, only $SOCK_DIR.
>=20
> Fixes: f3923a72f199b2c63747a7032db74730546f55c6
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/common.rc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index ffb47c3d5c..d088392ab6 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -217,7 +217,8 @@ if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
>           TEST_IMG=3D"$DRIVER,file.filename=3D$TEST_DIR/t.$IMGFMT"
>       elif [ "$IMGPROTO" =3D "nbd" ]; then
>           TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
> -        TEST_IMG=3D"$DRIVER,file.driver=3Dnbd,file.type=3Dunix,file.path=
=3D$SOCKDIR/nbd"
> +        TEST_IMG=3D"$DRIVER,file.driver=3Dnbd,file.type=3Dunix"
> +        TEST_IMG=3D"$TEST_IMG,file.path=3D$SOCK_DIR/nbd"
>       elif [ "$IMGPROTO" =3D "ssh" ]; then
>           TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
>           TEST_IMG=3D"$DRIVER,file.driver=3Dssh,file.host=3D127.0.0.1,fil=
e.path=3D$TEST_IMG_FILE"
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


