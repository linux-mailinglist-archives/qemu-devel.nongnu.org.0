Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6172CD662
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:11:37 +0100 (CET)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoOW-000544-Gw
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkoK0-00030U-6c
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkoJu-0004h3-U4
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607000810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqWf1Ys/PmkWK/hY5ypgm4nm9Jb/7v7Hn17UodmOXPQ=;
 b=D9Y2jDYMrqHK3YcUmg1QM6lduIGvjchmocElvO7q3wPPsBs8LhNKLAxxj49gNESs7lTDkr
 kNu2TDzZB9qbexemNoSjYuqXcK1Kg5j3HFmuN6AvD41DH7JhS06URWt4DcKqjDXmOZvkSQ
 MIOsnwPbsxCHPvR0n6PGRfeMveKlWmM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-CWFkeNgpMXONF9kjcTFhXA-1; Thu, 03 Dec 2020 08:06:48 -0500
X-MC-Unique: CWFkeNgpMXONF9kjcTFhXA-1
Received: by mail-ed1-f69.google.com with SMTP id i15so917781edx.9
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 05:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bqWf1Ys/PmkWK/hY5ypgm4nm9Jb/7v7Hn17UodmOXPQ=;
 b=RNHXIfm3CBr0G9IWtuokuSG5/3gGoOJYvqnkM+Qpvl15y3D+UkUG1ydN4S1zoQhH7w
 Eu7aFDhti9cbZzOfOLxEOvzkUPMOOZchbL3HJWg3t0PCyW0BaVKrwMaCMJZ+7f9JQZ1i
 mYL+TyR2LEmqfcMUQuR/ObdXcRvNvy9wN2JwvTi9VCeztfHZxrK4pyG2PYocRetkFFSc
 DnWB8gapJBN4M5WsCQMEHSqRD2vnKEmUj8YuU8IU+zrNGij4mJLyJLtMgnjD5OuQHzTA
 fFEpZmvaEdCBsLiEBe9fQYvn74jXb+YerxjbSXIpjDqgaAEDyeV1BJlZ8jMCD3WrnGnV
 vVwQ==
X-Gm-Message-State: AOAM531IqA5Go5JlJjm6jUvBHXshLxGQc4BVP4icADZiU7fsr4z9gEtZ
 eXXD3qEnB87Rv6xOBisGeduTyZq8xFJRW9QaQI7UGEP8cK6ih3DTx1j7EUg4nrzqGRf5cHio41k
 xfCFn4iN/qteXma0=
X-Received: by 2002:a17:906:f8d4:: with SMTP id
 lh20mr2470140ejb.442.1607000807512; 
 Thu, 03 Dec 2020 05:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAPgPffs2QY/RmSM+gvc/l9tz+j3ztGbcQQv5W6tBwvpbKEUhRfEYHzptLNtoDedxFaR7ghQ==
X-Received: by 2002:a17:906:f8d4:: with SMTP id
 lh20mr2470107ejb.442.1607000807152; 
 Thu, 03 Dec 2020 05:06:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r7sm1135543edv.39.2020.12.03.05.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 05:06:46 -0800 (PST)
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201104173217.417538-1-mlevitsk@redhat.com>
 <f8bca3252524372460e5cffa75fdb8a0216bc7b4.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] SCSI: fix transfer limits for SCSI passthrough
Message-ID: <dc3ac255-b03f-41dd-29ef-af73997cd219@redhat.com>
Date: Thu, 3 Dec 2020 14:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f8bca3252524372460e5cffa75fdb8a0216bc7b4.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/20 13:49, Maxim Levitsky wrote:
> On Wed, 2020-11-04 at 19:32 +0200, Maxim Levitsky wrote:
>> This patch series attempts to provide a solution to the problem of the transfer
>> limits of the raw file driver (host_device/file-posix), some of which I
>> already tried to fix in the past.
>>
>> I included 2 patches from Tom Yan which fix two issues with reading the limits
>> correctly from the */dev/sg* character devices in the first place.
>>
>> The only change to these patches is that I tweaked a bit the comments in the
>> source to better document the /dev/sg quirks.
>>
>> The other two patches in this series split the max transfer limits that qemu
>> block devices expose in two:
>> One limit is for the regular IO, and another is for the SG_IO (aka bdrv_*_ioctl),
>> and the two device drivers (scsi-block and scsi-generic) that use the later
>> are switched to the new interface.
>>
>> This should ensure that the raw driver can still advertise the unlimited
>> transfer  length, unless it is used for SG_IO, because that yields the highest
>> performance.
>>
>> Also I include a somewhat unrelated fix to a bug I found in qemu's
>> SCSI passthrough while testing this:
>> When qemu emulates the VPD block limit page, for a SCSI device that doesn't
>> implement it, it doesn't really advertise the emulated page to the guest.
>>
>> I tested this by doing both regular and SG_IO passthrough of my
>> USB SD card reader.
>>
>> That device turned out to be a perfect device for the task, since it has max
>> transfer size of 1024 blocks (512K), and it enforces it.
>>
>> Also it didn't implement the VPD block limits page,
>> (transfer size limit probably comes from something USB related) which triggered
>> the unrelated bug.
>>
>> I was able to see IO errors without the patches, and the wrong max transfer
>> size in the guest, and with patches both issues were gone.
>>
>> I also found an unrelated issue in /dev/sg passthrough in the kernel.
>> It turns out that in-kernel driver has a limitation of 16 requests in flight,
>> regardless of what underlying device supports.
>>
>> With a large multi-threaded fio job  and a debug print in qemu, it is easy to
>> see it, although the errors don't do much harm to the guest as it retries the
>> IO, and eventually succeed.
>> It is an open question if this should be solved.
>>
>> Maxim Levitsky (3):
>>    block: add max_ioctl_transfer to BlockLimits
>>    block: use blk_get_max_ioctl_transfer for SCSI passthrough
>>    block/scsi: correctly emulate the VPD block limits page
>>
>> Tom Yan (2):
>>    file-posix: split hdev_refresh_limits from raw_refresh_limits
>>    file-posix: add sg_get_max_segments that actually works with sg
>>
>>   block/block-backend.c          | 12 ++++++
>>   block/file-posix.c             | 79 +++++++++++++++++++++++++++-------
>>   block/io.c                     |  2 +
>>   block/iscsi.c                  |  1 +
>>   hw/scsi/scsi-generic.c         | 32 ++++++++------
>>   include/block/block_int.h      |  4 ++
>>   include/sysemu/block-backend.h |  1 +
>>   7 files changed, 103 insertions(+), 28 deletions(-)
>>
>> -- 
>> 2.26.2
>>
> Very gentle ping on this path series.

Hi, I was waiting for a respin followin Tom Yan's remark to patch 1.

For patch 5, however, I prefer a minimal change because the existing 
code is trying to update the contents of the page even if the outcome is 
then truncated.

Paolo
Paolo


