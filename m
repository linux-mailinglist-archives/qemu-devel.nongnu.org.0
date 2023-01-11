Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00B66558D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVxk-00063T-7j; Wed, 11 Jan 2023 02:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pFVxc-00061W-3a
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:55:49 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pFVxZ-0006if-NI
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:55:47 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p24so15927281plw.11
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 23:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRU7kJ6uO9CCqQtsxR4uUEHTNTyqixekBwznnawtUes=;
 b=LMRgoO3mIT3wtDX9io6ADi2O6h8HSuQmgeWrQvdClm2YnD7whsZAvraoUG4qjPhZPI
 ts9iSx8Y44lTL9rKk9sDxqF0zLVZVt5kFtOXKTfVejkHql+CHdGjq+6wxwOXNQkd+Arl
 kXN3vIhPSQK6+NZMd6+V2wa4zChz+0KBaajz1STwXieX5zXAlV04/AFw/UNup7R2X/qC
 4xNa1lXWcJjCL7eOopWo8QogztPyVGyaYNsrlGJfCRgyFkW4gIwaKnOvb0YHEYnCKZtR
 URN/5sYj9trCp5pMuN5AWrViewdm32kSJNCDRcwNkUWvy6LLnPQl9TS4jcuIDrIZfkDY
 KOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TRU7kJ6uO9CCqQtsxR4uUEHTNTyqixekBwznnawtUes=;
 b=wRKP4yMiKx5FXmbokmGTUsq8g5M1gKcTEiX0H0q7sR4tP4icl99xnXo58uYwI04VJw
 NKRUHt24vJegTVrphhTab8SzDCp2TsrPi1TWiWMl9cwMhFI1QetY99KkciUpPea1M/Pv
 dtn8nSf4LUrPtFz8XFij3j9cueU403eqpmYgPr8RG9JGNnQ341UC2f9GGtiMJXGKXGPU
 F92M8U+VD7mIvS0FVut7lWT1+cjp/vo9TbEB63RbiDjULhGTJeZ17FzY7qtA83mLOvvA
 b6Waac5dLJJzSVCLIvCfB5oPFxtnXbcA5B2TsmAtn+Ftthd0Bkk2sdFRWgZd9FeyPc/B
 KVSA==
X-Gm-Message-State: AFqh2kqP4NmSaarULJ6K9IPlXFRnsW7WzQl3bffWKyJnDB8ncrXiET7e
 Q5gfhUEpx5AEKQEIGgw3JGVfaQ==
X-Google-Smtp-Source: AMrXdXuMI2gEBnsjQh3eKpQBqbXN4XRHXpCo0AIyw1FSVBtipix35MFUHyF1HH86TqJX0esAnWcm1Q==
X-Received: by 2002:a17:90a:6c23:b0:226:d0a8:e79a with SMTP id
 x32-20020a17090a6c2300b00226d0a8e79amr1530311pjj.5.1673423740735; 
 Tue, 10 Jan 2023 23:55:40 -0800 (PST)
Received: from [10.254.157.45] ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a63f105000000b00478c48cf73csm6614236pgi.82.2023.01.10.23.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 23:55:40 -0800 (PST)
Message-ID: <e5433b9c-12c1-bfff-a3a5-878b47a86bab@bytedance.com>
Date: Wed, 11 Jan 2023 15:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Questions about how block devices use snapshots
To: Kevin Wolf <kwolf@redhat.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y7wdTurqBjWXIGmo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi Kevin,

Thank you for your reply and detailed answers.

In my scenario is the iSCSI SAN environment. The network storage device 
is connected to the physical machine via iSCSI, and LVM is used as the 
middle layer between the storage device and the VM for storage 
management and metadata synchronization. Every VM uses both raw and 
qcow2 formats, with the system disk being qcow2 and the data disk being 
raw. Therefore block devices need to support snapshot capability in both 
raw and qcow2 store methods. In addition, snapshot images should also be 
stored in iSCSI storage, which is a block device.

Both internal and external snapshots can implement snapshots of block 
devices, but they both have their drawbacks when multiple snapshots are 
required.

Internal snapshots can only be used in qcow2 format and do not require 
additional creation of new block devices. As you said, the block device 
has much more space than the virtual disk. There is no telling when disk 
space will be full when creating multiple snapshots.

External snapshots require the creation of additional block devices to 
store the overlay images, but it is not clear how much space needs to be 
created. If the space is the same as the virtual disk, when there are 
multiple snapshots it will be a serious waste of disk space, because 
each time a new snapshot is created the previous one will become 
read-only. However, if the disk space created is too small, the snapshot 
data may not be stored when the disk space is full.

The problem with both is the uncertainty of the space size of the block 
device at the time of creation. Of course, we can rely on lvm's resize 
function to dynamically grow the space of the block device. But I think 
this is more of a workaround.

It is mentioned in the Qemu docs page under "QEMU disk image utility" 
that the qemu-img rebase can be used to perform a “diff” operation on 
two disk images.

Say that base.img has been cloned as modified.img by copying it, and 
that the modified.img guest has run so there are now some changes 
compared to base.img. To construct a thin image called diff.qcow2 that 
contains just the differences, do:

qemu-img create -f qcow2 -b modified.img diff.qcow2
qemu-img rebase -b base.img diff.qcow2

At this point, modified.img can be discarded, since base.img + 
diff.qcow2 contains the same information.

Can this “diff” operation be used on snapshots of block devices? The 
first snapshot is a copy of the original disk (to save space we can copy 
only the data that has already been used), while the subsequent 
snapshots are based on the diff of the previous snapshot, so that the 
space required for the created block device is known at the time of the 
snapshot.

Regards

Zhiyong

On 1/9/23 9:57 PM, Kevin Wolf wrote:
> Am 09.01.2023 um 13:45 hat Zhiyong Ye geschrieben:
>> Qemu provides powerful snapshot capabilities for different file
>> formats. But this is limited to the block backend being a file, and
>> support is not good enough when it is a block device. When creating
>> snapshots based on files, there is no need to specify the size of the
>> snapshot image, which can grow dynamically as the virtual machine is
>> used. But block devices are fixed in size at creation and cannot be
>> dynamically grown at a later time.
>>
>> So is there any way to support snapshots when the block backend is a
>> block device?
> 
> In order to have snapshots, you need to have an image format like qcow2.
> 
> A qcow2 file can have a raw block device as its backing file, so even if
> you store the overlay image on a filesystem, you have technically
> snapshotted a block device. This may or may not be enough for your use
> case.
> 
> It is also possible to store qcow2 files on block devices, though
> depending on your requirements, it can get very tricky because then
> you're responsible for making sure that there is always enough free
> space on the block device.
> 
> So a second, still very simple, approach could be taking a second block
> device that is a little bit larger than the virtual disk (for the qcow2
> metadata) and use that as the external snapshot. Obviously, you require
> a lot of disk space this way, because each snapshots needs to be able to
> store the full image.
> 
> You could also use internal snapshots. In this case, you just need to
> make sure that the block device is a lot larger than the virtual disk,
> so that there is enough space left for storing the snapshots. At some
> point it will be full.
> 
> And finally, for example if your block devices are actually LVs, you
> could start resizing the block device dynmically as needed. This becomes
> very complex quickly and you're on your own, but it is possible and has
> been done by oVirt.
> 
> Kevin
> 

