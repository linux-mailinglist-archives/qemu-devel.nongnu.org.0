Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1363FE19
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 03:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0vlE-00080z-2a; Thu, 01 Dec 2022 21:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1p0vlB-0007zK-3N; Thu, 01 Dec 2022 21:26:41 -0500
Received: from [106.39.185.58] (helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>)
 id 1p0vl7-00018d-DC; Thu, 01 Dec 2022 21:26:40 -0500
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id EB0D117E0209;
 Fri,  2 Dec 2022 10:26:28 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.19.22.216] (unknown [110.185.170.176])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P2473745T281457585287536S1669947987952106_; 
 Fri, 02 Dec 2022 10:26:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <623a5cf5741c6c2fe2b9978d668660c9>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: armbru@redhat.com
X-RCPT-COUNT: 9
X-SENDER-IP: 110.185.170.176
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Message-ID: <1d355249-9ab0-f824-e00d-3135cb2646b5@cestc.cn>
Date: Fri, 2 Dec 2022 10:26:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] blockdev: add 'media=cdrom' argument to support usb cdrom
 emulated as cdrom
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fam Zheng <fam@euphon.net>
References: <20221201134227.1983-1-luzhipeng@cestc.cn>
 <871qpjf86a.fsf@pond.sub.org>
From: Zhipeng Lu <luzhipeng@cestc.cn>
In-Reply-To: <871qpjf86a.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.58 (failed)
Received-SPF: pass client-ip=106.39.185.58; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

libvirt issue： https://gitlab.com/libvirt/libvirt/-/issues/261

1、start vm with usb cdrom
<disk type="file" device="cdrom">
   <driver name="qemu" type="raw" discard="unmap"/>
   <source file="/tmp/cdrom"/>
   <target dev="sda" bus="usb"/>
   <readonly/>
   <address type="usb" bus="0" port="1"/>
</disk>

2、 get qemu cmdline


qemu     ... -blockdev 
{"driver":"file","filename":"/tmp/cdrom","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} 
-blockdev 
{"node-name":"libvirt-1-format","read-only":true,"discard":"unmap","driver":"raw","file":"libvirt-1-storage"} 
-device 
{"driver":"usb-storage","bus":"usb.0","port":"1","drive":"libvirt-1-format","id":"usb-disk0","removable":false}
3、 in vm

NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0  100M  1 disk
vda           252:0    0   10G  0 disk
├─vda1        252:1    0    1G  0 part /boot
└─vda2        252:2    0    9G  0 part
   ├─rhel-root 253:0    0    8G  0 lvm  /
   └─rhel-swap 253:1    0    1G  0 lvm  [SWAP]
lshw -short|grep cdrom -i
No cdrom.

My patch is to solve this problem, usb cdrom emulated as cdrom.



在 2022/12/1 23:35, Markus Armbruster 写道:
> luzhipeng <luzhipeng@cestc.cn> writes:
> 
>> From: zhipeng Lu <luzhipeng@cestc.cn>
>>
>> The drive interface supports media=cdrom so that the usb cdrom
>> can be emulated as cdrom in qemu, but libvirt deprived the drive
>> interface, so media=cdrom is added to the blockdev interface to
>> support usb cdrom emulated as cdrom
>>
>> Signed-off-by: zhipeng Lu <luzhipeng@cestc.cn>
> 
> What problem are you trying to solve?
> 
> 
> 



