Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CF696055
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsDS-0006Oe-0Y; Tue, 14 Feb 2023 05:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRsDQ-0006OW-D3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:07:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRsDO-000727-Md
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:07:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id j23so15080399wra.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYUPGrDos6m+lpzP9SrZRLxp5lCC4BWlXEKuTjy1zio=;
 b=tNDR6tMnSxTT/IWHQQqVJ9qPE+JTXx6BeFKxAblYcRlmxU3t6kbRdEbFwt4qrzOWNl
 LndAH7+hb+U2j3vZhjOw/jvSIrwuKc+X7zbOdXLcSuFW7wformXz7T3f8Fhk+HkCo1o+
 n3Y58Ro7Xs5JdlVF/iJrHcXzPAXKzZlUez9WZWMNe8WhMNKnH02smpvKc+diMTaDdKJ6
 city0qEUp8qjiOKZBytzUSYJMUlE0RXFbo912/2eAPtRoCz8cNkO40/4H3iCWm0StzI2
 Z0pMOM3T6wuX0jqxOSy0fbBti0X6eIuQr+rXHRAjrraxTT/Yu8egy7YcirG2ShcKxnuG
 Smvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pYUPGrDos6m+lpzP9SrZRLxp5lCC4BWlXEKuTjy1zio=;
 b=BEIw/xzSzqmIYxytEHKSHi9WMQ82L96SKO/8f3BzAoIxfMdIbP9ntYr2/W7I6IeFqW
 x/1oNa+eWwIlRBT3bVzSbqiY7NbuWrQdA91uKll+zU81m27YnKh1EM+QJmKHapBhRRK5
 La3VyB2y27/y2qHRVMmwWnM3TeRVnQUPZcdekRARb+hokTaqO7oh9xhaZN3GzLWY7hfY
 BiiIzF3FtOiEg+axeECsJfPV8/MF/hLqoakI5TAG6GsZzB8QcDlpHPklth9Ymdv7T2L5
 MVmxZjNfsjwIiG2jQq3VqriQbOdP0MovcSLLVtsWyWAfFh8kr5oV4a8ubqRQawWV2RRJ
 u0Bw==
X-Gm-Message-State: AO0yUKV/c3ssHozzKg8NcBUBehAe7oWwEQm8/Cto1DWA6YhZO+0v6sF3
 9HYRpToFLxyOp1ia/XZXPdttrg==
X-Google-Smtp-Source: AK7set/G2qSAPu1td2qXzQRoAkuNasa5x9UjbON2kEPPcUypXYOcamsdh0ckLQvxWR4t6HSFwazoRA==
X-Received: by 2002:adf:fb82:0:b0:2c5:5331:5516 with SMTP id
 a2-20020adffb82000000b002c553315516mr1524578wrr.51.1676369229028; 
 Tue, 14 Feb 2023 02:07:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z15-20020adfe54f000000b002c5694aef92sm558760wrm.21.2023.02.14.02.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 02:07:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 356EB1FFB7;
 Tue, 14 Feb 2023 10:07:08 +0000 (GMT)
References: <20230208103046.618154-1-thuth@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH] cirrus.yml: Improve the windows_msys2_task
Date: Tue, 14 Feb 2023 10:07:03 +0000
In-reply-to: <20230208103046.618154-1-thuth@redhat.com>
Message-ID: <87zg9ga7cj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> There's no need to run a full-blown bash just to create a directory.
> And we can skip the "cd build" each time by doing it once at the
> beginning.
>
> Additionally, let's exclude some targets (that we already compile-test
> with MinGW in the gitlab jobs) from the build, since the build time of
> this task is very long already (between 80 and 90 minutes).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

