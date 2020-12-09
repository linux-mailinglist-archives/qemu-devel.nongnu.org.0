Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0D2D4351
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:34:02 +0100 (CET)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmzbV-0000tF-W8
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmzaB-0008UO-Vn
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:32:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmza9-00015s-Uc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607520755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2V8YKEyLT6Zi/Ram3xH+SP1npoYxUgrz7bKGA3Dnkjw=;
 b=Nvwr5gn5Q52o0kHGwFFU+uPXwHgCikV6Oa3DnLf4t7QKQ4KVgTlj90O0EH9ZtJHZgL2bat
 OH0l7xuefMBDYdIi92tQPrRYjgsfoFlBUVkugQdyJ5MJD0LhL7bRij63ziFSYAkw19Aj3j
 WdlCUxSC2CmoA5zR0nCLlI8wwD6kuVY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-ayjTocBzMOiRF0C08j4XSg-1; Wed, 09 Dec 2020 08:32:34 -0500
X-MC-Unique: ayjTocBzMOiRF0C08j4XSg-1
Received: by mail-wr1-f72.google.com with SMTP id x10so674062wrs.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 05:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2V8YKEyLT6Zi/Ram3xH+SP1npoYxUgrz7bKGA3Dnkjw=;
 b=jFS9VlA3iuyKe2Qp1iHz4UXVWbcSNoe1HvzXdwfwAj9+naPXgt0MWD2fJnBpUxYT7L
 Hxyk9ZnfZ3IpioIswIkDyBgIiWjx0FESIP7S4TaTkIWB9TLAEazPt/UZcT6Nearyao2a
 WJiJnsUKmXgA8ccDKY/0ogEF4E8KTRFkD76majfBkJXWrEot/nkXe7G1RPkEwhXr05Q5
 TMntgTOKxB7IcxITbK9S+QtjN4plEvlM4kQT1+Fs44F0VqppwThA5RsNMMqf4kjDSyzH
 LAE1nNwzmgRW3Xp7W5ejMxWfryIRDBdlUeec8MTvFDoW1RgvyUcDrziQ4x/q6eBFanmM
 lSqQ==
X-Gm-Message-State: AOAM533epAldkpA/8kru/Pw+vh+J4gZ6c5Db/L7O6wiFg7eYSt694gQL
 sENIRN0wvfsBDEWvwWemYTrGtQAjLeUIP+exbh7Lm29dcJM+JC3kdwpCDYC1O6ggYzVCRWtXEqP
 E+UjbQHIKtwQFDP0g6BrToLu8UDg6n1zxSnvGjhgU8mXP/pMwrYGRedYM2TajvdWa
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr2831588wme.137.1607520752916; 
 Wed, 09 Dec 2020 05:32:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVhos3sgFoQTI0hA3QbgWM+ymvyyE4hiFUOxM9CLEM5aGWrwvufjg8H9wg4FeE1SYHP0KNKA==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr2831567wme.137.1607520752667; 
 Wed, 09 Dec 2020 05:32:32 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id r128sm3700503wma.5.2020.12.09.05.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 05:32:32 -0800 (PST)
Subject: Re: [PATCH 1/1] /hw/scsi/vhost-scsi.c: Fix a memory leak
To: ruc_gongyuanjun@163.com, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
References: <20201209115955.13191-1-ruc_gongyuanjun@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f16791af-4010-3d3e-9e51-ca53ee7496aa@redhat.com>
Date: Wed, 9 Dec 2020 14:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209115955.13191-1-ruc_gongyuanjun@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/9/20 12:59 PM, ruc_gongyuanjun@163.com wrote:
> From: yuanjungong <ruc_gongyuanjun@163.com>
> 
> close vhostfd before returning.
> 
> Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
> ---
>  hw/scsi/vhost-scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index 4d70fa0..9d12034 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -232,7 +232,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
>      /* Note: we can also get the minimum tpgt from kernel */
>      vsc->target = vs->conf.boot_tpgt;
>  
> -    return;
> +    goto clode_fd;

'close_fd' I presume? Please test your patch :)

>  
>   free_vqs:
>      if (!vsc->migratable) {
> 


