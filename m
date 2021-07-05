Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45623BBCD3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:24:03 +0200 (CEST)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ndq-0006Yd-W2
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NaT-0003h1-O9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NaN-0001zA-MG
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id t6so11931940wrm.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vhTYcA0DHzhRubP3wwWTxRAwzfuVCKyUoUseEbpOmyM=;
 b=MCWLaVMRW9iOOH0b0nZvXkOug6IWNwFO+h0NrmzvZzKaGH8yxCRKuUzhSnHl6QRvoq
 VE9IR/i3fsWtD9Vv6S40KIyEpsjlXoJQyr8Gw6cpwSkbnUg5c9nwW0LhoU/fwsJDZHMb
 fE5jA18u9wf3A+HAlT1pFPRjFwe3OAU9hbyuFFTq00r+zCyiFfw/ODD26lxODRc8Sqh9
 lJBQ/w7BBMSNZTmf/1rb9jaRfv184xpjoEbwCss3rOYHvrcQwCaBDZp1TTxFbv5ZO7xd
 szF096R38NUhTlc/8iEqlrKKQUy2hwmkKsPw6wRVtc28Xt71VX+9t12b0+bORvLRvrA5
 GvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vhTYcA0DHzhRubP3wwWTxRAwzfuVCKyUoUseEbpOmyM=;
 b=cOjtI4HsRvoRR7RnEwU9miCXRG4hnnc60bs0gc6mVjTtNKcVx11spgWfMWz52bWdHZ
 6inoQF35ICecV2OJJQBRn/5CmV+u9UNYBKMh1hBtawpNgaD6JehmRM8TlBnxOTDDmNjE
 3Ajm6VTloI+lYZMgWKdj96RgaCTbpjv80Xw/uXSPR7RWzGH0s6YSo+Z6dOOtdyyg4aq3
 GKwpzzcCAUE3yu72b1I1wN8pLuVP2tDidCpd7ru4Zik1bJooN55V9UtBxzhIwh6Hkm2j
 vbjXewLB/DnE+VEwWdAU+Wkgp4Q1QedQKe6tMdRRW67vEPaErV60GHGZ+pFmtiZlu0fN
 IfEg==
X-Gm-Message-State: AOAM532sikVu9hR5CDYXbufE10Va26Hm5MwMv+EZ3GnCUqiUHrpDkqGG
 nU+ZH+N50cBP770P+/Ou1j7DHwxIB3VPJQ==
X-Google-Smtp-Source: ABdhPJw5grStvaTYjyM9o7tth2dTaGwywLxqKQyuBvQCedmuCbdRyhh/yxVhJ+b27D7zJUlJ8kmyuA==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr15573605wrv.234.1625487621676; 
 Mon, 05 Jul 2021 05:20:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm12998119wrr.4.2021.07.05.05.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16D751FF7E;
 Mon,  5 Jul 2021 13:20:20 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-6-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 05/22] tests/docker: remove FEATURES env var from
 templates
Date: Mon, 05 Jul 2021 13:20:15 +0100
In-reply-to: <20210623142245.307776-6-berrange@redhat.com>
Message-ID: <87y2al3qbf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> In preparation for switching to auto-generated dockerfiles, remove the
> FEATURES env variable. The equivalent functionality can be achieved in
> most cases by just looking for existance of a binary.
>
> The cases which don't correspond to binaries are simply dropped because
> configure/meson will probe for any requested feature anyway.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

