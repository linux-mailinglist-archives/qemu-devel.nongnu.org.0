Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015304BF4FF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:49:05 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRn6-0003LQ-0c
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nMRi7-0008Pg-HF
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nMRi3-0007Zk-Ks
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645523031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p3DfDu4Qu5XnREaaKmzUMogBNWwiJXbn7T8dCL5QE8g=;
 b=SXqdeykwqtnRt3YqykqT5jxNTi3DWw5dUeGWu0uSbIjXclfeOrNpdxdsGkTQQIb8bBWLvB
 fWJKTpmMTKkS4ThT/4wZrwQMNliPYmhtxQVtuwzm30Z5UFmtrA+PWbMAFMVZ5L9K4R5UMe
 SnjhWVoL5Bpe9DSDaVmQdzX5tWoje3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-BZ1Fqg3DP8-pUj5d38qfYA-1; Tue, 22 Feb 2022 04:43:50 -0500
X-MC-Unique: BZ1Fqg3DP8-pUj5d38qfYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE8C80A5C5;
 Tue, 22 Feb 2022 09:43:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA967554B;
 Tue, 22 Feb 2022 09:42:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 70BE218007A2; Tue, 22 Feb 2022 10:42:55 +0100 (CET)
Date: Tue, 22 Feb 2022 10:42:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220222094255.as2alzu65rhateml@sirius.home.kraxel.org>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <YgzJE7ufEYm6OFyg@redhat.com> <YhOQfJ8x93+jDSZf@work-vm>
 <20220222094602.66d55613@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220222094602.66d55613@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > And the upstream code is now pretty much identical except for the
> > default;  note that for TCG you do need to keep to 40 I think.
> 
> will TCG work with 40bits on host that supports less than that?

When I understand things correctly the problem is that the phys-bits
limit applies to the npt/ept tables too, effectively restricting guest
physical address space to host physical address space.

TCG is not affected by that and should work just fine.

Not sure what happens if you turn off npt/ept and run on softmmu.
Possibly that works fine too.

> Also quick look at host-phys-bits shows that it affects only 'host'
> cpu model and is NOP for all other models.

I don't think so.  microvm forces host-phys-bits=on and that works with
all cpu models.

take care,
  Gerd


