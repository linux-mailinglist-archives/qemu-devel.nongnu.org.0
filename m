Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C1322B98
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:43:26 +0100 (CET)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEXyH-0007XN-O2
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lEXwh-0006aM-Ia
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lEXwe-0006I1-0g
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614087702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVnaSCYawGP/jQ0QGbiI+9A/4yJ02ur/fK7h4DvyxWs=;
 b=W+Q9tdgfFC+41t4ApdtY3rKHdjo9CqZU9fMk250g2EER8OaQ4iAkrsV+NXIqlpZD79VgP7
 ufguKBRbxaWoGCAPPU01d2XOd3OoXk7CLJNsbK84Ue3BiI1Xu0pE4gr7iLSD6uABXCOliE
 34ntosq8dqDkYlCWR8UhAc52ME6j3dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-1N8LulMaMkygqaMcOHL_PA-1; Tue, 23 Feb 2021 08:41:39 -0500
X-MC-Unique: 1N8LulMaMkygqaMcOHL_PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D700107ACE3;
 Tue, 23 Feb 2021 13:41:37 +0000 (UTC)
Received: from [10.3.113.71] (ovpn-113-71.phx2.redhat.com [10.3.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C3C65C277;
 Tue, 23 Feb 2021 13:41:28 +0000 (UTC)
Subject: Re: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
To: Stefan Hajnoczi <stefanha@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <YDTNkWsYbj3u5ejF@stefanha-x1.localdomain>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <92e02bd7-7f29-01b2-91e8-73c3fc689cba@redhat.com>
Date: Tue, 23 Feb 2021 07:41:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDTNkWsYbj3u5ejF@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 3:40 AM, Stefan Hajnoczi wrote:
> On Fri, Feb 05, 2021 at 06:13:06PM +0800, Jiahui Cen wrote:
>> This patch series propose to extend the werror=/rerror= mechanism to add
>> a 'retry' feature. It can automatically retry failed I/O requests on error
>> without sending error back to guest, and guest can get back running smoothly
>> when I/O is recovred.
> 
> This patch series implements a retry followed by werror/rerror=report
> after a timeout. This mechanism could be made more generic (and the code
> could be simplified) by removing the new werror/rerror=retry action and
> instead implementing the retry/timeout followed by *any* werror=/rerror=
> policy chosen by the user.
> 
> In other words, if the retry interval is non-zero, retry the request and
> check for timeouts. When the timeout is reached, obey the
> werror=/rerror= action.
> 
> This is more flexible than hard-coding werror=retry to mean retry
> timeout followed by werror=report.
> 
> For example:
> 
>   werror=stop,write-retry-interval=1000,write-retry-timeout=15000,
>   rerror=report,read-retry-interval=1000,read-retry-timeout=15000
> 
> Failed write requests will be retried once a second for 15 seconds.
> If the timeout is reached the guest is stopped.
> 
> Failed read requests will be retried once a second for 15 seconds. If
> the timeout is reached the error is reported to the guest.

You may also want to look at what the NBD block device already
implements for retries, and see if making retry generic to the block
layer in general can do everything already possible in the NBD code, at
which point the NBD code can be simplified.  Vladimir (added in cc) is
the best point of contact there.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


