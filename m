Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8729539FC15
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:10:37 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqeJG-0001nB-A2
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqeF4-0005Mn-6g
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:06:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqeF0-0002bX-7t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:06:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id a11so20308894wrt.13
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+2PC8y9S9HTNub/NDLAjpO3Tem4IYjHJHLFukiO8ktM=;
 b=SqwjasrTO92yWXaenm/xy5KytAn+/y8U4Onj0QeBwdErqUPkzWmNLxvCPddVNOpP3f
 4ndUBDH6kc/IMQc7AL5cm+m8Zk4L1ihXYKY3zOwCQqlPTuz2/kX+RtgLLulicBKkc800
 uf/2KxgMgfs4Zug+bKaQsR4KMtECCar45HR25hdvR0DPFIcynQDT41uD+t7oDnaN8jCu
 qWOX4Xl7pnMpkd7TwhvYvmUSp/Y4SU/GIEGzz/NO1r1VmmdNHxH8w7xndeUbw7EJphog
 qldr/U79YSwtVsIeyouUW3A0RQJ5ofFPH7XYOWeAjxjcz/dIs5LpOl3CKaqCxI0Tn/vx
 dZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+2PC8y9S9HTNub/NDLAjpO3Tem4IYjHJHLFukiO8ktM=;
 b=rYXlRrsvucUC3xODkCgogz/jvg1L0ZPNRVURRgrl/mqVOPZAXrQ590/XBUAeJBmYL+
 z8M0slkJjMOuc4ygqwWwggb3qvfPKmJmvYfcpnuLPTTe2/IeojfDYd5krbx4NwGGJjUF
 P/Zq7HuLQeibtZ3wcdmlUH+N9f2nm4FOdhrsq7/t+QIDFNVS4QuHpsWCsrT0Ei2xmU4n
 QfZMCyhzvaFJqBE4eXnVdfcVWdrFnTb7Ko07EvmEolAdWeV9QhxreEGbqKwOJZOYD3+2
 gsegns9gVEZYiOlnQEU0wjpgCpzqCbDTbQX/HCgKq9Wo3mt9nKJy++cTjWFhYH+4lEP6
 NJfQ==
X-Gm-Message-State: AOAM532OalnOs0+EizWOypaZRpOasU09yV2eTOhabc2rcyrjeVaZNDT2
 aQgJRQh7+/1d1MCSqrIOM8QW9Q==
X-Google-Smtp-Source: ABdhPJyUSxt6vY/Mjh2ZC/7ObyE1HACL/+J6ZtJwsde5aAQE1WH2E/MXgJgxlzf1kXwwlKrijJdXkw==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr23778521wrr.26.1623168368653; 
 Tue, 08 Jun 2021 09:06:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k42sm4082687wms.0.2021.06.08.09.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 09:06:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AECB1FF7E;
 Tue,  8 Jun 2021 17:06:07 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-18-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 17/28] tcg: Rename region.start to region.after_prologue
Date: Tue, 08 Jun 2021 17:06:00 +0100
In-reply-to: <20210502231844.1977630-18-richard.henderson@linaro.org>
Message-ID: <87y2bkjq8g.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Give the field a name reflecting its actual meaning.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

