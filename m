Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BD832A70E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:06:45 +0100 (CET)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8Ts-0006QW-HJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH8Pi-0003BH-6O
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:02:26 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:37161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH8Pg-0006Zv-Ag
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:02:25 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmlGg-1lfymV1YXe-00jre2; Tue, 02 Mar 2021 18:02:09 +0100
Subject: Re: [PATCH v2 18/42] esp: accumulate SCSI commands for PDMA transfers
 in cmdbuf instead of pdma_buf
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-19-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <99d86cc8-ec8d-049d-1252-92d50f0f8eaa@vivier.eu>
Date: Tue, 2 Mar 2021 18:02:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-19-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:biMtrh7yQ3UvzZa0NXUspdnV1fh+n+pfVcJk75HamID1QHRc2vS
 8/jRMVNwbsshw7tvEvAGFwAa0XSzHWaRfSAxVV3gC56zN7s+aBGplBlzO0JHFgG8IOF4n8D
 J10r7JKEFF9pqtDEH/1KbEzZRwgga7O3e7CUigo1TlKJOhtefSq/2JFLxsq4cW9pnYjQvJV
 mAQOwm04azSzNwVzCP2IQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:phqJhEjTv/s=:mb8F/5BhYax3X8dyKLR0bg
 s2yEo4QpUxfZG61Hl/Zbidi7DZfLb4oSJA9OV6Fak/MLJUxfSBkjId/rne80X01X+3L1ZVRH6
 n5garMiOp7hPfZnSgfre8Nl12yWaCzdZXU9v2nLAGu9GvVTTHD/R5oEY0J1JWdeaTq/a60wQl
 luWFl3hn85PtZqlrHAkNv4PiV/fFpD/sze+MQ5iHqGuG/1Bl92eHGg9+1tVoCoTz1aWZpIZMc
 Sxh8y2uhnkXzhG0YHqYp1M2P8DunjQvYnK++GZKIPR8vd+Yv7B4KF7Km+LWUFJgwQpkQT0axm
 eZ0MxRr0RZyw41dsf0Q2jXooGHWrIy0jRvU42SU6kvzOh85TJZ9605o925csjzWqA6FMDPc+Z
 cfB2sYLhPftD7tDO0AYWPgb3ylvEHLQpDakpP6VrB0umn18OvbYpUQ+VQg2x0
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> ESP SCSI commands are already accumulated in cmdbuf and so there is no need to
> keep a separate pdma_buf buffer. Accumulate SCSI commands for PDMA transfers in
> cmdbuf instead of pdma_buf so update cmdlen accordingly and change pdma_origin
> for PDMA transfers to CMD which allows the PDMA origin to be removed.
> 
> This commit also removes a stray memcpy() from get_cmd() which is a no-op because
> cmdlen is always zero at the start of a command.
> 
> Notionally the removal of pdma_buf from vmstate_esp_pdma also breaks migration
> compatibility for the PDMA subsection until its complete removal by the end of
> the series.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 56 +++++++++++++++++++------------------------
>  include/hw/scsi/esp.h |  2 --
>  2 files changed, 25 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 7134c0aff4..b846f022fb 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -139,8 +139,6 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin,
>  static uint8_t *get_pdma_buf(ESPState *s)
>  {
>      switch (s->pdma_origin) {
> -    case PDMA:
> -        return s->pdma_buf;
>      case TI:
>          return s->ti_buf;
>      case CMD:
> @@ -161,14 +159,12 @@ static uint8_t esp_pdma_read(ESPState *s)
>      }
>  
>      switch (s->pdma_origin) {
> -    case PDMA:
> -        val = s->pdma_buf[s->pdma_cur++];
> -        break;
>      case TI:
>          val = s->ti_buf[s->pdma_cur++];
>          break;
>      case CMD:
> -        val = s->cmdbuf[s->pdma_cur++];
> +        val = s->cmdbuf[s->cmdlen++];
> +        s->pdma_cur++;
>          break;
>      case ASYNC:
>          val = s->async_buf[s->pdma_cur++];
> @@ -193,14 +189,12 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>      }
>  
>      switch (s->pdma_origin) {
> -    case PDMA:
> -        s->pdma_buf[s->pdma_cur++] = val;
> -        break;
>      case TI:
>          s->ti_buf[s->pdma_cur++] = val;
>          break;
>      case CMD:
> -        s->cmdbuf[s->pdma_cur++] = val;
> +        s->cmdbuf[s->cmdlen++] = val;
> +        s->pdma_cur++;
>          break;
>      case ASYNC:
>          s->async_buf[s->pdma_cur++] = val;
> @@ -256,8 +250,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
>          } else {
> -            memcpy(s->pdma_buf, buf, dmalen);
> -            set_pdma(s, PDMA, 0, dmalen);
> +            set_pdma(s, CMD, 0, dmalen);
>              esp_raise_drq(s);
>              return 0;
>          }
> @@ -316,24 +309,24 @@ static void satn_pdma_cb(ESPState *s)
>      if (get_cmd_cb(s) < 0) {
>          return;
>      }
> -    if (s->pdma_cur != s->pdma_start) {
> -        do_cmd(s, get_pdma_buf(s) + s->pdma_start);
> +    s->do_cmd = 0;
> +    if (s->cmdlen) {
> +        do_cmd(s, s->cmdbuf);

I don't understant how you can remove the pdma_start: normally it is here to keep track of the
position in the pDMA if the migration is occuraing while a pDMA transfer.

Thanks,
Laurent

