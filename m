Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30042DE1D9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:17:26 +0100 (CET)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDlF-0004TM-Ga
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDZ9-0006Ds-IO
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDZ6-0003d0-Gz
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608289491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4jqY/18yXDw8Xgf5z1dyVYS+I7ooSVjGxmj8gB8rjY=;
 b=TzKJPKZRmyeJNtYvAXLmTPYMq8UYOcd2BT4jopiokeKFSUmv3qHVfLunT+lV4vcDQcMc01
 bLC+dZqkF3TvK2a4G9Z3csp8P4khMMyra2zQUyKhwYIfyRGii5dMRBEZt0G5NRliqSBLMI
 Xp5oHb0OG6EmfBnEBzjk/LMkgRX7PLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-36h2lNiSOZiy2BqwApwOng-1; Fri, 18 Dec 2020 06:04:49 -0500
X-MC-Unique: 36h2lNiSOZiy2BqwApwOng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BAFD1005504;
 Fri, 18 Dec 2020 11:04:48 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 620D91002382;
 Fri, 18 Dec 2020 11:04:47 +0000 (UTC)
Subject: Re: [PATCH 5/9] block/vpc: Pad VHDDynDiskHeader, replace uint8_t[]
 buffers
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-6-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ab2d47db-5526-fb7d-e63c-5954d3f8a2cb@redhat.com>
Date: Fri, 18 Dec 2020 12:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-6-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:19, Markus Armbruster wrote:
> Pad VHDDynDiskHeader as specified in the "Virtual Hard Disk Image
> Format Specification" version 1.0[*].  Change dynamic disk header
> buffers from uint8_t[1024] to VHDDynDiskHeader.  Their size remains
> the same.
> 
> The VHDDynDiskHeader * variables pointing to a VHDDynDiskHeader
> variable right next to it are now silly.  Eliminate them.
> 
> [*] http://download.microsoft.com/download/f/f/e/ffef50a5-07dd-4cf8-aaa3-442c0673a029/Virtual%20Hard%20Disk%20Format%20Spec_10_18_06.doc
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vpc.c | 41 +++++++++++++++++++----------------------
>   1 file changed, 19 insertions(+), 22 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


