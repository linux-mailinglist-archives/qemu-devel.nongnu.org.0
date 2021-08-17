Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477753EE9AC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:24:41 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvKq-0000n4-A9
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvJX-0008G0-KM; Tue, 17 Aug 2021 05:23:19 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:53648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvJW-0002GA-3J; Tue, 17 Aug 2021 05:23:19 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 14876C6019D;
 Tue, 17 Aug 2021 11:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xqOZ5KjLu1SLi4bTsqS+vwUAGZg1qKAO7qI48+vtFok=;
 b=Mb066doQkd8ChP2ZyOSStFlWt2CSeKFN8MISloR+SAmySf/WuitGaEL+oPQy2DSuAyGw7F
 DemhYC4wR3AMafC1Vy4u+m5Sk7SCAZUGDGvWxu+6faEHY2etrCEgJRoKmzaTKX3S09nD2t
 m78s8RAXOjHR65MSwW6FD0JxCmfAbNfU0a2wve02ZC4A+qN72rVtxxRxuyxj1oVn8OgCpl
 p2eUB7gyrhYjvctwq1MaUEEMiG3kfuRWLLyfAI+PcKitpAQsGDWc3HmD4xh3McaEsddY3L
 bekL2+Tzu9GLKsHXQJxaA0lXI7Mt0lpeoME9MCd2lCxkfXWzVNJAfUHqG9ufgQ==
Date: Tue, 17 Aug 2021 11:25:28 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 03/25] arm: Move system PPB container handling to
 armv7m
Message-ID: <20210817092528.hj4ibea7rgfd4x5q@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> @@ -309,13 +347,73 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "NMI");
>  
> +    /*
> +     * We map various devices into the continer MR at their architected
s/continer/container

Reviewed-by: Luc Michel <luc@lmichel.fr>


