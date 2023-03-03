Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879136A975B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:40:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4gT-0007Mh-T0; Fri, 03 Mar 2023 07:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY4gP-0007MH-9M
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY4gM-0003Pp-Qo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677847121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtGR+g6Uasqve/o0/6PzbaQm90yBQFs1+qUgY7Vjj6Q=;
 b=QXmg5DCC/5yGiFLHtYxszpLhb8YETbbMLp4rMo05V67ljAb+osIFcgiZm4UtAhfK+y5nlo
 X4AqQFePrl55jE62zjvsGOBwrSIJ0bXmY2J3yBvWGRKdsiBviPvCxKDE0NddvILJPGfRB6
 Vm3qwlvWSM8tSO9/byeEDZD/d59uC18=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-YamC9K1rOYqheJEX5SPKlQ-1; Fri, 03 Mar 2023 07:38:40 -0500
X-MC-Unique: YamC9K1rOYqheJEX5SPKlQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so875048wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtGR+g6Uasqve/o0/6PzbaQm90yBQFs1+qUgY7Vjj6Q=;
 b=U/KF8Ifo3ANj4gQrFKBc5oKtpXgE6LuGmnC3TqhfDH1iCf7oD95fhhanS2Yv9Zm+m4
 j2AKVhwMCAzYvDo0IYwE3LKM4B9klSxjrSeeIIZnEByxSofSS7RV5liKk/SAwxWDzU4X
 217ZyxJoBVLtazNY+s5cj3Af1PqeD2dh0Phe0bAnWDi4gaZbxlmdg1lm6mCLRCqjbGlO
 dA8SDWB+GI4PWdqtGCOrSNNFjveKNXe7Sw1DAV4VdNJklI0UNLMbJ2IXbIOvtO3pD8wx
 sH5CaDJkSF86P9NXOllj3Ba2XZ1hXL3t2fmjm5q9aiPmjy5MqqqSORWlMrPbVaBNf0RW
 hq/Q==
X-Gm-Message-State: AO0yUKUmTc/LfIprLTXexElIViIlv9p0ON/JXf2N6vbO6NUYRHqc7USk
 Ld2Z38LrQmEjcq2RrNS9AelOxuor5mdP7JtEuQHW4rVktU5ElawBdzT4RpMMLyHCJLKNnZvkOQ/
 6PGiJwKF6McuQV0s=
X-Received: by 2002:a05:600c:4447:b0:3ea:c110:55ba with SMTP id
 v7-20020a05600c444700b003eac11055bamr1438190wmn.18.1677847119286; 
 Fri, 03 Mar 2023 04:38:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+sZd8iRTZdSg7v/KJ2C/f0kDYz0s+EwXUKW9/iEItUB9XsbdbStBIt6vUYgE9YYYFna7JpZA==
X-Received: by 2002:a05:600c:4447:b0:3ea:c110:55ba with SMTP id
 v7-20020a05600c444700b003eac11055bamr1438177wmn.18.1677847119065; 
 Fri, 03 Mar 2023 04:38:39 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003dc49e0132asm6791380wmo.1.2023.03.03.04.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 04:38:38 -0800 (PST)
Message-ID: <9739da85-adf2-cf33-15c8-6107aaf6b814@redhat.com>
Date: Fri, 3 Mar 2023 13:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RESEND PATCH 1/1] pc-bios: Add support for List-Directed IPL
 from ECKD DASD
Content-Language: en-US
To: qemu-s390x@nongnu.org, jjherne@linux.ibm.com, frankja@linux.ibm.com,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: jrossi@linux.ibm.com, qemu-devel@nongnu.org
References: <20230221174548.1866861-1-jrossi@linux.ibm.com>
 <20230221174548.1866861-2-jrossi@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221174548.1866861-2-jrossi@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 21/02/2023 18.45, jrossi@linux.ibm.com wrote:
> From: Jared Rossi <jrossi@linux.ibm.com>
> 
> Check for a List Directed IPL Boot Record, which would supersede the CCW type
> entries.  If the record is valid, proceed to use the new style pointers
> and perform LD-IPL. Each block pointer is interpreted as either an LD-IPL
> pointer or a legacy CCW pointer depending on the type of IPL initiated.
> 
> In either case CCW- or LD-IPL is transparent to the user and will boot the same
> image regardless of which set of pointers is used. Because the interactive boot
> menu is only written with the old style pointers, the menu will be disabled for
> List Directed IPL from ECKD DASD.
> 
> If the LD-IPL fails, retry the IPL using the CCW type pointers.
> 
> If no LD-IPL boot record is found, simply perform CCW type IPL as usual.
> 
> Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>
> 
> ---
>   pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>   2 files changed, 148 insertions(+), 39 deletions(-)

  Janosch, Jason, Eric, Christian,

could you please help with reviewing + testing this patch?

  Thanks,
   Thomas


