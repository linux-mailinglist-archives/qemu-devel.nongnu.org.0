Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319B253115
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 16:19:32 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAwGx-0001oc-K6
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 10:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAwFZ-0000kL-9a
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:18:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24704
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAwFW-0003i4-Qo
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598451481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nw23zQsj3FR90Q5khVNmwMxegiJKzbvKv8zCLe1i7SQ=;
 b=OGN22Ik7GLSPep7dAK4NUs3S5akziPFNGjj5m7m6fPzMuEGsvKUNfDBp771zbWXJB9xF3A
 zW1blySZgdHYXdL7w+UQRp+nZKoi40yAvoYdlMCPhLOqDI3/dDyvORrIzAFYNL+C06eiY/
 VCHvcVyjCYhPNN7TocQuqSD0y8V21BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-bSkG7VcEOLuMSXChKMkaPg-1; Wed, 26 Aug 2020 10:17:56 -0400
X-MC-Unique: bSkG7VcEOLuMSXChKMkaPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7D51007465;
 Wed, 26 Aug 2020 14:17:55 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FDA05C1C2;
 Wed, 26 Aug 2020 14:17:54 +0000 (UTC)
Date: Wed, 26 Aug 2020 10:17:54 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] numa: hmat: fix cache size check
Message-ID: <20200826141754.GA642093@habkost.net>
References: <20200821100519.1325691-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200821100519.1325691-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mprivozn@redhat.com, qemu-devel@nongnu.org, jingqi.liu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 06:05:19AM -0400, Igor Mammedov wrote:
> when QEMU is started like:
> 
> qemu-system-x86_64 -smp 2 -machine hmat=on \
>  -m 2G \
>  -object memory-backend-ram,size=1G,id=m0 \
>  -object memory-backend-ram,size=1G,id=m1 \
>  -numa node,nodeid=0,memdev=m0 \
>  -numa node,nodeid=1,memdev=m1,initiator=0 \
>  -numa cpu,node-id=0,socket-id=0 \
>  -numa cpu,node-id=0,socket-id=1 \
>  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5 \
>  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
>  -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
>  -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \
>  -numa hmat-cache,node-id=0,size=8K,level=1,associativity=direct,policy=write-back,line=5 \
>  -numa hmat-cache,node-id=0,size=16K,level=2,associativity=direct,policy=write-back,line=5
> 
> it errors out with:
>  -numa hmat-cache,node-id=0,size=16K,level=2,associativity=direct,policy=write-back,line=5:
>         Invalid size=16384, the size of level=2 should be less than the size(8192) of level=1
> 
> which doesn't look right as one would expect that L1 < L2 < L3 ...
> Fix it by sawpping relevant size checks.
> 
> Fixes: c412a48d4d91 (numa: Extend CLI to provide memory side cache information)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Queued, thanks!

-- 
Eduardo


