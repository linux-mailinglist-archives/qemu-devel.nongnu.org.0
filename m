Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718334AB4B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:17:36 +0100 (CET)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoDN-0001oP-S0
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lPoC6-0001Lb-T2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lPoC3-0006PQ-Ci
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616771769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmemXS1+CE5TjNOoPA69gSQmJ96YeXNnRSJhbcR9e1U=;
 b=W/a0GJdcHfflJrF8JsFaKfxaVVx08NOg4wLiFaIen4LtoXaab9XaXFq7tOE0iOaFhd31wg
 rByX0od8QdifAh75IC1/JccHSELNzhUkfkvdghFjyGJMnQxGTg48ZnABg8FNE7kQ97k6hB
 vbSZ7BggwUDDyhrNlcuvba9/HMeyOcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-grlx5mPhO1yvWxUH3K_bfQ-1; Fri, 26 Mar 2021 11:15:58 -0400
X-MC-Unique: grlx5mPhO1yvWxUH3K_bfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A9310B3406;
 Fri, 26 Mar 2021 15:13:36 +0000 (UTC)
Received: from [10.3.114.231] (ovpn-114-231.phx2.redhat.com [10.3.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D345D9E3;
 Fri, 26 Mar 2021 15:13:35 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] qcow2: Force preallocation with data-file-raw
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210326145509.163455-1-mreitz@redhat.com>
 <20210326145509.163455-2-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7d40bc4c-a1de-0bba-d2c8-6c4876846200@redhat.com>
Date: Fri, 26 Mar 2021 10:13:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326145509.163455-2-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 9:55 AM, Max Reitz wrote:
> Setting the qcow2 data-file-raw bit means that you can ignore the
> qcow2 metadata when reading from the external data file.  It does not
> mean that you have to ignore it, though.  Therefore, the data read must
> be the same regardless of whether you interpret the metadata or whether
> you ignore it, and thus the L1/L2 tables must all be present and give a
> 1:1 mapping.
> 
> This patch changes 244's output: First, the qcow2 file is larger right
> after creation, because of metadata preallocation.  Second, the qemu-img
> map output changes: Everything that was not explicitly discarded or
> zeroed is now a data area.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/qcow2.c              | 34 ++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/244.out |  9 ++++-----
>  2 files changed, 38 insertions(+), 5 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

I think this counts as a bug fix worthy of inclusion in 6.0.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


