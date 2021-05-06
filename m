Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB437546E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:08:17 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ledjj-0001Cl-Q2
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ledhl-0000a0-0n
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ledhg-0003ly-7X
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620306364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q5q1nuCGKBKnd2ChWQiK2d796I7OGJxR0DIhcPSP7Wk=;
 b=OE9FKWU2DgtMCnMNevod4XDTZPu5pU1mjeC6tfAI+ZvxO+/o1wMr0Mc4rNjNT+r8zCSOlt
 AJ3jwTJE5DouD7gV5qtp9nw0K4v+LFTU0gZZ7mt5qk7lLNs7FGTWxfxZZz99cT9XXh7U98
 AhDuMc4XHdG09IBzMDQaDRDuRqXkl2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-ZrH5xdVROZyABmsVWFwzwA-1; Thu, 06 May 2021 09:06:01 -0400
X-MC-Unique: ZrH5xdVROZyABmsVWFwzwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB4081800D50;
 Thu,  6 May 2021 13:05:59 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 901F65D9DE;
 Thu,  6 May 2021 13:05:54 +0000 (UTC)
Date: Thu, 6 May 2021 14:05:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [question] The source cannot recover, if the destination fails
 in the last round of live migration
Message-ID: <YJPpr0z+sV3lQMxZ@work-vm>
References: <7d87a3b7-86c9-9248-59dc-e1612a00e7c3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7d87a3b7-86c9-9248-59dc-e1612a00e7c3@huawei.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> Hi all,

Hi,

> Recently I am learning about the part of live migration.
> I have a question about the last round.
> 
> When the pending_size is less than the threshold, it will enter
> the last round and call migration_completion(). It will stop the
> source and sent the remaining dirty pages and devices' status
> information to the destination. The destination will load these
> information and start the VM.
> 
> If there is an error at the destination at this time, it will exit
> directly, and the source will not be able to detect the error
> and recover. Because the source will not call
> migration_detect_error().
> 
> Is my understanding correct?
> Should the source wait the result of the last round of destination ?

Try setting the 'return-path' migration capability on both the source
and destination;  I think it's that option will cause the destination to
send an OK/error at the end and the source to wait for it.

Dave

> Thanks,
> Kunkun Jiang
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


