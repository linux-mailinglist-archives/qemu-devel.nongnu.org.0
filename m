Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050CC6A40B0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:32:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbk0-00025C-Bv; Mon, 27 Feb 2023 06:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbjy-00024W-1R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:32:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbjw-0004jv-BG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:32:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id p26so3998631wmc.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUZiNk80LUx2b1NC8eg5iFNLBJ7RTzDNlUqCy25pmJE=;
 b=OKt+76QculEpn2YOTVxzdPqR+rPXC1pELcFCp5pk1qFWLD0GC388Bvg+OHKnuBgmO/
 X9YAeIvhIrzR3MOyWzaNXnkBjXrEueiLf/YPqESyvwWsJuHBXG6g7PlChXl5wDQVZFWo
 c60RA47aB1UObJupDyBkjt204wbxXWYfWeMgOO39xp2bxaHMZhIHP7GFWNRDwz3oGwl9
 jFL91lOPoaAKcXwlBQpnj4G/dK2mtsAoEt1RcfIitmyQVnHI1aUtcV3MeQTUqpGrBqOb
 N30MvsL+2ADrPXUY4Zw4j/lOgvwHuMjWRlESEAiBA8m3r1Pfj6hNaMQ+SbaEzgWO6SaW
 11oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IUZiNk80LUx2b1NC8eg5iFNLBJ7RTzDNlUqCy25pmJE=;
 b=iOfzOxtuHhzbhw5GoTqaARFaQT3IMB8RZbu+3J+6AJuh2he33UAEiuZZKj11MfNUX+
 Ib+1pI+PHx2hR9s2jqlsypIvDTQKrwZLdLtHM8hHL18heGiwkKnn8a+R3vQaebJYwJRG
 sx2weilwwxCbljNwqrFnEh1Puv8cfZTsQwTJIjOLJlcQUtOj2BGRPWZPB+3mSsY+sMcU
 nAOemKy66rUuvULbQ3gcI1JyIhxxzcYrhNrIpe8NHJrc+D75/CstAxUQvSb68DMsCWVc
 PCJT+DAwh0kPjLROt2EVD5t/P2FO+AeLn92W8xxYY7htpZD6ATKHxsEK0X5/huCvaoeo
 P0Dg==
X-Gm-Message-State: AO0yUKVZgHx9rVN/woU9UA24GFubfO2nPLLVj7MfjOE+t1js7OmzuUVz
 doXXEUdEpPt1dLaLGLgSlSgn2A==
X-Google-Smtp-Source: AK7set/rgSGpp29EZ9mQusPE4L7/se3ZiNTNdk+BHp7ht8ELFmHiChC5x4feX9G5NsqIRG+29822Jw==
X-Received: by 2002:a05:600c:3acc:b0:3de:a525:1d05 with SMTP id
 d12-20020a05600c3acc00b003dea5251d05mr6780350wms.8.1677497536994; 
 Mon, 27 Feb 2023 03:32:16 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c502100b003e8dc7a03basm12813437wmr.41.2023.02.27.03.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:32:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36CC31FFB7;
 Mon, 27 Feb 2023 11:32:16 +0000 (GMT)
References: <20230223191343.1064274-1-thuth@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel P Berrange <berrange@redhat.com>
Subject: Re: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Date: Mon, 27 Feb 2023 11:32:11 +0000
In-reply-to: <20230223191343.1064274-1-thuth@redhat.com>
Message-ID: <87a60zibsv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> When handling pull requests in the staging branch, it often happens
> that one of the job fails due to a problem, so that the pull request
> can't be merged. Peter/Richard/Stefan then informs the sender of the
> pull request and continues by pushing the next pending pull request
> from another subsystem maintainer. Now the problem is that there might
> still be lots of other running jobs in the pipeline of the first pull
> request, eating up precious CI minutes though the pipeline is not
> needed anymore. We can avoid this by marking the jobs as "interruptible".
> With this setting, the jobs from previous pipelines are automatically
> terminated when pushing a new one. If someone does not like this auto-
> matic termination, it can still be disabled in the settings of the
> repository. See this URL for details:
>
>  https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

