Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E2435D5F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:52:27 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdToI-0007hl-4s
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mdTlz-0006Pp-60
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mdTlt-0005A6-QT
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KyhrvvOqmzpdFcqTyY9W/DvZnoRfuhJYBXezkRxzcQ=;
 b=YdQmTJjkgRQalw9gjHPUpBGMLcVJNUS6oJUYCXwuJGUVLYarMSBg26ieyVLwpD6nuAFOad
 CDzRX98LEnucvOVjPlC9OqHEqvDIjWgT2V0/XnfHDUumaflUWyi3CgY40j9BcZEdUqcyn4
 jUq23Fp6Dvh2fWDyUDBCpNS8JWoFZqI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-Mj0C_0deNc2NqvZIe4OGCA-1; Thu, 21 Oct 2021 04:49:55 -0400
X-MC-Unique: Mj0C_0deNc2NqvZIe4OGCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so11057523wrk.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 01:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=4KyhrvvOqmzpdFcqTyY9W/DvZnoRfuhJYBXezkRxzcQ=;
 b=WcuGqTb3Efd1g4zMindlzIG1nMNLQGiq0oRC6OnUAkMZNr33WaME8r4N7gmjzaQdrY
 pVwbYm3SXKNgYTp4WP3ykMXwe8gcui3bHPlWxuF21gyZXF/gcqu30OR94txR3y6QIZQG
 O1PoNGuj21hwxlDIAgLr3KJNtvn/rypVP3KrtspkJh0fWDmxo9Plyku12nc/9aYQ9fiv
 iO8NYmRbgw2sNNxGLlL2gQgTA5jvmgj/7vPs9VOkw0NIMz/SEUokCHDDTAfAgFh3MFzi
 rBZTnE5iOK85PywzVQt2S3GDzceqKqG4hGdRwVc6BRcVNhMvkyb0bTG/n4zU7UfbhgV7
 AnXQ==
X-Gm-Message-State: AOAM530pYLjO0CW/oqVDW7fM19DB3kDrEg6jtANl4jVeam5zIxh2Uwiz
 vWWCwjOCnFBsGAQxdWS9a6ZWTSOSnw653ZCTEoI5HW6YGtAdYVyl5S5G3agFGK4xrZaXkGcr4Hy
 aIJd0UzD6Hxg2g6cpd5rdoh98G2XvONLqJv7+F9EUlpLEkwmkEVku+jyfSEzvm7/cGw==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr19652628wmi.30.1634806194288; 
 Thu, 21 Oct 2021 01:49:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuUrd/Yn58utmo44/ssaqD1hgZoAZgWC0GiiwOJXT7zD0pcSP4kRBdyCaTogN+op9Os3WKMQ==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr19652596wmi.30.1634806193970; 
 Thu, 21 Oct 2021 01:49:53 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.24.54])
 by smtp.gmail.com with ESMTPSA id n17sm4138360wrq.11.2021.10.21.01.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 01:49:53 -0700 (PDT)
Message-ID: <aafd6d5f-4348-5f64-cfa2-b73277f34b1b@redhat.com>
Date: Thu, 21 Oct 2021 10:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
References: <20210929144311.1168561-1-lvivier@redhat.com>
In-Reply-To: <20210929144311.1168561-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/2021 16:43, Laurent Vivier wrote:
> As the guest OS is paused, we will never receive the unplug event
> from the kernel and the migration cannot continue.
> 
> The first patch is optional, it provides the error message to display
> to migration_cancel() rather than to have to call migrate_set_error()
> from the caller.
> 
> Laurent Vivier (2):
>    migration: provide an error message to migration_cancel()
>    failover: don't allow to migrate a paused VM that needs PCI unplug
> 
>   migration/migration.h |  2 +-
>   hw/net/virtio-net.c   | 10 +++++++++-
>   migration/migration.c |  9 ++++++---
>   migration/ram.c       |  3 +--
>   4 files changed, 17 insertions(+), 7 deletions(-)
> 

ping...


