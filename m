Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250732935C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:19:53 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGpxI-0000sI-F0
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGpwJ-0000I5-He
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:18:51 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGpwH-00077I-LR
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:18:51 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMX9b-1lXXs801kV-00JZKd; Mon, 01 Mar 2021 22:18:39 +0100
Subject: Re: [PATCH v2 08/42] esp: determine transfer direction directly from
 SCSI phase
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <335c5de3-6d98-5527-ab28-bfcb7935f4f9@vivier.eu>
Date: Mon, 1 Mar 2021 22:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V7g7hAqKdOEIy/dDqRs+9qsfEWcT7DRux3qPFvWMIuEHikrXE7i
 2j9rGhOMZThX+IXvTPCAM+PBH+W2HLNsACLSIr7Ehz3I48lid+G2RCTBiGIIpdTKQEoENPP
 1+eUP9TKe8v6CudbG1cIsNaEjAjs8YvPe5FNfn0ATDjbcDkua6L0eJ/cZHa+iNex6aLwV7j
 UKHZvXhpC/JxQMW8fT5wA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SWIy/ZyQiSI=:wEkBvUMzOVJCdHAqIo+BuN
 Fu9TpySUCzgc97dbKmFiBHcydBWxge2vQZnpBqUoLp4cnu4HsvcbIfn8UTQbbDmDmKQVDPrct
 uWYStbSizZvCwJP/p0kEHtzkznDE7vxRhQ6vWO5g0xSlX+1UVmJGIc2O02A1ANF0dD03QbEI3
 p51p6fIIbqsi3qpdlHjcAJyRkh1NhsIskcSoH3TWLhApL6Nvs0ebPMTf1soddZeUv5UZs0bUg
 OXiiyt/0FNvpAeUXVWa79rpV2HQVexHqI8j66qYiYqEv5hqo4gaBy5Tll2pju/+f5M5ezdq9Z
 JOwt0pcplMk3ivbGhZt4FPUECOaqHKaoV2OxTmU99caZ4n7ssRGA78Ns+BplawSyJE5nbC+iR
 tL5qTixsqiTrbEsz96e3yq6ICCTJ6PeTPdHTxWdk2dJxoL2cOHjsYQMsoOqaIwjBfQA+BWnqx
 MMqylq//+w==
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> The transfer direction is currently determined by checking the sign of ti_size
> but as this series progresses ti_size can be zero at the end of the transfer.
> 
> Use the SCSI phase to determine the transfer direction as used in other SCSI
> controller implementations.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index db2ea02549..e82e75d490 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -356,7 +356,7 @@ static void esp_dma_done(ESPState *s)
>  
>  static void do_dma_pdma_cb(ESPState *s)
>  {
> -    int to_device = (s->ti_size < 0);
> +    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
>      int len = s->pdma_cur - s->pdma_start;
>      if (s->do_cmd) {
>          s->ti_size = 0;
> @@ -392,7 +392,7 @@ static void do_dma_pdma_cb(ESPState *s)
>  static void esp_do_dma(ESPState *s)
>  {
>      uint32_t len;
> -    int to_device;
> +    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
>  
>      len = s->dma_left;
>      if (s->do_cmd) {
> @@ -425,7 +425,6 @@ static void esp_do_dma(ESPState *s)
>      if (len > s->async_len) {
>          len = s->async_len;
>      }
> -    to_device = (s->ti_size < 0);
>      if (to_device) {
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, s->async_buf, len);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.Eu>

