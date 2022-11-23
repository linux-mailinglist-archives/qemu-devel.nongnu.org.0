Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792A636859
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 19:14:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxuEh-0006nF-76; Wed, 23 Nov 2022 13:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxuEf-0006mg-He
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:12:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxuEe-0003Gn-0a
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669227155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+LgJavRVeTWO9eKxf0CHgUmjkCetmIwB8QzYpORZN5g=;
 b=Z19NjkBV+++e4nUdfX0LeEWoy7iJERlWartWg0cog/JZNHY5fNyCKyOgpXJJdcSCnLJmoj
 NlpVa4Y7ZfF1krXgq3JJmfrxvz+iG3I88rLoHr3CSy5OffdA1faPUFSp7+6db87OhrcU5I
 oOT17dczqGnXZR6uLYo5T700G9x/wzM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-7jCQ_gRsNXaMNreaMa6hYg-1; Wed, 23 Nov 2022 13:12:31 -0500
X-MC-Unique: 7jCQ_gRsNXaMNreaMa6hYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0F2C29DD9B2;
 Wed, 23 Nov 2022 18:12:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CA1F40C83BB;
 Wed, 23 Nov 2022 18:12:27 +0000 (UTC)
Date: Wed, 23 Nov 2022 19:12:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Peter Lieven <pl@kamp.de>, Eric Blake <eblake@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, integration@gluster.org
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Message-ID: <Y35iiLUfoHKhAZEQ@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
 <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
 <4a16c6dd-7806-429a-f62d-afd13bebc52c@redhat.com>
 <Y34kBsj1NEV+kmJQ@redhat.com>
 <e6b0dc87-8ff8-6388-748d-5eee25d374f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b0dc87-8ff8-6388-748d-5eee25d374f2@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 23.11.2022 um 18:04 hat Paolo Bonzini geschrieben:
> On 11/23/22 14:45, Kevin Wolf wrote:
> > I think this means that if we clean up everything, in the end we'll have
> > coroutine_wrapper and coroutine_wrapper_bdrv (the fourth version not in
> > the above list, but that Paolo mentioned we may want to have).
> 
> Yes, I agree.
> 
> > The only thing I'm unsure about is whether coroutine_wrapper_bdrv is
> > descriptive enough as a name or whether it should be something more
> > explicit like coroutine_wrapper_bdrv_graph_locked.
> 
> That's already long and becomes longer if you add "mixed", but perhaps
> co_wrapper_{mixed_,}{bdrv_graph_rdlock,} would be okay?
> 
> In other words:
> 
> generated_co_wrapper_simple -> co_wrapper
> generated_co_wrapper        -> co_wrapper_mixed
> generated_co_wrapper_bdrv   -> co_wrapper_mixed_bdrv_graph_rdlock
> 
> ?

Works for me. Maybe co_wrapper_mixed_bdrv_rdlock (without the "graph")
would be enough, too, if it is too long.

Kevin


