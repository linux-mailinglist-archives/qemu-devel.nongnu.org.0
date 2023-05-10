Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56216FE215
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:04:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmIV-0003YY-TR; Wed, 10 May 2023 12:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjongsma@redhat.com>)
 id 1pwmIU-0003YP-1L
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:04:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjongsma@redhat.com>)
 id 1pwmIR-0006sb-Dq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAJ+tvglQp9KR3i//lq5Zu536Mcq74mpWDajBkAN90Y=;
 b=Ir8gFXPXIMbVPm7AMRngfZKJmWt6oMdIGAQrLdraaEMEDUb02qBb1P+3XtktEvgawZswN8
 LrUZ8KBGSz8KKe36Jbq4v20sYRnQKMJQUAaAtwIMDeEQQcNiJtR9tcu8Y8xfOc0HY+YigJ
 FXvMbLU+oFflwJaoQZbZxxSPnjJfH6c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-ePMUMqMFMM-bv31jXVuoAw-1; Wed, 10 May 2023 12:02:54 -0400
X-MC-Unique: ePMUMqMFMM-bv31jXVuoAw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61b78e49e99so37991106d6.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734574; x=1686326574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aAJ+tvglQp9KR3i//lq5Zu536Mcq74mpWDajBkAN90Y=;
 b=WXM+svJiuiwBi6FEVYVjjSNjtYjyAXiyaTSo7cuC0PcLdwYmczXAM2tnw616DDXIuk
 zdcXHX+Z5L63I+8+ZzBreCrtllAnWwbVuyxyCSgYBqLj0U8aNyFpeEoXIpnq9wf+13vG
 mh4FWqNK3bVG1dfOUPpHMMVF4HPK3cYTuH0AIy64nwFHjSswS30BScUAZvblDO2mb+z0
 F+clP6dBIKdejDQFJ3ah+Q5FIBuWcIAf6GW91/NNM8RokMRjJLHPk1LqpeXValqs3N9Q
 EMNxopOGBOd2DiO04e3RVE5goedb8kT3gVc25/Faj3JGsS/3aZWLYZxHDs1UiSxEIdWJ
 Q04Q==
X-Gm-Message-State: AC+VfDx137RAyo91oXd8rUHRBnb4i1rWr0vEAfnkaG+gDcK8rOIbEU1N
 UsZK3bViotLheN03jtpXBWwzGWYyvC6THCQYnjhA21rtqEXXsspDPBFFUru/jm3sNJxRMhl1hrQ
 Uc4+7B04s3aP/mbI=
X-Received: by 2002:a05:6214:5182:b0:621:3c2f:cc4a with SMTP id
 kl2-20020a056214518200b006213c2fcc4amr5996841qvb.28.1683734574453; 
 Wed, 10 May 2023 09:02:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Fc2X8M2Tjk6hiiEUtsakZJAyIT/UMAB07RXyxBdH0xBxbIbbhv4JBr85W4tq5m/SreVP58A==
X-Received: by 2002:a05:6214:5182:b0:621:3c2f:cc4a with SMTP id
 kl2-20020a056214518200b006213c2fcc4amr5996801qvb.28.1683734573967; 
 Wed, 10 May 2023 09:02:53 -0700 (PDT)
Received: from [192.168.0.245] (207-153-48-138.fttp.usinternet.com.
 [207.153.48.138]) by smtp.gmail.com with ESMTPSA id
 j7-20020a0cf507000000b0061b5dbf1994sm1595967qvm.146.2023.05.10.09.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:02:53 -0700 (PDT)
Message-ID: <600fa0d6-5c01-c8e9-54d4-6d2695e92015@redhat.com>
Date: Wed, 10 May 2023 11:02:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/2] block/blkio: add 'fd' option to
 virtio-blk-vhost-vdpa driver
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230504092843.62493-1-sgarzare@redhat.com>
Content-Language: en-US
From: Jonathon Jongsma <jjongsma@redhat.com>
In-Reply-To: <20230504092843.62493-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jjongsma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/4/23 4:28 AM, Stefano Garzarella wrote:
> v2:
> - added patch 01 to use monitor_fd_param() in the blkio module
> - use monitor_fd_param() to parse the fd like vhost devices [Stefan]
> 
> v1: https://lore.kernel.org/qemu-devel/20230502145050.224615-1-sgarzare@redhat.com/
> 
> The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
> 'fd' property. Let's expose this to the user, so the management layer
> can pass the file descriptor of an already opened vhost-vdpa character
> device. This is useful especially when the device can only be accessed
> with certain privileges.
> 
> Stefano Garzarella (2):
>    stubs/monitor: add monitor_fd_param()
>    block/blkio: add 'fd' option to virtio-blk-vhost-vdpa driver
> 
>   qapi/block-core.json |  6 ++++-
>   block/blkio.c        | 53 +++++++++++++++++++++++++++++++++++++++++++-
>   stubs/monitor.c      |  6 +++++
>   3 files changed, 63 insertions(+), 2 deletions(-)
> 


I mentioned this briefly off-list, but I'm following up here just to 
provide a bit more visibility. From libvirt's point of view, it is 
actually much easier if we could pass the fd via the existing 'path' 
parameter (using /dev/fdset/N as the path, for example) due to how we 
construct the commandline for qemu. So if I get a vote, I would 
definitely vote for that approach over adding a new 'fd' property.

Thanks,
Jonathon


