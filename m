Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD034D4D6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:23:29 +0200 (CEST)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQufo-0008WM-FW
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQueZ-00086a-DZ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQueT-0000NC-81
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617034922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xX/Gs8ssDz2THBgfvrrLeQe8umCrCvhzI5eDCc8t4K0=;
 b=PkHtx7y89sUDW03icXSRR1g2k+3/bYPaUFtxumhuHa0oa8lB4DaiUjafqTvrXr1KecJxnE
 S/KVvmjZUlwg6SfUUHAyGZjmFqfJTs9nXCfJTFiVHrF3xtQ/9iTQbOKDAx4YnDZC+lwHWu
 RySgiBA5kB+X+Tw0yKHnDbHNRzvoSnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-FOYzEgJKMVGKShqHA8hkVg-1; Mon, 29 Mar 2021 12:21:41 -0400
X-MC-Unique: FOYzEgJKMVGKShqHA8hkVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F123C108BD12;
 Mon, 29 Mar 2021 16:21:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-119.ams2.redhat.com
 [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB1190A11;
 Mon, 29 Mar 2021 16:21:38 +0000 (UTC)
Subject: Re: [PATCH 0/2] file-posix: Cache next hole
To: qemu-block@nongnu.org
References: <20210211172242.146671-1-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f5c18995-3e77-ce4a-3c2b-e20978ed0c44@redhat.com>
Date: Mon, 29 Mar 2021 18:21:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210211172242.146671-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.21 18:22, Max Reitz wrote:
> Hi,

[...]

> (Speaking of “unless the WRITE permission is shared”: mirror_top is a
> bit broken in that it takes no permissions (but WRITE if necessary) and
> shares everything.  That seems wrong.  Patch 1 addresses that, so that
> patch 2 can actually do something when mirroring an image.)

I plan to send a v2 of patch 2 at some point, but for now I’ve applied 
patch 1 to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

https://bugzilla.redhat.com/show_bug.cgi?id=1940118 reports an abort, 
which I think can be avoided with patch 1 of this series: The mirror job 
lifts all permissions on the source node, so you can freely take locks 
with some other process, and then mirror_exit_common() fails when it 
tries to take those permissions back (at least when cancelling the job).

I plan to send an iotest for this, but getting this into rc1 is more 
important than waiting for the test, I think.

Max


