Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA332BA49
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:56:39 +0100 (CET)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXbq-0003i1-Ld
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXaa-00032r-D9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:55:20 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:47581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXaY-0002xj-Ff
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:55:20 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6DnM-1lAwwH384O-006eC1; Wed, 03 Mar 2021 20:55:09 +0100
Subject: Re: [PATCH v2 34/42] esp: remove old deferred command completion
 mechanism
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-35-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e7f3b59e-d33c-ad6c-730a-be7fe6c4cd96@vivier.eu>
Date: Wed, 3 Mar 2021 20:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-35-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GfZKK0QxQU47Srz40cz7lOXHCtTH0+lQ+a/Ih5lMCNsoG6Nzldc
 bqREch6W36x8hkQ7TDFW0FHMItNeNzIzTNOwVPMO2hslyAGQLSkpGarTGUeHWaRHO07GBdZ
 XCu9NOSh8SN9/RkdNUDM7k8RssXZk64YTdUmmbLm5jnlEypRjVzdIGv29uELEvhGj4dDLfz
 rLIGkFmFd1ZKApfnA9xmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s8LU0DK4cX8=:lg03f5MrtVpdNP678vK2ar
 JlxpZRA5LlFRj2RxCvM7qcx4M3VJvd5O9oqMdtVHBbuhHLd/4OrdKtyVeYm/uFkWeeyNtpeVK
 PKY0Iq/1Ur6tTeic2T8Aj5sn8lBQNJG5t6EgrW1FzCvWzquqhYGCZ/4HAtKxLftfoe8nUki4+
 3gcnN80NyMwdj4k8OAdXBXaWrkj6za8MC7ZC+zO+2OlAT4x6QjmWjeTJAvBQsqnDM7Omnm3Sd
 EQB1BHaAUJ1h1k0E3WCzOHKRjVDYm+AuFxCFls4k6VW7nks5lHKbilIPQSPpVhRx5nOd04ezs
 gdiTlIPoXzOVZQTKe3oJRdZu7IaJe48NiYrssapSq/393JfjwsDwHccFTx+BfRWDokiZVkEzO
 LQGw9oUylcxJdHzUDJ1qo71TB9JFbWYcoUTNVRKXFlY4nDarrpBieSUSUr0JHE50hM8ZaQ+M7
 RN7Ttm9nDA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
> Commit ea84a44250 "scsi: esp: Defer command completion until previous interrupts
> have been handled" provided a mechanism to delay the command completion interrupt
> until ESP_RINTR is read after the command has completed.
> 
> With the previous fixes for latching the ESP_RINTR bits and deferring the setting
> of the command completion interrupt for incoming data to the SCSI callback, this
> workaround is no longer required and can be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 33 ++++++++-------------------------
>  include/hw/scsi/esp.h |  4 ++--
>  2 files changed, 10 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index ce6a7a1ed0..8b856155d1 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -574,8 +574,11 @@ static void esp_do_dma(ESPState *s)
>      esp_lower_drq(s);
>  }
>  
> -static void esp_report_command_complete(ESPState *s, uint32_t status)
> +void esp_command_complete(SCSIRequest *req, uint32_t status,
> +                          size_t resid)
>  {
> +    ESPState *s = req->hba_private;
> +
>      trace_esp_command_complete();
>      if (s->ti_size != 0) {
>          trace_esp_command_complete_unexpected();
> @@ -596,24 +599,6 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
>      }
>  }
>  
> -void esp_command_complete(SCSIRequest *req, uint32_t status,
> -                          size_t resid)
> -{
> -    ESPState *s = req->hba_private;
> -
> -    if (s->rregs[ESP_RSTAT] & STAT_INT) {
> -        /*
> -         * Defer handling command complete until the previous
> -         * interrupt has been handled.
> -         */
> -        trace_esp_command_complete_deferred();
> -        s->deferred_status = status;
> -        s->deferred_complete = true;
> -        return;
> -    }
> -    esp_report_command_complete(s, status);
> -}
> -
>  void esp_transfer_data(SCSIRequest *req, uint32_t len)
>  {
>      ESPState *s = req->hba_private;
> @@ -740,10 +725,6 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>          s->rregs[ESP_RSTAT] &= ~STAT_TC;
>          s->rregs[ESP_RSEQ] = SEQ_0;
>          esp_lower_irq(s);
> -        if (s->deferred_complete) {
> -            esp_report_command_complete(s, s->deferred_status);
> -            s->deferred_complete = false;
> -        }
>          break;
>      case ESP_TCHI:
>          /* Return the unique id if the value has never been written */
> @@ -951,8 +932,10 @@ const VMStateDescription vmstate_esp = {
>          VMSTATE_UINT32(ti_wptr, ESPState),
>          VMSTATE_BUFFER(ti_buf, ESPState),
>          VMSTATE_UINT32(status, ESPState),
> -        VMSTATE_UINT32(deferred_status, ESPState),
> -        VMSTATE_BOOL(deferred_complete, ESPState),
> +        VMSTATE_UINT32_TEST(mig_deferred_status, ESPState,
> +                            esp_is_before_version_5),
> +        VMSTATE_BOOL_TEST(mig_deferred_complete, ESPState,
> +                          esp_is_before_version_5),
>          VMSTATE_UINT32(dma, ESPState),
>          VMSTATE_PARTIAL_BUFFER(cmdbuf, ESPState, 16),
>          VMSTATE_BUFFER_START_MIDDLE_V(cmdbuf, ESPState, 16, 4),
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 3b69aedebe..5e68908fcb 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -30,8 +30,6 @@ struct ESPState {
>      int32_t ti_size;
>      uint32_t ti_rptr, ti_wptr;
>      uint32_t status;
> -    uint32_t deferred_status;
> -    bool deferred_complete;
>      uint32_t dma;
>      uint8_t ti_buf[TI_BUFSZ];
>      SCSIBus bus;
> @@ -57,6 +55,8 @@ struct ESPState {
>  
>      /* Legacy fields for vmstate_esp version < 5 */
>      uint32_t mig_dma_left;
> +    uint32_t mig_deferred_status;
> +    bool mig_deferred_complete;
>  };
>  
>  #define TYPE_SYSBUS_ESP "sysbus-esp"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

