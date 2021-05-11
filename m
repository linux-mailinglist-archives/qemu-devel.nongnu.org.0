Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36E37A967
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:34:08 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTSZ-000893-KV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgTJz-0004Rw-VR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:25:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgTJw-0001hf-Ua
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:25:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1293947wmc.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wHObbk/ClBAi6Bkch/47MGFLld7klRZQYAYOJADUb4c=;
 b=Fq4yrC8g3vfd5qWh3flDXJ6xLCHgZENjY3zgS/lwSUNxsmSq7nIzTtJUqQBkX5lrWI
 +WWAkjWyIuxhHVRok6395F1FZH0kIo7cl0YghxT1B90dA21azF+7iL1bHaAgUrgkf8m2
 FJT35nxvp9x3wsY5I3KypZqEfsx72A2t87dO62jbYJKL/Op/vuszkwdAkP5FCSWqcb+z
 rj2eik1wZmmzjgQJFd2sW+phDlJQg6C7nAAU/hr/7VJRp/nnYfZzrz2CVmkwOuQ+VIlZ
 1RbeyAd0HfWjk+sJU0bJUU+hsqysBkMd4842++IZib1DGEbjrj1vyuCwXhQjIYBTNKO1
 RaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wHObbk/ClBAi6Bkch/47MGFLld7klRZQYAYOJADUb4c=;
 b=hkOtwQQLOnLnshUSWCdxEA/HMicOsDpQNMGHJWfo0HqNgQQr9w9zC4IG65F8bQwFBT
 /5FH5tYHMVAXg/QrKysTkDsubw7ijhv/vK6quSWMSpKrWZGexc2viPgqtWpSp6trovfE
 P1X8cblfsAa0aY2zm3Fmc3q29GFAjk3ObXZIOa6iXp5+pKYw76u7Dq3Du1/xsNOqOLb8
 Pbbb8TkP28Rsdh5yLwjlHeqdr4Es4spNepw2eYq6eBdAT0HsnSWRURKHCvrNxGnjhgqL
 2xeKJnULy6FRR6Rkh0HYAxWITkc/5rEFw2a19aGX7ICmekiPzzkCyC8icVBk/wT3IuzL
 cmUQ==
X-Gm-Message-State: AOAM530Ga+hF6uRy/rl9FLjCO/rwr+8Bn6dXlFHbTbB2fKkoP1saZJED
 L/Ta5CmSE1pdH9LfWCDz6i4C8Q==
X-Google-Smtp-Source: ABdhPJzJUg+7DNoL2q8FsaRrsUoD3DJTYUx7adOHF/RT6Y2m117JB15UgpETUOK2BmtJYD4XbPWnSw==
X-Received: by 2002:a05:600c:354b:: with SMTP id
 i11mr1831692wmq.102.1620743111270; 
 Tue, 11 May 2021 07:25:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m5sm13931583wrs.76.2021.05.11.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:25:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67C511FF7E;
 Tue, 11 May 2021 15:25:09 +0100 (BST)
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-10-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 09/12] tests/docker: drop CentOS 7 container
Date: Tue, 11 May 2021 15:25:03 +0100
In-reply-to: <20210511132641.1022161-10-berrange@redhat.com>
Message-ID: <874kf9gxfe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

