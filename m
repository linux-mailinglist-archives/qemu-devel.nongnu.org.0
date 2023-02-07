Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDE68D937
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNwC-0002rE-55; Tue, 07 Feb 2023 08:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNw8-0002r4-KO
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNw6-00036s-Ut
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675776182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y76DWHjFalG3jxSisOyNFsgLkx8dX1MmsD0tDa6CGiQ=;
 b=Kt81L3XXbzlFrOP+HO6pRxuCmo5jjj1RO4zuarmOohTT0Gvt8N8uMN8+H2lWlBdAUGzIvN
 rwavCfM4TWi4pjG4ezXU70OAA8IWdqd00otf+i7xQWQr4bPcpCfjfEpmjKmIBJDvnR05YM
 Tuy44bCYycBDkfM0ondOS9+ejnQd1M4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-A_SrptmhMCiimNBLmiKnMQ-1; Tue, 07 Feb 2023 08:23:00 -0500
X-MC-Unique: A_SrptmhMCiimNBLmiKnMQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 g2-20020ac870c2000000b003b9c8ab53e9so8405161qtp.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y76DWHjFalG3jxSisOyNFsgLkx8dX1MmsD0tDa6CGiQ=;
 b=m9OIh9M0F3qylAQE+aHkZteTQsf0RGN/1DSo81+ZFmPsnyDrf3rSaOKCFeIAkGQWfz
 hfCnEhk9yPbGBBgHQNb+d0l+3H71xXaR9tiUyfV8QU/7vD3Rg5raU/AQPfH6fGmpi5it
 bfpEmKBXilPKh8O2RDmXFke//FKjUX/hhZDOAEE2khIaXkcKN0KcQrsklT2FO/xQRyNR
 punul5+rg9rjbp0MgmjSW27LwI9mMlNV7w5Zgi5UBvZUszhJIRz2sXJtfBeED/U8M4Xe
 4N7bSbjQo+6ySxuq8jtCsEOrxRYHKEei3QdEOq2RXK1YEmy3pzY5XCgPR7xSM0i39A0g
 IGUg==
X-Gm-Message-State: AO0yUKU0G7JdfiW1OmMi7uZIBmwR5D8MEpg/cGqv9GnZTC97wesyJFno
 dBkzWYeYDRkn3ygOSvaUKorEa2w1Pa6pL7G5mV6bheaQFTp6kP7fbPemW+k3qLsZ3v1n4CfvGuN
 zfed+yzH0aK232Qo=
X-Received: by 2002:a05:6214:ace:b0:537:7f20:54b2 with SMTP id
 g14-20020a0562140ace00b005377f2054b2mr5521935qvi.40.1675776180374; 
 Tue, 07 Feb 2023 05:23:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/jkvBukSrcTGxmCZtMZl5bdYGPEISXDFzeZ0gQVtGAJQ9C2BOeZMquai+MRuX/vkzHcpYWeg==
X-Received: by 2002:a05:6214:ace:b0:537:7f20:54b2 with SMTP id
 g14-20020a0562140ace00b005377f2054b2mr5521909qvi.40.1675776180153; 
 Tue, 07 Feb 2023 05:23:00 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 bp41-20020a05620a45a900b00725d8d6983asm8324054qkb.61.2023.02.07.05.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:22:58 -0800 (PST)
Message-ID: <3392caa9-cb6f-572e-b9a2-8728d207acf2@redhat.com>
Date: Tue, 7 Feb 2023 14:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/12] tests/qtest: Add dependence on PCIE_ROOT for
 virtio-net-failover.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> This test depends on the presence of the pcie-root-port device. Add a
> build time dependency and a runtime check.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build           | 3 ++-
>   tests/qtest/virtio-net-failover.c | 5 +++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e97616d327..431b623df9 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -73,7 +73,8 @@ qtests_i386 = \
>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>     (config_host.has_key('CONFIG_POSIX') and                                                  \
>      config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
> -  (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
> +  (config_all_devices.has_key('CONFIG_PCIE_ROOT') and                                       \

CONFIG_PCIE_ROOT looks wrong ... hw/pci-bridge/meson.build uses 
CONFIG_PCIE_PORT instead, so I assume this is a typo?

Also, do we really need a run-time check if we already have a build-time check?

  Thomas


