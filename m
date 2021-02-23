Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98A322D27
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:09:38 +0100 (CET)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZJh-0002gv-9P
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZEP-00068H-Tf
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZEO-0001CL-5x
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ll0MjT6QSLx5Uh/YjIWzWAHjWI8/JubZthIOf3Y2vMQ=;
 b=M5rFsn/ABE+dg1xMihwAaSx8Tci5UO4i1UrEhJGiV+qnvyrkMF2w/actPKlklRXOpdSx+n
 dB5XJrpB3awaXJIgn1LwqZ7HfVwpSjoMbThBwgSpwyLMm0kPiwcHZl2yt/qy4OfGcO3Rgl
 5ELZxnbpvn6ifInFpg/iGnxplCYzRfM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-oy0bgzTXMHyvtcun8yqe2A-1; Tue, 23 Feb 2021 10:03:33 -0500
X-MC-Unique: oy0bgzTXMHyvtcun8yqe2A-1
Received: by mail-ed1-f69.google.com with SMTP id h1so8059438edq.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ll0MjT6QSLx5Uh/YjIWzWAHjWI8/JubZthIOf3Y2vMQ=;
 b=Ey7ef6soyt2zLs2SDPt0iBRyiL6RRQ+EYy02suw1R5y3RwaRAkfpuNX3bEIH3yv7gC
 y11skKnOaqYLEoRXlkYHppCxpynV+EcxXQ/OJXwcjtV/zs68m6gz37iVxTBWwwjyGxd5
 Hq4wWsZ/rGcCTZsx85AzFFrKTXAVrFo9qfS908dszf+06uLcaK2UrsYcsFq94C8e9tMb
 KTwT8D0nEz11V+ethm4ks50wRUJHmkWqKCowFVZUE68P4E/PpKF3vAOajZIBB1JIbY9l
 mJ1qv5x6h1sFbNZk6KhUKQkhaTD0ys/+Lpwa+65a2yYpvMHilRWUAvnMIgV5Ns0bXOIj
 ZTJg==
X-Gm-Message-State: AOAM533k+FP51J4lC+YbkXgMr3V32ZqravxiHk6HKZwFGA4TvZ8ICCGG
 u27G4Rhtv0L5vqd5KTAEmhyZEPTZNP8XZ4Sa1cbCh/C36eXvWZR0UYEX+HweeJFq8YuJes+AESX
 crMP5di5IzlzYTgU=
X-Received: by 2002:a17:907:4cf:: with SMTP id
 vz15mr16056865ejb.39.1614092612436; 
 Tue, 23 Feb 2021 07:03:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFi/ysNZqK46z8NOdSey8UeiOD00HR6BExegeSXMTsmjb2JGCdVcUn6F2IF64LqfnwFAKyWw==
X-Received: by 2002:a17:907:4cf:: with SMTP id
 vz15mr16056845ejb.39.1614092612262; 
 Tue, 23 Feb 2021 07:03:32 -0800 (PST)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id u17sm14813564edr.0.2021.02.23.07.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:03:31 -0800 (PST)
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
 <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
 <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
 <a6f7de7a-72c3-a6c6-0a14-3e21a0cc833b@redhat.com>
 <24562156-457f-90b5-dcaf-c55fba1e881b@redhat.com>
 <adedbbe8-cf77-7ede-1291-a1d6f6082451@redhat.com>
 <82e6faad-7d45-0f37-eda5-aef42e353972@redhat.com>
 <1409acfe-86eb-a4db-b35a-b45f5c046a2e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f53e9c67-fc0f-d168-7ed9-77d866de7654@redhat.com>
Date: Tue, 23 Feb 2021 16:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1409acfe-86eb-a4db-b35a-b45f5c046a2e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 11:50, David Hildenbrand wrote:
> 
> 
> However, I do agree that the notifier should work with 
> MemoryRegionSection - this will make the "client" code much easier.
> 
> The register()/replay_populate() mechanism should consume a 
> MemoryRegionSection to work on, and call the listener via (adjusted) 
> MemoryRegionSection.
> 
> Maybe I'm even able to simplify/get rid of the discard_all() callback.

Good, thanks for trying and finding the best of both worlds.

Paolo


