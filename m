Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C96225637
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 05:43:04 +0200 (CEST)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxMhj-0006wJ-OX
	for lists+qemu-devel@lfdr.de; Sun, 19 Jul 2020 23:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxMh2-0006Wj-Rb
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 23:42:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32387
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxMgy-0000UL-Vm
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 23:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595216534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ6v8Qo3QLXwwkVnkRqwS4KPkViLK16pSV3DgXs46os=;
 b=BLf7NJ9AYIQFTGrX/P8o2ZTDBDccmrNkiwtwoGFA/2zrCIhQMMo4wdaMpaIpF2qPNfFQA6
 a8/CJBzAdkGlgGwAivG17zi47m30m3piLllYDZhKnMjqnnHIOjJFCAL7zQSGKCqPGNMsAi
 mGlyfkd72EkgXHeRaN5ZU3YShJm3cJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-fHIGCciNPr2PUyvRCJqAxA-1; Sun, 19 Jul 2020 23:42:11 -0400
X-MC-Unique: fHIGCciNPr2PUyvRCJqAxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08B81080;
 Mon, 20 Jul 2020 03:42:08 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E58B66842F;
 Mon, 20 Jul 2020 03:41:48 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Alex Williamson <alex.williamson@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040> <20200717101258.65555978@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <95c13c9b-daab-469b-f244-a0f741f1b41d@redhat.com>
Date: Mon, 20 Jul 2020 11:41:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717101258.65555978@x1.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 22:24:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, cohuck@redhat.com, dinechin@redhat.com, devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/18 上午12:12, Alex Williamson wrote:
> On Thu, 16 Jul 2020 16:32:30 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
>
>> On Thu, Jul 16, 2020 at 12:16:26PM +0800, Jason Wang wrote:
>>> On 2020/7/14 上午7:29, Yan Zhao wrote:
>>>> hi folks,
>>>> we are defining a device migration compatibility interface that helps upper
>>>> layer stack like openstack/ovirt/libvirt to check if two devices are
>>>> live migration compatible.
>>>> The "devices" here could be MDEVs, physical devices, or hybrid of the two.
>>>> e.g. we could use it to check whether
>>>> - a src MDEV can migrate to a target MDEV,
>>>> - a src VF in SRIOV can migrate to a target VF in SRIOV,
>>>> - a src MDEV can migration to a target VF in SRIOV.
>>>>     (e.g. SIOV/SRIOV backward compatibility case)
>>>>
>>>> The upper layer stack could use this interface as the last step to check
>>>> if one device is able to migrate to another device before triggering a real
>>>> live migration procedure.
>>>> we are not sure if this interface is of value or help to you. please don't
>>>> hesitate to drop your valuable comments.
>>>>
>>>>
>>>> (1) interface definition
>>>> The interface is defined in below way:
>>>>
>>>>                __    userspace
>>>>                 /\              \
>>>>                /                 \write
>>>>               / read              \
>>>>      ________/__________       ___\|/_____________
>>>>     | migration_version |     | migration_version |-->check migration
>>>>     ---------------------     ---------------------   compatibility
>>>>        device A                    device B
>>>>
>>>>
>>>> a device attribute named migration_version is defined under each device's
>>>> sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version).
>>>
>>> Are you aware of the devlink based device management interface that is
>>> proposed upstream? I think it has many advantages over sysfs, do you
>>> consider to switch to that?
>
> Advantages, such as?


My understanding for devlink(netlink) over sysfs (some are mentioned at 
the time of vDPA sysfs mgmt API discussion) are:

- existing users (NIC, crypto, SCSI, ib), mature and stable
- much better error reporting (ext_ack other than string or errno)
- namespace aware
- do not couple with kobject

Thanks


