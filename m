Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA51E4A81
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 18:41:21 +0200 (CEST)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdz7I-0002ZP-8y
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 12:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jdz6O-00022V-BR
 for qemu-devel@nongnu.org; Wed, 27 May 2020 12:40:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37231
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jdz6J-0001vT-Hm
 for qemu-devel@nongnu.org; Wed, 27 May 2020 12:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590597617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ji38yc1GI0PNLaEF5E2l/hzkNnAU4bsFkp9akPtilA=;
 b=W8zqqdMhgskhlPOBv4//wdPesZSpf/z5emED+sd3jShWtYxZg05LJ9QcIHu6BQT8/hTBgi
 ja9x1A/mK47Dr5NxS1L4UEbTRndVxHG/zVASxxjqj7vQrEjbh0ChMjDa1rmcwxnScJFdl3
 Eumf2IP4X0DvhApFbzhV5uFLZKA/wu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-o9rHW-xkN1KCVAIoCjKcnA-1; Wed, 27 May 2020 12:40:09 -0400
X-MC-Unique: o9rHW-xkN1KCVAIoCjKcnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2563118FF660;
 Wed, 27 May 2020 16:40:08 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44C6E5D9F1;
 Wed, 27 May 2020 16:40:07 +0000 (UTC)
Subject: Re: [PATCH v7 21/32] qcow2: Add subcluster support to
 qcow2_get_host_offset()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1590429901.git.berto@igalia.com>
 <46add38625edc8ffec0056018d2cc512efda9a55.1590429901.git.berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0ba75da9-5a39-a24b-068e-ed7b20cd5b27@redhat.com>
Date: Wed, 27 May 2020 11:40:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <46add38625edc8ffec0056018d2cc512efda9a55.1590429901.git.berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 05:46:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Derek Su <dereksu@qnap.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/20 1:08 PM, Alberto Garcia wrote:
> The logic of this function remains pretty much the same, except that
> it uses count_contiguous_subclusters(), which combines the logic of
> count_contiguous_clusters() / count_contiguous_clusters_unallocated()
> and checks individual subclusters.
> 
> qcow2_cluster_to_subcluster_type() is not necessary as a separate
> function anymore so it's inlined into its caller.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/qcow2.h         |  38 ++++-------
>   block/qcow2-cluster.c | 150 ++++++++++++++++++++++--------------------
>   2 files changed, 92 insertions(+), 96 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


