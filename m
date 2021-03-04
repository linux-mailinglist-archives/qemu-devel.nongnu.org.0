Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF20B32DAE7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:13:28 +0100 (CET)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuLg-000569-1d
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHuHM-0000T0-AT
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:09:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHuHJ-00024O-Dj
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:09:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so5062622wma.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BtFyGMPvh4LNlalnin11V8SgVEYD+OZo7I88h/TR2qI=;
 b=fbYd9kqwRRLD86hqsVMify9FISLCEvCzGTu+so25g3oDRCK76G3jbsSKoBU+XtWgQG
 WxHsvm7CY+jdAQHVoXFFdyQm+pEFKwsf7Pnweve/DOyzR4l7tf+HlXa9dAZ0GlzNm1hv
 lRs25Ush69QCCRZtypcimBpW1GUKJTBREsx1cqoYCDS3CIT4/ftEQZpgI5Bqff6Zl5Eh
 P5n+oTh7GFompKHvik4Wf7uKVtozwjEBu4pEddcf1RqWL7N/rQRY37uc47/qZ14V9zo2
 fgLEuQ2bH0qEUeSNaCzUfHpNRKxRIMwLoI06GIRBhiMzj2UVgXmHCO7OyK/j+RDvyPIE
 8pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BtFyGMPvh4LNlalnin11V8SgVEYD+OZo7I88h/TR2qI=;
 b=d6KrwbKVCkCA9aJbiCT+judWF1Y2mwUbvkW5KQH4c0xAGpygrjBoTEJk8ssWcgCNj3
 QQeEWoxQN+JoFhFDp4G3d+S/Od/5/1vQz0tTDjbAiCHAqaXgtqwbVP3l1T/gWz8W7cWO
 rLfIWv807DebrSaJbqJsiRb58bOMurrVrPFJJKQ11z7nJz611BszrTKCaDsIUHBGNcyP
 LyfFHE5GvytisaFs04btB0w/f6YBkSPs5VPBceoNvbAS/SHz2EqxkY6MFy3q43nRgsHo
 rUJctQY/6uSOg1gW3W3Z6Bxn4G/QMKT0xeRNSonY31SjD86AhgOK7CBXsTwmSFopd6Lr
 Qvrg==
X-Gm-Message-State: AOAM532PyN6XkQjM8sIRvpgRXLCXbaaPcUpIZS3t/Az0tvcr3iULBvhd
 b7+70rCp/07vPlECtGUGUyGlvw==
X-Google-Smtp-Source: ABdhPJwWVGAGnldUlSCc0XKzttUlgm62n6HsSHw2e+CBfCFihQM0HiIuL837hWHlLN4iOm1gCtg4CA==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr5374682wmi.159.1614888532355; 
 Thu, 04 Mar 2021 12:08:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s124sm699217wms.40.2021.03.04.12.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:08:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C15381FF7E;
 Thu,  4 Mar 2021 20:08:50 +0000 (GMT)
References: <20210223211115.2971565-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] tests/docker: Use --arch-only when building Debian
 cross image
Date: Thu, 04 Mar 2021 20:08:40 +0000
In-reply-to: <20210223211115.2971565-1-f4bug@amsat.org>
Message-ID: <87o8fyfzql.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> When building a Docker image based on debian10.docker on
> a non-x86 host, we get:
>
>  [2/4] RUN apt update &&     DEBIAN_FRONTEND=3Dnoninteractive eatmydata  =
   apt build-dep -yy qemu
>  Reading package lists... Done
>  Building dependency tree
>  Reading state information... Done
>  Some packages could not be installed. This may mean that you have
>  requested an impossible situation or if you are using the unstable
>  distribution that some required packages have not yet been created
>  or been moved out of Incoming.
>  The following information may help to resolve the situation:
>
>  The following packages have unmet dependencies:
>   builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
>                    Depends: gcc-alpha-linux-gnu but it is not installable
>  E: Unable to correct problems, you have held broken packages.
>
> Fix by using the --arch-only option suggested here:
> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1
>
> Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

