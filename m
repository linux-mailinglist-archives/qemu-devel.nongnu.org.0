Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093431C6EC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:38:30 +0100 (CET)
Received: from localhost ([::1]:55060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBuwH-0005F6-4n
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lButO-00041q-5l
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:35:30 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lButI-0004VP-H7
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:35:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n4so8821962wrx.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sKpZ0pLfmY2cK3xWyWkTqi0MgeNr56UQCTHlBO0rFLI=;
 b=MyHlImfymzaMYfrezl6zd5XFgTgwx7bS2b4u8HWNTgDZC8rQkG5ufK2nbxBJHpJpuj
 dpHQ1/hyMntXCRQDSFKCM2e1jR7Plj+QmugBzRjE3VljegYfAg73pWxE5a0zAj/qipDi
 KhvYsBjEKZYAUZ3Q1MMn49U6HxBFodKjfmbSsfM+Ow1cFJy3gi8KwNvDQc/smEbAGrqt
 CJoK02HPWl1gfjk18i0Xkdf3fHRpM586FHWeuJXqZpcsML7XCdr/bgn4xHnT45Y6oayT
 IMZugt6oIRyV3bde+ploh2NIEkiwc5JWoxILEe9CsNWs+KzOwojKNCGtIXG+PC+yB4t3
 By2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sKpZ0pLfmY2cK3xWyWkTqi0MgeNr56UQCTHlBO0rFLI=;
 b=Boq/3H9xGJaUFnQ1O0cdoVnkUciJIDFLSwCG71quiLZvfqHVE77EMNTR6fN7zy9SXK
 D1A9vLwllxOVD4oM67ZIusYkvXcuR7aZxBONWs0aJ07w5WIY4wn3IeNawMR2+hiO1CHr
 N3Tm3u5+ZFRfomNPTUJpMXBBUI9UjEtTVT+Pz3aF/ClkEmXgBTXdUwBZ9d3zhYGMKa0o
 skDlTp8Fdg/fdG4iNIgZN63PPhztk1qsXC/ut6R+kIx1KZV+A4alWqNypN8gv8irkaqI
 tRGSChUCMzaH4BBSRKIammKD1Uvxjf5mY2JWXI5ywnESGEY8ijxAZRYvCbxMneL4IBYk
 CGyw==
X-Gm-Message-State: AOAM532dDM3XgZyalYEoHVsBf9NDMghsh3C0J+d7/cKWB05cg1Stx32X
 TlQC17yWh4XcrOobegrPmuQwel4qjJ0=
X-Google-Smtp-Source: ABdhPJxlxNWH2ZSJRNnPqNOoOi05RTb8o0vLPczsJxv8mEBp3cvoZMgYpgQjQCYAnj30tc6llKT0ew==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr20926957wrt.67.1613460922988; 
 Mon, 15 Feb 2021 23:35:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o17sm5646352wrq.34.2021.02.15.23.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:35:22 -0800 (PST)
Subject: Re: [PATCH v2 04/42] esp: add vmstate_esp version to embedded ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05971727-d947-df9b-190e-d9a19994e935@amsat.org>
Date: Tue, 16 Feb 2021 08:35:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> The QOM object representing ESPState is currently embedded within both the
> SYSBUS_ESP and PCI_ESP devices with migration state handled by embedding
> vmstate_esp within each device using VMSTATE_STRUCT.
> 
> Since the vmstate_esp fields are embedded directly within the migration
> stream, the incoming vmstate_esp version_id is lost. The only version information
> available is that from vmstate_sysbus_esp_scsi and vmstate_esp_pci_scsi, but
> those versions represent their respective devices and not that of the underlying
> ESPState.
> 
> Resolve this by adding a new version-dependent field in vmstate_sysbus_esp_scsi
> and vmstate_esp_pci_scsi which stores the vmstate_esp version_id field within
> ESPState to be used to allow migration from older QEMU versions.
> 
> Finally bump the vmstate_esp version to 5 to cover the upcoming ESPState changes
> within this patch series.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/scsi/esp-pci.c     |  3 ++-
>  hw/scsi/esp.c         | 23 +++++++++++++++++++++--
>  include/hw/scsi/esp.h |  2 ++
>  3 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index ccf73bb901..8a82404853 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -330,11 +330,12 @@ static void esp_pci_hard_reset(DeviceState *dev)
>  
>  static const VMStateDescription vmstate_esp_pci_scsi = {
>      .name = "pciespscsi",
> -    .version_id = 1,
> +    .version_id = 2,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, PCIESPState),
>          VMSTATE_BUFFER_UNSAFE(dma_regs, PCIESPState, 0, 8 * sizeof(uint32_t)),
> +        VMSTATE_UINT8_V(esp.mig_version_id, PCIESPState, 2),
>          VMSTATE_STRUCT(esp, PCIESPState, 0, vmstate_esp, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 1635f86622..9427c55d1d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -796,10 +796,28 @@ static const VMStateDescription vmstate_esp_pdma = {
>      }
>  };
>  
> +static int esp_pre_save(void *opaque)
> +{
> +    ESPState *s = ESP(opaque);
> +
> +    s->mig_version_id = vmstate_esp.version_id;
> +    return 0;
> +}
> +
> +static int esp_post_load(void *opaque, int version_id)
> +{
> +    ESPState *s = ESP(opaque);
> +
> +    s->mig_version_id = vmstate_esp.version_id;
> +    return 0;
> +}
> +
>  const VMStateDescription vmstate_esp = {
>      .name = "esp",
> -    .version_id = 4,
> +    .version_id = 5,
>      .minimum_version_id = 3,
> +    .pre_save = esp_pre_save,
> +    .post_load = esp_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_BUFFER(rregs, ESPState),
>          VMSTATE_BUFFER(wregs, ESPState),
> @@ -996,9 +1014,10 @@ static void sysbus_esp_init(Object *obj)
>  
>  static const VMStateDescription vmstate_sysbus_esp_scsi = {
>      .name = "sysbusespscsi",
> -    .version_id = 1,
> +    .version_id = 2,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_V(esp.mig_version_id, SysBusESPState, 2),
>          VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 11c799d91e..7d92471c5b 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -68,6 +68,8 @@ struct ESPState {
>      uint32_t pdma_start;
>      uint32_t pdma_cur;
>      void (*pdma_cb)(ESPState *s);
> +
> +    uint8_t mig_version_id;
>  };
>  
>  #define TYPE_SYSBUS_ESP "sysbus-esp"
> 


