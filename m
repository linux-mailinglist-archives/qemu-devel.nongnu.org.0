Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D32E32AC73
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 23:06:24 +0100 (CET)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHD9r-0006fZ-Db
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 17:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD8o-00067z-3d
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:05:19 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:54883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD8h-0001vw-2Y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:05:17 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M7Jj2-1l9Uy93gpo-007kNB; Tue, 02 Mar 2021 23:05:02 +0100
Subject: Re: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4d791897-012b-fa1d-90ff-f8afef107157@vivier.eu>
Date: Tue, 2 Mar 2021 23:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TBt/Il8fIEmvRG9nIUvRpBZsfPWcvtspz8xE4w/im2qrla7FpRg
 ZrEdt4JT4sCuLT19pdezOaRqjEjvCBSYfanJyKHpgPckoLzPf7rWXulfDZAnfGW8wHEnGR6
 xvZUd0DLrHWz8FzjdKGQrqELRSY5B3MPoPCcshINOUP8EQvlpijFi6eUXyaUqTMeXFNE14q
 2yI1ytpSDxG0xZukwNzkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/JcJ9GRQagw=:QrJGJTaaGP1Jzwt8cTD53F
 RpucGblk4Dqw32zB5pbPLqf0UPOIKB3uWn8fVRfSr8nOZmmYoGzhK0BxhB7ACzRrhbQ1mOF8n
 1vcMy4NyhYGqSm54oN0vxBxVi8MV72i3h+1+ZCmhsgRrUVWbJ0ctfIG0FD/gnRKhKeGI8x8OJ
 OhkvqN1k3uZjnfV8EnS65YdkqQs+Kd29N2AAbW1fwLMSxzqRQ9FN7eA7ADCGzMjAiSbySBxlq
 MMA6IYv3jNm3Y/JutUYe9oRH5HrgXaTHEAq8eKDBuOmViSV7BzIpi2lxYOAy2MWXauFXw/wub
 Nc3QhLAryu0x0vhF0IEx+hGKPBsBkp4hRQ6BIP7hhwTyDn96tIoHP5eawRBkf43tGF08Uk1Pz
 NcaxhgWEnBVZjgcRkJN+xkfNb+HXgThdf2GRs0eEpVf7+XebmWM15CJX12UQ7
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
> The MacOS toolbox ROM performs 4 byte reads/writes when transferring data to
> and from the target. Since the SCSI bus is 16-bits wide, use the memory API
> to split a 4 byte access into 2 x 2 byte accesses.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 7671cc398d..1d56c99527 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -1003,7 +1003,9 @@ static const MemoryRegionOps sysbus_esp_pdma_ops = {
>      .write = sysbus_esp_pdma_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid.min_access_size = 1,
> -    .valid.max_access_size = 2,
> +    .valid.max_access_size = 4,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 2,
>  };
>  
>  static const struct SCSIBusInfo esp_scsi_info = {
> @@ -1048,7 +1050,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
>                            sysbus, "esp-regs", ESP_REGS << sysbus->it_shift);
>      sysbus_init_mmio(sbd, &sysbus->iomem);
>      memory_region_init_io(&sysbus->pdma, OBJECT(sysbus), &sysbus_esp_pdma_ops,
> -                          sysbus, "esp-pdma", 2);
> +                          sysbus, "esp-pdma", 4);
>      sysbus_init_mmio(sbd, &sysbus->pdma);
>  
>      qdev_init_gpio_in(dev, sysbus_esp_gpio_demux, 2);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

