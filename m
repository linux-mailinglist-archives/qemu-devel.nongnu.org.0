Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CA27896A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:23:18 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLngz-0004tz-RA
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kLnYC-0003Qf-Bc
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kLnYA-00048b-Fl
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:14:12 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601039649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4W4WiY1o7CPnavQCkXEkrrwg6Rky8QFo7TYJ6WKwrts=;
 b=AM7WO/vJLEMKEHVwuXGds3HfmqhDgXhWImfCdYuZhZq9xm0/FCNf0eKMB0WL9V7Bpq6JWe
 AxK+h/MT6XCmkgv4xIzJdFJkDIMXw0LbrFE6BzRCpQUsHSyfu3B3MPt4DgwwXdsRL2tAVg
 bCb6TAPIBMTzAOOcu5T0YR0iw6MBM5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-I87u5zjaNhKdledP2YhgZw-1; Fri, 25 Sep 2020 09:14:05 -0400
X-MC-Unique: I87u5zjaNhKdledP2YhgZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A448018A4;
 Fri, 25 Sep 2020 13:14:04 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-239.rdu2.redhat.com [10.10.116.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC1FF7B7A2;
 Fri, 25 Sep 2020 13:13:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7C5CB222FC0; Fri, 25 Sep 2020 09:13:56 -0400 (EDT)
Date: Fri, 25 Sep 2020 09:13:56 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: virtiofs vs 9p performance
Message-ID: <20200925131356.GD132653@redhat.com>
References: <20200918213436.GA3520@redhat.com>
 <46D726A6-72F3-40FE-9382-A189513F783D@intel.com>
 <20200924221023.GB132653@redhat.com> <17216624.eqST2d0sUl@silver>
MIME-Version: 1.0
In-Reply-To: <17216624.eqST2d0sUl@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Shinde, Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 25, 2020 at 10:06:41AM +0200, Christian Schoenebeck wrote:
> On Freitag, 25. September 2020 00:10:23 CEST Vivek Goyal wrote:
> > In my testing, with cache=none, virtiofs performed better than 9p in
> > all the fio jobs I was running. For the case of cache=auto  for virtiofs
> > (with xattr enabled), 9p performed better in certain write workloads. I
> > have identified root cause of that problem and working on
> > HANDLE_KILLPRIV_V2 patches to improve WRITE performance of virtiofs
> > with cache=auto and xattr enabled.
> 
> Please note, when it comes to performance aspects, you should set a reasonable 
> high value for 'msize' on 9p client side:
> https://wiki.qemu.org/Documentation/9psetup#msize

Interesting. I will try that. What does "msize" do? 

> 
> I'm also working on performance optimizations for 9p BTW. There is plenty of 
> headroom to put it mildly. For QEMU 5.2 I started by addressing readdir 
> requests:
> https://wiki.qemu.org/ChangeLog/5.2#9pfs

Nice. I guess this performance comparison between 9p and virtiofs is good.
Both the projects can try to identify weak points and improve performance.

Thanks
Vivek


