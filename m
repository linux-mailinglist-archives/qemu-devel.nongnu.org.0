Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70455F881
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 09:13:44 +0200 (CEST)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6RtP-0001EQ-Bv
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 03:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o6RqN-0000NJ-Vm
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o6RqJ-00076J-Lx
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656486629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lhRSCKnZ8wf+fuZj4qgSh/JxOuphoqLGI/sPNG0fLs=;
 b=VEUM3E4R3PKe1SAP0dd1R6bGDT3N+ITtwLOSDTAQYlNzg04rcvxetmCSV5pTyOio/FM0jB
 bsmPykrMD9T4x+58+8ZlRKbAmMUjhBkNesrhVSA7Npbcf6mV3vjMl2dV0O1RQKHxlgsO3g
 /CEHLXylKp8HuXGGmpk5UU/HJ42HwnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-1HQrV9y5OTWATpe5aVT41A-1; Wed, 29 Jun 2022 03:10:26 -0400
X-MC-Unique: 1HQrV9y5OTWATpe5aVT41A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B918D80159B;
 Wed, 29 Jun 2022 07:10:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E4EA2166B26;
 Wed, 29 Jun 2022 07:10:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E780E1800629; Wed, 29 Jun 2022 09:10:23 +0200 (CEST)
Date: Wed, 29 Jun 2022 09:10:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220629071023.2wfvs7utmx6w3p4o@sirius.home.kraxel.org>
References: <20220603085920.604323-1-kraxel@redhat.com>
 <20220608120505-mutt-send-email-mst@kernel.org>
 <20220609072838.jcq4cdofpwvlew7j@sirius.home.kraxel.org>
 <20220627183724-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627183724-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 06:37:50PM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 09, 2022 at 09:28:38AM +0200, Gerd Hoffmann wrote:
> > On Wed, Jun 08, 2022 at 12:06:17PM -0400, Michael S. Tsirkin wrote:
> > > On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> > > > The pcie host bridge has no io window on microvm,
> > > > so io reservations will not work.
> > > > 
> > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > 
> > > I don't much like overriding user like this. We end up users
> > > setting it to silly values and then if we do want to
> > > support this things just break. Thoughts?
> > 
> > Well, it just looked like the simplest way to tell the firmware that
> > io reservations are pointless.  Do you have a better idea?
> > 
> > take care,
> >   Gerd
> 
> Fail if user supplies values we can't support.

Well, it is the *default* value which doesn't work on microvm.

take care,
  Gerd


