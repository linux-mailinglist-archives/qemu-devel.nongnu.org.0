Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C244DCBB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 21:51:38 +0100 (CET)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlH2n-0000T5-LY
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 15:51:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mlH1H-000880-Et
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 15:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mlH1D-0000U4-Cc
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 15:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636663796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aa6/V1WPfzLswqSZQuMx1HW1omRVFuCeZn+jd5tLqcs=;
 b=Y6/bdw/ym4o+BrlSmo3AKPsihTw5XHutbdciGcn3lN7DCi/8RVXTAAHFBTfuy72noTW47K
 KNE0r3G9bqhblvfMDBc5I8fZKsinSTqEJIvOESIofQeTApi3zSEWJzj6dTQjpxeLW828Br
 1f8K1uUoOeykuySiPDDehHTM8SEHPgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-qXJWfL6fOoaQJ6rGvamGQg-1; Thu, 11 Nov 2021 15:49:52 -0500
X-MC-Unique: qXJWfL6fOoaQJ6rGvamGQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB1CA40C0;
 Thu, 11 Nov 2021 20:49:50 +0000 (UTC)
Received: from redhat.com (ovpn-113-115.phx2.redhat.com [10.3.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55AFB5DEFB;
 Thu, 11 Nov 2021 20:49:49 +0000 (UTC)
Date: Thu, 11 Nov 2021 14:49:47 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
Message-ID: <20211111204947.hsows4m5bukwxgde@redhat.com>
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
 <20211108151704.65611-3-yaroshchuk2000@gmail.com>
 <87czn9honw.fsf@dusky.pond.sub.org>
 <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 akihiko.odaki@gmail.com, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 06:21:28PM +0300, Vladislav Yaroshchuk wrote:
> 
> > +#
> > > +# Since: 6.2
> >
> > Missed 6.2, please adjust.  More of the same below.
> >
> >
> The next one is 6.3, isn't it?

7.0, actually, as it will be the first release in 2022.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


