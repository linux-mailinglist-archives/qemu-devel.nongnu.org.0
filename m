Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2040360E07B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 14:16:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onfCP-0005pB-Do; Wed, 26 Oct 2022 08:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1onfCM-0005er-Fq
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 08:07:54 -0400
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1onfCJ-0008U7-60
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 08:07:54 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 365D15FE99;
 Wed, 26 Oct 2022 15:07:32 +0300 (MSK)
Received: from [IPV6:2a02:6b8:0:107:3e85:844d:5b1d:60a] (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 UzX3P8vZVl-7VNmDnRB; Wed, 26 Oct 2022 15:07:31 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666786051; bh=/Sleswqpo8R+Zp/QXJ2SuLR5ewM3bfw3yM/WTiU7JR4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=nbOsYnB3CSTNFmVgIRvhvcmJX1qCe0L3YPDkkOauz+RBLuSp4hu0nVu0Ncj9rIuhU
 zOYsM6iypjG82jFeidmYwmxJyxiQth4d+1VEi9MZsyXy95U0c6GYMGusAiOhGbxv1R
 2VlnrDU/am49lAg7/45hD3Fa1/sUxWiTVAlhKdN4=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Message-ID: <2cc9ecc1-97d8-44de-4609-35e703dd627b@yandex-team.com>
Date: Wed, 26 Oct 2022 15:07:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 0/4] Allow to pass pre-created VFIO container/group to QEMU
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Steve Sistare <steven.sistare@oracle.com>,
 yc-core@yandex-team.ru, Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
 <20221017092105.0476385c.alex.williamson@redhat.com>
From: Andrey Ryabinin <arbn@yandex-team.com>
In-Reply-To: <20221017092105.0476385c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72; envelope-from=arbn@yandex-team.com;
 helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/17/22 18:21, Alex Williamson wrote:
> On Mon, 17 Oct 2022 13:54:03 +0300
> Andrey Ryabinin <arbn@yandex-team.com> wrote:
> 
>> These patches add possibility to pass VFIO device to QEMU using file
>> descriptors of VFIO container/group, instead of creating those by QEMU.
>> This allows to take away permissions to open /dev/vfio/* from QEMU and
>> delegate that to managment layer like libvirt.
>>
>> The VFIO API doen't allow to pass just fd of device, since we also need to have
>> VFIO container and group. So these patches allow to pass created VFIO container/group
>> to QEMU via command line/QMP, e.g. like this:
>>             -object vfio-container,id=ct,fd=5 \
>>             -object vfio-group,id=grp,fd=6,container=ct \
>>             -device vfio-pci,host=05:00.0,group=grp
> 
> This suggests that management tools need to become intimately familiar
> with container and group association restrictions for implicit
> dependencies, such as device AddressSpace.  We had considered this
> before and intentionally chosen to allow QEMU to manage that
> relationship.  Things like PCI bus type and presence of a vIOMMU factor
> into these relationships.
> 

This is already the case. These patches doesn't change much.
QEMU doesn't allow to adding device from one group to several address spaces.
So the management tool needs to know whether devices are in the same group or not
and whether QEMU will create separate address spaces for these devices or not.

E.g.
qemu-system-x86_64 -nodefaults -M q35,accel=kvm,kernel-irqchip=split \
        -device intel-iommu,intremap=on,caching-mode=on \
        -device vfio-pci,host=00:1f.3 \
        -device vfio-pci,host=00:1f.4 
qemu-system-x86_64: -device vfio-pci,host=00:1f.4: vfio 0000:00:1f.4: group 14 used in multiple address spaces

> In the above example, what happens in a mixed environment, for example
> if we then add '-device vfio-pci,host=06:00.0' to the command line?
> Isn't QEMU still going to try to re-use the container if it exists in
> the same address space? Potentially this device could also be a member
> of the same group.  How would the management tool know when to expect
> the provided fds be released?
> 

Valid point, container indeed will be reused and second device will occupy it.
But we could make new container instead. Using several containers in one address
space won't be a problem, right?
Of course several devices from same group won't be allowed to be added in mixed way.


> We also have an outstanding RFC for iommufd that already proposes an fd
> passing interface, where iommufd removes many of the issues of the vfio
> container by supporting multiple address spaces within a single fd
> context, avoiding the duplicate locked page accounting issues between
> containers, and proposing a direct device fd interface for vfio.  Why at
> this point in time would we choose to expand the QEMU vfio interface in
> this way?  Thanks,
> 

It sounds nice, but iommufd is new API which doesn't exist in any kernel yet.
These patches is something that can be used on existing, already deployed kernels.


