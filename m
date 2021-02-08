Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941E313886
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:52:37 +0100 (CET)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98q4-0001HH-CP
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94iX-00014q-4r
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:28:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94iS-0001ms-RE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weFFdNIa01FEVV/DarPgXQAfYZYJuVzfEf+PRPpHbPY=;
 b=PTFCAOWxtDwkN248Tk2WRWI/GmpXJB4pPkTgVZQ8MYFgmPkxoVqOGcoBPHBZsUDy89GiS/
 J6GmrGpjY3fRepg1mL1QyUg/qhwTVDlqapHVL1+aD9qi8w2Jzom4IifclAN+kElN5h5Lox
 e/0QYjglJDXCA1Bg92ayYvx2ZaXQDMg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-iLSYEjv7MkKm7BnBdYAxPA-1; Mon, 08 Feb 2021 06:28:26 -0500
X-MC-Unique: iLSYEjv7MkKm7BnBdYAxPA-1
Received: by mail-wr1-f72.google.com with SMTP id c9so2209267wrq.18
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=weFFdNIa01FEVV/DarPgXQAfYZYJuVzfEf+PRPpHbPY=;
 b=fwOo4vJLaogsNwpEGADme30dER4nx9n+f/lMHax5kU/Q3D6rOe70d2sBsw8a4u29lQ
 foyf5mIbbJK8mKQySA6A7hyERz3z2aP3kqYX9bFpyU8p2Cf/7Rd+U9tccMUuMcizna5o
 SImY4RptyiWYqjerShnzFtwAjelMTiuTMTXC2WZli+RkglCaHecdbJu2SKZ3+nIf2WIv
 8ErPzW2RoNHEFqyFVHUUgz3DZbj0HornK684+njZkLynnD32EHIF1m4wPWExEUTcizQL
 SGSyQq9L4/HMod3UeVeUU3K07n/ymD0H1RgJHZUf6+ZBkHR5cCAwf8bVfwvb7GqOAnLu
 fw/w==
X-Gm-Message-State: AOAM533E8Y3LQm9TbHYd3xTqwL8LUPxQrdBfSehRLoXA2ySSR/8c82AB
 qYj5G2eLYGMBRfzbgLfjKRQb9DqH1SH4iSTDzkJsMPOu3XKN3ZF4/QiSIClNrJ3IaIFiLtKXNyo
 nlgZNh0KOeVNzKR8=
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr19910797wrp.110.1612783705223; 
 Mon, 08 Feb 2021 03:28:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoCpDSVZ19pdc58RFTRzqVw9ufFUHYxdh25dG1alXFcVqFEtIiNh+Ex/F/LMyU0aHmZsyTWA==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr19910767wrp.110.1612783705057; 
 Mon, 08 Feb 2021 03:28:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l10sm29048558wro.4.2021.02.08.03.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:28:24 -0800 (PST)
Subject: Re: [PATCH 13/22] tests/acceptance/virtiofs_submounts.py: add missing
 accel tag
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-14-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b80bb329-8de1-7fd4-98cc-c2bd327c5725@redhat.com>
Date: Mon, 8 Feb 2021 12:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-14-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:23 PM, Cleber Rosa wrote:
> Which is useful to select tests that depend/use a particular feature.

Is that a question?

Why keep this last in your series?

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index c998b297ee..1e745f15a2 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -75,6 +75,7 @@ def has_cmds(*cmds):
>  class VirtiofsSubmountsTest(BootLinux):
>      """
>      :avocado: tags=arch:x86_64
> +    :avocado: tags=accel:kvm
>      """
>  
>      def ssh_connect(self, username, keyfile):
> 


