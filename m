Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF0C32BA4D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:01:48 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXgp-0006N8-3M
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXew-0005aK-Ig
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:59:51 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:52367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXet-00046V-Bg
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:59:50 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMH2M-1lXQNg3Mne-00JNZn; Wed, 03 Mar 2021 20:59:38 +0100
Subject: Re: [PATCH v2 35/42] esp: raise interrupt after every non-DMA byte
 transferred to the FIFO
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-36-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <24469f4c-e794-f703-019d-64f31e801dcc@vivier.eu>
Date: Wed, 3 Mar 2021 20:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-36-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3v4bi2nAn5vAXEHblvknjynIT64h1KHm2plc25+KpkvjeMUsFxE
 LrLSJ0VXjUaV+TseTeGeK3pNlP/yfho+cx+/7SCVQfhgqYSaEhg81KxcDtPhDI5xhs4yyU9
 Fd18yrSbN1u+GfJi/w+zi+TFEwBq403xfIAsmG2hen7e7ud0hqNkehOKv4IE38zT1tMnevb
 4mYE/IwpLFrJrVwHlyw+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fnYNplv+ISQ=:kuhKW+rW98JcApIn4NYmSN
 vTWz7W/CRiMcFJEJ/erBaKJnjL99H6pVSE1FI5I34BRPD8L7AAgXifJRW8CBb8Pz1sQ91pDen
 mM8occRfJMBrmK0wob5YTHs7XT1XpYg1GtaPJH3HpfJ0/Bg9Fjh9WO0tW1EtXb00iBAaynxVl
 K4PbFU+wGLqf6IqXGD8jqfBiyIkcLxNFjcWZj6RAxG0i/nFJ7tppIAZr1xq5QUVWzDX7BpeVa
 WesPyISF4vcLc6knRYjesT7QL0QTuyaJXwmpnjUVo5DwGNim/at8GJvf0GEaxKSl3uHMhS6Pa
 MC8FM5zXilFY+/ymgvtclL5uXeGbqQzqxFxkrvoh/XWBmImXhqXyT3s5dVDA+rx2ap252FB2i
 YuZ0+huQHPOvcMYD7n3MAPTFuzrzlFZ7LwU1dVNa+3AnxTEse7PPK/N9ht7Be+i+vAbqFPOp6
 WfgQkxWGhg==
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
> This matches the description in the datasheet and is required as support for
> non-DMA transfers is added.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 8b856155d1..617fdcb3ed 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -767,6 +767,12 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>              s->ti_size++;
>              s->ti_buf[s->ti_wptr++] = val & 0xff;
>          }
> +
> +        /* Non-DMA transfers raise an interrupt after every byte */
> +        if (s->rregs[ESP_CMD] == CMD_TI) {
> +            s->rregs[ESP_RINTR] |= INTR_FC | INTR_BS;
> +            esp_raise_irq(s);
> +        }
>          break;
>      case ESP_CMD:
>          s->rregs[saddr] = val;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

