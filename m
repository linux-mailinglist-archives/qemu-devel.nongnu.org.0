Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33D396922
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 22:54:42 +0200 (CEST)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnovp-0007xE-Oa
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 16:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lnoup-0006v6-1i
 for qemu-devel@nongnu.org; Mon, 31 May 2021 16:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lnoul-0003Ug-TU
 for qemu-devel@nongnu.org; Mon, 31 May 2021 16:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622494414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9Asck0WzLiOUUzC9JJuWilZrpJ/jUf0gIfbgNLWu78=;
 b=C2KydEuxe0eOunfZMLl421TBFpZyKO0uLD92CkMpKzsyUcPZ6sxbMg6LDAEFZk1Ww7zXn4
 qVMI+6pf6m/mniDdRaDoI0p3qktC48C85TYgt9+YAE3NQbNGcXchU6+5Pyz419SfgIhtYu
 Utavvg7GPZr9W7E+boDH0V2Yt/1WMDo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-e7LbGQnNPb6dWrT3ljYjTA-1; Mon, 31 May 2021 16:53:32 -0400
X-MC-Unique: e7LbGQnNPb6dWrT3ljYjTA-1
Received: by mail-qt1-f199.google.com with SMTP id
 v13-20020ac8578d0000b02901e4f5d48831so4098952qta.14
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 13:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=O9Asck0WzLiOUUzC9JJuWilZrpJ/jUf0gIfbgNLWu78=;
 b=U094elbep6XLL9IJOyRU2ceCRpAWmDspAk8Vhz0uN7XlFMDnzExWA58VD+qr0qQwj0
 uacKHsha3j7U/lQCnrbevEISSbIuqt3DnH2AXC1hB36nJ1EJykNWiP4a+rgdg2CEWZLU
 xkY0mMXFXCc9mmLiBay5GQGR/f3qubx5KX6Vdlh8vG9bJgwzce/sNUfVAILfqo7JwcNp
 GgnpmVaHNlt9tEsW3Avee6fSNTm8ylCYHPhfSr/1iurxQZcmc263ogwN4U0NDTJvsefA
 FmQuz0LPETJKpeBm1eW4mvz9j1Znb0t07T2TrWSSfgI5pcvOHxXey/QYoPHGl0A8dqq9
 xOZQ==
X-Gm-Message-State: AOAM531buMMaV1w6x3x4T4W/hxt5pzuYDZUMl1GKXhofKxyxthpLaWAs
 1tuJjhc+Ovf6D/kqTCnAfOwlbc3MIH05ICl1Y6m1ULMgZPyeURy0Cqg1b7t4tLfFp7uC3v4iF6e
 Nwc8QYzJBPPddcww=
X-Received: by 2002:a05:620a:753:: with SMTP id
 i19mr18975594qki.320.1622494412345; 
 Mon, 31 May 2021 13:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb9g9NkOk/lbtITtEpxMHfkFse7h7rMLAUPrfkxk21cTYhpe+QZpiBIqzMfFFw0mTMK1XrzQ==
X-Received: by 2002:a05:620a:753:: with SMTP id
 i19mr18975576qki.320.1622494412131; 
 Mon, 31 May 2021 13:53:32 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.247.20])
 by smtp.gmail.com with ESMTPSA id m10sm9767843qkk.113.2021.05.31.13.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 13:53:31 -0700 (PDT)
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210531100348.1655156-1-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
Date: Mon, 31 May 2021 17:53:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531100348.1655156-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/31/21 7:03 AM, Philippe Mathieu-Daudé wrote:
> Install more dependencies to increase code coverage.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/vm/freebsd | 5 +++++
>   1 file changed, 5 insertions(+)

With or without this patch I got an error when `make vm-build-freebsd`. 
It fails to install packages.

For example, with this patch I got:

< Output omitted>

### Installing packages ...
Failed to prepare guest environment
Traceback (most recent call last):
   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in main
     return vm.build_image(args.image)
   File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in build_image
     self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in 
ssh_root_check
     self._ssh_do(self._config["root_user"], cmd, True)
   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in _ssh_do
     raise Exception("SSH command failed: %s" % cmd)
Exception: SSH command failed: pkg install -y git pkgconf bzip2 python37 
ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo png 
sdl2 gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir

Is it a known issue?

>
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 6e20e843228..85049b43136 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -46,7 +46,9 @@ class FreeBSDVM(basevm.BaseVM):
>           "gettext",
>   
>           # libs: crypto
> +        "cyrus-sasl",
>           "gnutls",
> +        "nettle",
>   
>           # libs: images
>           "jpeg-turbo",
> @@ -56,6 +58,7 @@ class FreeBSDVM(basevm.BaseVM):
>           "sdl2",
>           "gtk3",
>           "libxkbcommon",
> +        "pixman",
>   
>           # libs: opengl
>           "libepoxy",
> @@ -63,6 +66,8 @@ class FreeBSDVM(basevm.BaseVM):
>   
>           # libs: migration
>           "zstd",
> +
> +        "usbredir",
>       ]
>   
>       # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed


