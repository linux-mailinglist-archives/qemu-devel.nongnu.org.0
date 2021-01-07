Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8872ED122
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:48:22 +0100 (CET)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVeH-0000Th-PZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxVaw-00069Z-GW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:44:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxVat-0007pt-Mj
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610027090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O12EQFffkji1bSgBP2lItf3boI3kvV0a+k9Yq7BLNg0=;
 b=EXVv8WrUYLlpGbrjdMVIx6NNPwBq/hbbZdsPsO+PEacW/rzkys4c5KMCQuFQslW8B+ctjh
 VmA9cMpApsHKH27SCpmHMwNOlZy/ommIaZ51Gq1/O05PWq5oEFNgMU/7A99o9h9CHGELm7
 mRxSChlLsrLQ49Bcu4BkX5yoE5z1egY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-D8dPPcVmPjSiXY72qmbNWg-1; Thu, 07 Jan 2021 08:44:46 -0500
X-MC-Unique: D8dPPcVmPjSiXY72qmbNWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 435A4BBEE5;
 Thu,  7 Jan 2021 13:44:45 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-252.ams2.redhat.com
 [10.36.114.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 297B01042A8F;
 Thu,  7 Jan 2021 13:44:40 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] block/scsi: correctly emulate the VPD block limits
 page
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217165612.942849-1-mlevitsk@redhat.com>
 <20201217165612.942849-6-mlevitsk@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cdc893f9-58fe-7b1d-d2dc-1f540c59ba28@redhat.com>
Date: Thu, 7 Jan 2021 14:44:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217165612.942849-6-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:56, Maxim Levitsky wrote:
> When the device doesn't support the VPD block limits page, we emulate it even
> for SCSI passthrough.
> 
> As a part of the emulation we need to add it to the 'Supported VPD Pages'
> 
> The code that does this adds it to the page, but it doesn't increase the length
> of the data to be copied to the guest, thus the guest never sees the VPD block
> limits page as supported.

Isn’t the problem more generally that if there is a block limits page, 
the last supported page is cut off (which perhaps more likely than not 
is the block limits page (given that it’s 0xb0, which relatively high))?

> Bump the transfer size by 1 in this case.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   hw/scsi/scsi-generic.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Anyway, looks good to me, though I have a hard time following the code, 
which yields a rather weak:

Reviewed-by: Max Reitz <mreitz@redhat.com>


