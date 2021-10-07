Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9D425835
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:42:38 +0200 (CEST)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWTd-0005ak-Jg
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mYWD9-0003bN-EL
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mYWCz-0002V7-2n
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1kbk2lcxg9O2Y1a76hO9mtdUGaa5nIQDze4u6D1O12E=;
 b=RTqH+0ssm8aZydUKzdtX3uqz6JSWLg+cCMbKZu/x3Rm1x2+nFRHNgOy2TNdqpqM7dJgl2C
 IsfrzdppxXidPv3c50NDCkMYI6qnBcoIQR9ZiBJULhVKXh1U4Lz+1OQydssBFATTKHAo1E
 LP3p2mtzVgrSSGF9gHhiZXIiwj0hn8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-SUq8qOLJPw6XCB59yiXLGA-1; Thu, 07 Oct 2021 12:25:18 -0400
X-MC-Unique: SUq8qOLJPw6XCB59yiXLGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9546111EB683;
 Thu,  7 Oct 2021 16:17:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6506671B90;
 Thu,  7 Oct 2021 16:16:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio: write back F_VERSION_1 before validate
In-Reply-To: <20211007175242.4b0155b8.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211006142533.2735019-1-pasic@linux.ibm.com>
 <875yu9yruv.fsf@redhat.com> <20211007163255.61d95513.pasic@linux.ibm.com>
 <8735pczwjj.fsf@redhat.com> <20211007175242.4b0155b8.pasic@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 07 Oct 2021 18:16:16 +0200
Message-ID: <87wnmoyfn3.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, Xie Yongji <xieyongji@bytedance.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 07 Oct 2021 17:25:52 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Thu, Oct 07 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
>> 
>> > On Thu, 07 Oct 2021 13:52:24 +0200
>> > Cornelia Huck <cohuck@redhat.com> wrote:
>> >  
>> >> On Wed, Oct 06 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
>> >>   
>> >> > The virtio specification virtio-v1.1-cs01 states: "Transitional devices
>> >> > MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
>> >> > been acknowledged by the driver."  This is exactly what QEMU as of 6.1
>> >> > has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
>> >> >
>> >> > However, the specification also says: "... driver MAY read (but MUST NOT
>> >> > write) the device-specific configuration fields to check that it can
>> >> > support the device ..." before setting FEATURES_OK.    
>> >> 
>> >> Suggest to put the citations from the spec into quotes, so that they are
>> >> distinguishable from the rest of the text.  
>> >
>> > For the record: I basically took Michael's description, the one which you
>> > said you prefer, with some minor changes.  
>> 
>> Well I did look at what the text said, not the details in the formatting...
>> 
>> >
>> > This is one of the changes, which renders this a paraphrase and not a
>> > quote. Michael didn't use quotation marks so I was not sure it is was
>> > a word by word quote anyway. It was. But the spec depends on "During this
>> > step" which does not make any sense without the context. That is why I made
>> > the end of step explicit.  
>> 
>> I still think that would be nicer while using some quotation marks, even
>> if you are just doing a partial quote.
>> 
>> In the first paragraph, however, we really should mark the quote
>> properly. It gave me a stop when I first read it.
>
> I've added in some quotation marks and ellipsis marks. Does that look
> good for you?

Yep, works for me.


