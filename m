Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF1E3BABCC
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 09:32:35 +0200 (CEST)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzwcE-0007Ik-LI
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 03:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lzwZa-0006Tz-Gp
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 03:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lzwZS-0004Yl-F3
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 03:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625383781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lZo/mdosICK+XXkEHmrr2oIM/BRx2t7r/UDR8oQVc4=;
 b=BnVsS0JkKtb6QVaaRh5TPel5gXJbScky6A3vrK4SfCc594tC6aUrsqgjr9YiYa4zx5RjmO
 /bcUmZCXlUt2cvi4fnbhCXAh27CZtFXkoedX+xj14RBsauWjEm5vWBDhfrZkKAla+K0P8W
 EiIgstIN8hKeaDEh9F4CNbtrdBsmT6w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-n0B-TxEXN6K4MFy8HlU8NA-1; Sun, 04 Jul 2021 03:29:40 -0400
X-MC-Unique: n0B-TxEXN6K4MFy8HlU8NA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c15-20020a056000184fb0290124a352153cso5299663wri.9
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 00:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3lZo/mdosICK+XXkEHmrr2oIM/BRx2t7r/UDR8oQVc4=;
 b=N4c/0agobxtZeXmwMvLTI8zpWQTLP9/A5tOvWU9OjcrrLgk1hWg1PmxgAbyuFyDsfA
 Mo4ZU6E6righFSDakJzgH1F4l9xCg+j/lMjVXUO7K5aCJFEtxYkaUYsz+7ZMp0L6xXkY
 fNaSK3BPj0TiHhc7kY7ONWuMdLM3orBI5Oag9PIkcn7CBGEzXUWHL60v5I17ZYvptZRy
 adVPRX1lpTlDkfVNIo809P9VR9EJJUvv4N4uhdj2DprfgGvB6Nzia7rXPCW3gSFlMu6f
 7bZy8CkE3rx1ccjqs3aRW/lBIBn2VQjCnd6U11M21lnlzFtlgJWRBOTBX0eORC43COsl
 Zdfw==
X-Gm-Message-State: AOAM532Hy4WlL4SUrEDQRSLQMYsZmke1F4Y37CIZF4yKd1JJMH7A4faa
 ww4pSvegZbIXI86lQW6F3zjFUQoPCBA+Z6KcuasVoRJIaCw9VTGcz/P+zP289X+0oFELsoOCA1k
 LrPAeoYDvbriSTsw=
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr8364927wme.150.1625383779540; 
 Sun, 04 Jul 2021 00:29:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLNxmbwi7kmKzIbY3xmUBIbRNkdjsJcjM8/31DY9tzO65fReqm1bsFkwXIhW08P6MzJBukdA==
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr8364908wme.150.1625383779311; 
 Sun, 04 Jul 2021 00:29:39 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id b8sm18778543wmb.20.2021.07.04.00.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 00:29:38 -0700 (PDT)
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6419b192-7aa5-f7e4-fc8a-c9e21e16157b@redhat.com>
Date: Sun, 4 Jul 2021 09:29:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/2021 23.10, Richard Zak wrote:
> For Haiku: turn off TPM, disable mips & xtensa emulators as they won't 
> compile on Haiku, use Haiku's capstone. I'm resending this as I previously 
> sent to the wrong address. This should resolve the memory issue with "make 
> vm-build-haiku.x86_64"
> 
> Signed-off-by: Richard Zak <richard.j.zak@gmail.com 
> <mailto:richard.j.zak@gmail.com>>
> ---
>   configure | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e799d908a3..a965c6c72e 100755
> --- a/configure
> +++ b/configure
> @@ -358,6 +358,7 @@ oss_lib=""
>   bsd="no"
>   linux="no"
>   solaris="no"
> +haiku="no"
>   profiler="no"
>   cocoa="auto"
>   softmmu="yes"
> @@ -769,7 +770,10 @@ SunOS)
>   ;;
>   Haiku)
>     haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
> +  tpm="no"

Why is tpm support not auto-detected?

> +  capstone="system"
> +  target_list_exclude="mips-softmmu mipsel-softmmu mips64-softmmu 
> mips64el-softmmu xtensa-softmmu xtensaeb-softmmu"

I think it's rather a bad idea to set target_list_exclude here since this 
will prevent that the users can use their own "--target-list" and 
"--target-list-exclude" switches for the configure script. But maybe you 
could add some logic later that checks whether the user set a target list, 
and if that's not the case then tweak the target_list_exclude accordingly.

> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -I`finddir 
> B_SYSTEM_HEADERS_DIRECTORY`/capstone $QEMU_CFLAGS"
>   ;;
>   Linux)
>     audio_drv_list="try-pa oss"
> -- 
> 2.25.1

  Thomas


