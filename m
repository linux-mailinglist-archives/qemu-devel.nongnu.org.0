Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0566604A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdr6-0005IO-JC; Wed, 11 Jan 2023 11:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pFdr3-0005DL-Qs
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:21:33 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pFdr1-0004Ng-9c
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:21:33 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b17so9788341pld.7
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qssX6qFQO9pQ1WVgqV6mHU2cqeM0SFWlUjNVaXN5s6s=;
 b=IuL6gqbk5lU5fF/HT2BuCEaM2pSbAk6TntHjR3nAi4zsexdXcHLlj/APwPDup24xXc
 6QfxfwvrHOy8EfCNXJrwb1JDN89ke71dkU+faSOF7dU+Fx+OQw9GsQ5rjZpZjIu7SaV8
 D11WFYb5NkM7bcgJxK54LXyzcnS3MgccPRQco1NijTo/ZNv/n3iWz3KiEQR6cnRCtFEt
 /qo89pcZ/t/bLzRJuYjRHG1ayp6YzwHLS3shmBM08FijIO/z9Tuo7QodPvJf8y53yZtG
 Dku7BYyTX8nnhunrwyq3h7t38o4273RCJxagPH0zoQ3cCWVemtHF63n6H21rKc1Sf+L3
 jS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qssX6qFQO9pQ1WVgqV6mHU2cqeM0SFWlUjNVaXN5s6s=;
 b=EEpW0qB1fS6Ymvjij1hl2LNUr88BQQhrylikq9k1RckimPyFqtEHIpLrEJ1onmkDMw
 A4NNJuO+RRhSibyNTYP9bb/o40zqy+qDM16qhCro4gh9uPnQnTJYMwNxkFWDKfYsV15y
 wwNJSA0su5YDY35KiFD0qA8y8+gzGcybo7U+RdnLm/5zE8UuFUxJLmKjL+sjHrhYJ+gY
 dQ99GdEJ6FfqOPjyQRHCFIoyj09hT6hSaCWH4kWr+YNMRTzEvn07+7MC+u3blW+oi5Qn
 rFHPf6/r1CSVHcT89DN/yk+o8SMzwm4GvD0ePZhsFucbJ+b5s1KUhMJ89BpGpt0asz9P
 tvcw==
X-Gm-Message-State: AFqh2kpfSbCMgZd3javwDKrcwLkz3uziCbbhdkloMyyaXiDovE5tiylG
 bvHek8in4eW2NWGN0h6MBnyAlg==
X-Google-Smtp-Source: AMrXdXs5V7z06qvGlGbsf4HuM+FsD9PKjHIT/sqb8GOi9XtLEEZgCIVa2tP2mNcl531yfeT3GqgLVQ==
X-Received: by 2002:a17:90b:2807:b0:219:5fc5:7790 with SMTP id
 qb7-20020a17090b280700b002195fc57790mr73909289pjb.16.1673454089595; 
 Wed, 11 Jan 2023 08:21:29 -0800 (PST)
Received: from [10.255.193.65] ([139.177.225.235])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a63ec10000000b004b1b9e23790sm6115009pgh.92.2023.01.11.08.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:21:29 -0800 (PST)
Message-ID: <26114701-2d32-136d-ca44-01048c61842d@bytedance.com>
Date: Thu, 12 Jan 2023 00:21:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Questions about how block devices use snapshots
To: Kevin Wolf <kwolf@redhat.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
 <e5433b9c-12c1-bfff-a3a5-878b47a86bab@bytedance.com>
 <Y77IajRLJOC6ohih@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y77IajRLJOC6ohih@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Kevin,

Can I ask again how base.img + diff.qcow2 can be re-merged into one 
image via qemu-img or hmp command when modified.img is discarded?

Regards

Zhiyong

On 1/11/23 10:32 PM, Kevin Wolf wrote:
> Am 11.01.2023 um 08:55 hat Zhiyong Ye geschrieben:
>> Hi Kevin,
>>
>> Thank you for your reply and detailed answers.
>>
>> In my scenario is the iSCSI SAN environment. The network storage device is
>> connected to the physical machine via iSCSI, and LVM is used as the middle
>> layer between the storage device and the VM for storage management and
>> metadata synchronization. Every VM uses both raw and qcow2 formats, with the
>> system disk being qcow2 and the data disk being raw. Therefore block devices
>> need to support snapshot capability in both raw and qcow2 store methods. In
>> addition, snapshot images should also be stored in iSCSI storage, which is a
>> block device.
>>
>> Both internal and external snapshots can implement snapshots of block
>> devices, but they both have their drawbacks when multiple snapshots are
>> required.
>>
>> Internal snapshots can only be used in qcow2 format and do not require
>> additional creation of new block devices. As you said, the block device has
>> much more space than the virtual disk. There is no telling when disk space
>> will be full when creating multiple snapshots.
>>
>> External snapshots require the creation of additional block devices to store
>> the overlay images, but it is not clear how much space needs to be created.
>> If the space is the same as the virtual disk, when there are multiple
>> snapshots it will be a serious waste of disk space, because each time a new
>> snapshot is created the previous one will become read-only. However, if the
>> disk space created is too small, the snapshot data may not be stored when
>> the disk space is full.
>>
>> The problem with both is the uncertainty of the space size of the block
>> device at the time of creation. Of course, we can rely on lvm's resize
>> function to dynamically grow the space of the block device. But I think this
>> is more of a workaround.
> 
> Yes, this is why I said it's challenging. oVirt uses resizing of LVs to
> achieve this, and it's still very complex. You need to decide yourself
> if you think implementing the management software for this is worth it.
> 
>> It is mentioned in the Qemu docs page under "QEMU disk image utility" that
>> the qemu-img rebase can be used to perform a “diff” operation on two disk
>> images.
>>
>> Say that base.img has been cloned as modified.img by copying it, and that
>> the modified.img guest has run so there are now some changes compared to
>> base.img. To construct a thin image called diff.qcow2 that contains just the
>> differences, do:
>>
>> qemu-img create -f qcow2 -b modified.img diff.qcow2
>> qemu-img rebase -b base.img diff.qcow2
>>
>> At this point, modified.img can be discarded, since base.img + diff.qcow2
>> contains the same information.
>>
>> Can this “diff” operation be used on snapshots of block devices? The first
>> snapshot is a copy of the original disk (to save space we can copy only the
>> data that has already been used), while the subsequent snapshots are based
>> on the diff of the previous snapshot, so that the space required for the
>> created block device is known at the time of the snapshot.
> 
> Yes, you can use raw block devices for both base.img and modified.img.
> But of course, the result is still a qcow2 file that you need to store
> somewhere.
> 
> Kevin
> 

