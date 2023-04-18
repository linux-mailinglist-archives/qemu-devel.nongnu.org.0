Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6F6E6AD2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 19:22:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pop1c-0008IP-DK; Tue, 18 Apr 2023 13:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pop1Z-0008IG-Ob
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pop1X-0004Se-6K
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681838506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mId/pkPlPy5udyWu4qF7OqEb8oo254rS4nhCO4uIJPM=;
 b=OQ7fwqYRlm4lx+rUwxsM9X26KCzPIq+VYz19xZzDWx1z0Ir2p1Zvyh6wyWbOZHn3DuZyAM
 vYoBOquSTy7dJVbREAX8MFC1y9Nz8EH72XD2rEJ+zMFTOm10RkMbwI3lU9mQHAwf3dLRcm
 /oRDlzIznmV2SD7v25adakcDvrY/Y0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-1oR19BicOj6lDU7HddFeSQ-1; Tue, 18 Apr 2023 13:21:43 -0400
X-MC-Unique: 1oR19BicOj6lDU7HddFeSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B76A6101A552;
 Tue, 18 Apr 2023 17:21:42 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFE7A1121314;
 Tue, 18 Apr 2023 17:21:41 +0000 (UTC)
Date: Tue, 18 Apr 2023 18:21:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gudkov Andrei <gudkov.andrei@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [PATCH 0/2] Migration time prediction using calc-dirty-rate
Message-ID: <ZD7RoxC22eIDwvUn@redhat.com>
References: <cover.1677589218.git.gudkov.andrei@huawei.com>
 <cd6187297b0e4196a3e916faff921a07@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd6187297b0e4196a3e916faff921a07@huawei.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan,

This series could use some feedback from the migration maintainer
POV. I think it looks like a valuable idea to take which could
significantly help mgmt apps plan migration.

Daniel

On Tue, Apr 18, 2023 at 01:25:08PM +0000, Gudkov Andrei via wrote:
> ping5
> 
> https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/
> 
> -----Original Message-----
> From: Gudkov Andrei 
> Sent: Monday, April 10, 2023 18:19
> To: 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>
> Cc: 'quintela@redhat.com' <quintela@redhat.com>; 'dgilbert@redhat.com' <dgilbert@redhat.com>; 'jsnow@redhat.com' <jsnow@redhat.com>; 'eblake@redhat.com' <eblake@redhat.com>
> Subject: RE: [PATCH 0/2] Migration time prediction using calc-dirty-rate
> 
> ping4
> 
> https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/
> 
> -----Original Message-----
> From: Gudkov Andrei 
> Sent: Monday, April 3, 2023 17:42
> To: 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>
> Cc: 'quintela@redhat.com' <quintela@redhat.com>; 'dgilbert@redhat.com' <dgilbert@redhat.com>
> Subject: RE: [PATCH 0/2] Migration time prediction using calc-dirty-rate
> 
> ping3
> 
> https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/
> 
> -----Original Message-----
> From: Gudkov Andrei 
> Sent: Monday, March 27, 2023 17:09
> To: 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>
> Cc: 'quintela@redhat.com' <quintela@redhat.com>; 'dgilbert@redhat.com' <dgilbert@redhat.com>
> Subject: RE: [PATCH 0/2] Migration time prediction using calc-dirty-rate
> 
> ping2
> 
> https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/
> 
> -----Original Message-----
> From: Gudkov Andrei 
> Sent: Friday, March 17, 2023 16:29
> To: qemu-devel@nongnu.org
> Cc: quintela@redhat.com; dgilbert@redhat.com
> Subject: RE: [PATCH 0/2] Migration time prediction using calc-dirty-rate
> 
> ping
> 
> https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/
> 
> -----Original Message-----
> From: Gudkov Andrei 
> Sent: Tuesday, February 28, 2023 16:16
> To: qemu-devel@nongnu.org
> Cc: quintela@redhat.com; dgilbert@redhat.com; Gudkov Andrei <gudkov.andrei@huawei.com>
> Subject: [PATCH 0/2] Migration time prediction using calc-dirty-rate
> 
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


