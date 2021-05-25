Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54338FD30
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:52:02 +0200 (CEST)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSn9-0001zd-KF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1llSlf-00015K-Cz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1llSlc-0005es-B7
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621932622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGDKfuuXfFKPNHGELd077fu46mrnA7wOBrv2kC00ngk=;
 b=hkR8vbTLY6o+3HypeLUHAP+fe8/tHPeHOaAbfXPIyZo2ImcGgwNgLVDRgmt0Tl+OoZGkoI
 6mnyiAKB0Aje1GE0up5WmOHj2v04N7XFn6Xtr9x31kZY8G9tEyj1U106qZ+IT5liwCNgHV
 Ijf+sKOJc1ZyOuN1wbYRT+f73lUORIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-H43CHYjmOeKqKqhwk84xIg-1; Tue, 25 May 2021 04:50:21 -0400
X-MC-Unique: H43CHYjmOeKqKqhwk84xIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752BE100747A;
 Tue, 25 May 2021 08:50:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-27.ams2.redhat.com
 [10.36.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8623D5D9F0;
 Tue, 25 May 2021 08:50:12 +0000 (UTC)
Subject: Re: RFC: Qemu backup interface plans
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
 <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
 <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <60dd7a7a-3838-8d11-66f4-2cbd08fbf575@redhat.com>
Date: Tue, 25 May 2021 10:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, yur@virtuozzo.com,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 "Denis V. Lunev" <den@openvz.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.05.21 08:11, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 19:39, Max Reitz wrote:

[...]

>> On 17.05.21 14:07, Vladimir Sementsov-Ogievskiy wrote:

[...]

>>> Not also, that there is another benefit of such thing: we'll 
>>> implement this callback in qcow2 driver, so that backup will read 
>>> clusters not in guest cluster order, but in host cluster order, to 
>>> read more sequentially, which should bring better performance on 
>>> rotating disks.
>>
>> I’m not exactly sure how you envision this to work, but block_status 
>> also already gives you the host offset in *map.
>>
> 
> But block-status doesn't give a possibility to read sequentially. For 
> this, user should call block-status several times until the whole disk 
> covered, then sort the segments by host offset. I wonder, could it be 
> implemented as some iterator, like
> 
> read_iter = bdrv_get_sequential_read_iter(source)
> 
> while (extents = bdrv_read_next(read_iter)):
>    for ext in extents:
>      start_writing_task(target, ext.offset, ext.bytes, ext.qiov)
> 
> where bdrv_read_next will read guest data in host-cluster-sequence..

How would you implement this, though?  qcow2 doesn’t have a reverse 
mapping either, so it too would need to read all L2 table entries and 
sort them, wouldn’t it?

Max


