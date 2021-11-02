Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C92443457
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:09:08 +0100 (CET)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxHX-0005XN-Ro
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhxFX-0002wO-CM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhxFS-0000Ye-Ft
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635872817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5f1aROOHmGmxO9L4qAiiWb4HOQiVRtGVkel0n8z5hxE=;
 b=QTAva8D7R34/JrN0W9LP/3WmlsNsslArnF6wUyGivowbRnOEKc+0M/rHeRCC0z8TIk9fDK
 VfCDKYzdhTQPHLZhrnF8ZUBpe1ZDVaHcNPvfvOufAt3rqfc0DuG8pifspwfxomW/nsmFRf
 /UQKzJklX8ZiOdyIKwXT6OCwlpnImjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-J-k_4fTuN4CPWxClphkOzQ-1; Tue, 02 Nov 2021 13:06:55 -0400
X-MC-Unique: J-k_4fTuN4CPWxClphkOzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1444671wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5f1aROOHmGmxO9L4qAiiWb4HOQiVRtGVkel0n8z5hxE=;
 b=PfwrzJeP+dUJO/E5kb0wZED8GAj03cVmLI3ehN6LrawkP+1NW2rFes/pKBrtSBTMr5
 S2msmFmYY0yovoOBibeb2FzR3z7r6j7/0RsXGZS2QAc8/2514h7Hmrgi8CefFr9dz6V/
 Chd54ZuV9xB1dgKhuyjCnDKb2nKM7fwsg/rn8ol+5WCZuJ7v0zwT8GaT8nMo5uDLJ2Q0
 BKvwYqcDDP4HxQZVrLzmdyhA7VSJ9hK4ZygwgQQFh1wUvKwOK0D1JI6rYBUlwtFWjJba
 Aq004jJRaElesVoPRcJuQ6rx1jCbJkcS8jISkYsb7gQY8zn18DD7hq1905lS/otvy/Th
 yJRA==
X-Gm-Message-State: AOAM533RJ91utDLTTdXZIEfYw+LN30SVEPSGKAB+jZaP6djS+rRaURjv
 8r0+/CwxRcba2LoJceHSX08/Fs8jc35+ZpahJ21OVwT2PGj4uXRPe/uIwA1HkebHO6kuvm4vKfF
 CRExVNq4uh/HqOYQ=
X-Received: by 2002:adf:a78a:: with SMTP id j10mr49135922wrc.231.1635872813236; 
 Tue, 02 Nov 2021 10:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0z8/+E7FcYfyTSiuQACsKHHYlN3r611H/q0OcqnK0JII+uefnl2mPw4mwH2uqt5RcH4Ronw==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr49135886wrc.231.1635872812956; 
 Tue, 02 Nov 2021 10:06:52 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id m34sm3369315wms.25.2021.11.02.10.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:06:52 -0700 (PDT)
Message-ID: <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
Date: Tue, 2 Nov 2021 18:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211102110043-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 16:04, Michael S. Tsirkin wrote:
> On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
>> As the guest OS is paused, we will never receive the unplug event
>> from the kernel and the migration cannot continue.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Well ... what if user previously did
> 
> pause
> start migration
> unpause
> 
> we are breaking it now for no good reason.
> 
> Further, how about
> 
> start migration
> pause
> 
> are we going to break this too? by failing pause?
> 
> 

TL;DR: This patch only prevents to migrate a VFIO device as failover allows to start a 
migration with a VFIO device plugged in.

Long Story:

* before this patch:

- pause and start migration and unpause-> fails if we unpause too late because we migrate 
a VFIO device, works otherwise
- start migration and pause before we unplug the card -> hangs forever
- start migration and pause after we unplug the card -> it works fine

* After this patch:

- pause and start migration and unpause-> fails if we unpause too late because of the new 
error checking, works otherwise
- start migration and pause before we unplug the card -> fails because of the new error 
checking
- start migration and pause after we unplug the card -> it works fine

Thanks,
Laurent



