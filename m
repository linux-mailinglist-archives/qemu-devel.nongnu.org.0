Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D8D3A0426
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:38:21 +0200 (CEST)
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhYK-0001pq-RO
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqhWe-0007tJ-Dx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqhWc-00029q-Am
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623180993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2TOnaYaewZxhc35ityJCq39Tnd4OBJXc+yWwgcCmxGQ=;
 b=gKZQJ+yyNgeNzzlb/M99a7CU9ex+qST27gAtpr/IWCxYqkBRx2iizuBzpWMZuBRX5lYfba
 TxQWzJg5/1AD4MfM1jrajnMkXgYLWLCQmbrIMo2L75lIF+95QUvJiIyaaEAEO8tnKt2mHs
 oODRWUNB36aq/Q/w1lLnI9mvykipW7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-uXjSFocnNTGuq3keMevKsA-1; Tue, 08 Jun 2021 15:36:32 -0400
X-MC-Unique: uXjSFocnNTGuq3keMevKsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE84B104FB6C;
 Tue,  8 Jun 2021 19:36:30 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B01B5D9DC;
 Tue,  8 Jun 2021 19:36:25 +0000 (UTC)
Date: Tue, 8 Jun 2021 20:36:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Message-ID: <YL/Gtw64I0jbSXgn@work-vm>
References: <20210601005708.189888-1-peterx@redhat.com>
 <YL+71C9cteDVYJum@work-vm> <YL/C00m4LDZ9EVnY@t490s>
MIME-Version: 1.0
In-Reply-To: <YL/C00m4LDZ9EVnY@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Jun 08, 2021 at 07:49:56PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > These two commands are missing when adding the QMP sister commands.  Add them,
> > > so developers can play with them easier.
> > > 
> > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Cc: Juan Quintela <quintela@redhat.com>
> > > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > > Cc: Chuan Zheng <zhengchuan@huawei.com>
> > > Cc: huangy81@chinatelecom.cn
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > > ---
> > > PS: I really doubt whether this is working as expected... I ran one 200MB/s
> > > workload inside, what I measured is 20MB/s with current algorithm...  Sampling
> > > 512 pages out of 1G mem is not wise enough I guess, especially that assumes
> > > dirty workload is spread across the memories while it's normally not the case..
> > 
> > What size of address space did you dirty - was it 20MB?
> 
> IIRC it was either 200M or 500M, based on a 1G small VM.

What was your sample time ?

Dave

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


