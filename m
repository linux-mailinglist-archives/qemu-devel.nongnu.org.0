Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446B4C4820
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:57:42 +0100 (CET)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNc2O-000702-UK
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:57:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nNbiT-0005XJ-19
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:37:05 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nNbiO-00021M-VW
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:37:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6764B831FC;
 Fri, 25 Feb 2022 14:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C059FC340F0;
 Fri, 25 Feb 2022 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645799817;
 bh=txqJvZ34d7BrZO7RHw7rO9yWJUsvqMki1kDp9v2h9SU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iiVujjQ+GKRu9o3Io6hV9VsR0n61Yyt+SAmGtX8wulItYIIZncpvOK8biXCD5PgcB
 PzOkze+vVDjUdVaQnIkflDCRdyk/ofuobsv4uRmMT8yStgeM5CM4HUfagNAo7e+C1I
 IcZCkROjHF/JTBbFT68rwgzOwBRKp2NfsKRiajzU=
Date: Fri, 25 Feb 2022 15:36:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <YhjphtYyXoYZ9lXY@kroah.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=gregkh@linuxfoundation.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, mst@redhat.com,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux@dominikbrodowski.net,
 kys@microsoft.com, ardb@kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 ben@skyportsystems.com, decui@microsoft.com, ebiggers@kernel.org,
 lersek@redhat.com, ehabkost@redhat.com, adrian@parity.io, jannh@google.com,
 haiyangz@microsoft.com, tytso@mit.edu, colmmacc@amazon.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-crypto@vger.kernel.org,
 imammedo@redhat.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 02:57:38PM +0100, Alexander Graf wrote:
> > +
> > +       phys_addr = (obj->package.elements[0].integer.value << 0) |
> > +                   (obj->package.elements[1].integer.value << 32);
> > +       state->next_id = devm_memremap(&device->dev, phys_addr, VMGENID_SIZE, MEMREMAP_WB);
> > +       if (!state->next_id) {
> > +               ret = -ENOMEM;
> > +               goto out;
> > +       }
> > +
> > +       memcpy(state->this_id, state->next_id, sizeof(state->this_id));
> > +       add_device_randomness(state->this_id, sizeof(state->this_id));
> 
> 
> Please expose the vmgenid via /sysfs so that user space even remotely has a
> chance to check if it's been cloned.

Export it how?  And why, who would care?

thanks,

greg k-h

