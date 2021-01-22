Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E13010CC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 00:17:42 +0100 (CET)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35gT-0006tm-D5
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 18:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35f8-0006FN-Vs
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:16:19 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35f5-0001wH-II
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:16:18 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d2so4850001edz.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5lWkgj8DIwtPTU2rDD15+cdf/wswQ+WKNPo70ksMkWM=;
 b=qVoY1lWG6dJpiY0VsLo8Lwt7DWLyasPjehVsWaE8FrJr/qhWBXqb0Yq1U5DzNcwQiD
 zyRiyp4G4QoK+HnZd0Yhs3Shs2ejXMZINJrAR0dQBGyCoaemKuBLEhyFaN3P3lv75U1d
 qzpGlxd5ZFaaShu1IId/MjDhTilP3mqzqh1bwlQmtW56+fresmvYtZjtEARW/j7U1hVR
 f1quKDLlW5hvz8hZ3zw9M0DELel2J6jcoYFchltSygh0xZvzF+UcLQc+hIiuUMljledx
 0O8kdtJwHO5Rh+m2XvnrJflZKddOp5P7NSpvr2iQ4L3mh+pJzyT9RAn1b5GllVZd6Zgk
 11QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5lWkgj8DIwtPTU2rDD15+cdf/wswQ+WKNPo70ksMkWM=;
 b=admX9buqWQvJ9c+1oPAN/jcfJ56sWU0wuA7hRfBmALIV6ATsveftcRC68arBWmjiA4
 Lz+ANbSMIi+VmTl9HLflRJo60uXYwVUSg3/o4Z8Mg8Ak7KGv4dBU41ytk6yzKcSn9v9s
 t1YOA7bnJeZH7cTw7qLRJctahyakAnnIhSnDSdflXXQZTWglNmzs5nAj+s4kPRYIW9oE
 tq1hrM6GDN/LnT5O6d2Zd7sDrbLCfReUl9Lm0aTuj76CgFRl+DMvFK4+SOkXRMjwv/3q
 hy7E3s/aF0Aoxes7dFyMma7n2+2E862vNTpt0htOzTK+62dRLo/9+tOWG8H8LYfCztez
 vDnA==
X-Gm-Message-State: AOAM530H9b4EPhsyQnCl5egaQVv5JJ9kdsjhkkC3ulUhQhULDnC+3L4y
 YeKMSdVKdmOZR1CCdoDAiUUF2QV9XZ514+GWZcp/0zC+Qqkttg==
X-Google-Smtp-Source: ABdhPJy4bGDFjSxlQ54OTqdaEhbUTmAx5w6vwqw2VacHSU7EbBADtIEVtnHyYKZDvsYfHZJ8q+SJ76ALIFBB8CPKGxY=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr4940374edv.36.1611357373693; 
 Fri, 22 Jan 2021 15:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-4-j@getutm.app>
In-Reply-To: <20210122201113.63788-4-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 23:16:02 +0000
Message-ID: <CAFEAcA9tPOfL2UHFZNEJWUs428qKR1NABd5+b4Q_dO2eEY5r-Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/11] configure: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 20:13, Joelle van Dyne <j@getutm.app> wrote:
>
> Some BSD platforms do not have this header.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure          | 9 +++++++++
>  block.c            | 2 +-
>  block/file-posix.c | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 32be5d225d..951de427bb 100755
> --- a/configure
> +++ b/configure
> @@ -5295,6 +5295,12 @@ else
>    have_host_block_device=no
>  fi
>
> +if check_include "sys/disk.h" ; then
> +  sys_disk_h=yes
> +else
> +  sys_disk_h=no
> +fi
> +
>  ##########################################
>  # End of CC checks
>  # After here, no more $cc or $ld runs
> @@ -5528,6 +5534,9 @@ echo "ARCH=$ARCH" >> $config_host_mak
>  if test "$have_host_block_device" = "yes" ; then
>    echo "HAVE_HOST_BLOCK_DEVICE=y" >> $config_host_mak
>  fi
> +if test "$sys_disk_h" = "yes" ; then
> +  echo "HAVE_SYS_DISK_H=y" >> $config_host_mak
> +fi
>  if test "$debug_tcg" = "yes" ; then
>    echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
>  fi

We should do this check in meson.build, where it is a one-liner:

config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))

(compare the existing HAVE_PTY_H etc).

thanks
-- PMM

