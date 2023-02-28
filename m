Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921226A61A9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7jR-0003sI-GY; Tue, 28 Feb 2023 16:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX7jD-0003pD-Rk
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:41:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX7j8-0001Ih-ND
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:41:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so11278522wrb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677620496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NidVbJgV9MGiy8ABUJQGsBok5ojQzwtzR+nMwcr3V+4=;
 b=kUOx0V7n/WurvEBGCTPomRDf68gIJ3ljzHpD3M8lEyw+UPSXnxROtKyMEox5lmv42R
 Q2Zu6Cc3pJINArjmJ7xNgVb5Tg+xisNbh+2ZJkNBV6yD62RpbkSq3Im138z/zOv1Dk3u
 eizkBNy8hrOhZNIynqw6Z1TOnCn3+Tz7WhvHKKvMDm/SPYG8HynYrIYHtSW4+64BMzM3
 gRKdTF9kvXSjnbL9DZ+Lv7rjU/uCWbbIEa3hRSSlxNEQmDaCSDRo9PQQeMHHWcPAeGNB
 DKuBZG+zvlBR/VhVpSZRz46RViclywTbLiafm00e9TQ/810u07q0F63rzWh+XQwVBPQm
 LkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677620496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NidVbJgV9MGiy8ABUJQGsBok5ojQzwtzR+nMwcr3V+4=;
 b=YtNZ0ixp78nupIA/PBkaRtidx55C5VIaA60ZL3ArPUpygyAjZDzfSd6hkhXBSN/yUE
 wmhXJ1jETN5dk/F2e+pITgEEfPSlVm15TzTEBPGsOO/4VkhrjcI82GPdgG/HLXDIVVVg
 QrssCeO/wX0HrBR8C76L9vBtRxSDYhG4IQX/Uiz0II9RR6lQMk/mvAwJt+rKYmQ/UA6Z
 8UIWOSpeqfzJ1Wu8ZLxic9hUQnecnL0V/6/9qQi/2QFZo+Fm6mLmaWmKmjFcOO9jUPRU
 7hdMTnap2C4i2cV5CGCByNWuLgPSSaP4RBkhAi1jHsyMv/cYi4KLAyKBc7i71LE78dsW
 3bew==
X-Gm-Message-State: AO0yUKUuGZOmSq+xUdriqcADuPzWJCTmNdL9Pm2jQHEcUeT53n3M5XTg
 AjtdJtOEovHY4jV0mP4F1OvmWg==
X-Google-Smtp-Source: AK7set/1+agqYzpk0teuYEGGX59iqHgnHhW+l2jxq4JRrO+pqWndOHxSQxV5frMwwhBiW0XZuEdkmQ==
X-Received: by 2002:adf:f4cb:0:b0:2bf:d940:29b6 with SMTP id
 h11-20020adff4cb000000b002bfd94029b6mr3842577wrp.54.1677620496435; 
 Tue, 28 Feb 2023 13:41:36 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b002c70f5627d5sm10605279wrn.63.2023.02.28.13.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 13:41:35 -0800 (PST)
Message-ID: <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
Date: Tue, 28 Feb 2023 22:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 28/2/23 20:06, Alex Bennée wrote:
> To avoid lots of copy and paste lets deal with artefacts in a
> template. This way we can filter out most of the pre-binary object and
> library files we no longer need as we have the final binaries.
> 
> build-system-alpine also saved .git-submodule-status so for simplicity
> we bring that into the template as well.
> 
> As an example the build-system-ubuntu artefacts before this patch
> where around 1.3 GB, after dropping the object files it comes to 970
> MB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>   2 files changed, 46 insertions(+), 51 deletions(-)

This is still kludging the fact that 'make check-qtest' rebuild
the world even if QEMU binaries are present. Still an improvement, so
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


