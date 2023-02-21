Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FEB69E016
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURYj-00084d-MW; Tue, 21 Feb 2023 07:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pURYa-0007z8-7s; Tue, 21 Feb 2023 07:15:40 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pURYS-0008Oo-LN; Tue, 21 Feb 2023 07:15:38 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1954C47E90;
 Tue, 21 Feb 2023 13:15:26 +0100 (CET)
Message-ID: <1c31f33f-4346-6152-23fe-43c71d61efb2@proxmox.com>
Date: Tue, 21 Feb 2023 13:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 03/11] block/iscsi: fix double-free on BUSY or similar
 statuses
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230208171922.95048-1-pbonzini@redhat.com>
 <20230208171922.95048-4-pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230208171922.95048-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 08.02.23 um 18:19 schrieb Paolo Bonzini:
> Commit 8c460269aa77 ("iscsi: base all handling of check condition on
> scsi_sense_to_errno", 2019-07-15) removed a "goto out" so that the
> same coroutine is re-entered twice; once from iscsi_co_generic_cb,
> once from the timer callback iscsi_retry_timer_expired.  This can
> cause a crash.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1378
> Reported-by: Grzegorz Zdanowski <https://gitlab.com/kiler129>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/iscsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index b3e10f40b649..3aacd0709f93 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -269,6 +269,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
>                  timer_mod(&iTask->retry_timer,
>                            qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + retry_time);
>                  iTask->do_retry = 1;
> +                return;
>              } else if (status == SCSI_STATUS_CHECK_CONDITION) {
>                  int error = iscsi_translate_sense(&task->sense);
>                  if (error == EAGAIN) {

Thank you for the fix! CC-ing stable, because this is a regression fix.


