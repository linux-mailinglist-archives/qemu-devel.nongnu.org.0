Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347D441D5B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:21:50 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZ88-0002xK-OW
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mhZ6X-00020I-7j
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mhZ6T-0007K0-Sh
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635780004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=poEdaomnTQ+yVAwYpi2f2pVSlNjVBEp1V9Ea9cuKK/0=;
 b=Ghuh1Lpyz5YHBYXT5yd8NkFrH30uPgoqju+7CaMYAFuaUPa3tUWY+4ocX72u6FBM+YJSLg
 /Sw4yd/732FiiP0G6krXQiEWbiKCp+j5iZZ52thztlcl7wP1PooD2oAK+ctgVVL63YVHFG
 azXDhsmq1hNvotI9LJLnnwwFY15kj7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-ioGBLlyUMcOpmkztmpMB_g-1; Mon, 01 Nov 2021 11:20:01 -0400
X-MC-Unique: ioGBLlyUMcOpmkztmpMB_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D176C8E2189;
 Mon,  1 Nov 2021 15:19:43 +0000 (UTC)
Received: from localhost (unknown [10.22.33.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7F25D9D5;
 Mon,  1 Nov 2021 15:19:41 +0000 (UTC)
Date: Mon, 1 Nov 2021 11:18:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v3 0/3] Dynamic sysbus device check error report
Message-ID: <20211101151808.mqckuwjufad3jlzb@habkost.net>
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <20211029142258.484907-1-damien.hedde@greensocs.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 mark.burton@greensocs.com, qemu-devel@nongnu.org, edgari@xilinx.com,
 mirela.grujic@greensocs.com, Alistair Francis <alistair.francis@wdc.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 04:22:55PM +0200, Damien Hedde wrote:
> Hi,
> 
> Dynamic sysbus devices are allowed by a per-machine basis.
> Right now, the allowance check is done during an machine_init_done
> notifier, well after such devices are created.
> 
> This series move the check at the right place (during the handling
> of a QMP device_add command or -device CLI option) so that we can
> report the error right away.
> 
> This was initially part of my RFC (hence the v3) about allowing to
> create devices during the machine initialized phase (link is below).
> But it seems to me these patches make sense already as a standalone
> cleanup.
> 
> Only patch 1 miss a review.
> 
> Thanks,
> Damien
> 
> v3:
>  + standalone series
>  + minor tweaks
> 
> v2 was part of:
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05683.html

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


