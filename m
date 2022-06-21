Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D73553591
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:12:18 +0200 (CEST)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fY8-0007m9-Hh
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3fVJ-0005Yi-00
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3fVE-00034I-L9
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655824155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NK2kJ0dyb6gOSpKHYB9QxZlWRsDfXaCaFXkqObXQjTI=;
 b=Jd/y/a5DVuMXiv8mP8cjsOIgWJhHmjC6p3ROZJzKeJ8QpXEmsQCYYx7uGj54BRPl0BOj0M
 RIQ/UrFgIcgg1PhNN1JUMcSf16B/GGZyhpbPNE6vhCIpyK/YbP7JlK/LPuj1TSbpYarBB1
 br5a59YeFD+JBUHlwSwqKLaA9h+Ml+Y=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-58P96rd1PYOeAJG_wAOCdw-1; Tue, 21 Jun 2022 11:09:14 -0400
X-MC-Unique: 58P96rd1PYOeAJG_wAOCdw-1
Received: by mail-il1-f197.google.com with SMTP id
 k8-20020a056e02156800b002d91998aef7so2961457ilu.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NK2kJ0dyb6gOSpKHYB9QxZlWRsDfXaCaFXkqObXQjTI=;
 b=mVxPnaWnPc+uPbSqwc7s45m9C1EplF3rLVOo0D3EOfpTektQIoeZDkv6S8wVFGZPd3
 RoAbE3Vnrx/KS7TBeTJ6wEacs9w4HYny+WF7N1yj3ttN9K+/5dz7jB6VVIVyn5tfJKSN
 BbXlwQIEBGiGld8Br0xoifO+zuKbljbTR0H8nhdWHoEN/7JxpJgluXIPtkQ7N7JF6iTu
 NWLv7iIGbK4poUDzzeWfcUXUgeyKNx+uK+y21r1/rutZuqMtqHdyCgdqvd7LhN/7sves
 qJCYN5L8pkLP5KslhAomy7pKjQTVmTbd84HB5+P7cWJMmDsdPTcP2oyQDoMs9OtCMCfY
 /N2g==
X-Gm-Message-State: AJIora/tt3uDGM90uO5qDj4INM32kIh++rJ4f2GxeIG//JhoK42sbb/o
 4RTYpDlhnRc3tV+9UTkYau5hbpQqDTb5H8b2Vk3aJbjycnnSg6aePx6lECqL26I+vAzOPaJ9f34
 h++/f3Js25FSEdP8=
X-Received: by 2002:a5d:83c7:0:b0:66c:cc68:2f2d with SMTP id
 u7-20020a5d83c7000000b0066ccc682f2dmr13742453ior.74.1655824153600; 
 Tue, 21 Jun 2022 08:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vFEaNGuEm7Hv6BIJCKuMqbsbvW4X+36XVxTKiB3kZ4SOaFvHaLp/HmDK0vzTYX5s2awqfmrA==
X-Received: by 2002:a5d:83c7:0:b0:66c:cc68:2f2d with SMTP id
 u7-20020a5d83c7000000b0066ccc682f2dmr13742439ior.74.1655824153354; 
 Tue, 21 Jun 2022 08:09:13 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a92c9cc000000b002d9257d3eefsm1361638ilq.71.2022.06.21.08.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:09:12 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:09:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Leonardo =?utf-8?B?QnLDoXM=?= <leobras@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
Message-ID: <YrHfFiFbk+s13Zqg@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com>
 <87wndb4riu.fsf@secure.mitica> <YrCV089JKhc067sm@xz-m1.local>
 <7fbc118dedbaf7d01dd72220255affc98abffc9d.camel@redhat.com>
 <875ykuvzlw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875ykuvzlw.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 21, 2022 at 04:51:39PM +0200, Juan Quintela wrote:
> > IIRC, the kernel will fall back to copying only if the network adapter / driver
> > does not support MSG_ZEROCOPY, like when it does not support scatter-gather.
> 
> My understanding is that it will fallback when you have too much stuff
> inflight.

I think we'd better figure this out soon, because if so then IMHO we can't
simply fail the migration when the fallback happens..  If we're not sure
about that, we can always be on the safe side to dump an error only.

-- 
Peter Xu


