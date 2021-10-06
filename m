Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75B423A79
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:24:18 +0200 (CEST)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY39s-0003kb-Uf
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mY38g-00034x-NS
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mY38f-0000pF-Dt
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633512180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1O4rB9njXUosG38JSFJFR+Gf3Rm3tT2jLBKQIF7ij4=;
 b=gmOAfkgZ34oZHLI8JEU++fso9hQ/qNo4oUpTkGnBA95atquXmwjPE+BYCsX8DxRE+Emous
 7L2jV5IPZUiQthtTDtrsnB2VtvJ9UI26M3a+A6+1Qy+gtezivIwHgomG8Du9YAbSqlGes9
 Tt3kpUYKe7YeU1xngwzyBCwqx9htTbg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-fCKhe3rOOmq7glXOoYFZXw-1; Wed, 06 Oct 2021 05:22:59 -0400
X-MC-Unique: fCKhe3rOOmq7glXOoYFZXw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso1509800wru.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=V1O4rB9njXUosG38JSFJFR+Gf3Rm3tT2jLBKQIF7ij4=;
 b=OtVk4bz+kHNTmdfR98n6h1X6ImGPaOW+Xo+RB78HJgVywvfD6rUCPh5MjIQcETjYtN
 Iy+DpikhQRW7bxtE5nuNGX9Umah21MP1N0iAbJ041A8KdHThE94KIErGLKxxXhiteii3
 K9p55MjCqwhPf+rK8N3cNuSZ55nBWiGSmaD39y/njbm/4aMrHmoWWwQ8z8jNQ2vG1+5x
 bUrtGatKIPOT3ZJ3PKmfZYcCpBP68e2BVfsVC6Lxo4E/ARz/FIUzJTgTRcKcwYo59kSI
 Gk01dHjovI57wLFPMXkVYGYuSuvoBWnpyXg+3MNtY+IGtpYJ1IXfUaneEafuTGK2aZfs
 m6YA==
X-Gm-Message-State: AOAM533QYM2DkWJq1YnohH9nPk97tBprGpQFdiadkzv5sWku/ImE879+
 vzvcCZqzDGaDYf/xixZ52hooy5YwKC97f33O/OSNrqnoVNTsQ2ctPeI2+FFGROTtoUHDYvS5ICn
 dKR1lkNzBoyVGwTNdtfgX4FDVMl11kNmHiDdaOMbRKOwX8nv2xG03oWIMBWsiKMLQUA==
X-Received: by 2002:a05:6000:1052:: with SMTP id
 c18mr10861128wrx.294.1633512178422; 
 Wed, 06 Oct 2021 02:22:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywmwsrIZr/Ya/7WVDuWI3sXIKG71AU6MHPsjqsAofV26610YUrMTMoYPiCCugOV/DB1eHBfQ==
X-Received: by 2002:a05:6000:1052:: with SMTP id
 c18mr10861111wrx.294.1633512178244; 
 Wed, 06 Oct 2021 02:22:58 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.114])
 by smtp.gmail.com with ESMTPSA id u3sm4306494wmc.16.2021.10.06.02.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 02:22:57 -0700 (PDT)
Message-ID: <dcbc741d-019f-47a5-2d0b-1e145d492897@redhat.com>
Date: Wed, 6 Oct 2021 11:22:56 +0200
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

Any comment?

Thanks,
Laurent


