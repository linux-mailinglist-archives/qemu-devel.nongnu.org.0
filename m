Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854432BA39
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:33:55 +0100 (CET)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXFq-0000dC-0K
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXF4-0000Cd-KH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:33:06 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:46889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXF2-0004fV-KZ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:33:06 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mw9Dg-1m71Oa1J24-00s6E6; Wed, 03 Mar 2021 20:32:52 +0100
Subject: Re: [PATCH v2 31/42] esp: implement FIFO flush command
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-32-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d764e7e2-2171-4fe9-b73e-197f892c148b@vivier.eu>
Date: Wed, 3 Mar 2021 20:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-32-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2/ZLqzx5mscDQUwUey2ilqf7rhAyhwk5RIQH1bUsUf35P7bac7M
 0jNldYYObGf+rVWgBlfCrbq8f0VPQw5lng8RmOHBYkkPVK41fNVjIghlA6pO5Yovn40ukMT
 eB+0XTeoml6QpQXNlLFSHFaYJlT9wUreJ2ObmaxmnpwwuQKdKiluiOlQDsnlhtJmB1FP9JK
 2bjEJd7wFCtwmNgnnu56g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ahBavYN7/jI=:J0Ps0eq9W67oCNMuYxVoy3
 MEB1jMr1bzRDwH3Goz/jcM5dIbSw3JxKvEKiuG1TRy/t5D3n4F48/keQzWANZ+PnsKJh8PdDv
 9HOzajUWjeMgSgkQInBn1KtjjFCTnme0l0m8zCJchJvhae6895eQMqfBZPtk2rYRaeXva3/Pr
 elXL91hLobQLw8FN8gstxFn96LCCqkyCXRdqkMZy72bhQL10VOpm+8YT2ldFD8cmPhA5yWhCC
 KHNvhiq1+yKQHO7/+I3S99ejwJkPE9a3z9LtZisaIkqxAyhHITsjkj5PnrKWAq8p6zgydqomJ
 qnJ10zQ/vK2K9mBGCp9GPb0/nzTRSKgC1EV8qFqzJFt9FTtCZ4WbI5Z1Pl7gYJ8OsVbz41etS
 kUbn+80jG51Xj0brFXH2NOqG6LZjyZOiiF6gZxQzLGaKe6v8dptSwq99OUTk+8EVZW+RoEdh0
 YB57cL5/9Q==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
> At this point it is now possible to properly implement the FIFO flush command
> without causing guest errors.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 1d56c99527..0994673ff8 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -770,6 +770,8 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          case CMD_FLUSH:
>              trace_esp_mem_writeb_cmd_flush(val);
>              /*s->ti_size = 0;*/
> +            s->ti_wptr = 0;
> +            s->ti_rptr = 0;
>              s->rregs[ESP_RINTR] = INTR_FC;
>              s->rregs[ESP_RSEQ] = 0;
>              s->rregs[ESP_RFLAGS] = 0;
> 

Why don't  you set aso ti_size to 0?

Anyway:

Reviwed-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent

