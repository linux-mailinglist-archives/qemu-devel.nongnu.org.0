Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2DB3F76FC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:17:24 +0200 (CEST)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItiU-0001iF-TM
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mIthc-0000vH-E4
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 10:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mIthZ-0004sg-Oj
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 10:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629900984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b9zkzuZdM+hNcHf/OnpvtAlPHQIQbp1VCk+cAXKUE8=;
 b=d1cLE344f6apgTA2iQ3Iid0iq0+plY5upMD2kYEkKgBMskXSC1t14VXzfA6/nA8NhJc8JZ
 +PhthvQYWTeEbnz0HeRci/n4cpi9ltXJUIWNS3Vs/8hkwO08jfcKVG8VHDpcdeKHELmL6s
 WhwyfTII47sgdOeonkFa5nVDtoB32nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-GMNwbWY1Mr2C8iEDxtd-aA-1; Wed, 25 Aug 2021 10:16:18 -0400
X-MC-Unique: GMNwbWY1Mr2C8iEDxtd-aA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7D487D54A;
 Wed, 25 Aug 2021 14:16:16 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BFD569CBA;
 Wed, 25 Aug 2021 14:16:16 +0000 (UTC)
Date: Wed, 25 Aug 2021 09:16:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 3/3] qcow2: handle_dependencies(): relax conflict
 detection
Message-ID: <20210825141614.34gnevef2bts7bsg@redhat.com>
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
 <20210824101517.59802-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210824101517.59802-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: kwolf@redhat.com, den@openvz.org, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 01:15:17PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> There is no conflict and no dependency if we have parallel writes to
> different subclusters of one cluster when the cluster itself is already
> allocated. So, relax extra dependency.
> 
...
> So small writes are more independent now and that helps to keep deeper
> io queue which improves performance.
> 
> 271 iotest output becomes racy for three allocation in one cluster.
> Second and third writes may finish in different order. Second and
> third requests don't depend on each other any more. Still they both
> depend on first request anyway. Filter out second and third write
> offsets to cover both possible outputs.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-cluster.c      | 11 +++++++++++
>  tests/qemu-iotests/271     |  5 ++++-
>  tests/qemu-iotests/271.out |  4 ++--
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 

> +++ b/tests/qemu-iotests/271
> @@ -893,7 +893,10 @@ EOF
>  }
>  
>  _make_test_img -o extended_l2=on 1M
> -_concurrent_io     | $QEMU_IO | _filter_qemu_io
> +# Second an third writes in _concurrent_io() are independent and may finish in

and

> +# different order. So, filter offset out to match both possible variants.
> +_concurrent_io     | $QEMU_IO | _filter_qemu_io | \
> +    $SED -e 's/\(20480\|40960\)/OFFSET/'
>  _concurrent_verify | $QEMU_IO | _filter_qemu_io
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


