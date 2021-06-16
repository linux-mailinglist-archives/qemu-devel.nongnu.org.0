Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79A3A9C51
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:42:43 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVoZ-0002Cv-1y
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltVna-0001Sy-Bt
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:41:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltVnY-0002vD-Pg
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623850899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8D1v+X/cCUOku5NcuoPLTH9+625M4TuWue4VYK/Lzo4=;
 b=GV+d3/eTQweRMANLLS+q5qh3IpxhguqGn7CBk/m1NUQboV9mpAX6sCJiVlMxrY44ECxe23
 Xgd35PimdA37K9jbBlxRNBruzJdcMbVc75WYLMH+et5bmR6aIgrdKOKF00KBoP5OLPUJA9
 TvaKDWlbuB9Ao2aIX/xEsm7K3FvziIQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-RKfUdZuXOM2VzRFjwq753w-1; Wed, 16 Jun 2021 09:41:38 -0400
X-MC-Unique: RKfUdZuXOM2VzRFjwq753w-1
Received: by mail-ed1-f72.google.com with SMTP id
 df3-20020a05640230a3b029039179c0f290so1048085edb.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8D1v+X/cCUOku5NcuoPLTH9+625M4TuWue4VYK/Lzo4=;
 b=AXZaCF7hzF5bfe0Y6dBS3oi7uccpHQq60eygzO76FSTr3W3Qdw+eeVm+7Kdln++Oyw
 YNAIAubST7tfrlCC6HrIceaMY9hJYmqiq24iUwbKZ0CvPMYmDzUqdxPH3HEY3GONkGge
 6I7dsvtKMLFyWV1LwGDdMRlD3El617SfCfRydkRqpcBrZ9DM9P1BXbap8v3ARnQsj8b/
 BRzLNfvG5FOhL3X58eO0P3EZI9j+cU4wcVyD+GIX4Ps+zKYOOAjYhqZvV23txxAJX8Kr
 sWm4nhiJZ0MxbvumHiKlvF3wMhFTYcx/OrpxV00HXvwCp+8wiDSpVxKBoUh1OJxzCrT5
 sMYQ==
X-Gm-Message-State: AOAM532ncuXXv/z6SFQe46AuZA7nG4yMwDHiV+/SFCFKMgCmp41ZWCoc
 O4a9ZLrDs9vbl6h4ND0Xmc0MHPoCfp7/pSgJyfAntg5ETjvexGwX/A0+GKle58FIqFjG9iC2uYN
 /nRHDaZEyG409TiI=
X-Received: by 2002:aa7:ca50:: with SMTP id j16mr4283846edt.158.1623850897276; 
 Wed, 16 Jun 2021 06:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCHqWSw90UxenKgbXRGlxLt9tvDzG/TLj5RL7fC0oWt3detRycEW9HsjbfDJ4Dk5YC68w00A==
X-Received: by 2002:aa7:ca50:: with SMTP id j16mr4283819edt.158.1623850897074; 
 Wed, 16 Jun 2021 06:41:37 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 kf3sm1749651ejc.8.2021.06.16.06.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:41:36 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] virtiofsd: Allow using file handles instead of
 O_PATH FDs
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210611191925.GA767764@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ddc46d6a-70c0-5d5e-c704-514be7a3c014@redhat.com>
Date: Wed, 16 Jun 2021 15:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611191925.GA767764@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.06.21 21:19, Vivek Goyal wrote:
> On Wed, Jun 09, 2021 at 05:55:42PM +0200, Max Reitz wrote:
>> Hi,
>>
>> v1 cover letter for an overview:
>> https://listman.redhat.com/archives/virtio-fs/2021-June/msg00033.html
> Hi Max,
>
> What's the impact of these patches on performance? Just trying to
> get some idea what to expect. Performance remains more or less
> same or we expect a hit.
I definitely expect a hit if you just benchmark the right way. Having to 
open FDs all the time (for metadata operations) will have an impact 
(when you do lookups all the time, or open files and close them 
immediately). How much of an impact, that’s completely up to the 
filesystem’s open_by_handle_at() implementation, I presume.

I don’t expect it to be significant for real-world use cases, though. 
When really doing I/O, there should be absolutely no difference, because 
then we’re operating with these FUSE handles that have actual (non-path) 
FDs attached to them.

Max


