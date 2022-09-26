Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87CD5EAB7A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:45:35 +0200 (CEST)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqIW-0002Mu-RU
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocq1R-0002EK-Br
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:27:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocq1P-0005Da-Mb
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:27:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id y5so10801553wrh.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=1SdpDugj/Pzf4rd9A2zZ0DQAEx+nCDh6IBBF1crszag=;
 b=mkqxQiwQQff6OWx5vNPYXJU9RXiL4jRByJH9hs6pCdCQyY20asSl7XR3TJYqB2IAdF
 f5RAIszBAqMXYCsPQotHSB9l8cUVYDP6bt2jM8B0m+WF8OacE/lW5xb0+H/lmpfepIyU
 qHKdbXyekHdb3Bjm9xuqGS9qIwxZdHb7Vw8H9lZC79wvys6rGkf90puMbTl+16tZnbUg
 8PZlo0N1u5c8edmpmqicDsBSEL0oQlm6F/wk4xu+UwTM/Vxxx+xIlaTlXpDcWj9Wo1k0
 9/0C4YNURXsD0w81T1XPnhkP+TcClhbrVGtvXhmnOfw4W59gh3557GmP0gJBT9LRPLBV
 67Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=1SdpDugj/Pzf4rd9A2zZ0DQAEx+nCDh6IBBF1crszag=;
 b=vuyZbS/OA7WNx7V5LrsBN0IpTUTG5az/CXFfNOnVQJkuq26hl43gcXGj1sc/AgDKFG
 tYwbSf2cHXPYKe8W54a/wL511QSnm+OoFZiAzfRNAJ5x+c1d2B5eXAij6OB+VEyIsqlR
 aryp74hniIaDFt+HVEVyOoiS+ArpttfTa9hfiThPSb7cg5i3qwgI7YNPEMxtNReDEA1M
 qQ8RhiX4K0JYxg3AHq/GnS113GjhLqSB9qm9pexGePStuoFp6pOT6nOYUS8cJXb85sUb
 Mofqd1q0DPD3XSY+W/D5ohhuwyBaUgwstrW3ZoFe0GDLnuKfvSghbpzol125TZvdpuuv
 GMhQ==
X-Gm-Message-State: ACrzQf3kSMM5VIOluW0g9vWxeycBQ/cYUisYBdKFM6Ntn5ybTxXMXxoE
 N8rHRiee4DYnBpDabrIol9K0XJtxzBt6gQ==
X-Google-Smtp-Source: AMsMyM7ZoGC2AXc97KAQzSmKichhbeBQro+SxQ1a+RnwPVajQy8bameltBBgJ4AUNVXAbO0z+9gDtg==
X-Received: by 2002:a5d:4a48:0:b0:22a:e55d:535d with SMTP id
 v8-20020a5d4a48000000b0022ae55d535dmr13774074wrs.308.1664206069694; 
 Mon, 26 Sep 2022 08:27:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e6-20020adff346000000b0022a53fe201fsm6782423wrp.68.2022.09.26.08.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:27:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95BD91FFB7;
 Mon, 26 Sep 2022 16:27:48 +0100 (BST)
References: <20220825222745.38779-1-pbonzini@redhat.com>
 <20220825222745.38779-3-pbonzini@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 02/20] pc-bios/optionrom: detect CC options just once
Date: Mon, 26 Sep 2022 16:27:44 +0100
In-reply-to: <20220825222745.38779-3-pbonzini@redhat.com>
Message-ID: <878rm640ln.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> In preparation for adding Docker container support, detect compiler optio=
ns
> just once rather than once per Make run; container startup overhead is
> substantial and doing the detection just once makes things faster.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

