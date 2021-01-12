Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CD2F2E32
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:43:13 +0100 (CET)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI4u-0003Ek-MM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzHUW-00071Z-Qm
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzHUR-0001ZN-RC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610449530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JSUWmZbL4Sr5GVawTdDdiQbpDRG/thJH5WRQzCmHj4=;
 b=jQgrO4WzdcTb1+i0jYkS340bHVPx9Gf+s2cEjM96f+95Vj1iFZ5o+ISUbWWlzABVFzGDKM
 LKxdx2IQC0LkSWC3TROJk8OGd1tdn6SchwTOWBNrXbgAYOt9Ew4aRLOZ0YGdmORpMM5wYH
 +8tzrsHHBnoLKM1xB6rA/NVygzxaQUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-LJlz1zQpMuWNjljEq7AxiQ-1; Tue, 12 Jan 2021 06:05:26 -0500
X-MC-Unique: LJlz1zQpMuWNjljEq7AxiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91CC81012EAF;
 Tue, 12 Jan 2021 11:05:24 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B885D9CD;
 Tue, 12 Jan 2021 11:05:21 +0000 (UTC)
Subject: Re: [PATCH v3 08/25] block/block-copy: add block_copy_cancel
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-9-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7a7fe13a-a7ff-d6dc-d074-ef24f6ea75e3@redhat.com>
Date: Tue, 12 Jan 2021 12:05:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:17, Vladimir Sementsov-Ogievskiy wrote:
> Add function to cancel running async block-copy call. It will be used
> in backup.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h | 13 +++++++++++++
>   block/block-copy.c         | 24 +++++++++++++++++++-----
>   2 files changed, 32 insertions(+), 5 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


