Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A43BE3E6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:48:00 +0200 (CEST)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12Hn-000406-5m
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m12Fe-00021N-Bf; Wed, 07 Jul 2021 03:45:46 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m12FY-0001Nb-U8; Wed, 07 Jul 2021 03:45:46 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 467181FD49;
 Wed,  7 Jul 2021 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625643939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWaX1Ep0YCb5jLwnpKqZBsqecCMx6hngGZQJ4MsC8j8=;
 b=iCNK0H0vQ4Cgh+ZeYsn98i+zC8Ne3EVMI4JbNDrJgH4Pw828rwuinjUk1zIndRogCuHw0N
 d4BvYG+ChowNCf8dCVvb+SOdDeMjgaXXXMkrOOMpjbJAqdjRTDI9hsHeIsZhKzhi0DDhq6
 UbEmS9Id8Yb+aRqRfxEYf93qrqVmR44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625643939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWaX1Ep0YCb5jLwnpKqZBsqecCMx6hngGZQJ4MsC8j8=;
 b=lmy/UqJpMg7Z9rq4p0giwyVjVl3//8/nuwaJDa5tCvvoPGq7bDWxA1aXYd5a0aD7Xo8L50
 0LjSgBHOtDK+/sDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2854A1372D;
 Wed,  7 Jul 2021 07:45:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id da7WCKNb5WBeHQAAGKfGzw
 (envelope-from <hare@suse.de>); Wed, 07 Jul 2021 07:45:39 +0000
Subject: Re: [PATCH 2/4] hw/nvme: mark nvme-subsys non-hotpluggable
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-3-its@irrelevant.dk>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <12886d57-6973-2332-adc3-06f2e26b2810@suse.de>
Date: Wed, 7 Jul 2021 09:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706093358.1036387-3-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 11:33 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> We currently lack the infrastructure to handle subsystem hotplugging, so
> disable it.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/subsys.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> index 192223d17ca1..dc7a96862f37 100644
> --- a/hw/nvme/subsys.c
> +++ b/hw/nvme/subsys.c
> @@ -61,6 +61,7 @@ static void nvme_subsys_class_init(ObjectClass *oc, void *data)
>   
>       dc->realize = nvme_subsys_realize;
>       dc->desc = "Virtual NVMe subsystem";
> +    dc->hotpluggable = false;
>   
>       device_class_set_props(dc, nvme_subsystem_props);
>   }
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

