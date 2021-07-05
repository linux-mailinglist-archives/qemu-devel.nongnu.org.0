Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1FE3BBD9D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:41:51 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Or8-0001QE-Fs
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Opc-0000b4-Pq
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:40:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OpZ-0000tL-Hk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:40:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id t6so12223663wrm.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sdFND3cLqbnhzfau7+CurpxiyEZcrqY96/9/rPslg8k=;
 b=RBCh4hC4DJkEg81n7XNMQKleL+TlLuGzdNQbZ2EHPsvvzN5hVVXsNhjwMo0Aoaugkq
 YD3Y3MhUuWkhjLEfV61tJazr04rb2y5Y2pUbvPxuu5r6RtawNU77T8EMKqQ7OQIaq1OV
 Zg/ZlEK+L/gOWNkRAWIKMXrPVNIqJkqbAkUgleQCIJ63usMGsVVsYMewln0a7+Qavy+x
 hLcWVA8pC5M7DISOyaPzQI7QeQvnaetWsnalLip0Pm3Nse/i3EGy5anwjJWLFBJbp8PA
 V5IA7x+ewFd+KpC9n8jJN/shUTCx3A4nEA+TrhtZbh9r6gG5R7k2PN8BgfPx6DA9didb
 WUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sdFND3cLqbnhzfau7+CurpxiyEZcrqY96/9/rPslg8k=;
 b=W1rzwKJBEt5t5bUEqf/tMLD+X2N5exMXHAgR2WdkYjJTDJY5RjAWJeWfvJX3WkYhfl
 y909RwFEU1uHX/UEsDI6dlduqLrRiaM80gaPB4o8b9hrLtDAy6xYNGnwOpWWhpXROguB
 Ws4puWV/HvY5aobXHcc2UWHENpzzwYlHXdauTWDgIy6JHBMK2uetSslpvR1blNVnAs9L
 0cRuFFChuuC3Z2X7iOxYY0Lj62ezQ5W2sGSarQtQJ8mEv/6qiGSCukCDGpntvVV8bNw0
 k7Ds4oJeYA3po6NMv8JXEO3/aTh58U7GYKd/cINv5olijApLk9C2gSQokNWqSX3I2rdP
 FnpA==
X-Gm-Message-State: AOAM530/aZ0kWwCpnXe/iXpuLbXiY/sDxg03wpxzFyaLRgvPndo7MTwC
 14zoiYouFLdM0e81OPrwlLAn/Q==
X-Google-Smtp-Source: ABdhPJxJ/JuDe9Ps81kn7mzmqRgLTPZtEIpBjgUUORlW3mI5i2RoPYaeJbOqJu3Jqm7Ty+pri7Xebw==
X-Received: by 2002:adf:ec10:: with SMTP id x16mr15722174wrn.74.1625492410615; 
 Mon, 05 Jul 2021 06:40:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y8sm13066192wrr.76.2021.07.05.06.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:40:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C63A1FF7E;
 Mon,  5 Jul 2021 14:40:09 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-10-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 09/22] tests/docker: fix mistakes in ubuntu package
 lists
Date: Mon, 05 Jul 2021 14:40:01 +0100
In-reply-to: <20210623142245.307776-10-berrange@redhat.com>
Message-ID: <87h7h8516u.fsf@linaro.org>
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

> librados-dev is not required by QEMU directly, only librbd-dev.
>
> glusterfs-common is not directly needed by QEMU.
>
> QEMU uses ncursesw only on non-Windows hosts.
>
> The clang package is clang 10.
>
> flex and bison are not required by QEMU.
>
> Standardize on nmap ncat implementation to match Fedora/CentOS.
>
> Remove vim since it is not a build pre-requisite and no other containers
> include it.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

