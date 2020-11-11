Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915ED2AF154
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:58:56 +0100 (CET)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpiB-00015r-Hs
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpa6-0007Gs-DW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:50:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpa4-0002zq-Lm
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605099031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SS7qhQYnZW+VlPMAeohrJDOCoELydoadEwN3X2HVWKs=;
 b=XBJuZXoUUh/Nhp8PhSQWh1IwmK8rujnGMAVTEECH7YeruC7E6jucEm6FO+Z8sNx0q5fUFo
 6rAXUZZskIGBobDERtZL1xA8ucfOyKfxg9nhCbeFdELcxVnMvrBKufSSS0AeEXSCTbY8hW
 /hMej7M/Nlf7K0zvqv0ieUQEKiAhPcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-73-ZfNrdOd6a3Xz_OZuFmg-1; Wed, 11 Nov 2020 07:50:28 -0500
X-MC-Unique: 73-ZfNrdOd6a3Xz_OZuFmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE5681891E87;
 Wed, 11 Nov 2020 12:50:25 +0000 (UTC)
Received: from [10.72.12.95] (ovpn-12-95.pek2.redhat.com [10.72.12.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40DEF1002C28;
 Wed, 11 Nov 2020 12:50:22 +0000 (UTC)
Subject: Re: [PATCH for-5.2 v3 0/4] hw/net/can/ctucan: fix Coverity and other
 issues
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7cc59d42-9e8b-e7e4-7f74-95c53d981750@redhat.com>
Date: Wed, 11 Nov 2020 20:50:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Ondrej Ille <ondrej.ille@gmail.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 =?UTF-8?Q?Jan_Charv=c3=a1t?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/11 上午5:52, Pavel Pisa wrote:
> Credit for finding and fixes goes to Peter Maydell
>
> This patchset fixes a couple of issues spotted by Coverity:
>   * incorrect address checks meant the guest could write off the
>     end of the tx_buffer arrays
>   * we had an unused value in ctucan_send_ready_buffers()
> and also some I noticed while reading the code:
>   * we don't adjust the device's non-portable use of bitfields
>     on bigendian hosts
>   * we should use stl_le_p() rather than casting uint_t* to
>     uint32_t*
>
> Tested with "make check" only.
>
> Changes v1->v2: don't assert() the can't-happen case in patch 1,
> to allow for future adjustment of #defines that correspond to
> h/w synthesis parameters.
>
> Changes v2->v3: minnor corrections of range checking,
> support for unaligned and partial word writes into Tx
> buffers. Tested on x86_64 guest on x86_64 host and bige-edian
> MIPS guest on x86_64 host Pavel Pisa.
>
> Peter Maydell (4):
>    hw/net/can/ctucan: Don't allow guest to write off end of tx_buffer
>    hw/net/can/ctucan: Avoid unused value in ctucan_send_ready_buffers()
>    hw/net/can/ctucan_core: Handle big-endian hosts
>    hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers
>
>   hw/net/can/ctucan_core.c | 23 +++++++----------------
>   hw/net/can/ctucan_core.h |  3 +--
>   2 files changed, 8 insertions(+), 18 deletions(-)


Applied.

Thanks


>


