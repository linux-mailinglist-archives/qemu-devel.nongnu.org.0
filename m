Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C4938FB17
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 08:41:57 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llQlI-0004mm-F8
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 02:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1llQk3-0003KG-1F
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:40:39 -0400
Received: from mail.ispras.ru ([83.149.199.84]:52064)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1llQk1-0002PH-DN
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:40:38 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id E35B24076B44;
 Tue, 25 May 2021 06:40:35 +0000 (UTC)
Subject: Re: [PATCH] target/nios2: fix page-fit instruction count
To: qemu-devel@nongnu.org
References: <162072241046.823357.10485774346114851009.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <7ff230df-8173-1dae-3750-a40b0588f13d@ispras.ru>
Date: Tue, 25 May 2021 09:40:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162072241046.823357.10485774346114851009.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, pbonzini@redhat.com, crwulff@gmail.com,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 11.05.2021 11:40, Pavel Dovgalyuk wrote:
> This patch fixes calculation of number of the instructions
> that fit the current page. It prevents creation of the translation
> blocks that cross the page boundaries. It is required for deterministic
> exception generation in icount mode.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/translate.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 9824544eb3..399f22d938 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -829,7 +829,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>       /* Set up instruction counts */
>       num_insns = 0;
>       if (max_insns > 1) {
> -        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & TARGET_PAGE_MASK)) / 4;
> +        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
>           if (max_insns > page_insns) {
>               max_insns = page_insns;
>           }
> 


