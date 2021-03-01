Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694883293AE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:36:57 +0100 (CET)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqDn-00004y-SV
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqCy-0007kV-1E
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:36:04 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:40129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqCw-0006C5-BV
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:36:03 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVe5c-1lOVBf0deO-00RVV3; Mon, 01 Mar 2021 22:35:55 +0100
Subject: Re: [PATCH v2 11/42] esp: apply transfer length adjustment when STC
 is zero at TC load time
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-12-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <147ddcd7-4797-51da-7940-e6d0fa77ee2c@vivier.eu>
Date: Mon, 1 Mar 2021 22:35:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/Cpd57O20cG4eUqr7a2hRkql893eAY8q9JP+B8Zydefw9HkM9tQ
 uZ4OZKO7e77Esux/mE/zxp+lZ7qx88IkSAKwjhTFFipq4Q6j58xtMO7M4i6IKsV3rv0NbyM
 ev/PkquacOrYfHFXJfEy8gZ6w8N1idIDAeEPSL+SKBwWsOp8ndKgKAXV1hvYLrchtJNf73D
 beBrD6JtuQyeTVz0YeYEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wb4uRAnD18k=:mc/8XyIwqJeJ1zIVLxev7M
 Vdd8TBef+BWsD0/8j6/lUxbbAn077exyL/M1Edt7ncdeFuI4u/0wTJhgKmQRkLEBDOZ1p8Msk
 +yonl/7r78GMv5C3IMX3EohwsnvcIYGNsHqAzJ7sx5ji9QxO5l7E94EypkXlRSOo5bUppSojv
 lufwxh3WHK5GBH3AuS4ogjBk/TAWHPG/MmmswQ3Bs2zhAnb4zujJ8SPrELA+VxecleWpGo5jg
 PLMgnDbmBxMiM+O3Cqc8MXTwqNNP57F2Qbk+hwcNVp7dylFJYjO5VJblwtq2PRUSZieM4Khq3
 bRDds3paV+ZkExDPi+DNC9yJe1kFm8VMDjR2PgELBkMx+QjWCGTuYtS3RksQ6alK1GwLqFd2m
 YPaXu8xs32tNvI1TW+CPGERda7y6cqCMht51gTtPO/8D0aKkGdnD4/MagMWPcQZ1D+vB20OIS
 /h4uUQmtNQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
> Perform the length adjustment whereby a value of 0 in the STC represents
> a transfer length of 0x10000 at the point where the TC is loaded at the
> start of a DMA command rather than just when a TI (Transfer Information)
> command is executed. This better matches the description as given in the
> datasheet.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index a1acc2c9bd..02b7876394 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -562,9 +562,6 @@ static void handle_ti(ESPState *s)
>      }
>  
>      dmalen = esp_get_tc(s);
> -    if (dmalen == 0) {
> -        dmalen = 0x10000;
> -    }
>      s->dma_counter = dmalen;
>  
>      if (s->do_cmd) {
> @@ -699,7 +696,11 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          if (val & CMD_DMA) {
>              s->dma = 1;
>              /* Reload DMA counter.  */
> -            esp_set_tc(s, esp_get_stc(s));
> +            if (esp_get_stc(s) == 0) {
> +                esp_set_tc(s, 0x10000);
> +            } else {
> +                esp_set_tc(s, esp_get_stc(s));
> +            }

More fun?

    esp_set_tc(s, esp_get_stc(s) ?: 0x10000);

>          } else {
>              s->dma = 0;
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

