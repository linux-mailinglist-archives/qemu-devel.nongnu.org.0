Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7142EBBD5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 10:50:27 +0100 (CET)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx5ST-00034n-Iy
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 04:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kx5QQ-0002Jj-RC
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 04:48:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kx5QO-0004QZ-82
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 04:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609926495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a38i1+500P5e3M/UNGlM9y85B5kRqzL5SfvA+v5qmUc=;
 b=JjB9GAr5Byf/GJ+KDT5+av4KtI5R6RY9tgc8GDyNTow56onKXXmkdescjCtP3+6QUpHcsm
 tKd25xxvPU37n7lGRB17feGl6rekJ8v61NZMeMJut5FCYkHcGXK+3dQerenWTeGDAnTaez
 ybZ0rvHnDuiI065kHmMBrW2bVRJ8KFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-QFHBInbWNSOfYYHkixnIQg-1; Wed, 06 Jan 2021 04:48:13 -0500
X-MC-Unique: QFHBInbWNSOfYYHkixnIQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E0EB107ACE8;
 Wed,  6 Jan 2021 09:48:12 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-89.ams2.redhat.com
 [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 344A13A3;
 Wed,  6 Jan 2021 09:48:10 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] block: report errno when flock fcntl fails
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
 <20201221134931.1194806-2-david.edmondson@oracle.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f70e8b9b-2e28-7bd8-c260-c86952eeba0a@redhat.com>
Date: Wed, 6 Jan 2021 10:48:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221134931.1194806-2-david.edmondson@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.12.20 14:49, David Edmondson wrote:
> When a call to fcntl(2) for the purpose of manipulating file locks
> fails, report the error returned by fcntl.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   block/file-posix.c         | 20 +++++-----
>   tests/qemu-iotests/153.out | 76 +++++++++++++++++++-------------------
>   tests/qemu-iotests/182.out |  2 +-
>   3 files changed, 49 insertions(+), 49 deletions(-)

tests/qemu-iotests/296.out also needs to be adjusted (found by grepping 
for 'Failed to get').

And now I might as well add this idea: EAGAIN is the most common errno 
when flock fcntl fails, so would it make sense to generate a custom 
error message then?  I’d like to think we could do better than “Resource 
temporarily unavailable”, e.g. perhaps “Lock is already taken”.

OTOH, “Resource temporarily unavailable” isn’t *that* bad, so if you 
don’t want to, I won’t push for it.

Max


