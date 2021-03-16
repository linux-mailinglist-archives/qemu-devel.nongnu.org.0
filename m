Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D962C33D4CE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:26:08 +0100 (CET)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9i3-0006ox-C6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9gu-0005tN-Q8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9gt-0008V1-9m
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615901093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfLvB7vmSTw69s58GD5SlbXgRdC6Vu3998J5qhNoEhs=;
 b=dPFJwdaz9xdgnzCcyHBtrZCZ1aDWFdKxjw9ekQZ95jd33K0uIFnpf2xN0q1MBaE17oZ4uJ
 NdWxtRgIruwJPmA8nJXJn6Balo3+DEA9xY9xcN4/uwBukMsa+0tk1MxUe/Wf1KLWOTbJsM
 2ww/pifue05gltetQKC8ubYNZJhaqps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-_InW1STKOF2VVxnU_loPlQ-1; Tue, 16 Mar 2021 09:24:52 -0400
X-MC-Unique: _InW1STKOF2VVxnU_loPlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF43F19057A2;
 Tue, 16 Mar 2021 13:24:48 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9205119C46;
 Tue, 16 Mar 2021 13:24:39 +0000 (UTC)
Subject: Re: [PATCH v29 17/17] qapi: Add VFIO devices migration stats in
 Migration stats
From: Eric Blake <eblake@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>, alex.williamson@redhat.com,
 cjia@nvidia.com
References: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
 <1603704987-20977-18-git-send-email-kwankhede@nvidia.com>
 <d022e3b6-fbb9-7b34-71c6-ec6e01ebbb7d@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <483de297-3d4d-367c-c0e5-3cf60a25b3eb@redhat.com>
Date: Tue, 16 Mar 2021 08:24:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d022e3b6-fbb9-7b34-71c6-ec6e01ebbb7d@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: cohuck@redhat.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 8:22 AM, Eric Blake wrote:
> On 10/26/20 4:36 AM, Kirti Wankhede wrote:

Hmm, just now realizing this is an old thread...

>> Added amount of bytes transferred to the VM at destination by all VFIO
>> devices
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
> 
>> +++ b/qapi/migration.json
>> @@ -147,6 +147,18 @@
>>              'active', 'postcopy-active', 'postcopy-paused',
>>              'postcopy-recover', 'completed', 'failed', 'colo',
>>              'pre-switchover', 'device', 'wait-unplug' ] }
>> +##
>> +# @VfioStats:
>> +#
>> +# Detailed VFIO devices migration statistics
>> +#
>> +# @transferred: amount of bytes transferred to the target VM by VFIO devices
>> +#
>> +# Since: 5.2
> 
> 5.2 is last year; this should be 6.0 (if this makes it in time for soft
> freeze) or even 6.1

...but it was revived because of Thomas' notice of a problem with
CONFIG_VFIO with what is already in-tree, rather than something still
awaiting review.  My (untimely) review is thus unnecessary noise; sorry.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


