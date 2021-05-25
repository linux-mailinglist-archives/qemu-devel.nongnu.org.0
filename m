Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E638FB16
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 08:41:54 +0200 (CEST)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llQlE-0004aO-S7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 02:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1llQjz-0003Gr-Do
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:40:35 -0400
Received: from mail.ispras.ru ([83.149.199.84]:52040)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1llQjx-0002Ni-Dj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:40:35 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 887A54076B44;
 Tue, 25 May 2021 06:40:24 +0000 (UTC)
Subject: Re: [PATCH] replay: fix watchpoint processing for reverse debugging
To: qemu-devel@nongnu.org
References: <162072430303.827403.7379783546934958566.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <fc75c7b5-e99c-f558-d24f-519041aa8d46@ispras.ru>
Date: Tue, 25 May 2021 09:40:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162072430303.827403.7379783546934958566.stgit@pasha-ThinkPad-X280>
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 11.05.2021 12:11, Pavel Dovgalyuk wrote:
> This patch enables reverse debugging with watchpoints.
> Reverse continue scans the execution to find the breakpoints
> and watchpoints that should fire. It uses helper function
> replay_breakpoint() for that. But this function needs to access
> icount, which can't be correct in the middle of TB.
> Therefore, in case of watchpoint, we have to retranslate the block
> to allow this access.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   softmmu/physmem.c |   10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 5232696571..2826d60cef 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -904,6 +904,16 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>           if (watchpoint_address_matches(wp, addr, len)
>               && (wp->flags & flags)) {
>               if (replay_running_debug()) {
> +                /*
> +                 * replay_breakpoint reads icount.
> +                 * Force recompile to succeed, because icount may
> +                 * be read only at the end of the block.
> +                 */
> +                if (!cpu->can_do_io) {
> +                    /* Force execution of one insn next time.  */
> +                    cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
> +                    cpu_loop_exit_restore(cpu, ra);
> +                }
>                   /*
>                    * Don't process the watchpoints when we are
>                    * in a reverse debugging operation.
> 


