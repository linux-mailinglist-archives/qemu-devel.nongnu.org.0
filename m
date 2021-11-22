Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7186645958E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 20:25:06 +0100 (CET)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpEw5-00058Z-3H
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 14:25:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mpEuD-0004M3-S1
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 14:23:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mpEu6-0006EH-5U
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 14:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637608981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgdxH7djCf/0BkbHcY4sdI2NVYsEc2Dz4wseuQgNaDU=;
 b=RZfESUZzJzOAiBP+csPRSlDHjMyWXe8c89GZuxZ+ajein/ehGtlTQuyCGNnNKj/soVcgm5
 rA9eLosr4JBnv7lc4Dbn8qL5MAekIl5MXVBW8yRexayOEEOArcpL2c06PVMC/VTh0jb2mB
 0XBbI4cLtKyTwFUqnfNSAjPSFyP1j8A=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-229-D9X-jXmbOjCcEOzaXGog_A-1; Mon, 22 Nov 2021 14:21:50 -0500
X-MC-Unique: D9X-jXmbOjCcEOzaXGog_A-1
Received: by mail-ua1-f69.google.com with SMTP id
 q12-20020a9f2b4c000000b002ddac466f76so9904151uaj.12
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 11:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qgdxH7djCf/0BkbHcY4sdI2NVYsEc2Dz4wseuQgNaDU=;
 b=vuv1r8mnFela1NZbxK3Zf1WgDWJQRoOfWBrpvYcM+HKm2A4+3+1C0Vbkau6GZ/zCqU
 CfV532C/LFd23GT7nVy3YCMHkjRCiHmV6r5VKy//6RW+b3PjMhkgRweHxmgsFneEJkMS
 x7BStlQVBc3P7pp6IdcSkN+3eCBPsTT7FON9e28bSfNGMJkAApF9xEtiQ0QhX8kT7H47
 5uHVkvbxCYat69c2Pv+B+Upk0RcrNCIztXd8nu227HnxduY/gJti+mX0B1aLENsjS/+v
 Mx4NvxFIWk+BmoKaIPded2tJ714sQqjoc9Eg0TSDuLzn8gkvXSovP8IzTQ/SL2bYy2g8
 fBKA==
X-Gm-Message-State: AOAM5325blP3B0zjuXP2COaOdQQOcqOl4bjySzK0NPVo6ArWSTSRhFoC
 U111qkzGJkeBnag/26JYKh8esM5HxbDuPHlFW7QohcosdI83/JZLKixJyfVRGTSVJX6NHUdr71r
 r5HgghvGBKdF2gmA=
X-Received: by 2002:a67:f805:: with SMTP id l5mr132810744vso.17.1637608910532; 
 Mon, 22 Nov 2021 11:21:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWuMFI332qkNNw/+nsW5gg2mWRoibvHAzqDvrmZm08olX/wkPnZsFfMRvYQ5wQanmvgAHlew==
X-Received: by 2002:a67:f805:: with SMTP id l5mr132810709vso.17.1637608910369; 
 Mon, 22 Nov 2021 11:21:50 -0800 (PST)
Received: from localhost ([181.191.236.149])
 by smtp.gmail.com with ESMTPSA id m15sm5006791vkl.40.2021.11.22.11.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:21:49 -0800 (PST)
Date: Mon, 22 Nov 2021 16:21:42 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Message-ID: <20211122192142.p346skm4yt2oboiu@laptop.redhat>
References: <20211122191124.31620-1-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211122191124.31620-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 04:11:24PM -0300, Willian Rampazzo wrote:
> Remove me as a reviewer for the Build and test automation and the
> Integration Testing with the Avocado Framework and add Beraldo
> Leal.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c1..8f5156bfa7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3469,7 +3469,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>  M: Thomas Huth <thuth@redhat.com>
>  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -R: Willian Rampazzo <willianr@redhat.com>
> +R: Beraldo Leal <bleal@redhat.com>
>  S: Maintained
>  F: .github/lockdown.yml
>  F: .gitlab-ci.yml
> @@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
>  R: Cleber Rosa <crosa@redhat.com>
>  R: Philippe Mathieu-Daudé <philmd@redhat.com>
>  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -R: Willian Rampazzo <willianr@redhat.com>
> +R: Beraldo Leal <bleal@redhat.com>
>  S: Odd Fixes
>  F: tests/avocado/

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


