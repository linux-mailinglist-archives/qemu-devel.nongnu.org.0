Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023C6025B6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:30:34 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh3Z-000528-0b
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1okgbj-0004aE-CZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 03:01:49 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:49429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1okgbh-0005oS-90
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 03:01:47 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id B996A44A67;
 Tue, 18 Oct 2022 09:01:33 +0200 (CEST)
Message-ID: <49638f34-da84-4528-e849-88c61c64f7ff@proxmox.com>
Date: Tue, 18 Oct 2022 09:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20221013084100.57740-1-f.ebner@proxmox.com>
 <MWHPR11MB00318FBF6AB2FCC40F9AEF849B299@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <MWHPR11MB00318FBF6AB2FCC40F9AEF849B299@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.10.22 um 11:54 schrieb Zhang, Chen:
> 
> 
>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-bounces+chen.zhang=intel.com@nongnu.org>
>> On Behalf Of Fiona Ebner
>> Sent: Thursday, October 13, 2022 4:41 PM
>> To: qemu-devel@nongnu.org
>> Cc: dgilbert@redhat.com; quintela@redhat.com; berrange@redhat.com
>> Subject: [PATCH v2] migration/channel-block: fix return value for
>> qio_channel_block_{readv, writev}
>>
>> in the error case. The documentation in include/io/channel.h states that -1 or
>> QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply passing
>> along the return value from the bdrv-functions has the potential to confuse
>> the call sides. Non-blocking mode is not implemented currently, so -1 it is.
>>
>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> 
> LGTM.
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>
> 
> But I found the same problem elsewhere, for example: 
> "qio_channel_rdma_writev/readv", "qio_channel_buffer_writev/readv"...etc...
> 
> Can you send other patches to fix it?
> 

Thank you for the review! Unfortunately, I'll be pretty busy in the
coming weeks, because we have some releases coming up. But if nobody
else sends patches until those are done, I'll take a look then.

Best Regards,
Fiona

> Thanks
> Chen 
> 
> 


