Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E436901AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1sH-0008FJ-Dh; Thu, 09 Feb 2023 03:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ1rP-00088u-Hl
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:00:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ1rN-0007Gr-42
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675929648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yr2PcjDIcbH4djd/yC/zum9DITHy2/yPLBUzLulYmQ=;
 b=iD0NusjhAneiAHMFMDc90e0zceOqUSjXHmgLnycac/sk9VJwTUKiihxtyYKfAS/n3YCYKB
 Lipi3+hRLvedszJj0GiF2J5VREezK/kzJpqPjOvgyBjsUQvNifpkadA/UJdhVJYxVmuxsO
 WaYvCYum80ec4qvyR7LuZ3pshYRKpsQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-rA-SqT0jOpOfpRKvx46ozw-1; Thu, 09 Feb 2023 03:00:46 -0500
X-MC-Unique: rA-SqT0jOpOfpRKvx46ozw-1
Received: by mail-qk1-f198.google.com with SMTP id
 x17-20020a05620a449100b00731b7a45b7fso779971qkp.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+yr2PcjDIcbH4djd/yC/zum9DITHy2/yPLBUzLulYmQ=;
 b=LY+DorP3jqFNkI+2qQsluV5oY+2YWNqiWFA2+HfY3x7whyBpArJoL+TRN+obcPSsRQ
 1/JfhSDlGB4+hHBA7eBbMIeAQ9UiCcFoWMDhJKmBkf5WEf3bBBPGCiGZmKIp5qO/+fIU
 9YlDkoQL6pTB0/QgAsXb19t1oW/OFx6CMH8IWOAV2Ka4y40vH2Jd+Co14Icapyj1w5La
 6ny5mBh476pJ7K9Sk8BfvGMJP7K7GX0sasqdJbq87C8m4g2+ihRmUn+OBuunc51sCAMd
 Jcng9BbEb75FchfpkHgBghZrCm6MTP8E6TBHDvpeugDbpykJYn5F3jK80i44yvzm4M3t
 clJQ==
X-Gm-Message-State: AO0yUKVXe124mvIv0E2CNbxvVWvOG9Er9Bb6PnTzbAl+YjoTqBEzWdZG
 NjsexGqUvJHIk/ANV2WuFSHNiOCZ9BFK+JKnAIeiXAvFKgo1qmSdvk1TeJrL4q1HAaghn8ccXlL
 BqJLXFjVx5vJ2DDQ=
X-Received: by 2002:ac8:5f85:0:b0:3b6:35a2:bb04 with SMTP id
 j5-20020ac85f85000000b003b635a2bb04mr18856365qta.7.1675929645993; 
 Thu, 09 Feb 2023 00:00:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8/oheNWSxdGutGsHfemr37nbB7Oolcxw/93bly04+lQAyksAvW8ftmdZ8cUidnf+hwGrPn2Q==
X-Received: by 2002:ac8:5f85:0:b0:3b6:35a2:bb04 with SMTP id
 j5-20020ac85f85000000b003b635a2bb04mr18856335qta.7.1675929645738; 
 Thu, 09 Feb 2023 00:00:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 f18-20020ac80692000000b003b9e1d3a502sm818179qth.54.2023.02.09.00.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:00:45 -0800 (PST)
Message-ID: <bd4c3e54-b603-562e-1694-e8da5e839590@redhat.com>
Date: Thu, 9 Feb 2023 09:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 03/12] tests/qtest: Add dependence on PCIE_PORT for
 virtio-net-failover.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208194700.11035-1-farosas@suse.de>
 <20230208194700.11035-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208194700.11035-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/02/2023 20.46, Fabiano Rosas wrote:
> This test depends on the presence of the pcie-root-port device. Add a
> build time dependency.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e97616d327..5c8b031ce0 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -73,7 +73,8 @@ qtests_i386 = \
>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>     (config_host.has_key('CONFIG_POSIX') and                                                  \
>      config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
> -  (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
> +  (config_all_devices.has_key('CONFIG_PCIE_PORT') and                                       \
> +   config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
>      config_all_devices.has_key('CONFIG_Q35') and                                             \
>      config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
>      slirp.found() ? ['virtio-net-failover'] : []) +                                          \

Reviewed-by: Thomas Huth <thuth@redhat.com>


