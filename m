Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596B2DE1D1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:13:14 +0100 (CET)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDhB-0008EN-EZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDf6-0006Th-QB
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDf1-0005iT-9U
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608289858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAod8uXMIot0ZDAA2g0/I0yqTpkPRhlrByNE/v2Wk68=;
 b=AhI6r35/Dkd4d/4pt9PxUYb7m7xZQHmmkMz+2bul4GXTxs52BPAAqnle3jG+FXAzYGQknc
 pWMqXYVKaf8dtIega+J7g/5ztabr5/ua1xAwmfx7BobSB86ChIRgIRPTXzwth8AweXxLIz
 XQCiMrnYUeTW6iyqIEPNjLG/pOBRbTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-orENRnDYOdG0_PpSSx7BQQ-1; Fri, 18 Dec 2020 06:10:56 -0500
X-MC-Unique: orENRnDYOdG0_PpSSx7BQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B85311005D4E;
 Fri, 18 Dec 2020 11:10:55 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A806117577;
 Fri, 18 Dec 2020 11:10:54 +0000 (UTC)
Subject: Re: [PATCH 7/9] block/vpc: Pad VHDFooter, replace uint8_t[] buffers
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-8-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2e9df98c-7c63-ad11-c24e-ee24c63c837c@redhat.com>
Date: Fri, 18 Dec 2020 12:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-8-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 17.12.20 17:20, Markus Armbruster wrote:
> Pad VHDFooter as specified in the "Virtual Hard Disk Image Format
> Specification" version 1.0[*].  Change footer buffers from
> uint8_t[HEADER_SIZE] to VHDFooter.  Their size remains the same.
> 
> The VHDFooter * variables pointing to a VHDFooter variable right next
> to it are now silly.  Eliminate them, and shorten the remaining
> variables' names.
> 
> Most variables pointing to s->footer are now also silly.  Eliminate
> them, too.
> 
> [*] http://download.microsoft.com/download/f/f/e/ffef50a5-07dd-4cf8-aaa3-442c0673a029/Virtual%20Hard%20Disk%20Format%20Spec_10_18_06.doc
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vpc.c | 77 +++++++++++++++++++++++++----------------------------
>   1 file changed, 37 insertions(+), 40 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


