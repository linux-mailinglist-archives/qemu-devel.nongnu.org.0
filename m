Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973E70277D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:45:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTpk-0005R7-Mq; Mon, 15 May 2023 04:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyTpc-0005QG-BL
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyTpa-0004uG-Pc
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684140321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThsH3eZWydy7SHoW+HsZa+OVV3PhUhVxfFPP0wBoWrA=;
 b=Q2XW8Pdkg1uFOAKUxEJrv2QTKA0S5xlc9Xh58XYD5oZd3FqXY3OBN4w9iwYyX7gtctwUyA
 JF1lvWJVfwxJHA+Ux9eEBXFuCorHIQ9EfXqI7+y3f10+UX5JOgS+CKUXMwU8YJnccSpyl1
 RyPBpfZqV9UmtK6qq0er1Muc8W4QR4A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-z7UfXjivMPKUS5BuEYWWWA-1; Mon, 15 May 2023 04:45:20 -0400
X-MC-Unique: z7UfXjivMPKUS5BuEYWWWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f348182ffcso74900865e9.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684140319; x=1686732319;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ThsH3eZWydy7SHoW+HsZa+OVV3PhUhVxfFPP0wBoWrA=;
 b=FwS4J8Co7klUrGAun1oSOTaZ0IYVJL5mxH76bX+GMq79YhfkcdDcrRaPnKgNqyJjR0
 F2V4nPxrGWi7ewmv7g99gCVlYWSK4yZNa5tG2JnQ5M5T354ktWYsfsZ3XzGwfShPSrvK
 LtjU6nUg++6lDDzRNKaa7QIcpE7mhDZAhLDIMA5XqV8QPWnLE8SwwLxP7OHxH25tgWE2
 r0LW0+m688ryta0pybdT2Q7C9ib2VxRg14OYfIfvpdv8FOk7dJLAXtTvXlOup6TX3eYI
 +v7hcdZB2vtiMArAI2VUXWj3XVydjB9/RbkyI/nMT0IZZYgYtp4HqllEun5iBu1IKEhX
 VGLQ==
X-Gm-Message-State: AC+VfDxBz8xty3emLk8T9F2tf+UYTAIesqfy5aobxDq8kae6rqiGVRXE
 s3xyyjs8Yfw6aWt5oyLsMslxk5VptDbrY4oSSH4x5MVnDQ2KJzkFrl1ivYUiE+70Kk55/5UoPZb
 QT6B0342n2UI2sePuLhp6lDw=
X-Received: by 2002:a05:600c:2056:b0:3f4:2bbf:40a with SMTP id
 p22-20020a05600c205600b003f42bbf040amr14352635wmg.37.1684140319335; 
 Mon, 15 May 2023 01:45:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7B1PiP6msmmohrFnvnGAoSiEyz8kKATMoMRwNmWKuESJBKbBLOzWsgy/0pCFXWJBYDdqEJwg==
X-Received: by 2002:a05:600c:2056:b0:3f4:2bbf:40a with SMTP id
 p22-20020a05600c205600b003f42bbf040amr14352619wmg.37.1684140319045; 
 Mon, 15 May 2023 01:45:19 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-139.web.vodafone.de.
 [109.43.176.139]) by smtp.gmail.com with ESMTPSA id
 n18-20020adfe792000000b002f7780eee10sm31765686wrm.59.2023.05.15.01.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 01:45:18 -0700 (PDT)
Message-ID: <21d27dc8-0b8b-ae85-9dba-db4c8f13486c@redhat.com>
Date: Mon, 15 May 2023 10:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, nsg@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 mhartmay@linux.ibm.com
References: <20230510105531.30623-1-imbrenda@linux.ibm.com>
 <20230510105531.30623-2-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230510105531.30623-2-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 10/05/2023 12.55, Claudio Imbrenda wrote:
> Kernel commit 292a7d6fca33 ("KVM: s390: pv: fix asynchronous teardown
> for small VMs") causes the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl to fail
> if the VM is not larger than 2GiB. QEMU would attempt it and fail,
> print an error message, and then proceed with a normal teardown.
> 
> Avoid attempting to use asynchronous teardown altogether when the VM is
> not larger than 2 GiB. This will avoid triggering the error message and
> also avoid pointless overhead; normal teardown is fast enough for small
> VMs.
> 
> Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
> Link: https://lore.kernel.org/all/20230421085036.52511-2-imbrenda@linux.ibm.com/
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   hw/s390x/pv.c              | 10 ++++++++--
>   hw/s390x/s390-virtio-ccw.c |  2 +-
>   include/hw/s390x/pv.h      |  2 +-
>   3 files changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


