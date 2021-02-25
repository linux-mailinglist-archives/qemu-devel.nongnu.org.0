Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7773249E6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 05:58:49 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF8jg-0008Aa-E9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 23:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keescook@chromium.org>)
 id 1lF8ia-0007it-Sv
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:57:40 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <keescook@chromium.org>)
 id 1lF8iY-00015R-Rw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:57:40 -0500
Received: by mail-pj1-x1033.google.com with SMTP id e9so2820982pjj.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 20:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+8kI8nz4N5Z48gbO4eFrSdCp9JwpH67g3WghBeNMpbU=;
 b=UCbZ5Mhzz4O5aTkkjWgGwk3FLzXuPh8ycqu8b3WpnxL1gqVcU4sJ9w42+cOkvjAmcf
 REpFYMUV4APQsRd2sy7qqMuumqz8lByV6QhjIcU2drZjBTaISO2YvK3zk0zZq2Vn6MMG
 vRdIDJNTLaO0ZVwLpY4Y5oYQiZaoaoQJTRRFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+8kI8nz4N5Z48gbO4eFrSdCp9JwpH67g3WghBeNMpbU=;
 b=iaNyHlmE8hnMSg6fcQmDvIPlAMVkHhh8XwgIuNCtctvoI2NtQxKohxc8SWNY0VO0Ox
 dixoxmJW7RzqzHySnSpuntd6sh8avN6+AqeMUdWvHicRbRiTIEzPdLXEy9SumGL+/jcF
 D/d0BxR0NzmNsiZ4pRqnvQOrmC+ZSZ9rpvsAzwx7VrWEz/eUJfjNAJRDJHEzmpGRZKM3
 cdIfqWY1JrkBGtRBQbXgLIvd/H+KcfD8XIbE/h04ur1idPqnp0bf1/y9wirUpJlCQiLo
 6z5+Y3HnhdiiSzQdPECuXFAn40DKpxSGgPtBV+niXJhDju/oAVcFYVoOa11aA3h2WCGS
 Rr1Q==
X-Gm-Message-State: AOAM533YhbHYaUskJYsyS8Dr70kKWpYZ4z29qw8D81tNl1PpUDoQVgHy
 SwhdFOmYicgQi/eR4EWhh+uZZg==
X-Google-Smtp-Source: ABdhPJxN42CgYcoLGskaFUCoPXLZ2lXQ2UUsOjk+rumrN7ykCwdYDaAVvwhw0mcwsn86KftcE8gtww==
X-Received: by 2002:a17:902:edc2:b029:e4:3738:9b23 with SMTP id
 q2-20020a170902edc2b02900e437389b23mr1512855plk.37.1614229056386; 
 Wed, 24 Feb 2021 20:57:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z8sm1756620pjd.0.2021.02.24.20.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 20:57:35 -0800 (PST)
Date: Wed, 24 Feb 2021 20:57:34 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
Message-ID: <202102242050.128D0CD@keescook>
References: <20210211194258.4137998-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211194258.4137998-1-nathan@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=keescook@chromium.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Gabriel Somlo <somlo@cmu.edu>, Nick Desaulniers <ndesaulniers@google.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:42:58PM -0700, Nathan Chancellor wrote:
> fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> which violates clang's CFI checking because fw_cfg_showrev()'s second
> parameter is 'struct attribute', whereas the ->show() member of 'struct
> kobj_structure' expects the second parameter to be of type 'struct
> kobj_attribute'.
> 
> $ cat /sys/firmware/qemu_fw_cfg/rev
> 3
> 
> $ dmesg | grep "CFI failure"
> [   26.016832] CFI failure (target: fw_cfg_showrev+0x0/0x8):
> 
> Fix this by converting fw_cfg_rev_attr to 'struct kobj_attribute' where
> this would have been caught automatically by the incompatible pointer
> types compiler warning. Update fw_cfg_showrev() accordingly.
> 
> Fixes: 75f3e8e47f38 ("firmware: introduce sysfs driver for QEMU's fw_cfg device")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1299
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Ah, nice, yes.

Reviewed-by: Kees Cook <keescook@chromium.org>

Michael, are you able to take this? I can snag it if needed.

-Kees

> ---
>  drivers/firmware/qemu_fw_cfg.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index 0078260fbabe..172c751a4f6c 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -299,15 +299,13 @@ static int fw_cfg_do_platform_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static ssize_t fw_cfg_showrev(struct kobject *k, struct attribute *a, char *buf)
> +static ssize_t fw_cfg_showrev(struct kobject *k, struct kobj_attribute *a,
> +			      char *buf)
>  {
>  	return sprintf(buf, "%u\n", fw_cfg_rev);
>  }
>  
> -static const struct {
> -	struct attribute attr;
> -	ssize_t (*show)(struct kobject *k, struct attribute *a, char *buf);
> -} fw_cfg_rev_attr = {
> +static const struct kobj_attribute fw_cfg_rev_attr = {
>  	.attr = { .name = "rev", .mode = S_IRUSR },
>  	.show = fw_cfg_showrev,
>  };
> 
> base-commit: 92bf22614b21a2706f4993b278017e437f7785b3
> -- 
> 2.30.1
> 

-- 
Kees Cook

