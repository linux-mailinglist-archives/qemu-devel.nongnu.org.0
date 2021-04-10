Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E292E35AB3D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 07:57:57 +0200 (CEST)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV6d2-0006PN-JV
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 01:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV6bj-0005Ql-7n
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 01:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV6be-0000VZ-Qv
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 01:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618034188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TP7YIqtNMFL20p2QNhvadUTuM9leN1QQDJQlH9kW9hw=;
 b=KJuRIHPACeTqj5NyUomX3Fuvd4Lo1BXjw3pkqBPLxGNfhcB4ul8rkaRg2HS6lAWXeC9Fhg
 96lVuI/VpjjlIqdoa/USW6tyW53TEw2mnKD4WRrgINPN4GstP6XV21TsfSOUX1jDsHS4H+
 xj/pR8lvEleHzsij375SMrQZ4aW5PRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-lJOyMNipMmW-R6Zi9kLrFg-1; Sat, 10 Apr 2021 01:56:25 -0400
X-MC-Unique: lJOyMNipMmW-R6Zi9kLrFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B96B110053E7;
 Sat, 10 Apr 2021 05:56:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10E095D9D3;
 Sat, 10 Apr 2021 05:56:21 +0000 (UTC)
Subject: Re: [PATCH for-6.0] esp: fix setting of ESPState mig_version_id when
 launching QEMU with -S option
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Alan Gilbert
 <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210407124842.32695-1-mark.cave-ayland@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0cadef46-d80c-6f09-bc36-9b8872fc9009@redhat.com>
Date: Sat, 10 Apr 2021 07:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210407124842.32695-1-mark.cave-ayland@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2021 14.48, Mark Cave-Ayland wrote:
> If QEMU is launched with the -S option then the ESPState mig_version_id property
> is left unset due to the ordering of the VMState fields in the VMStateDescription
> for sysbusespscsi and pciespscsi. If the VM is migrated and restored in this
> stopped state, the version tests in the vmstate_esp VMStateDescription and
> esp_post_load() become confused causing the migration to fail.
> 
> Fix the ordering problem by moving the setting of mig_version_id to a common
> esp_pre_save() function which is invoked first by both sysbusespscsi and
> pciespscsi rather than at the point where ESPState is itself serialised into the
> migration stream.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1922611
> Fixes: 0bd005be78 ("esp: add vmstate_esp version to embedded ESPState")
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp-pci.c     | 1 +
>   hw/scsi/esp.c         | 7 ++++---
>   include/hw/scsi/esp.h | 1 +
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index c3d3dab05e..9db10b1a48 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -332,6 +332,7 @@ static const VMStateDescription vmstate_esp_pci_scsi = {
>       .name = "pciespscsi",
>       .version_id = 2,
>       .minimum_version_id = 1,
> +    .pre_save = esp_pre_save,
>       .fields = (VMStateField[]) {
>           VMSTATE_PCI_DEVICE(parent_obj, PCIESPState),
>           VMSTATE_BUFFER_UNSAFE(dma_regs, PCIESPState, 0, 8 * sizeof(uint32_t)),
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 3b9037e4f4..0037197bdb 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -1089,9 +1089,10 @@ static bool esp_is_version_5(void *opaque, int version_id)
>       return version_id == 5;
>   }
>   
> -static int esp_pre_save(void *opaque)
> +int esp_pre_save(void *opaque)
>   {
> -    ESPState *s = ESP(opaque);
> +    ESPState *s = ESP(object_resolve_path_component(
> +                      OBJECT(opaque), "esp"));
>   
>       s->mig_version_id = vmstate_esp.version_id;
>       return 0;
> @@ -1127,7 +1128,6 @@ const VMStateDescription vmstate_esp = {
>       .name = "esp",
>       .version_id = 5,
>       .minimum_version_id = 3,
> -    .pre_save = esp_pre_save,
>       .post_load = esp_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_BUFFER(rregs, ESPState),
> @@ -1317,6 +1317,7 @@ static const VMStateDescription vmstate_sysbus_esp_scsi = {
>       .name = "sysbusespscsi",
>       .version_id = 2,
>       .minimum_version_id = 1,
> +    .pre_save = esp_pre_save,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT8_V(esp.mig_version_id, SysBusESPState, 2),
>           VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 95088490aa..aada3680b7 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -157,5 +157,6 @@ void esp_hard_reset(ESPState *s);
>   uint64_t esp_reg_read(ESPState *s, uint32_t saddr);
>   void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val);
>   extern const VMStateDescription vmstate_esp;
> +int esp_pre_save(void *opaque);

Reviewed-by: Thomas Huth <thuth@redhat.com>

Which tree should this patch go through? Your Sparc tree? Migration? Scsi? 
Trivial?


