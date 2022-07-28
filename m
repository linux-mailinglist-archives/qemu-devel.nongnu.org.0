Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6D5838F1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:43:22 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxEu-0007Nl-JS
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGx0m-0005oe-UJ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGx0k-0005fj-8u
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658989721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Q1teLH/HLAd1reF3KAmeZsdWZVp/JOFEgJjUq3ahes=;
 b=FL9b+fqPf6tT4uKYQoKGh8URuFubJ8CWPmkSf++kknRGoDeYQSPWfLzmHMBr1gI0FllBwI
 B7Bc+ILlAbNSILWqmEt5z1xpE3fk94+uTOWFK25T09oN1kbi6bldt+vMl4B+h5/kluzt+4
 zH/KTf/paLhiJSx+dv+5+D83KTc69/M=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-Tx8uPFWxMAGNjeP5mOZ1NQ-1; Thu, 28 Jul 2022 02:28:38 -0400
X-MC-Unique: Tx8uPFWxMAGNjeP5mOZ1NQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 d185-20020a6236c2000000b0052af7994d56so514431pfa.16
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Q1teLH/HLAd1reF3KAmeZsdWZVp/JOFEgJjUq3ahes=;
 b=b18/yLxOLMkaughinL07TM//oYs4Dw48NfJ3Q5rkreATjowYQyi8QjSe6ps+17gbGU
 fr+liuVggXHDA++gmpkEuMw2JUqFHB0dTIsA76bzwplAXBb3SvV2mD7UWpUspSid3qC5
 YCx4nL22ObBkiv2X0NmqqWMjQsPRMXsXIst8GmKouYkyptlIA/20+ARKL1tQfEurv/KY
 oC/vnLvwWOZ6uCqwGHgSHL7W83QXZtONfrF42JF1FTzlVIH0R07fvGGZoaVajLptwfov
 ehJA2EWgrAAZ55cKnR5MVCnmboYEIXbC+HeVQSqFLMEbDLaKvXGaOOsDI0Q3ouhCTsyu
 TObw==
X-Gm-Message-State: AJIora9jR7SdRbH8KMeQPI5KBxkNyLSJZxfeGV6SZm2fNVV7wIt3vHjt
 6KULu1v/TESMgYWLzT6ESn0A7A/Ywkd6xYcDtR3xIreAxII2hreJuUsS0rCCBNiHa6ZjUo4jHgM
 XrNiNaPLuc22GKz0=
X-Received: by 2002:a17:90b:4a04:b0:1f2:79e7:72ef with SMTP id
 kk4-20020a17090b4a0400b001f279e772efmr8952754pjb.152.1658989716936; 
 Wed, 27 Jul 2022 23:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsjQNUlVUphzG3T8oFTn21bLTGFyydGvtKT+yLeWKFFbsO4cDjVKbmBgYILkE4TCQZgOC7MA==
X-Received: by 2002:a17:90b:4a04:b0:1f2:79e7:72ef with SMTP id
 kk4-20020a17090b4a0400b001f279e772efmr8952712pjb.152.1658989716430; 
 Wed, 27 Jul 2022 23:28:36 -0700 (PDT)
Received: from [10.72.12.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a170902a38a00b0016bdf0032b9sm255866pla.110.2022.07.27.23.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:28:27 -0700 (PDT)
Message-ID: <ea3f8ab9-bd7d-a351-7823-cfad21f12274@redhat.com>
Date: Thu, 28 Jul 2022 14:28:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 09/21] hw/virtio: fix vhost_user_read tracepoint
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-10-alex.bennee@linaro.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726192150.2435175-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/27 03:21, Alex Bennée 写道:
> As reads happen in the callback we were never seeing them. We only
> really care about the header so move the tracepoint to when the header
> is complete.
>
> Fixes: 6ca6d8ee9d (hw/virtio: add vhost_user_[read|write] trace points)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-user.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index a96a586ebf..b7c13e7e16 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -296,6 +296,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
>           return -EPROTO;
>       }
>   
> +    trace_vhost_user_read(msg->hdr.request, msg->hdr.flags);
> +
>       return 0;
>   }
>   
> @@ -545,8 +547,6 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
>           }
>       }
>   
> -    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
> -
>       return 0;
>   }
>   


