Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB264C85E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 12:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5QFE-0007m0-2f; Wed, 14 Dec 2022 06:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1p5QF7-0007kn-99; Wed, 14 Dec 2022 06:48:11 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1p5QF5-0007jC-Jl; Wed, 14 Dec 2022 06:48:09 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84B7E1FF15;
 Wed, 14 Dec 2022 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671018484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGlUK1C8okbujCmPyhVOXz2M3kH5ZDDFJRrQBgCSRtE=;
 b=Ku6VRf95eYvpqyvJUP/vVUBw/tWGKpkr3zK1dcr/SxGFsD4tEWtN7qTfSiD9aIH3THUulo
 gTLb5I+YZUMmsDVeA7hDDOj9ftFpoMqsk6J7URzffAm86uFbJwoPUUJXLTGZ/c3+Uxf/7x
 3JToZJmXPCZrrOcezdBC+OcbIK3nMPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671018484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGlUK1C8okbujCmPyhVOXz2M3kH5ZDDFJRrQBgCSRtE=;
 b=TZtb6iJ9S81XMkQUggwAFRKJKmH++Smyur6zZvzytxzqxCs59jNbyBO+JkyrJw7cZUa22H
 SCEobOSCeiGVWGDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C490138F6;
 Wed, 14 Dec 2022 11:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hPUmDfS3mWMfTQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 14 Dec 2022 11:48:04 +0000
Message-ID: <e48328cf-ebd4-fc40-7395-b7659c3af718@suse.de>
Date: Wed, 14 Dec 2022 12:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/6] target/arm: general cleanups
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221213190537.511-1-farosas@suse.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/13/22 20:05, Fabiano Rosas wrote:
> Hi folks,
> 
> I'm splitting this big series from Claudio from last year into more
> manageable chunks (at least for me):
> 
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
> 
> This is the first chunk with only the most trivial patches that make
> sense even without the kvm/tcg and sysemu/user splits.
> 
> Claudio Fontana (1):
>   target/arm: cleanup cpu includes
> 
> Fabiano Rosas (5):
>   target/arm: Fix checkpatch comment style warnings in helper.c
>   target/arm: Fix checkpatch space errors in helper.c
>   target/arm: Fix checkpatch brace errors in helper.c
>   target/arm: Remove unused includes from m_helper.c
>   target/arm: Remove unused includes from helper.c
> 
>  target/arm/cpu.c      |   1 -
>  target/arm/cpu64.c    |   6 -
>  target/arm/helper.c   | 439 ++++++++++++++++++++++++++----------------
>  target/arm/m_helper.c |  16 --
>  4 files changed, 278 insertions(+), 184 deletions(-)
> 

For the series:

Reviewed-by: Claudio Fontana <cfontana@suse.de>

