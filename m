Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149126C3699
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peeWs-0001dA-Or; Tue, 21 Mar 2023 12:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1peeWq-0001bN-Eo
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:08:04 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1peeWo-0001BI-Na
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q6hc00WI/tgne53yF9B7CBSUYfjr95uLI4iXP7ztImY=; b=ppHnV+lImIHowiElFcT4Bd09rX
 Yjl4wAz17Dzm81ojhOQVCRRab60DQmki4oZ/E4IWErH3A4q2yXBHx/k/k2XHEq2gyIqAgkbkcgJow
 3buIbTa1goH9WyhG4zppyWhOj4nnlihZCNfI2h7jQ5NwVZ2Q4Cto1uEr8ksmVvem+h0w=;
Date: Tue, 21 Mar 2023 17:07:22 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 02/10] accel/tcg: move cpu_reloading_memory_map into
 cpu-exec-softmmu
Message-ID: <20230321170722.1150ff32@orange>
In-Reply-To: <20230320101035.2214196-3-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 20 Mar 2023 10:10:27 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> This doesn't save much as cpu-exec-common still needs to be built
> per-target for its knowledge of CPUState but this helps with keeping
> things organised.

> --- /dev/null
> +++ b/accel/tcg/cpu-exec-softmmu.c

Could `cpu_reloading_memory_map` be pushed closer to its only user
(softmmu/physmem.c) instead of creating a new file in accel/tcg?

Maybe I'm missing something, but I see other usages of current_cpu in
softmmu:

    $ git grep 'current_cpu->' softmmu/|cat
    softmmu/cpus.c:        current_cpu->stop =3D true;
    softmmu/memory.c:        return current_cpu->cpu_index;
    softmmu/runstate.c:        current_cpu->crash_occurred =3D true;

Maybe you envision more stuff in cpu-exec-softmmu.c.

Reviewed-by: Alessandro Di Federico <ale@rev.ng>

--=20
Alessandro Di Federico
rev.ng Labs

