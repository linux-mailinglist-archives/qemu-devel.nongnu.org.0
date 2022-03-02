Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7D4CA248
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:34:33 +0100 (CET)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMJV-0002Kw-0P
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:34:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nPMHI-0000JQ-4K
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:32:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nPMHD-0006VT-Uo
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646217130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWulcxgH2WIllOMjPxQIChKMAPM/9GmN67w8yoGwQq4=;
 b=auouNqRXcJGjQHM6tTsVlL3GGM9B2LCCgJdtmOSho0Of3TEeAfLW+5d80aZA3Q5IdeTKFW
 TX6oQAC3EWTPajVOSaCSzW4EBxvIxkfA8ZJLr6tOKo3jpQvM1+2QFF2PXPC4ugHv1SDF4F
 4enzZidzksyloUFHx51kiIRwmxmWZ84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-Q92vRqHhOQyThkiYmV_1Ew-1; Wed, 02 Mar 2022 05:32:08 -0500
X-MC-Unique: Q92vRqHhOQyThkiYmV_1Ew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E93D31006AA7;
 Wed,  2 Mar 2022 10:32:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F521042A97;
 Wed,  2 Mar 2022 10:31:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 17FA118003B6; Wed,  2 Mar 2022 09:05:03 +0100 (CET)
Date: Wed, 2 Mar 2022 09:05:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 7/7] isa: Inline and remove one-line isa_init_irq()
Message-ID: <20220302080503.tftfjra3cdevnojr@sirius.home.kraxel.org>
References: <20220301220037.76555-1-shentey@gmail.com>
 <20220301220037.76555-8-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220301220037.76555-8-shentey@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 "open list:Floppy" <qemu-block@nongnu.org>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 11:00:37PM +0100, Bernhard Beschow wrote:
> isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
> It can therefore be removed.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com> (tpm_tis_isa)
> Acked-by: Corey Minyard <cminyard@mvista.com> (isa_ipmi_bt,
> isa_ipmi_kcs)
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


