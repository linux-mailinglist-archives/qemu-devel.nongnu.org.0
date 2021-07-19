Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2123CD692
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:26:23 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UDu-0001Eb-80
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UCL-0008BS-Pu
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:24:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UCK-0006BF-1J
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:24:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p15-20020a05600c358fb0290245467f26a4so134283wmq.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=SP0bMk3x2fAuAUe9ulYOPmxuJmYeDXYLTrtg/sCGVuHMDT0NTZ+Ux3oWZcfRlQbYLu
 KVelJGo0osFEe1jgeZtUIrWawmJAu4NZfKdCC4+Q8fJTg6+iEz4jd81IwfD2rgHJ0n4Y
 qz9DQbVz20o1Wda+uRAu639/Dlv0rpUPR95ZSPCuB6uDW/hbecIm5tI7TQ2X28Bisj/x
 RvpSCSSQZ1v+zrrTry5KB3MqjoTQ8XObfJaIKNwDN7biNb7T+pV+GLg1S2FYlYIkg2B6
 2115F32KqNmG8S9wAKcz2SNDH4TTTjM9IN8ZSnsimiLc0mAdI6DT6U5+2dRbIfCuiSvA
 y9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=DjLTeHIGvSVA9ob4G0w+UvQ6uNwRL2i8qxsCz5IwSWc9tawSk9AwsQ+hKHAi3AB/nv
 vAiK56JcAUOO2aNrvLK2olYPT7pSUMO2hABSuRKCOj+Ckr8FfPfUvUlOT08tc8ROq5fB
 mrrBYIvdCjUw1KcaNZ1oIC3GUyDFfggGe+pv00P5n70PAcNpKMybYEUwLbs+qidb2xTT
 Zd0GjOyjgTWWpSxkob9NdPJKtjRp2k8WifZEPY5FK7Jn700M/CXP0t8xBfDt+vpU54qh
 e+gXUfzDXhV97W+Wi8Xi1/UZNw323gMucvhmj3jAXtXA5V47hDw2yd14qSQLkpoXEUUe
 7lCA==
X-Gm-Message-State: AOAM530oOxjIP+FRXA7fmm3c6HUT1yIoao034Efezk4Bk7u57nWJnbox
 pB3RD4EH1nt/QTXsB0CELeSf7g==
X-Google-Smtp-Source: ABdhPJy4L5kvfOvdC1w0jDTCzMZCHlW3uDybFSBocWgSbOojL+L0CJprWJpe8qgUMZGAzPjeI2jjjA==
X-Received: by 2002:a05:600c:cf:: with SMTP id
 u15mr32396974wmm.92.1626704682649; 
 Mon, 19 Jul 2021 07:24:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r16sm20063493wmg.11.2021.07.19.07.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:24:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 342741FF7E;
 Mon, 19 Jul 2021 15:24:41 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-5-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 04/13] plugins/hotblocks: Added correct boolean argument
 parsing
Date: Mon, 19 Jul 2021 15:24:37 +0100
In-reply-to: <20210717100920.240793-5-ma.mandourr@gmail.com>
Message-ID: <87a6mipeja.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

