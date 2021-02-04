Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D36930F1A5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:10:45 +0100 (CET)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cX6-0002i3-7z
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cTz-0000L3-EE
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:07:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cTx-0005Xc-DU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8pzO1gkE8XAl54gTeb+30vK7f3mIL2y9IHMX9g3m1F4=;
 b=GufCBxSORSSFMg4XKiaO3V/VqkFwykUfT2THE1t3qy4TXIDO6wzpsxDh5P40FfgarUjD4N
 KhPHSY8DEJinG5xj32HTa9lqRMkZGdpnXgFeizDaS8JtckvU+WTRypX/NZloP4bEGT/wMV
 3tNYEizAmJQq7lF6ndDyGOn1Uqldur4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-NQ-duo1QNNuJ-mTYotANqA-1; Thu, 04 Feb 2021 06:07:24 -0500
X-MC-Unique: NQ-duo1QNNuJ-mTYotANqA-1
Received: by mail-qk1-f198.google.com with SMTP id b20so715104qkg.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8pzO1gkE8XAl54gTeb+30vK7f3mIL2y9IHMX9g3m1F4=;
 b=cMWlMKNlQqv/4GQ3u3E0OnENvkvDs9SIOoZsCJS00Sr1rGFci8gJwOeRCeBi2o2qlX
 aeEdNgueThREVWna+FzAkDAofSu7F9cv8MStHmgF/GGi91q9l7tknUjVl1tlT//7Wdf9
 bIWIFlsBV5J0qY2+2a75Qf1Par9J6J9cln8VhoX7uPLNsB4rskL06nnGSr2dSrnMd1Sl
 GGIm6O77/2IJc5k3QmJ4NVA6HRUXhgJKECTOJRQMnuKTNit90QDLkQq2vhDRpu4vM6/p
 W1foxw4JusQBvLVTx6ZCghuFomFgWpI+UX8RY8LlPZ87wd3Ic27x0AMhPXgVArgEAY6F
 rVxA==
X-Gm-Message-State: AOAM532SJPa60nB645anv43yjl5gNCQceaFzCVGcqp+i+KcUkHqTSrxM
 +r6DDs73lNblQruTXNjor3DUOF06rY1Bk2znZS1NE9Sm/9oCXTWnwBgH5tCyOCWg09f4C29RQLR
 Pi16sLUEC90su4vY=
X-Received: by 2002:a37:9581:: with SMTP id x123mr6831524qkd.439.1612436844385; 
 Thu, 04 Feb 2021 03:07:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrXO0s3XnkoBOGMscSJJQoWjUUeHe49QWNaRyt/NtJdlldwyQUyeWGf/0+9jhV0Hr5/2pSvA==
X-Received: by 2002:a37:9581:: with SMTP id x123mr6831499qkd.439.1612436844209; 
 Thu, 04 Feb 2021 03:07:24 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id 12sm4906891qkg.39.2021.02.04.03.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:07:23 -0800 (PST)
Date: Thu, 4 Feb 2021 08:07:21 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
Message-ID: <20210204110721.wd646pwcap7hect2@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-8-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 12:23:42PM -0500, Cleber Rosa wrote:
> If the vmlinuz variable is set to anything that evaluates to True,
> then the respective arguments should be set.  If the variable contains
> an empty string, than it will evaluate to False, and the extra
> arguments will not be set.
> 
> This keeps the same logic, but improves readability a bit.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index f1b49f03bb..f25a386a19 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -241,7 +241,7 @@ class VirtiofsSubmountsTest(BootLinux):
>  
>          super(VirtiofsSubmountsTest, self).setUp(pubkey)
>  
> -        if len(vmlinuz) > 0:
> +        if vmlinuz:
>              self.vm.add_args('-kernel', vmlinuz,
>                               '-append', 'console=ttyS0 root=/dev/sda1')
>  
> -- 
> 2.25.4
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>


