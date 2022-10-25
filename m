Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E160CDE0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:49:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKHT-0007wW-R0; Tue, 25 Oct 2022 09:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onKH9-0007NG-8T
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:47:29 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onKH1-0006Jb-0Y
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:47:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 762EA1F8F5;
 Tue, 25 Oct 2022 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666705637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPMbqpOxDl7VWKf0EVlOaBcK0E9nr5UMyaUa9/CB46k=;
 b=CbMCDW5kTzM+LzMkXKsequDqGi0iAQiPK/DvSQHvzRkCiT1xf49oUn0uDUHlIoH4nWrlsv
 uUrOqzZuRIyc/3X1hOCtwU2b3BX2fjAows7ZltB8KXivNL430hJuPTgaIye8aoIxXT+Ykt
 ZhH81U+ur5twtyQzHAFsjrIlDz0/7lM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666705637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPMbqpOxDl7VWKf0EVlOaBcK0E9nr5UMyaUa9/CB46k=;
 b=sK/HdY28RrApyMtnovlzuicXiMcR3dWalp58ESPYcf8ctjSqXmADuAhTkZh2028hURouff
 g1v4raIET7POjmBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EE94134CA;
 Tue, 25 Oct 2022 13:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AunCFeXoV2MjRwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 25 Oct 2022 13:47:17 +0000
Message-ID: <0669dabb-5db2-b6d7-bf73-424e77045285@suse.de>
Date: Tue, 25 Oct 2022 15:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/4] include/qemu/thread: Use qatomic_* functions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
 <20221024232435.3334600-4-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221024232435.3334600-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 01:24, Richard Henderson wrote:
> Use qatomic_*, which expands to __atomic_* in preference
> to the "legacy" __sync_* functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/thread.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index af19f2b3fc..976e1ab995 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -227,7 +227,7 @@ struct QemuSpin {
>  
>  static inline void qemu_spin_init(QemuSpin *spin)
>  {
> -    __sync_lock_release(&spin->value);
> +    qatomic_set(&spin->value, 0);

Here an integer literal is used, which makes sense, spin->value is int.

>  #ifdef CONFIG_TSAN
>      __tsan_mutex_create(spin, __tsan_mutex_not_static);
>  #endif
> @@ -246,7 +246,7 @@ static inline void qemu_spin_lock(QemuSpin *spin)
>  #ifdef CONFIG_TSAN
>      __tsan_mutex_pre_lock(spin, 0);
>  #endif
> -    while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
> +    while (unlikely(qatomic_xchg(&spin->value, true))) {

nit: here 'true' is used. Maybe "1" instead of "true" for consistency? 

>          while (qatomic_read(&spin->value)) {
>              cpu_relax();
>          }
> @@ -261,7 +261,7 @@ static inline bool qemu_spin_trylock(QemuSpin *spin)
>  #ifdef CONFIG_TSAN
>      __tsan_mutex_pre_lock(spin, __tsan_mutex_try_lock);
>  #endif
> -    bool busy = __sync_lock_test_and_set(&spin->value, true);
> +    bool busy = qatomic_xchg(&spin->value, true);
>  #ifdef CONFIG_TSAN
>      unsigned flags = __tsan_mutex_try_lock;
>      flags |= busy ? __tsan_mutex_try_lock_failed : 0;
> @@ -280,7 +280,7 @@ static inline void qemu_spin_unlock(QemuSpin *spin)
>  #ifdef CONFIG_TSAN
>      __tsan_mutex_pre_unlock(spin, 0);
>  #endif
> -    __sync_lock_release(&spin->value);
> +    qatomic_store_release(&spin->value, 0);
>  #ifdef CONFIG_TSAN
>      __tsan_mutex_post_unlock(spin, 0);
>  #endif

Thanks,

C

