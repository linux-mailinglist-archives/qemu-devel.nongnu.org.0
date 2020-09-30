Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD027E6BE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 12:35:30 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNZSL-0005nk-OB
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 06:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNZQb-0004Aw-7D
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 06:33:42 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNZQU-0007X6-4b
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 06:33:40 -0400
Received: by mail-ej1-x629.google.com with SMTP id lo4so2020688ejb.8
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=i05iHsypczvHuk9kq07V8NS2boXN6nDY9vAkChLdbQg=;
 b=m+0iyfTIzr9bI83PKpMTwPHdhaM0pZQFftwLsuwzSyMii0z8EjZsk6z1LZjZxOu+43
 pG73WdS+qztKD+PslL5GjV9Hq4utEiE9751iCqkjYxCOvU89vOYcok0Oco25qPgMohkV
 PDjclBFPNSydJvyL2wMRP7nD2CpzOIkn5C7m7Swf1psRMJCB1W5fLD+v3f0FPRqyGyP2
 wPPhTpFjPkQASxezcyrsvSr43BhCb4bJG+arPssjuJ4fVh7G+MxanIMiv5SLJmBaGjCv
 fvu+WgM891s6zAq41pM95CDwwjljkLFbQCSPmdZMLfVhcZMKQTaXWs+L+b9//tg2qI8A
 6Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=i05iHsypczvHuk9kq07V8NS2boXN6nDY9vAkChLdbQg=;
 b=kSczGNAvHjt4U+GY5CoMBFG2BNTJ4A3xP5x9pmtP/C683yXgEp+4fQ+R0dJHbMlXdR
 XAnf8A3SMnxEsne2bQywDjOzqI9CmtADQcABRBp0j9HsFc+t1iPNfpupNWL/4CVnz6UZ
 z7MZuHynfiCUwXV01joiDtVA6Ol3JYgeCQcQ7wt12XnE2bFphosCJN5KfGWPQXyKz26K
 k4vA4bFDZVe95YdA+H5B/4/5OYk/p9HE/BdjU4p0JnWJwDGmfqk+bzx6D8t1C80S3ZjC
 LmWE9xVD6Me5eORf7Coo6cFzBBOZ29fKIicll/epR63N/4w+OLepL9IWVMM5mvpnVHy6
 8v/w==
X-Gm-Message-State: AOAM533jvWS0BfOL58F9eG8XFjxAR0LKq6Y+0t5FMGiadXahcXAb+JFj
 hWL8toYvFl/zXpwaBgQe2v+szErZ2oWXxA8zD6peOEmnQ1QnYJVV
X-Google-Smtp-Source: ABdhPJxbOW/JZ+P9lp9nz4LVHF3LhO3C1RR1csoDgtchzkRThAExueByv2ScBuHBOYztO2P4nao7ixO3gtc0xIVEF0Y=
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr2135807ejb.4.1601462011882; 
 Wed, 30 Sep 2020 03:33:31 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Sep 2020 11:33:21 +0100
Message-ID: <CAFEAcA-wMzZhO-9EdYhPC3aoPatQ-JEtBJ2nSjGepRbLs-5AdA@mail.gmail.com>
Subject: use of 'apt' in scripting in our dockerfiles provokes warnings
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While processing a recent pullreq which updated the dockerfile
dependencies and thus provoked a rebuild, I noticed that we
use the 'apt' command in ways that provoke a warning:

#7 0.789 WARNING: apt does not have a stable CLI interface. Use with
caution in scripts.

The apt(8) manpage says:

SCRIPT USAGE AND DIFFERENCES FROM OTHER APT TOOLS
       The apt(8) commandline is designed as an end-user tool and it may
       change behavior between versions. While it tries not to break backward
       compatibility this is not guaranteed either if a change seems
       beneficial for interactive use.

       All features of apt(8) are available in dedicated APT tools like apt-
       get(8) and apt-cache(8) as well.  apt(8) just changes the default value
       of some options (see apt.conf(5) and specifically the Binary scope). So
       you should prefer using these commands (potentially with some
       additional options enabled) in your scripts as they keep backward
       compatibility as much as possible.

That suggests that we should probably be using apt-get instead
of apt in our dockerfiles...

Also, any idea what this error is about?

#4 importing cache manifest from registry.gitlab.com/qemu-project/qemu/qemu...
#4       digest:
sha256:815fb44b573ac7520d148d9b2510c00f31846ca6fa55127d322bc8db3c5d0ec0
#4         name: "importing cache manifest from
registry.gitlab.com/qemu-project/qemu/qemu/debian-alpha-cross:latest"
#4      started: 2020-09-29 22:57:54.371490684 +0000 UTC
#4    completed: 2020-09-29 22:57:55.064468936 +0000 UTC
#4     duration: 692.978252ms
#4        error: "invalid build cache from
{MediaType:application/vnd.docker.distribution.manifest.v2+json
Digest:sha256:a1e8a5830bb19b7cddda64872c5d71a0337d4b98bed30fd7684d20467adcd289
Size:1161 URLs:[] Annotations:map[] Platform:<nil>}"

It didn't seemt to have an adverse effect...

thanks
-- PMM

