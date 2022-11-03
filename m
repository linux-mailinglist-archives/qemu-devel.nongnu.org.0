Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2836185BE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:06:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdf2-0004Dy-Eb; Thu, 03 Nov 2022 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqder-000447-1R
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdep-0008Bf-G2
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667495133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3i+PvMdXuMxHl7l4wqzUm3r5bHNm6/vfaS7htAHyf4=;
 b=gDdPw/MYzSpSxqyZh0gcrw2/JnnQAZ6mK6vR8ugYwhgKxyuXabKJy9thIYJO+zddpdiAwW
 blfDIG4SidVLUPPetOH5YnG7V7laajTh+SLzLoOrn0ZrKLcetW0mUjZypbtfejVLsmqysF
 Emd/PSCWh8SmCGLXVWyOO0D2d4mJQTc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-ydai7OM6MQ2_o9-aG0lsPA-1; Thu, 03 Nov 2022 13:05:30 -0400
X-MC-Unique: ydai7OM6MQ2_o9-aG0lsPA-1
Received: by mail-ed1-f71.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so1817851edb.22
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3i+PvMdXuMxHl7l4wqzUm3r5bHNm6/vfaS7htAHyf4=;
 b=6BugPeM6RP6ioeaAUYASQNVhRDeOTDn1lZICnzeG0hACEWuyQhZce5PUk75qA3FZ9R
 5S6juLpDPUVcyxGN+n6tpUdXf3UeK1GGtRI1C8Sr44aekedJHbT7DracwvFUY2UkxNvW
 byUg5ZWbwpWt2dd1C6OXHcVYplwWfCT+fW3kANfawC+IvV+WFP1838hj+bnksR4iCR+3
 iuLRwh0cYmehunDpg7icTh/EAaEuHu+hS31EFIYnkwsGUOYj1qIKQBmnLZMQzAQhFLIn
 62OT/9DhL30FR8sxORmI+OGurQEdUR7Yb5NDErmu7O1p0ef2E7uudg0e67IqvHuBiiHD
 cNNA==
X-Gm-Message-State: ACrzQf1MIaV93Fx2dbT8nvG1iXFW7PqTz0i3OuhkZluoPCshn/nif2Et
 qPHFeEhyPYQkt74ImEmRqzs1JIq0MkB0EMjzdsQRcqeYvdxJ/xcaZluuAXhjJCp2PYiXmgZlVsw
 gtl9qUDmP283CVyo=
X-Received: by 2002:a17:907:6d82:b0:7ae:2964:72bb with SMTP id
 sb2-20020a1709076d8200b007ae296472bbmr1435538ejc.404.1667495129159; 
 Thu, 03 Nov 2022 10:05:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50NE45L4DZ78HbmA2/dYJOwlh3UikQRNDhy4Y+S6mA6JUfMX4zY10oJxVn5+VUKJAMCFh5aA==
X-Received: by 2002:a17:907:6d82:b0:7ae:2964:72bb with SMTP id
 sb2-20020a1709076d8200b007ae296472bbmr1435513ejc.404.1667495128872; 
 Thu, 03 Nov 2022 10:05:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 d27-20020a170906305b00b007821f4bc328sm709207ejd.178.2022.11.03.10.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:05:28 -0700 (PDT)
Message-ID: <9086affd-d2ed-e2dc-35c4-d1fd8a3d9077@redhat.com>
Date: Thu, 3 Nov 2022 18:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/9] block: call bdrv_co_drain_begin in a coroutine
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-2-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221103134206.4041928-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 14:41, Emanuele Giuseppe Esposito wrote:
> -    for (i = 0; i < bs->quiesce_counter; i++) {
> -        if (drv->bdrv_co_drain_begin) {
> -            drv->bdrv_co_drain_begin(bs);
> -        }
> +    if (drv->bdrv_co_drain_begin) {
> +        co = qemu_coroutine_create(bdrv_co_drain_begin, &dco);
> +        qemu_coroutine_enter(co);
> +        AIO_WAIT_WHILE(qemu_get_aio_context(), dco.ret == NOT_DONE);
>       }
>   

Alternatively there should be no reason for drv->bdrv_co_drain_begin to 
wait at this point, because the device does not have any active I/O.  So 
you could also assert that the coroutine is terminated after 
qemu_coroutine_enter(), i.e. that dco.ret != NOT_DONE.

Since you need to respin, perhaps put it the above in the commit message 
in case this needs a change in the future; however your patch is simple 
and should indeed work, so

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


