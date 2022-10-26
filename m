Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2245D60E25D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:42:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongcO-0000QI-0K; Wed, 26 Oct 2022 09:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ongcJ-0000FZ-3H
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:38:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ongcH-0000Up-H1
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:38:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1613406wmb.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KqyjZIAdyRWNH0fej2C/fxbu+h3V2hClhXIiAquQo+E=;
 b=DB6hyl1hbNy8REj+Dk1vOmFDfqojiRSNgI40A/0dj89d75bcpOfQbxO/MYWuxafGKe
 pRCHxadWBJlaDZ/CjFOZbUSGYfjZyIjTrrjiA6V9FkFMrA4ZNV1LPDRFWZdvLq/7DjRp
 0he8LiIkWJEHxV8SAxLkYYrGGweH5nlB0yA3HJTGnMOOw2gcKwm+IFxBSMc38mSskqX+
 H9m9OSEO/CfVW6qGsyICqWgqx2QiGnpu+uIJLt/hWi1MmNgkF5YDkozu26Z+VA3mSqAK
 h/BW42JuzxWuLaMBmQ6Wi26NXRtt+K3DXM9qlFevdKgeeA/iE7/SF09QuJ6BpqUtNT0E
 oUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KqyjZIAdyRWNH0fej2C/fxbu+h3V2hClhXIiAquQo+E=;
 b=8OffUY9e0S3jz5z+RdKBuUk9c6f+4MN8X31e64pVAn0e1rQUunoGDiWyznEJzFizO/
 rhvSbcGI1grxouZ5V2GE1F3/Vvuii0wVnoOMxiPoyKOYpd4wLdn1LkMedSKch+TqZl6+
 vx1Y0EsW0pEDHmFMTDHA9i95zLJZWLrLuQKqnQkr4Z70rUE67PV4wq0uwAZtwM3M6Yw9
 WeJSl6uiL92WMZW7pDYpATzdwIj9YTDSR/GEUFMg0i9ffP6ZWzRO4XWFevoh8BjyEN5y
 xqFG1pieh4ikoiL7dATQhiB4WO7rlRgS7UGdi7SeqBFB8nswalDzQRQ9ac4zSQOw0GtF
 INUA==
X-Gm-Message-State: ACrzQf3SrFM4s/U8R4RarxFCHV3oBet5GnEZ870BZx6tHHDx9EA1pDeX
 mA7jef5c39XWJdF3aSsv6T53jw==
X-Google-Smtp-Source: AMsMyM5Q3ODYxvUlI4EKKQvh2qvKsoxeGTOhyf8KMng35XrV4KiL31BZjpCyAibvBWgG/nhrWbMeSg==
X-Received: by 2002:a05:600c:1906:b0:3c6:f154:d4b5 with SMTP id
 j6-20020a05600c190600b003c6f154d4b5mr2508748wmq.94.1666791523301; 
 Wed, 26 Oct 2022 06:38:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4c979e6bcsm2081898wmq.10.2022.10.26.06.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 06:38:42 -0700 (PDT)
Message-ID: <c64e1314-9786-1489-3044-d76eef66cf27@linaro.org>
Date: Wed, 26 Oct 2022 15:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] virtio_net: Modify virtio_net_get_config to early
 return
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-2-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026095303.37907-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26/10/22 11:53, Eugenio Pérez wrote:
> Next patches introduce more code on vhost-vdpa branch, with already have
> too much indentation.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/net/virtio-net.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


