Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39388635B50
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:13:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxngB-0006vV-RJ; Wed, 23 Nov 2022 06:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxng8-0006rf-QE
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxng7-00027X-AX
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669201950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UdGOoHrZyZjqzzHCaq85OKm3zZ3iOXviRc0yc3m3mj8=;
 b=KmQXd1mCD83S9Qla6+zXQ6Lw5pONAKYdYkvnGaIJXOTntwHb9tkJEvZNaW6gvRHxDeq/Ev
 3f45HcaTDAaOAd5pF0Xq7GenwW3zC1aie1bl3FrzJk6zabt5o9LYoDB99MRCuLWIQ0AVZY
 JRBYbd07aAVis8orN/vfFOaUBkvdDAo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-GsV31VYgNHqTkfXrVcAu0w-1; Wed, 23 Nov 2022 06:12:26 -0500
X-MC-Unique: GsV31VYgNHqTkfXrVcAu0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78E3E1C008A1;
 Wed, 23 Nov 2022 11:12:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5686E2024CBE;
 Wed, 23 Nov 2022 11:12:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3E1F221E6921; Wed, 23 Nov 2022 12:12:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 3/2] ppc4xx_sdram: Simplify sdram_ddr_size() to return
References: <20221122134917.1217307-1-armbru@redhat.com>
 <87a64i87zp.fsf@pond.sub.org>
 <a804f913-920c-e481-318a-5a365173a7e4@eik.bme.hu>
Date: Wed, 23 Nov 2022 12:12:23 +0100
In-Reply-To: <a804f913-920c-e481-318a-5a365173a7e4@eik.bme.hu> (BALATON
 Zoltan's message of "Wed, 23 Nov 2022 11:44:24 +0100 (CET)")
Message-ID: <87leo17wmg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Wed, 23 Nov 2022, Markus Armbruster wrote:
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> I thought you could include the hunk modifying sdram_ddr2_size in this patch too and make it a separate clean up to reduce the size of the 
> Coccinelle patch making that easier to review but it's OK either way. Thanks for doing this clean up.

Yes, I could do that, but since I got R-bys already, I opted for
minimizing change.

Thanks!


