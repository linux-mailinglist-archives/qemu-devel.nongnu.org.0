Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BA613CAF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 18:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZ1H-0000Jt-1B; Mon, 31 Oct 2022 13:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opZ1C-0000F2-2u
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 13:56:14 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opZ1A-00053S-Do
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 13:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=h9DGjzbAee/vYNVvXrowqyI+lyte7P62ttxA1HdKMbk=; b=OU+w1ChJgGvYmYWCI7aXv+s9Lf
 etdzgl0Z6aB+l7qH91yRWZ2yV4YU6625RMLIKa5/yBv1FZi3fBk6VWSDfZBnC/LBe7JzQZwYYwlNI
 6uQiap+1EEqgB2rV5v4FTOb4pd/t6/pc8M5QPhBk7fGGEp8rJur2z6s3AH9bat2YCz33KP4mHTmbv
 xxy4kVSiwIhv1OEME6i1nfURG3v6mnw1rYy3hBTl33hrV42KE1uDPFoVhFI13ZGTEMFnKe7fmW1+y
 IzszJbqVPd7+5Jmf9Sjl/oQtGKfn1+w/VwhTjSi4NPcMQWj2otoLQFczw8Z1sK3nQED8Qww/qtPoj
 z5HpxQ7UMYxuhtp+WFg8zEXg9JTC2A3AZ0PmYWKqODmZ4wPEXwKdSJLTi4n59imvBYWcJcrLyqLV2
 EjfpRPQQ+O7W4apErVwVwNowDEUC96Eo0NfHEdWC+3Dw/zUwyVbtf6O9GURxI/Ucn7pk18Am19dUT
 mQqZgsS2ElwnQki5Rb0WdDe/RckDwVpbSTr7DpzZaruGuEL3wxOHWzRbtcdHcv1lE+8VMeCeggi9W
 4iiqgp10kqcN81rim6X07ZEVK243LDHRq07Aen0sKqV2pkR3lzEiGIyUBHNLB97mF3xdm5low0arW
 LPu24ah5Un+1OobmRT5WcC1jwCa1enJSmTrjSckWo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Date: Mon, 31 Oct 2022 18:56:07 +0100
Message-ID: <1792277.8fnDRLUPHX@silver>
In-Reply-To: <20221026021116.1988449-26-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Wednesday, October 26, 2022 4:10:54 AM CET Richard Henderson wrote:
> Add a tcg_ops hook to replace the restore_state_to_opc
> function call.  Because these generic hooks cannot depend
> on target-specific types, temporarily, copy the current
> target_ulong data[] into uint64_t d64[].
> 
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
[...]
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 433fa247f4..4d8783efc7 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
[...]
>  bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>  {
> +    /*
> +     * The pc update associated with restore without exit will
> +     * break the relative pc adjustments performed by TARGET_TB_PCREL.
> +     */
> +    if (TARGET_TB_PCREL) {
> +        assert(will_exit);
> +    }
> +
>      /*
>       * The host_pc has to be in the rx region of the code buffer.
>       * If it is not we will not be able to resolve it here.

This patch appears to break macOS host. This assertion always triggers on
Apple Silicon. Previous patch 8269c01417 runs fine. Any ideas?

BTW Richard, could you add a message-id tag to your queued TCG patches? If you
are using patchwork client then it suffices to add "msgid=on" to .pwclientrc

Best regards,
Christian Schoenebeck



