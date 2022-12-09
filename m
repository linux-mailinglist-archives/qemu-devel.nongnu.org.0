Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D21648294
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:51:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cpo-0006T2-Eh; Fri, 09 Dec 2022 07:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p3cpm-0006So-7S; Fri, 09 Dec 2022 07:50:34 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p3cpk-0008LI-Mm; Fri, 09 Dec 2022 07:50:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3180337EB;
 Fri,  9 Dec 2022 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670590228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYGsyV2yK1Ik/jF7wwqYZxCTSkCE9sS/NgvjjPAn0L0=;
 b=0fEfsTy8RtQQ2FXpMsC+ttp1l28nks02YcZ9HRVmUduypZMKPFCgDddyvE479eQePQWsKQ
 5Yw2gUk6EyVBU1aP7oUWeH8VqeBiZmsvAb7PllY9IXf7Atvo8ej3BMA6pnpI38Cq8+cea+
 nHq7bmyxBisv6aOvmcLzWRV5x7K+mRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670590228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYGsyV2yK1Ik/jF7wwqYZxCTSkCE9sS/NgvjjPAn0L0=;
 b=RSx9jILGC/MWNu/r2MWwVW9JUPcpNVgxXdCTD3vX0ndtmyRUEKhKwzgH73M93zjLrmDh+e
 EKke7CXf8WhmjEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79F1613597;
 Fri,  9 Dec 2022 12:50:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VNzMDxQvk2PuWQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 09 Dec 2022 12:50:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH-for-8.0] target/arm: Restrict arm_cpu_exec_interrupt()
 to TCG accelerator
In-Reply-To: <20221209110823.59495-1-philmd@linaro.org>
References: <20221209110823.59495-1-philmd@linaro.org>
Date: Fri, 09 Dec 2022 09:50:25 -0300
Message-ID: <87wn70bv1q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> When building with --disable-tcg on Darwin we get:
>
>   target/arm/cpu.c:725:16: error: incomplete definition of type 'struct T=
CGCPUOps'
>     cc->tcg_ops->do_interrupt(cs);
>     ~~~~~~~~~~~^
>
> Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
> handler to sysemu") limited this block to system emulation,
> but neglected to also limit it to TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

