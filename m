Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560A2FBB2D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:30:47 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sxy-0005tW-Cl
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1suU-0003l9-V7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1suQ-0003cm-Pc
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611070023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fb9KkxiOv4yyuFZVyYzjaM6CgYJ2BdduujxbmMm207M=;
 b=EFVVpotb9uD2TiIiJ+80jutv/7Bw3KKFngYIXnQf56PR40RPsCrUvCUyNGPRRbWfyk5RxW
 g7IxXPqcoSKt909Yt99K7QuFqr0RvkqWZmFMS6UlLlOlaP1m8Ue8+xdrXpLuE/GxE+orYO
 AjXwXjyb70e8WjzSDFr/PilAeJttPXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-Fa4ncvc4Pn6oCE4Ocu_k_g-1; Tue, 19 Jan 2021 10:26:57 -0500
X-MC-Unique: Fa4ncvc4Pn6oCE4Ocu_k_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B95C80A5C1;
 Tue, 19 Jan 2021 15:26:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-54.ams2.redhat.com
 [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95760E174;
 Tue, 19 Jan 2021 15:26:55 +0000 (UTC)
Subject: Re: [PATCH 2/2] virtio-scsi-test: Test writing to scsi-cd device
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210118123448.307825-1-kwolf@redhat.com>
 <20210118123448.307825-3-kwolf@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <89e8c773-2f75-f1bf-fff7-2eac04064687@redhat.com>
Date: Tue, 19 Jan 2021 16:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210118123448.307825-3-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alxndr@bu.edu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.01.21 13:34, Kevin Wolf wrote:
> This tests that trying to write to a (read-only) scsi-cd device backed
> by a read-write image file doesn't crash and results in the correct
> error.
> 
> This is a regression test for https://bugs.launchpad.net/bugs/1906693.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/qtest/virtio-scsi-test.c | 39 ++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


