Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3DE551F3B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:42:49 +0200 (CEST)
Received: from localhost ([::1]:42438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ic5-0003kn-0K
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IN4-0000ui-FO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:27:18 -0400
Received: from smtpout140.security-mail.net ([85.31.212.145]:12975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IN2-0001nh-Tf
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:27:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 5D579323778
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655735234;
 bh=qpBjYxIiEl4OT6H30PT7ttCAS8KxbCcmR4ZVgk/YX/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=R9GZpp8T+z0q3Kdmg5vlOwQfwfQW6nNxCD2Y+v5MRpQUN03f1VclVav8lUvak1MLf
 bxHKeAireW7mj9NBLeHZzuR2QvasUX9Ru7yphlSIMsMiIUoi5aRl/27pqr3Mcm5l2E
 qMEblLbBTcd32/Trv77a+i11YFjDsQSxU7wLq3Fc=
Received: from fx405 (localhost [127.0.0.1]) by fx405.security-mail.net
 (Postfix) with ESMTP id 94BB7323722; Mon, 20 Jun 2022 16:27:04 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id 85948323725; Mon, 20 Jun
 2022 16:27:03 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 5D85A27E04B5; Mon, 20 Jun 2022
 16:27:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 4781127E04D6; Mon, 20 Jun 2022 16:27:03 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 JZTl69dU15pD; Mon, 20 Jun 2022 16:27:03 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 2F12F27E04B5; Mon, 20 Jun 2022 16:27:03 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <18055.62b083b7.81967.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 4781127E04D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655735223;
 bh=v1vv82yFqYC2AoJa+HjqFV1sJIo0eRXubkr8Ew1UwB4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=U6v7fDM/ayZW5hHcoaSzb4LlwwnC+5A5YtN08KUtk/C98NVuQZL8PNooFAy3CWl8j
 FQ3xE8aPxrw0rUwkZujuKBup99OVJveSyzDjjR+QVkttYPDY6TIkdohO3THHTxzkGI
 wYS+k1tBIgiEMAg0ZorbW7nPsqQn1QV6Zz0OdxRo=
Date: Mon, 20 Jun 2022 16:27:02 +0200
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?b?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] accel/tcg/cpu-exec: fix precise single-stepping after
 interrupt
Message-ID: <20220620142702.GA4427@ws2101.lin.mbt.kalray.eu>
References: <20220620142426.15040-1-lmichel@kalray.eu>
 <20220620142426.15040-2-lmichel@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220620142426.15040-2-lmichel@kalray.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.145; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 16:24 Mon 20 Jun     , Luc Michel wrote:
> In some cases, cpu->exit_request can be false after handling the
> interrupt, leading to another TB being executed instead of returning
> to the main loop.
> 
> Fix this by returning true unconditionally when in single-step mode.
> 
> Fixes: ba3c35d9c4026361fd380b269dc6def9510b7166
> 

Please ignore this old patch





