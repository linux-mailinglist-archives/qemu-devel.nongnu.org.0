Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4C60F0EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:11:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onx0K-0000am-GX; Thu, 27 Oct 2022 03:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwzc-0008Hd-RV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:07:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwza-0008Ps-85
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666854473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzlSbustRBXdIEjaq9f/m6rFA9wxNxqI6on8WVl0Hrg=;
 b=BFbO0POcSUEkR1wXL8KiHqQn4yqAaIAc2wLsmNw7s6Db2DFTm9FTdDQ62bhRqLkLZnk0mG
 SYVhUSUIu9SjqLujiOn1RCkcjuTYn+2+lNF94qVVFO1OklvbvxhsbtxQCtDlf9w8SKigrZ
 FVI9HmAbu8rBl6FQOIFV9Qv11MwWQq4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-d43HeJ6ZMIyfE3bIC0KaHg-1; Thu, 27 Oct 2022 03:07:50 -0400
X-MC-Unique: d43HeJ6ZMIyfE3bIC0KaHg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i67-20020a1c3b46000000b003cf4dbff2e4so46139wma.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 00:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzlSbustRBXdIEjaq9f/m6rFA9wxNxqI6on8WVl0Hrg=;
 b=QhmzcM4EtQTxgrHCat9SlZco7nzlVfO4O0pmuxy+KqZc0oANzFMC0JCHA7K6bD6v4h
 LWg5nQa1ytysnykv/Ha7ulHeQk+6aGDXjgVbXC48tTR0L281prdx/tvZD4Az6oAHvsXc
 HOUsFrIg9uMJ3/Lj6WJxBRsIaRTlGl9fyC9Phygj/jxChTIO7oImSyA3Wn293h1cEXJi
 a0qSsvLw8E2beLZC0F7Tm8JkODT9VqRbEUhznfmdy7cxXZdOgYIojkmNkXgl6gA40iu/
 LCfuA6XE7BjGA+YPCiNih8FtOHRZ80Po90T2h+SGKOrhmaXTPdUMhl43V/+I2e/VI3la
 j/Ug==
X-Gm-Message-State: ACrzQf2F9fWlsxirFhDFSMQc5MC7M9w9gyuf2EIGEbmkxTWACAhtpjhW
 ESHbK2UcvGPvCkDQKhQvws48KuE0aHE50yYEIabGTRaTGiSljN4ihpui+IzZOaj3w488OVqe8H/
 UmR5gdO7YOUomHJo=
X-Received: by 2002:a5d:524e:0:b0:236:6a61:3b92 with SMTP id
 k14-20020a5d524e000000b002366a613b92mr14899851wrc.328.1666854469042; 
 Thu, 27 Oct 2022 00:07:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GzC/YNYSdeSyoH57UzznsYbCBEqj6o3PnLanRIBJ+M3KLgKgVCnoBDJVmeIycYqkcHESdlA==
X-Received: by 2002:a5d:524e:0:b0:236:6a61:3b92 with SMTP id
 k14-20020a5d524e000000b002366a613b92mr14899838wrc.328.1666854468855; 
 Thu, 27 Oct 2022 00:07:48 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 bk13-20020a0560001d8d00b0023677693532sm410964wrb.14.2022.10.27.00.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 00:07:48 -0700 (PDT)
Message-ID: <4696fa2a-5714-c86b-a410-b34218b4a2aa@redhat.com>
Date: Thu, 27 Oct 2022 09:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 3/4] hw/display: fix tab indentation
Content-Language: en-US
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, vr_qemu@t-online.de,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <cover.1666707782.git.amarjargal16@gmail.com>
 <5cefd05b4d3721d416e48e6df19df18cb6338933.1666707782.git.amarjargal16@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5cefd05b4d3721d416e48e6df19df18cb6338933.1666707782.git.amarjargal16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/2022 16.28, Amarjargal Gundjalam wrote:
> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
> ---
>   hw/display/blizzard.c   |  352 ++++-----
>   hw/display/cirrus_vga.c | 1606 +++++++++++++++++++--------------------
>   hw/display/omap_dss.c   |  598 +++++++--------
>   hw/display/pxa2xx_lcd.c |  196 ++---
>   hw/display/vga_regs.h   |    6 +-
>   hw/display/xenfb.c      |  260 +++----
>   6 files changed, 1509 insertions(+), 1509 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


