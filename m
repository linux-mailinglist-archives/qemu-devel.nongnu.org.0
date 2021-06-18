Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C773ACBD7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 15:14:03 +0200 (CEST)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luEJu-0000Jj-HD
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 09:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luEI6-0007uz-At
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luEI3-0001rr-5Z
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624021924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mrx0n/wH1AU9/Kd3DKsddxQL4B8UbUVQPUD6kzeIA10=;
 b=ac89NKvoxn1Mz7gaeaDLAsExbjRB5rKrmgoqc92BYVie76jld+B924pJiNxLe26iea0WRm
 8L0XMwZ+Lw2cUVqcVW/LUXWfPJasGUnf3OL+Auz7NmwCteO+hnpDmCzkQegbz+f/rJgkU9
 6X+V8UOIWRtZ0CJ5QUDg1hWl29IHxao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Ol4hKDXLN66xAklq0iASNA-1; Fri, 18 Jun 2021 09:12:03 -0400
X-MC-Unique: Ol4hKDXLN66xAklq0iASNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D227800C78;
 Fri, 18 Jun 2021 13:12:01 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6682C5C224;
 Fri, 18 Jun 2021 13:11:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
In-Reply-To: <adca6d5e3c3037da7923489fa28fcd34be099e75.camel@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com>
 <877dirph77.fsf@redhat.com> <874kdvpchd.fsf@redhat.com>
 <adca6d5e3c3037da7923489fa28fcd34be099e75.camel@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 18 Jun 2021 15:11:52 +0200
Message-ID: <871r8zpbaf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:

> On Fri, 2021-06-18 at 14:46 +0200, Cornelia Huck wrote:
>> On Fri, Jun 18 2021, Cornelia Huck <cohuck@redhat.com> wrote:
>> 
>> > On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:
>> > > +/* format-0 extended-status word */
>> > > +typedef struct ESW {
>> > > +   uint32_t word0;
>> > > +   uint32_t erw;
>> > > +   uint64_t f_addr;     /* Zeros for other ESW formats */
>> > > +   uint32_t s_addr;     /* Zeros for other ESW formats */
>> > > +} QEMU_PACKED ESW;
>> > 
>> > Eww, this fails with mingw:
>> > https://gitlab.com/cohuck/qemu/-/jobs/1358335494
>> > In file included from /usr/i686-w64-mingw32/sys-
>> > root/mingw/include/winsock2.h:54,
>> >                  from /builds/cohuck/qemu/include/sysemu/os-
>> > win32.h:29,
>> >                  from /builds/cohuck/qemu/include/qemu/osdep.h:135,
>> >                  from ../hw/s390x/virtio-ccw-gpu.c:11:
>> > /builds/cohuck/qemu/include/hw/s390x/ioinst.h:131:13: error:
>> > expected ':', ',', ';', '}' or '__attribute__' before '.' token
>> >   131 |    uint32_t s_addr;     /* Zeros for other ESW formats */
>> >       |             ^~~~~~
>> 
>> It seems to be the name that is tripping it; if I rename it to
>> sec_addr
>> and the preceding field to fail_addr, the build passes.
>
> I was just wondering if it might have been the underscore directly, not
> that it was a single letter before the underscore. Weird.
>
>> 
>> Anyone know why that is? And if renaming is unavoidable, are
>> fail_addr
>> and sec_addr ok, or can we find better names?
>
> Since they're zero for Format-!0 ESWs, and regardless we don't fill
> them in anyway, could we just make them wordN and change the comment to
> give the descriptive name?
>
>  /* format-0 extended-status word */
>  typedef struct ESW {
> -   uint32_t
> word0;
> +   uint32_t word0;      /* subchannel logout for format 0 */
>     
> uint32_t erw;
> -   uint64_t f_addr;     /* Zeros for other ESW formats */
> -   uint32_t s_addr;     /* Zeros for other ESW formats */
> +   uint64_t
> word2;      /* failing-storage address for format 0 */
> +   uint32_t
> word4;      /* scondary-CCW address for format 0 */
>  } QEMU_PACKED ESW;
>

Yeah, that looks even better.

I can change that myself, will push out to test.


