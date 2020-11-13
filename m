Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E158A2B1A24
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:38:10 +0100 (CET)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXP7-0004Bw-W8
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdXO9-0003Fn-P8
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdXO4-00084V-3o
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605267422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsWH8Y79r50fdzH7z2ps7QNRmRndghvZyHj+h7f2MEw=;
 b=GWE1INgaPwuESxlAduJiyXCsOX+ai5juO3DIU6LP7g6sL0e88iiHZWGQu/Fibisp4h6bRZ
 5BKSvIMEY5RX1mVOsTvQ8L4sqDCUoAaGFzBh0QMa785CIpfy8j2fEfkpSmnwRv46C5BjZ7
 yXRwGuWEywsc5YqfzR+DjIyVh4el/tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-WL_1bXDCMwK4HYdeXzohKA-1; Fri, 13 Nov 2020 06:37:01 -0500
X-MC-Unique: WL_1bXDCMwK4HYdeXzohKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C965185A0FC;
 Fri, 13 Nov 2020 11:37:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9708160BE2;
 Fri, 13 Nov 2020 11:36:58 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] quorum: Implement bdrv_co_block_status()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1605111801.git.berto@igalia.com>
 <6b6256192945e7cacb9b0a9bf2b0db086d7f52e3.1605111801.git.berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6045ed83-ffa6-b5e8-e604-ce2140aef7ea@redhat.com>
Date: Fri, 13 Nov 2020 12:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6b6256192945e7cacb9b0a9bf2b0db086d7f52e3.1605111801.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.20 17:53, Alberto Garcia wrote:
> The quorum driver does not implement bdrv_co_block_status() and
> because of that it always reports to contain data even if all its
> children are known to be empty.
> 
> One consequence of this is that if we for example create a quorum with
> a size of 10GB and we mirror it to a new image the operation will
> write 10GB of actual zeroes to the destination image wasting a lot of
> time and disk space.
> 
> Since a quorum has an arbitrary number of children of potentially
> different formats there is no way to report all possible allocation
> status flags in a way that makes sense, so this implementation only
> reports when a given region is known to contain zeroes
> (BDRV_BLOCK_ZERO) or not (BDRV_BLOCK_DATA).
> 
> If all children agree that a region contains zeroes then we can return
> BDRV_BLOCK_ZERO using the smallest size reported by the children
> (because all agree that a region of at least that size contains
> zeroes).
> 
> If at least one child disagrees we have to return BDRV_BLOCK_DATA.
> In this case we use the largest of the sizes reported by the children
> that didn't return BDRV_BLOCK_ZERO (because we know that there won't
> be an agreement for at least that size).
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Tested-by: Tao Xu <tao3.xu@intel.com>
> ---
>   block/quorum.c             |  52 +++++++++++++
>   tests/qemu-iotests/312     | 148 +++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/312.out |  67 +++++++++++++++++
>   tests/qemu-iotests/group   |   1 +
>   4 files changed, 268 insertions(+)
>   create mode 100755 tests/qemu-iotests/312
>   create mode 100644 tests/qemu-iotests/312.out

Reviewed-by: Max Reitz <mreitz@redhat.com>


