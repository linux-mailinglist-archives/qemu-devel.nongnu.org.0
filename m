Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9B325190
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:38:17 +0100 (CET)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHmS-0001At-Si
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHjJ-0006wv-Ua
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHjI-00062X-Ba
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCXAEzY8RCFaVDTHNBiMY5q9ajIPO8IBvdlQIM21B9c=;
 b=OKJ11uw8ndBb/R8zvZCep5kf/RtHe9TD/ebURA6kaNKg7wbTEtSF92j14uHg+f7uepadf+
 tVcGLDaAkNXSv44zzq9joP9MCT9sxNnA3gcuUxa3/DNRzhBtfgbwekAD36UwjPCPURiFOs
 8Za4ZnpB/XbdTZSadl4DKy2EbS+Hgxw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-GWBt81TQPxqScrRKL0GYew-1; Thu, 25 Feb 2021 09:34:57 -0500
X-MC-Unique: GWBt81TQPxqScrRKL0GYew-1
Received: by mail-ej1-f72.google.com with SMTP id v10so2484640ejh.15
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kCXAEzY8RCFaVDTHNBiMY5q9ajIPO8IBvdlQIM21B9c=;
 b=jySGHfRqIy2HBSqOFEgkhn3vdtzlQL0h/34i8JYCkqrBseEvmbIiXIr+yJqnH7F/Xo
 6Fw4Qn4Ko9wGJNlu1RU7nr8mVbbkIbnZ7G0N67tTDuWN4YxjcHQFSfBHFDjulxnv5BwA
 yaORqPN/DAwyeaZMPojmlUPrm1+rl/8HnXO3NVn1J4xa8HOEYK5+cExMjrYUnPr68xIu
 86y7i5UZPhXk7nOpSBb8VTBIO+Bt/MaU/QRLA/NRhE+s0PrkSdb8xUUbXXqzPOhv3djI
 YRnhOfDOblOLEhKEEUbkELHSAeBX4yAR4wWR+INZe4q3TX+6crNqVI3/X3YqIcI2xKH7
 XAdA==
X-Gm-Message-State: AOAM530WJAigzAzxLfhelpiwtAlQSEQau7W6xjuxqBCB2apLjJfddNXZ
 7WR9iGOcW8f3cEa4zvoJBxUyj4yBNBddPesnkSQZbkGyxOl2laMy/gVdlsO9Fg9pZMKgP61dbt0
 vZFm196Cdp2cv0sE=
X-Received: by 2002:a17:906:4f8a:: with SMTP id
 o10mr2951959eju.484.1614263696689; 
 Thu, 25 Feb 2021 06:34:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT/xdz+Ru48Wa24eBdRu3JXj+q+Nm+Pg4P9xdHUHTu+tvq/dMgjBKgN22rtDMW+Qn+IVCfXQ==
X-Received: by 2002:a17:906:4f8a:: with SMTP id
 o10mr2951950eju.484.1614263696580; 
 Thu, 25 Feb 2021 06:34:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z19sm3715749edr.69.2021.02.25.06.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:34:56 -0800 (PST)
Subject: Re: [PATCH 4/6] msf2-mac: switch to use qemu_receive_packet() for
 loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-5-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <718b98dd-1c19-8d03-efd1-04d09f85613b@redhat.com>
Date: Thu, 25 Feb 2021 15:34:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-5-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 6:53 AM, Jason Wang wrote:
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/msf2-emac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



