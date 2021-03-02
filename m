Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13E632AC6E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:58:52 +0100 (CET)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHD2Z-0003Pf-No
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD1f-0002xi-7o
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:57:55 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:51233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD1b-0000xk-FV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:57:54 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MbTCr-1loLz40wZd-00bqOS; Tue, 02 Mar 2021 22:57:43 +0100
Subject: Re: [PATCH v2 27/42] esp: fix PDMA target selection
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-28-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8230b6c1-7e40-84a1-8012-e3aa7978ede0@vivier.eu>
Date: Tue, 2 Mar 2021 22:57:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-28-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uaxC9RePnx0GTGYeTt/ZWkckDAggHUYlFbGghNMVj1qtQc2DCf1
 J2c3tGCC/7l8HUlAfbXoDCs++RTWVFhfmp8RXMpEqzkuRLxNkL669Ren5u1JoPXezNAHoXB
 lU7m7S0IBTPC3e3PoQQgctBbvnzUMAfa2skXHgoekabyvuimy95t3zkEgOQdcApjzgiyj7p
 HLSAH4wjMFsk8Bdj8QADg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GtmuELYcBDA=:jDC9qupyB9nowUGw6ABgkr
 9dJOuwO1GRKNpq+NIDqQGMZEwbKPLwQUTdVQYrCdsci1a/8gQTQrNjeTPr6LLAwXUWggne0Mf
 242gcsNEcUfN8IwN5HpBAzZe9X39a89PbVnAO/2fkhMicB2FB3qTvRTJTAGQFIo9kh5Lej71E
 OhimnGIYJktbVMCk4DsnOWXYA4FykjHforGxHKmyRIKfSFAvJMMLBm0HboPMrgOmBTVr4/xWf
 K9gpSGdJXUwrsRHPXESCz++IC5ACVZFtNoxDrec4/rsBgoArW7QAfnEY5qbonkNTNvEXE+2W6
 7inOk35kl7vUR9x1xhaTGzHHIE57/ZN8OWauj3IndsaqkJwK48YfgAX4stSCIC9XFAHEHj14V
 swahys30P8wu0pp9S8DlDMSWBdzguOEmSNVJcfAbaXaVpGCXmIxiKY0GLL2xmIbcpzIioynsW
 i3UlWdo12A==
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

Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
> Currently the target selection for PDMA is done after the SCSI command has been
> delivered which is not correct. Perform target selection as part of the initial
> get_cmd() call when the command is submitted: if no target is present, don't
> raise DRQ.
> 
> If the target is present then switch to the command phase since the MacOS toolbox
> ROM checks for this before attempting to submit the SCSI command.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 53 +++++++++++++++++++++++++++++++++------------------
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 6736e7142c..b7ab5a5592 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -243,6 +243,9 @@ static uint32_t get_cmd(ESPState *s)
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
>          } else {
>              set_pdma(s, TI);
> +            if (esp_select(s) < 0) {
> +                return -1;
> +            }
>              esp_raise_drq(s);
>              return 0;
>          }
> @@ -257,7 +260,7 @@ static uint32_t get_cmd(ESPState *s)
>      trace_esp_get_cmd(dmalen, target);
>  
>      if (esp_select(s) < 0) {
> -        return 0;
> +        return -1;
>      }
>      return dmalen;
>  }
> @@ -299,9 +302,6 @@ static void do_cmd(ESPState *s)
>  
>  static void satn_pdma_cb(ESPState *s)
>  {
> -    if (esp_select(s) < 0) {
> -        return;
> -    }
>      s->do_cmd = 0;
>      if (s->cmdlen) {
>          do_cmd(s);
> @@ -310,24 +310,28 @@ static void satn_pdma_cb(ESPState *s)
>  
>  static void handle_satn(ESPState *s)
>  {
> +    int32_t cmdlen;
> +
>      if (s->dma && !s->dma_enabled) {
>          s->dma_cb = handle_satn;
>          return;
>      }
>      s->pdma_cb = satn_pdma_cb;
> -    s->cmdlen = get_cmd(s);
> -    if (s->cmdlen) {
> +    cmdlen = get_cmd(s);
> +    if (cmdlen > 0) {
> +        s->cmdlen = cmdlen;
>          do_cmd(s);
> -    } else {
> +    } else if (cmdlen == 0) {
> +        s->cmdlen = 0;
>          s->do_cmd = 1;
> +        /* Target present, but no cmd yet - switch to command phase */
> +        s->rregs[ESP_RSEQ] = SEQ_CD;
> +        s->rregs[ESP_RSTAT] = STAT_CD;
>      }
>  }
>  
>  static void s_without_satn_pdma_cb(ESPState *s)
>  {
> -    if (esp_select(s) < 0) {
> -        return;
> -    }
>      s->do_cmd = 0;
>      if (s->cmdlen) {
>          do_busid_cmd(s, s->cmdbuf, 0);
> @@ -336,24 +340,28 @@ static void s_without_satn_pdma_cb(ESPState *s)
>  
>  static void handle_s_without_atn(ESPState *s)
>  {
> +    int32_t cmdlen;
> +
>      if (s->dma && !s->dma_enabled) {
>          s->dma_cb = handle_s_without_atn;
>          return;
>      }
>      s->pdma_cb = s_without_satn_pdma_cb;
> -    s->cmdlen = get_cmd(s);
> -    if (s->cmdlen) {
> +    cmdlen = get_cmd(s);
> +    if (cmdlen > 0) {
> +        s->cmdlen = cmdlen;
>          do_busid_cmd(s, s->cmdbuf, 0);
> -    } else {
> +    } else if (cmdlen == 0) {
> +        s->cmdlen = 0;
>          s->do_cmd = 1;
> +        /* Target present, but no cmd yet - switch to command phase */
> +        s->rregs[ESP_RSEQ] = SEQ_CD;
> +        s->rregs[ESP_RSTAT] = STAT_CD;
>      }
>  }
>  
>  static void satn_stop_pdma_cb(ESPState *s)
>  {
> -    if (esp_select(s) < 0) {
> -        return;
> -    }
>      s->do_cmd = 0;
>      if (s->cmdlen) {
>          trace_esp_handle_satn_stop(s->cmdlen);
> @@ -367,21 +375,28 @@ static void satn_stop_pdma_cb(ESPState *s)
>  
>  static void handle_satn_stop(ESPState *s)
>  {
> +    int32_t cmdlen;
> +
>      if (s->dma && !s->dma_enabled) {
>          s->dma_cb = handle_satn_stop;
>          return;
>      }
>      s->pdma_cb = satn_stop_pdma_cb;
> -    s->cmdlen = get_cmd(s);
> -    if (s->cmdlen) {
> +    cmdlen = get_cmd(s);
> +    if (cmdlen > 0) {
>          trace_esp_handle_satn_stop(s->cmdlen);
> +        s->cmdlen = cmdlen;
>          s->do_cmd = 1;
>          s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
>          s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
>          s->rregs[ESP_RSEQ] = SEQ_CD;
>          esp_raise_irq(s);
> -    } else {
> +    } else if (cmdlen == 0) {
> +        s->cmdlen = 0;
>          s->do_cmd = 1;
> +        /* Target present, but no cmd yet - switch to command phase */
> +        s->rregs[ESP_RSEQ] = SEQ_CD;
> +        s->rregs[ESP_RSTAT] = STAT_CD;
>      }
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

