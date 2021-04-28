Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C81136D802
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:06:49 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjtv-0001Y4-HR
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lbjr8-0008LR-R1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lbjr6-0000Xd-Df
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619615031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LdRU8qPhZGh/AIiq3PDdRcOGE/2YEl38KKfSmQQJpg=;
 b=DqILyE6z9a/3eA9tGK15MqDprgU2ryfFalq6u06TMHtjDUOw3bnMHKjXvFsh2TfRPjLXDY
 GhsHnpsAOndDDaUzxPKpjdWWXUyTUlipuxCRC/P935fd9ZT89aOqy1SlOtbSbWfOsSGZ0e
 qPzYNADFplt+enGyXrQ38Z+2NYLcIWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-omFbeflaNAWRMU5RS9xfIw-1; Wed, 28 Apr 2021 09:03:47 -0400
X-MC-Unique: omFbeflaNAWRMU5RS9xfIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 802C3824FBE;
 Wed, 28 Apr 2021 13:00:11 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-250.ams2.redhat.com
 [10.36.115.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F6D70137;
 Wed, 28 Apr 2021 13:00:10 +0000 (UTC)
Subject: Re: [Bug 1925496] Re: nvme disk cannot be hotplugged after removal
To: Klaus Jensen <its@irrelevant.dk>, Bug 1925496 <1925496@bugs.launchpad.net>
References: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
 <161960231059.11681.2408216748859225156.malone@wampee.canonical.com>
 <YIk1KG4dgT6mwChA@apples.localdomain>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <09273f4c-3ac6-1fc4-b26e-d6fd3bee9021@redhat.com>
Date: Wed, 28 Apr 2021 15:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIk1KG4dgT6mwChA@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 12:12, Klaus Jensen wrote:
> On Apr 28 09:31, Oguz Bektas wrote:
>>> My understanding is that this is the expected behavior. The reason is
>>> that the drive cannot be deleted immediately when the device is
>>> hot-unplugged, since it might not be safe (other parts of QEMU could
>>> be using it, like background block jobs).
>>>
>>> On the other hand, the fact that if the drive is removed explicitly
>>> through QMP (or in the monitor with drive_del), the drive id is
>>> remains "in use". This might be a completely different bug that is
>>> unrelated to the nvme device.
>>
>> using the same commands I can hot-plug and hot-unplug a scsi disk like
>> this without issue - this behavior only appeared on nvme devices.
>>
> 
> Kevin, Max, can you shed any light on this?
> 
> Specifically what the expected behavior is wrt. to the drive when 
> unplugging a device that has one attached?
> 
> If the scsi disk is capable of "cleaning up" immediately, then I suppose 
> that some steps are missing in the nvme unrealization.

I’m not very strong when it comes to question for guest devices, but 
looking into the QAPI documentation, it says that when DEVICE_DELETED is 
emitted, it’s safe to reuse the device ID.  Before then, it isn’t, 
because the guest may yet need to release the device.

So the questions that come to my mind are:
- Do nvme guest devices have a release protocol with the guest, so that 
it just may take some time for the guest to release the device?  I.e. 
that this would be perfectly normal and documented behavior?
(Perhaps this just isn’t the case for scsi, or the guest just releases 
those devices much quicker)

- Did Oguz always wait for the DEVICE_DELETED event before reusing the 
ID?  Sounds like it would be a bug if reusing the ID after getting that 
event failed.

Max


