Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC42B0294
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:12:54 +0100 (CET)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9b2-0004Gv-Sa
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kd9Zo-0003f8-Bk
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:11:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kd9Zl-00086G-Aa
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605175890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3PjKOZDRoMgjQSPM6TWJyjQWUH2KzOpx3n/I6iRMIc=;
 b=fHodinwwOjdttYecjUSA4E06pT+otpE53tRVfZRJIFTrv4p64Q8iBqH2E07fotBHr4/7SS
 AgFo0/95ZwLx6Ya2DuhZTGTfSAT+EDMebqfBbir8X9ueaTmdQOdRbqVBlpV9BQYxYbqCB6
 GRGjHR6KFEpahQNhZ8O9F6tbyVCrR/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-nLQFPgHgPg2cW4QWCIi6Xg-1; Thu, 12 Nov 2020 05:11:29 -0500
X-MC-Unique: nLQFPgHgPg2cW4QWCIi6Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE6071891E96;
 Thu, 12 Nov 2020 10:11:27 +0000 (UTC)
Received: from [10.36.115.61] (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17A9C60C13;
 Thu, 12 Nov 2020 10:11:04 +0000 (UTC)
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
To: Peter Xu <peterx@redhat.com>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com> <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9d3b2512-08cd-c566-9783-5e4e7e49770d@redhat.com>
Date: Thu, 12 Nov 2020 11:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201020204443.GE200400@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Luiz Capitulino <lcapitulino@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.10.20 22:44, Peter Xu wrote:
> On Tue, Oct 20, 2020 at 10:01:12PM +0200, David Hildenbrand wrote:
>> Thanks ... but I have an AMD system. Will try to find out how to get
>> that running with AMD :)

I just did some more testing with the oldish GPU I have for that
purpose. Seems to work, at least I get video output that keeps
on working - did not try advanced things yet.

I use
-device vfio-pci,host=05:00.0,x-vga=on
-device vfio-pci,host=05:00.1

when adding "-device intel-iommu", I got

"qemu-system-x86_64: -device vfio-pci,host=05:00.1: vfio 0000:05:00.1: group 23 used in multiple address spaces"

... so I poked around the internet a bit and got it running with

-device intel-iommu,caching-mode=on \
-device pcie-pci-bridge,addr=1e.0,id=pci.1 \
-device vfio-pci,host=05:00.0,xvga=on,bus=pci.1,addr=1.0,multifunction=on \
-device vfio-pci,host=05:00.1,bus=pci.1,addr=1.1 \

Things still seem to be working, so I assume it works
(I guess ?!).

-- 
Thanks,

David / dhildenb


