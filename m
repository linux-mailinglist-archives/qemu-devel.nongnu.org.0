Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D23BEFF2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:59:42 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Clo-0004aQ-Oh
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1CkE-0003Qe-Ng
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1CkB-0002c1-CS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625684278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jglq8+VyyWzrkiJbZUJo6FJu+PaPASGqs1wk9nC/YZw=;
 b=AQucnC1ip9C77R0A6PDZkae52nyn5eP2VswZIgcnN0jLe+dWkeG9nrYlKUDjPre3Q3XqKe
 Ltn36ChAt+Uodzwnc5d5UIDjxRZ93UCV9bNrq32gPmMt2ViCgrFpEQhlj6VXhrB1W5ona/
 c66AEYr1EYGXD9AE+8tS0EnfXhCSxNU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-FDArRFbWPMiT5BFw7ic3qA-1; Wed, 07 Jul 2021 14:57:57 -0400
X-MC-Unique: FDArRFbWPMiT5BFw7ic3qA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so1084972wrq.21
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 11:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jglq8+VyyWzrkiJbZUJo6FJu+PaPASGqs1wk9nC/YZw=;
 b=PIRMsKhmt9KGXJ8f+o2nk2wQp0TrovIL/AgwZHfhXv63ALsZ9dFB27zNg3tQ7Uwkp7
 auLzvjEJD8yIJt0V+pz09UcekU1kXF0D0bQPAOvyG6SFqCGNeMvAJxnd2xDZ9TOaRHlr
 SSuNyD37Y5mxkW0+sD6xCb5mWpsPUUro+FsdVgsCJjVJAddYAWzrWJV5s3W5Jmv0K+FD
 n9Zj3/ItklMSAyxGj0YWKDuU7FRC2N6nWYtkXp/b5nJddJLEYA6Byw29lwryzvMdbvbd
 Pq4+4IRVrE462j3/rfQOZVwz0Rrvlm0WQe10O/4DoTxnpXSmPr2KKDC3elTK4eXP5Wdt
 ju4Q==
X-Gm-Message-State: AOAM5313I3/XlqVBJoqDgIK8kpUFkI4zlbhzkWpPCFaVAfYGzm3lFhBJ
 HWYvFEYXtLBtflcgEwwmfhY/WGGSymLpsMvFmyR8oT1nvJDu8qKZjtY39fdiUwjRP+KV4FShXA7
 tbHdM4OhfJoHk3hk=
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr585816wmc.170.1625684276087; 
 Wed, 07 Jul 2021 11:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRKnWmMwVwkXSP6CM6s96NUxglgPjXOkX+58D/frmPWdorm8Deo2b5GyvTaGzg0bbNAnyxaw==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr585797wmc.170.1625684275918; 
 Wed, 07 Jul 2021 11:57:55 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23579.dip0.t-ipconnect.de. [79.242.53.121])
 by smtp.gmail.com with ESMTPSA id b8sm7781452wmb.20.2021.07.07.11.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 11:57:55 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com> <YOXsTQoq6eeIR8B5@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
Date: Wed, 7 Jul 2021 20:57:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOXsTQoq6eeIR8B5@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 qemu-stable@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.07.21 20:02, Peter Xu wrote:
> On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
>> As it never worked properly, let's disable it via the postcopy notifier on
>> the destination. Trying to set "migrate_set_capability postcopy-ram on"
>> on the destination now results in "virtio-balloon: 'free-page-hint' does
>> not support postcopy Error: Postcopy is not supported".
> 
> Would it be possible to do this in reversed order?  Say, dynamically disable
> free-page-hinting if postcopy capability is set when migration starts? Perhaps
> it can also be re-enabled automatically when migration completes?

I remember that this might be quite racy. We would have to make sure 
that no hinting happens before we enable the capability.

As soon as we messed with the dirty bitmap (during precopy), postcopy is 
no longer safe. As noted in the patch, the only runtime alternative is 
to disable postcopy as soon as we actually do clear a bit. 
Alternatively, we could ignore any hints if the postcopy capability was 
enabled.

Whatever we do, we have to make sure that a user cannot trick the system 
into an inconsistent state. Like enabling hinting, starting migration, 
then enabling the postcopy capability and kicking of postcopy. I did not 
check if we allow for that, though.

-- 
Thanks,

David / dhildenb


