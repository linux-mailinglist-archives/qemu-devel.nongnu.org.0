Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF732D7A9B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:14:13 +0100 (CET)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl3c-0005zl-Tk
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knkzm-0002KY-0V
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knkze-0005oL-Kd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607703005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qg0Lq80o/24arYFmamo9BysVV3UR7KgCYaBFSHTg+AI=;
 b=ZkxN1Ve0ap6LmJnHDxWfGbpx0E20g/ymAE7AszDBqBVQWpEO6rIQLIRNzDkaJZi6G75vAQ
 UdAKpVjq/xb73KHMTs2djDjHv5z4VRJRXAQSKFlFWHdG0+gK7FdTwafsKduhXc9+4CDB3G
 Iwn7i3ZTRTVpBo5Ua3OlNQlEYSpPT+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-C29YZHuyNl62bR0ikRnSJA-1; Fri, 11 Dec 2020 11:10:01 -0500
X-MC-Unique: C29YZHuyNl62bR0ikRnSJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 477811842141;
 Fri, 11 Dec 2020 16:10:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7263D10016F5;
 Fri, 11 Dec 2020 16:09:54 +0000 (UTC)
Subject: Re: [PATCH v14 11/13] iotests: 30: prepare to COR filter insertion by
 stream job
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-12-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f3d41669-5689-c548-1fa9-4a8f40ddbd02@redhat.com>
Date: Fri, 11 Dec 2020 17:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-12-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> test_stream_parallel run parallel stream jobs, intersecting so that top
> of one is base of another. It's OK now, but it would be a problem if
> insert the filter, as one job will want to use another job's filter as
> above_base node.
> 
> Correct thing to do is move to new interface: "bottom" argument instead
> of base. This guarantees that jobs don't intersect by their actions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/030 | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


