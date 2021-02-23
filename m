Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE43227FF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:48:16 +0100 (CET)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUIh-0001TG-9P
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEUH2-0000SF-2A
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEUH0-0001yR-JF
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614073590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akFCCw/iolJb/Wzs5err+kzMK/fB7r/FcBKKNnZMHUQ=;
 b=Fd70Ao2BM1oJnLbUJxhM9+sTfecI1LernWhq30QCWntjk/qr/ZCABEa26Q5QfpxtM4FTaH
 Vp9WurK+etHS5X1H0d9B8iyP93D6oiUTKP713mRRod03DHucKVf/2qFbtNYZyfgmFJMUJu
 SR/63u7Ydlqi212A2/KFhp1S6gxQdBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Le9QUeJWN6q9wRGhn69G2A-1; Tue, 23 Feb 2021 04:46:23 -0500
X-MC-Unique: Le9QUeJWN6q9wRGhn69G2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3A38107ACE3;
 Tue, 23 Feb 2021 09:46:22 +0000 (UTC)
Received: from work-vm (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80CA877714;
 Tue, 23 Feb 2021 09:46:18 +0000 (UTC)
Date: Tue, 23 Feb 2021 09:46:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Jiatong Shen <yshxxsjt715@gmail.com>
Subject: Re: romfile resize
Message-ID: <YDTO5yIR1IyxbVZt@work-vm>
References: <CALqm=df_dH41LQfG+X2_qL2z68DPAF9vT=9HGSEbBMWec_zLQA@mail.gmail.com>
 <ef18782e-99d8-8406-152f-46c03bbd3280@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ef18782e-99d8-8406-152f-46c03bbd3280@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Cc'ing qemu-devel@
> 
> On 2/23/21 1:45 AM, Jiatong Shen wrote:
> > Hello,
> > 
> >   we are faced with an issue where a changed sized romfile
> > (efi-virtio.rom) fails live migration. Do qemu load this rom from its
> > current host only? If yes, why cannot sync this from source vm?

Hi,
  For migration to work the ROM has to be the same size on the source
and destination.

  The problem is that whne the destination starts up it allocates the
size of the ROM based on the size of the file;  but then the migration
comes along and tries to copy the data from the source machine into that
allocation; and isn't sure what should happen when it doesn't quite fit.

  There is some variation allowed (I think the allocated size gets
rounded up, maybe to the next power of 2); but you still hit problems
wehn the ROM size crosses certain thresholds.

  In the latest qemu, a 'romsize' property was added (see git commit
08b1df8ff463e72b0875538fb991d5393047606c ); that lets you specifiy a
size that's big enough to hold some space for future expansion - e.g.
lets say your ROM is currently 300k, you might specify romsize=512k
and then it doesn't matter what size the actual file is, we'll always
allocate 512k, and as long as the file is less than 512k migration will
work.

  The more manual way to do that, is to arrange for your files to be
padded to a larger boundary so that you leave room for growth.
Some distros have done that for a while.

Dave
  
> > thank you.
> > 
> > -- 
> > 
> > Best Regards,
> > 
> > Jiatong Shen
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


