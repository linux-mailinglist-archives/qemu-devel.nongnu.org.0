Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1F3F1F82
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 20:04:14 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGmOj-00032Q-Tu
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 14:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mGmNJ-0002Fy-3Q
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 14:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mGmNH-0000UD-AS
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 14:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629396162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6nRK6yJxzEMS680/NqI4khJuTT+j5SperRoHXwD9Uw=;
 b=ddyD5PkkDA7TFLW24KeQFrfAAHfSZL3KBUyDfaior5N00jRFKPPmKaenFfcFo1y5MQrodp
 HQiITDBXuq8WDb3Vqt+S8IjvpiOFmhVtSYfuQlmIdAuub4no3Hkhw5Py0obvZwzKCRgpgE
 qaICCZDh60klcpuZB0O0A1t99AofPOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-SCDoEkQKNZuAIoXLqctMiw-1; Thu, 19 Aug 2021 14:02:41 -0400
X-MC-Unique: SCDoEkQKNZuAIoXLqctMiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81CF6D4E1;
 Thu, 19 Aug 2021 18:02:39 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E335C18B42;
 Thu, 19 Aug 2021 18:02:31 +0000 (UTC)
Date: Thu, 19 Aug 2021 13:02:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/3] qcow2: handle_dependencies(): relax conflict detection
Message-ID: <20210819180230.eouxyi3j2754weyf@redhat.com>
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210724133846.64614-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-732-28786f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 24, 2021 at 04:38:46PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> There is no conflict and no dependency if we have parallel writes to
> different subclusters of one cluster when cluster itself is already

when the cluster itself

> allocated. So, relax extra dependency.
> 
> Measure performance:
> First, prepare build/qemu-img-old and build/qemu-img-new images.
> 
> cd scripts/simplebench
> ./img_bench_templater.py
> 
> Paste the following to stdin of running script:
> 
> qemu_img=../../build/qemu-img-{old|new}
> $qemu_img create -f qcow2 -o extended_l2=on /ssd/x.qcow2 1G
> $qemu_img bench -c 100000 -d 8 [-s 2K|-s 2K -o 512|-s $((1024*2+512))] \
>         -w -t none -n /ssd/x.qcow2
> 
> The result:
> 
> All results are in seconds
> 
> ------------------  ---------  ---------
>                     old        new
> -s 2K               6.7 ± 15%  6.2 ± 12%
>                                  -7%
> -s 2K -o 512        13 ± 3%    11 ± 5%
>                                  -16%
> -s $((1024*2+512))  9.5 ± 4%   8.4
>                                  -12%
> ------------------  ---------  ---------

Cool improvement.

> 
> So small writes are more independent now and that helps to keep deeper
> io queue which improves performance.
> 
> 271 iotest output becomes racy for three allocation in one cluster.
> Second and third writes may finish in different order. Second and
> third requests don't depend on each other any more. Still they both
> depend on first request anyway. Keep only one for consistent output.

Interesting fallout.  Yes, it looks like the test is still robust
enough without the extra request.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-cluster.c      | 11 +++++++++++
>  tests/qemu-iotests/271     |  4 +---
>  tests/qemu-iotests/271.out |  2 --
>  3 files changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


