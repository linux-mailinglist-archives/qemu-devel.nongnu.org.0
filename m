Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766AC44DB16
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:27:50 +0100 (CET)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDrZ-0003yL-93
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlDqb-0002kz-A0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlDqY-0004I2-GF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636651605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8rLN0gSGi4UfsrJ05a+dEpSFWQQDZKLFWdyWmisvKE=;
 b=JkbW0GpF2c1QMJSJWBxuY3aRPlfzgkqaNryavfWORZwNs8TOwALZq/sHS1PPyF2WWI6arR
 TrJJmNDihARHVOpCWqo+6RsjCfQLi7W/fLd2YYq7Y9xnRS0JT8qB/WLRVeet7bNKPICzEL
 lkkPa0qz71wjeL+IGif449ipLVFmkdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-BQosaLHUNKaCORn0dahE_Q-1; Thu, 11 Nov 2021 12:26:43 -0500
X-MC-Unique: BQosaLHUNKaCORn0dahE_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C941118125F1;
 Thu, 11 Nov 2021 17:26:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96161380;
 Thu, 11 Nov 2021 17:25:59 +0000 (UTC)
Date: Thu, 11 Nov 2021 18:25:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 00/10] block: Attempt on fixing 030-reported errors
Message-ID: <YY1SJQLbbw7XwCh/@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2021 um 13:08 hat Hanna Reitz geschrieben:
> Hi,
> 
> v1 cover letter:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg01287.html
> 
> In v2 I’ve addressed the comments I’ve received from Kevin and Vladimir.
> To this end, I’ve retained only the non-controversial part in patch 5,
> and split everything else (i.e. the stuff relating to
> bdrv_replace_child_tran()) into the dedicated patches 6 and 8.
> 
> Kevin’s most important comments (to my understanding) were that:
> 
> (A) When bdrv_remove_file_or_backing_child() uses
>     bdrv_replace_child_tran(), we have to ensure that the BDS lives as
>     long as the transaction does.  This is solved by keeping a strong
>     reference to it that’s released only when the transaction is cleaned
>     up (and the new patch 7 ensures that the .clean() handler will be
>     invoked after all .commit()/.abort() handlers, so the reference will
>     really live as long as the transaction does).
> 
> (B) bdrv_replace_node_noperm() passes a pointer to loop-local variable,
>     which is a really bad idea considering the transaction lives much
>     longer than one loop iteration.
>     Luckily, the new_bs it passes is always non-NULL, and so
>     bdrv_replace_child_tran() actually doesn’t need to store the
>     BdrvChild ** pointer, because for a non-NULL new_bs, there is
>     nothing to revert in the abort handler.  We just need to clarify
>     this, not store the pointer in case of a non-NULL new_bs, and assert
>     that bdrv_replace_node_noperm() and its relatives are only used to
>     replace an existing node by some other existing (i.e. non-NULL)
>     node.

Thanks, applied to the block branch.

Kevin


