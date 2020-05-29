Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D11E84B7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 19:22:30 +0200 (CEST)
Received: from localhost ([::1]:52374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeiiD-0007lp-0r
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jeihG-0007M7-UI
 for qemu-devel@nongnu.org; Fri, 29 May 2020 13:21:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56118
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jeihF-0002GW-DC
 for qemu-devel@nongnu.org; Fri, 29 May 2020 13:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590772887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qx9T2EoD179A8dEFW1nhgxN05j0avav7Aka5VGpiwL8=;
 b=guM9DO9DjtPB6Au6rKVPEVuECNWIBDcIxB/CBjF5PaBhAaYQcT4umJ0JEeVPWxePipBBDI
 Mn4wfKJ7lXGacJYj7enEN5XUYxjp6CSAF9N/8BbkuieYx6liZjLN/JPmgWxEVV8+Med/Gk
 XiyMt2UPgpnywT51Co8rsnZ1B1a5Y8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-JnomV8lzM0OhWzgwwxwg9g-1; Fri, 29 May 2020 13:21:25 -0400
X-MC-Unique: JnomV8lzM0OhWzgwwxwg9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA9B464;
 Fri, 29 May 2020 17:21:24 +0000 (UTC)
Received: from work-vm (ovpn-113-111.ams2.redhat.com [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 939EA5C1B5;
 Fri, 29 May 2020 17:21:22 +0000 (UTC)
Date: Fri, 29 May 2020 18:21:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/2] migration/rdma: fix potential nullptr access in
 rdma_start_incoming_migration
Message-ID: <20200529172120.GP2856@work-vm>
References: <20200508100755.7875-1-pannengyuan@huawei.com>
 <20200508100755.7875-2-pannengyuan@huawei.com>
 <878si2hnht.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <878si2hnht.fsf@secure.mitica>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 23:43:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Pan Nengyuan <pannengyuan@huawei.com> wrote:
> > 'rdma' is NULL when taking the first error branch in rdma_start_incoming_migration.
> > And it will cause a null pointer access in label 'err'. Fix that.
> >
> > Fixes: 59c59c67ee6b0327ae932deb303caa47919aeb1e
> > Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> good catch.

Thanks, Queued

> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


