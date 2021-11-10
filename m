Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B22144BCFD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:38:13 +0100 (CET)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkj7T-0008Ee-SV
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:38:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkj68-0007aF-Qt
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkj5T-00037y-NE
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636533365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hJ3RF2V8IM9/8XGBNKLXckEbYRI+BW4q9NNTFImo/IQ=;
 b=iQEEGZ796X8euZiChdDR4HPi6wK5e0BMJ54KYPpxxohuOyVI0yIp8X0C7VJakR0KkNLvMW
 6CYkCpE3iTL6RXkbOHG1/5RFHSieG3eZJIOaN3P5XOWsPpZ5RkulBP9MdyQ408qsxRCeu0
 dXkULva8B96qji4GgVD7I7c4oMCAJC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-lQJABciZMGCeW2Z9MnUf_Q-1; Wed, 10 Nov 2021 03:36:00 -0500
X-MC-Unique: lQJABciZMGCeW2Z9MnUf_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736681023F4E;
 Wed, 10 Nov 2021 08:35:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5D7D1B4B8;
 Wed, 10 Nov 2021 08:35:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6F53811380A7; Wed, 10 Nov 2021 09:35:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <87czn88uqc.fsf@dusky.pond.sub.org>
 <MWHPR11MB00319C2B4ED872EDDB5D43539B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87v9104jlb.fsf@dusky.pond.sub.org>
 <MWHPR11MB0031DA3FF0E560F0A83C9B759B939@MWHPR11MB0031.namprd11.prod.outlook.com>
Date: Wed, 10 Nov 2021 09:35:55 +0100
In-Reply-To: <MWHPR11MB0031DA3FF0E560F0A83C9B759B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 (Chen Zhang's message of "Wed, 10 Nov 2021 06:53:03 +0000")
Message-ID: <87czn82ys4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Wednesday, November 10, 2021 2:21 PM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
>> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
>> 
>> "Zhang, Chen" <chen.zhang@intel.com> writes:
>> 
>> >> -----Original Message-----
>> >> From: Markus Armbruster <armbru@redhat.com>
>> >> Sent: Wednesday, November 10, 2021 1:07 PM
>> >> To: Zhang, Chen <chen.zhang@intel.com>
>> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>> >> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
>> >> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by
>> >> default
>> >>
>> >> Zhang Chen <chen.zhang@intel.com> writes:
>> >>
>> >> > This patch make filters and colo-compare module support vnet_hdr by
>> >> > default. And also support -device non-virtio-net(like e1000.).
>> >> > But it can't avoid user manual configuration error between
>> >> > different filters when enable/disable virtio-net-pci.
>> >> >
>> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> >>
>> >> Have you considered backward compatibility?  Can it break usage that
>> >> now works?
>> >
>> > Yes, this patch fully guarantees the compatibility as Jason's comments.
>> > Original usage still works.
>> 
>> Worth a brief explanation in the commit message?
>
> OK. Add following statement to commit message:
> This patch make filters and colo-compare module support vnet_hdr by
> default. And also support -device non-virtio-net(like e1000.). Because
> when enabled the support will make the vnet_hdr_len field become must-delivery
> part of filter transfer protocol(even 0 in use -device e1000). It fully guarantees the
> compatibility for management layer like libvirt.
> But it still can't avoid user manual configuration error between
> different filters connected when enable/disable vnet_hdr_support.
>
> How about this explanation?

I'm deferring to Jason, because I can't judge this for technical
accuracy.

> By the way, please let me know your comments on filter passthrough series:
> https://mail.gnu.org/archive/html/qemu-devel/2021-08/msg01393.html
> If OK, I will update it.

Uh, I was under the impression that you'd respin with my comments
addressed as per your reply to my review.

It's too late for 6.2 now.  Suggest to respin, and adjust the "since:"
tags to 7.0.


