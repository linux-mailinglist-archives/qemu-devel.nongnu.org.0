Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67633E1CF9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:48:12 +0200 (CEST)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjLf-00044n-Nh
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBjKW-0003Gj-Lq
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBjKU-0001gX-HV
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfESrm3oejPpqkSdjxX0m9k5N22uwgQZ6FymeTivGVA=;
 b=fnIECSCX69eq/O7xrO080jvI3DmLUfb6jOR0WWRYyP84Mw+k6IMee5HhOe3j6ptLEPE9DV
 hglKmt6tISj6YuQXDsepLve63szwYBXbq+oGjt8yfJU2lWR4o4yeghZ/mqcq303KhaSaWo
 l6DO0HrHq0DQ81TlXLuJkebAd1DQZmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-gwTSRuizMSWjy6JSn8O__g-1; Thu, 05 Aug 2021 15:46:54 -0400
X-MC-Unique: gwTSRuizMSWjy6JSn8O__g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C2D100E422;
 Thu,  5 Aug 2021 19:46:52 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61ED16A057;
 Thu,  5 Aug 2021 19:46:51 +0000 (UTC)
Date: Thu, 5 Aug 2021 14:46:49 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/9] hw/sd: Extract address_in_range() helper, log
 invalid accesses
Message-ID: <20210805194649.d7auy2liismxjec5@redhat.com>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210623180021.898286-3-f4bug@amsat.org>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 08:00:14PM +0200, Philippe Mathieu-Daudé wrote:
> Multiple commands have to check the address requested is valid.

check that the

> Extract this code pattern as a new address_in_range() helper, and
> log invalid accesses as guest errors.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index d8fdf84f4db..9c8dd11bad1 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -937,6 +937,18 @@ static void sd_lock_command(SDState *sd)
>          sd->card_status &= ~CARD_IS_LOCKED;
>  }
>  
> +static bool address_in_range(SDState *sd, const char *desc,
> +                             uint64_t addr, uint32_t length)
> +{
> +    if (addr + length > sd->size) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s offset %lu > card %lu [%%%u]\n",
> +                      desc, addr, sd->size, length);

For a (fictitiously small) device with 2048 bytes and a read request
of 2k at offset 1k, this results in the odd message:

READ_BLOCK offset 1024 > card 2048 [%2048]

Would it be any better as:

"%s offset+length %lu+%lu > card size %lu\n"

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


