Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7C452B72
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 08:17:45 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmsiu-0007qo-C8
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 02:17:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mmshP-0007AR-Nd
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mmshM-0004ug-Li
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637046966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CLtlzS+fuan5iob/Oy9OT2aVLTVAmhhEsV2R+VISIII=;
 b=G6ZsoDpkxHfdFQWFVYkH3asz6JCl9UgAtx6BVLiLtYeMVNB4Z9CMAcVSfkG+w6YY8j+Vet
 H4lyIoiww8/X0VrVY9LovbxcL0QZMxxwxz5Q04nMXMOqwMblz0BJPidfbeJEQ78tdtmk4H
 x+9hHacYbrBve2+IwgzTSvx6PGzI1iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-lJ8MFsqaPI2M2RGaGmkjLA-1; Tue, 16 Nov 2021 02:16:04 -0500
X-MC-Unique: lJ8MFsqaPI2M2RGaGmkjLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2242801000;
 Tue, 16 Nov 2021 07:16:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4405919724;
 Tue, 16 Nov 2021 07:16:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 796D818007A1; Tue, 16 Nov 2021 08:16:01 +0100 (CET)
Date: Tue, 16 Nov 2021 08:16:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/6] pci: implement power state
Message-ID: <20211116071601.ytywmlpfy3hbj4rh@sirius.home.kraxel.org>
References: <20211111130859.1171890-1-kraxel@redhat.com>
 <20211111130859.1171890-2-kraxel@redhat.com>
 <20211115094503-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211115094503-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >          new_addr = pci_bar_address(d, i, r->type, r->size);
> > +        if (!d->has_power) {
> > +            new_addr = PCI_BAR_UNMAPPED;
> > +        }
> >  
> >          /* This bar isn't changed */
> >          if (new_addr == r->addr)
> 
> I am a bit confused about why this is necessary.
> When power is removed device is reset, does not
> this disable device memory automatically?

Hmm.   While it clearly doesn't hurt it might not be needed indeed.  The
reset-on-poweroff should make sure both bars and dma are off, and due to
config space access being blocked the guest shouldn't be able to turn
them on while device power is off.

So, yes, in theory we should be able to drop this.  Assuming nothing in
qemu ever touches the bar mappings (host access to config space is not
blocked).

I'll have a look.

take care,
  Gerd


