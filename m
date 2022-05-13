Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77D525C1B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:12:56 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPTr-0008J0-EQ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1npPLZ-00059b-5W
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1npPLW-0005Vf-Kr
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652425457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xbPES43nd6tV2ykaPymp8GMoCBU/wjpuSd8+247OmgI=;
 b=aH+Z3Flvtt2O1e3W8aQVbIIQ5/SAxKMFkRXnXIzKWt+kwFkeH7//U11ZetmHSlfRi+/keh
 ng9CAo1Cx41QyxbicIrRzTZxlaCFzKQD8lnjLhc2sPETaU+wxr17h2V6uI+pO7YKE1O1yl
 gSeaODKFuXOR6stJ0jaejtNe1D7eUHU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-aRhbDp2ePjyRWSag9TNx9w-1; Fri, 13 May 2022 03:04:16 -0400
X-MC-Unique: aRhbDp2ePjyRWSag9TNx9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACC53C138B6;
 Fri, 13 May 2022 07:04:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 668B81460E5D;
 Fri, 13 May 2022 07:04:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>, Avihai Horon
 <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Thomas Huth
 <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH 0/9] vfio/migration: Implement VFIO migration protocol v2
In-Reply-To: <20220512120218.0f871784.alex.williamson@redhat.com>
Organization: Red Hat GmbH
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512120218.0f871784.alex.williamson@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 13 May 2022 09:04:14 +0200
Message-ID: <871qwxc3rl.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Thu, May 12 2022, Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 12 May 2022 18:43:11 +0300
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Hello,
>> 
>> Following VFIO migration protocol v2 acceptance in kernel, this series
>> implements VFIO migration according to the new v2 protocol and replaces
>> the now deprecated v1 implementation.
>
> Let's not bottleneck others waiting on a linux header file update on
> also incorporating v2 support.  In the short term we just need the
> first two patches here.
>
> Are there any objections to folding those patches together for the sake
> of bisection?  Thanks,
>
> Alex

I think folding the headers update and the fixup together makes a lot of
sense. And yes, I'd like to see it in QEMU quickly in order to unblock
other series.


