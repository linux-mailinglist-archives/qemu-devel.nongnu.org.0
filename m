Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C68C3CD691
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:25:20 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UCt-00089a-La
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UBm-0007Tg-Ko
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:24:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UBl-0005nY-74
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:24:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so95649wms.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ag0aKItzvnJbk4Zpqd4k4wGjov9sGMgqtpJs9+i/5Ik=;
 b=KDLaRVg4vL5/YFiAG+0TF8gYOIKcwPtdVFHFXzVJaUZVS6HmI/DUGiGX54X2dfv4YX
 kYo79NamH+U6UfmpVa7mA8bKYKbDOFLeihTVCEweI8NM4WcGEXpAADFlec7v3DqRUHXK
 k6MHIWwWYmcZoJwhHdPT/+VY9jLUwGRFPmq2Jo1sYuW+vRk041rr5WrBn0QsMk5vvoWy
 L9rqdVJyVS24OaG/0eGb8AM0WZPxYwu/lEH0jKvMkQ+uOoNy99oQLLuOE2mWcWyUKbCG
 Zg7ejOvI/U5qnBphzEtKgspIWD1sd9TcR0BTCojbix4fn/JXVqaLRhHuYSZ2djELqwD7
 fPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ag0aKItzvnJbk4Zpqd4k4wGjov9sGMgqtpJs9+i/5Ik=;
 b=nTOAQeLASy3FdPOz54CDQ99wHg7G8YYZr8LFFXYGHBuYTnwSOiHdjHS8vmb5/Y/2yj
 cYAubPm5DOuyZUZRh3RHl1gG2gX72MtsSm5jfa/wltX2WjhnY+3QE5ZQJ05Qn5PUp/kN
 wy6Escz8WQtLHhbjNOj5BNQ5H9fWCaB2CAjmT3ToReF8ccquPNCuBXEjsU22koHLk7nR
 BmQojk/5+X9vc9CpbkM2MN7Yj/H8JjImvR3HTrDGxTtVjlzD7Mv26WjrW1fRyrWbzLN5
 9ERqQ4ZgkCjE5WL9PqT75dR6/WTnOMQ+DXniwAOlMJN722qbTeW7UmlIp8kSQp6vgbhp
 6CNA==
X-Gm-Message-State: AOAM533/UUC7IUgWb7zHJ61nQ0yT3UhmagtoXZRLLFvsqyLblHPMaWO6
 PslilnEUMuatsqDgZxN1HtANBg==
X-Google-Smtp-Source: ABdhPJwMm70ZW+9oxu8f3FER5DSkcg7x8lk3DSLBzUeN6DHkpprFvZ7/Bh1Ykj7PIkrodtIk3qGVYQ==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr33022756wma.185.1626704647634; 
 Mon, 19 Jul 2021 07:24:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y197sm19809914wmc.7.2021.07.19.07.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:24:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C16701FF7E;
 Mon, 19 Jul 2021 15:24:05 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-4-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 03/13] plugins/hotpages: introduce sortby arg and parsed
 bool args correctly
Date: Mon, 19 Jul 2021 15:23:41 +0100
In-reply-to: <20210717100920.240793-4-ma.mandourr@gmail.com>
Message-ID: <87czrepeka.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> Since plugin arguments now expect boolean arguments, a plugin argument
> name "sortby" now expects a value of "read", "write", or "address".
>
> "io" arg is now expected to be passed as a full-form boolean parameter,
> i.e. "io=3Don|true|yes|off|false|no"

It would be nice to expand the tcg-plugins.rst in this commit while we
are at it but otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

