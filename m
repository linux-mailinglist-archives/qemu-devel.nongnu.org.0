Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AE67342A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:06:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQO9-00058y-Gt; Thu, 19 Jan 2023 03:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pIQO7-00058Y-U4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pIQO6-0005h6-8A
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674117309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbUcJI6G5WcmqnB3GIlH0Z+AJ5n9Sy3+TAwAV05YXUs=;
 b=hnDQW5jJt9PgX+axW3v6aiPiImXeGWmGT85FUWWG2CC93BiVlFgrT/qikfzbD1kjH7af2P
 shi2T1AjriMaLtgmSlmaRTWmcvQbXdTM6bJBtuQ8CTe/qUiejTUfN7Gzz2MpeDx7c0YRsv
 X2wadIBjsYUqRzTNHN21uogqU3gtIOU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-5C-VTNBLP4mKbC2ws_7Upg-1; Thu, 19 Jan 2023 03:23:36 -0500
X-MC-Unique: 5C-VTNBLP4mKbC2ws_7Upg-1
Received: by mail-pj1-f72.google.com with SMTP id
 pa16-20020a17090b265000b0020a71040b4cso736375pjb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 00:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HbUcJI6G5WcmqnB3GIlH0Z+AJ5n9Sy3+TAwAV05YXUs=;
 b=Xa4LntmQGTM53wq8WOglOJACKCQAUXS0QbBg1GMjmrUuWP3PRfvKCbBgRTyAW1N4um
 1E+xKIhS8Eke16o4h4YXsjdVxKtn0FAwaiK09yBjZo1oA6aPDP3m1hlm3Fv18Tt9q0IE
 lbzUl7qgVBOdvmHmbQGkIrC4Cq4sBeTX6RWReWSSaz6psuOBqNxuB4KfaOPqdkqBXyOK
 1TAcrFSpJFflng22g+rFE8C3RvKnFyC0XqYth5u+ioY3Yr/4yZx173WWWBDyS4IFf7Gj
 aUfOy/kknFvOpvZLrXRssgRRSUeNquEen0lJIyiWC5b+B8hxDM8xz664ddy4fWv2l5oA
 e6PA==
X-Gm-Message-State: AFqh2kp5o17amHOPi4HyIvf3L4QzJ57K0kSwEay226Wr5MVS4AUVKYwu
 ja69yqGDOticXfy5c6JqNlu4tcLB7H9savHpK8f90fKPW0VGdyTRb9b6DWx0Ue62EpQ5WOHajOe
 qlUtb8N84gb9LqSU=
X-Received: by 2002:a17:902:eb44:b0:193:2bed:3325 with SMTP id
 i4-20020a170902eb4400b001932bed3325mr8867124pli.15.1674116615620; 
 Thu, 19 Jan 2023 00:23:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvAK12wFfyxTNdIM7nFMLWdyE54gUhA4mu+R8Y+9q21VbBfkMMgJ/0MCKo3Gg3f3qOnpzXeqQ==
X-Received: by 2002:a17:902:eb44:b0:193:2bed:3325 with SMTP id
 i4-20020a170902eb4400b001932bed3325mr8867110pli.15.1674116615321; 
 Thu, 19 Jan 2023 00:23:35 -0800 (PST)
Received: from [10.72.12.175] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a1709028d9500b001868981a18esm7061344plo.6.2023.01.19.00.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 00:23:34 -0800 (PST)
Message-ID: <fd67c019-5109-c79a-2ecb-7671dcea2ed3@redhat.com>
Date: Thu, 19 Jan 2023 16:23:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/net/can/xlnx-zynqmp-can: fix assertion failures in
 transfer_fifo()
Content-Language: en-US
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
References: <20230109091950.784235-1-cyruscyliu@gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230109091950.784235-1-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/1/9 17:19, Qiang Liu 写道:
> Check fifos before poping data from and pushing data into it.
>
> Fixes: 98e5d7a2b726 ("hw/net/can: Introduce Xilinx ZynqMP CAN controller")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1425
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1427
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>


Applied.

Thanks


> ---
>   hw/net/can/xlnx-zynqmp-can.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index e93e6c5e19..55d3221b49 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -451,6 +451,12 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
>       }
>   
>       while (!fifo32_is_empty(fifo)) {
> +        if (fifo32_num_used(fifo) < (4 * CAN_FRAME_SIZE)) {
> +            g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: data left in the fifo is not"
> +                          " enough for transfer.\n", path);
> +            break;
> +        }
>           for (i = 0; i < CAN_FRAME_SIZE; i++) {
>               data[i] = fifo32_pop(fifo);
>           }
> @@ -463,7 +469,8 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
>                * acknowledged. The XlnxZynqMPCAN core receives any message
>                * that it transmits.
>                */
> -            if (fifo32_is_full(&s->rx_fifo)) {
> +            if (fifo32_is_full(&s->rx_fifo) ||
> +                    (fifo32_num_free(&s->rx_fifo) < (4 * CAN_FRAME_SIZE))) {
>                   ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
>               } else {
>                   for (i = 0; i < CAN_FRAME_SIZE; i++) {


