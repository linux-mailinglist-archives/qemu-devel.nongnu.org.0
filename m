Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F23557D52
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:54:09 +0200 (CEST)
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NHc-000574-3w
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o4NG3-0002Vc-F1
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:52:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o4NG1-0001KY-VN
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:52:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i10so24305424wrc.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1X9lbKKIV9qycrXRpNydQ+hZtRjdEcBHpnSHAhTustc=;
 b=Q8wLdsGGO2EMGYwRe1qx9L+Id/qeH5FGsNpDqssmOAVha+fiBs8gU15mzwp99iHf3q
 POCKEFtPz9KVHJhzxKH/HhM/1fXiknbk+U23hgE/upekiyWIg6RIq9ieJjrFkznBfLl7
 kWxfSUzP2FIWpewjxG5dF2FJdWSb8fBOcTgdUNgQu5N0RMq98vclEOSuYQQSD/n2m6EO
 GvG76m8q47B5zc6aKTjN9AQ79Z2mKMrKztuOAcpPVkr0H8xu5ETRuxswK9KXrHzeEIFa
 HfjENT5CZl8ih1nw44Oj0gQA9aPwUSNF+otJHjcagPq24kR5XfdSbhtZCsLMKGhE5hM3
 79pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1X9lbKKIV9qycrXRpNydQ+hZtRjdEcBHpnSHAhTustc=;
 b=qQz2zSSEw2+RKZ/iANP+hrKAtuMibfgyT/wuJKxVNLOp9lNp8zsYb1m4U4FSF61tqp
 rPyNEiN1Ug3Wv9mbWt+5FzWRMKPnjb3PfV0nLyaiiN/Pfc4YRFDXjlVCy6CP2drro60S
 BGX/N2VMJJfgaqF102AGRU5BP86JZfvacxUS3BkNUFOaskYAJau+yvQX7/Uv744Zpgka
 txcgTH8TGmA5UQM5+Fiy+WGu6aIzk8SB5A0pAS8QqMxhM8awOvnqdyMISoyzHhqFhiiM
 TdGvSjchNXIPLuP1alwEpjFHEfOhsLU9teI5333rSG0tT9am622hu6fgHJYMgCyKQ94Q
 JAaA==
X-Gm-Message-State: AJIora9wJwNmzRgFbrqiXUVp2vQXc652ZVuT36glhXYDIrWDM78LbZi9
 coPtEKbZym0J9PDIwCKSmOcyzA==
X-Google-Smtp-Source: AGRyM1s1YMX1GREKjHaIpDGqwB6jmYus7bPtupyPY19Kc6pNGoYQY2OMTwz4NdaQOxFdEYiwc0jUJg==
X-Received: by 2002:adf:ebc4:0:b0:21b:815b:d135 with SMTP id
 v4-20020adfebc4000000b0021b815bd135mr8145392wrn.653.1655992348613; 
 Thu, 23 Jun 2022 06:52:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0039748be12dbsm3470135wmq.47.2022.06.23.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 06:52:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E271E1FFB7;
 Thu, 23 Jun 2022 14:52:26 +0100 (BST)
References: <20220623131017.670589-1-drjones@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 thuth@redhat.com, alexandru.elisei@arm.com, andre.przywara@arm.com,
 nikos.nikoleris@arm.com, ricarkol@google.com, seanjc@google.com,
 maz@kernel.org, peter.maydell@linaro.org
Subject: Re: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
Date: Thu, 23 Jun 2022 14:52:22 +0100
In-reply-to: <20220623131017.670589-1-drjones@redhat.com>
Message-ID: <87pmizpjvp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Andrew Jones <drjones@redhat.com> writes:

> As a side effect of leaving Red Hat I won't be able to use my Red Hat
> email address anymore. I'm also changing the name of my gitlab group.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

