Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F060DEFF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 12:47:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onduK-0000YA-Jd; Wed, 26 Oct 2022 06:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1onduH-0000Wz-Pi
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 06:45:09 -0400
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1onduB-0001ta-Kf
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 06:45:09 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 327CD5FFFB;
 Wed, 26 Oct 2022 13:44:55 +0300 (MSK)
Received: from [IPV6:2a02:6b8:0:107:3e85:844d:5b1d:60a] (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kWrjXC8ofr-isNmvbPi; Wed, 26 Oct 2022 13:44:54 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666781094; bh=FSfhKUkQiyo6uXyjWA4AcT8DMrnPtNSR88NZVeYi/oI=;
 h=In-Reply-To:Cc:Date:References:To:Subject:From:Message-ID;
 b=Z7AJyoZKRlbYcgcTTSmhiC6F2EvIYCruIdBHqJ78uclyLZTE82a9Grm/VGT9jqlyf
 xtBkfs6f8PbARKHwwK4NYZH8MhUyzJlBWSxNFtPs/3a7oXft9ceHcu9xc+WvNWs9QV
 xkU4s+n+LL2G29SqTkQt3r71kduSRYYmJHB3R6/Y=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Message-ID: <2d56bafa-a036-e37c-5d23-d0a9ee7c47d2@yandex-team.com>
Date: Wed, 26 Oct 2022 13:44:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
From: Andrey Ryabinin <arbn@yandex-team.com>
Subject: Re: [PATCH 0/4] Allow to pass pre-created VFIO container/group to QEMU
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Steve Sistare <steven.sistare@oracle.com>,
 yc-core@yandex-team.ru, Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
 <Y0027XOMm/lfftGK@redhat.com>
Content-Language: en-US
In-Reply-To: <Y0027XOMm/lfftGK@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/17/22 14:05, Daniel P. Berrangé wrote:
> On Mon, Oct 17, 2022 at 01:54:03PM +0300, Andrey Ryabinin wrote:
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
>>
>> A bit more detailed example can be found in the test:
>> tests/avocado/vfio.py
>>
>>  *Possible future steps*
>>
>> Also these patches could be a step for making local migration (within one host)
>> of the QEMU with VFIO devices.
>> I've built some prototype on top of these patches to try such idea.
>> In short the scheme of such migration is following:
>>  - migrate source VM to file.
>>  - retrieve fd numbers of VFIO container/group/device via new property and qom-get command
>>  - get the actual file descriptor via SCM_RIGHTS using new qmp command 'returnfd' which
>>    sends fd from QEMU by the number: { 'command': 'returnfd', 'data': {'fd': 'int'}}
>>  - shutdown source VM
>>  - launch destination VM, plug VFIO devices using obtained file descriptors.
>>  - PCI device reset duriing plugging the device avoided with the help of new parameter
>>     on vfio-pci device.
> 
> Is there a restriction by VFIO on how many processes can have the FD
> open concurrently ? I guess it must be, as with SCM_RIGHTS, both src
> QEMU and libvirt will have the FD open concurrently for at least a
> short period, as you can't atomically close the FD at the exact same
> time as SCM_RIGHTS sends it.
> 

There is no such restriction. Several opened descriptors is what allows us to survive
PCI device reset. The kernel reset device on the first open.
Obviously we shouldn't use these descriptors concurrently and can't in many cases
(ioctl()s will fail), but there is no problem with just saving/passing FD between processes.


> With migration it is *highly* desirable to never stop the source VM's
> QEMU until the new QEMU has completed migration and got its vCPUs
> running, in order to have best chance of successful rollback upon
> failure
> 
> So assuming both QEMU's can have the FD open, provided they don't
> both concurrently operate on it, could src QEMU just pass the FDs
> to the target QEMU as part of the migration stream. eg use a UNIX
> socket between the 2 QEMUs, and SCM_RIGHTS to pass the FDs across,
> avoiding libvirt needing to be in the middle of the FD passing
> dance. Since target QEMU gets the FDs as part of the migration
> stream, it would inherantly know that it shold skip device reset
> in that flow, without requiring any new param.
> 

Yeah, I had similar idea, but this would require a lot of rework of VFIO initialization
phase in QEMU. The main problem here is all initialization happens on device addition, which will fail
if device already used by another QEMU. I guess we would  need to move lot's of initialization to the
->post_load() hook.

