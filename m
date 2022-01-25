Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4249ADFF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:29:45 +0100 (CET)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHCy-0002Ny-HE
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGVI-000495-Vg
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGVH-0005DS-Ji
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643096675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PuKA0yliZXwUqqB9lL1kE/W9H53PwbsANUc3med2Tbg=;
 b=L0VmxVsDldBqb5ox2HgxM2FvIj8pZu35euOXXC5MiQftzgYN620F9emWxUs802GzMcnjrF
 8uXTeXekuXP1I1oLbhwb8IAXgd1gC23s8HvWnLUkAabrtLi9fAwMDKFt4bpOivr6+tnkAI
 zQxbNR/QXohWbemT+VlFemvsvjpfaoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-M3D1vSXZMeqMXBTUaBq8Eg-1; Tue, 25 Jan 2022 02:44:33 -0500
X-MC-Unique: M3D1vSXZMeqMXBTUaBq8Eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA341180FD7A;
 Tue, 25 Jan 2022 07:44:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758791059581;
 Tue, 25 Jan 2022 07:44:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 87CE918000B2; Tue, 25 Jan 2022 08:44:30 +0100 (CET)
Date: Tue, 25 Jan 2022 08:44:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/5] Misc OHCI clean ups
Message-ID: <20220125074430.5krdc75rn3a3nca3@sirius.home.kraxel.org>
References: <cover.1642339238.git.balaton@eik.bme.hu>
 <a56cff-a9e2-365a-9d85-62f46560a7c5@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <a56cff-a9e2-365a-9d85-62f46560a7c5@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 06:09:12PM +0100, BALATON Zoltan wrote:
> On Sun, 16 Jan 2022, BALATON Zoltan wrote:
> > Hello,
> > 
> > I have these patches from last October when we've looked at what
> > causes problems with mac99 and USB. We've found the main problem is
> > likely not allowing pending packets per endpoint which we did not fix
> > but these patches came out of debugging that and trying to improve the
> > device model so eventually the real problem could be fixed more
> > easily. So these are just clean ups and fixing one potential issue
> > with isochronous transfers breaking pending async packet but it does
> > not solve all problems OHCI currently has. I'm sending it anyway as I
> > don't plan to work further on this so this series could be taken as is
> > for now.
> 
> Ping?

Queued now.

thanks,
  Gerd


