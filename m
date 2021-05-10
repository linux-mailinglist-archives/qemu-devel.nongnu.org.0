Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BF377D28
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:32:46 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0PF-0006QT-Fc
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg0NG-0004NC-2N
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg0N9-0000Sr-Je
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620631830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Omry4IrQWuhVckhnWLrAIx75PzjRNNdNfqqTJO5RWkc=;
 b=D4/c1WD7AFX+BaEUI7KaTuds/4Lj0/VUz5EpLCLEqKqZ3yD78LbyiB1eY2hJ9+dAxaRJxX
 73uXGVeyzNqPAkzE5uieCzxuJW9z4vnaC9RTPwF/L3W1e0SxR2m7g2H3gaYTmqaS2YRxXN
 rpwNd8O4bRt4z6XM/6YCjFC9KkyiIZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-KlpKu3czN7OMuPxflahSbQ-1; Mon, 10 May 2021 03:30:29 -0400
X-MC-Unique: KlpKu3czN7OMuPxflahSbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E808BEDA9;
 Mon, 10 May 2021 07:30:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4BE5D9CA;
 Mon, 10 May 2021 07:30:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F2CE0180038E; Mon, 10 May 2021 09:30:25 +0200 (CEST)
Date: Mon, 10 May 2021 09:30:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rainer =?utf-8?Q?M=C3=BCller?= <raimue@codingfarm.de>
Subject: Re: [PATCH 1/2] input-linux: Delay grab toggle if keys are pressed
Message-ID: <20210510073025.jxxxgqnkbsv64h5h@sirius.home.kraxel.org>
References: <20210501190622.153901-1-raimue@codingfarm.de>
 <20210501190622.153901-2-raimue@codingfarm.de>
 <20210504091438.p7kk3heyowpduyzq@sirius.home.kraxel.org>
 <2f01eb6a-7c69-e7a9-8340-b671b0b6c643@codingfarm.de>
MIME-Version: 1.0
In-Reply-To: <2f01eb6a-7c69-e7a9-8340-b671b0b6c643@codingfarm.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 09, 2021 at 01:43:38PM +0200, Rainer Müller wrote:
> On 04/05/2021 11.14, Gerd Hoffmann wrote:
> > On Sat, May 01, 2021 at 09:06:21PM +0200, Rainer Müller wrote:
> >> When multiple keyboards are passed to the guest with input-linux, there
> >> could still be keys pressed on the other keyboard when toggling grab.
> >> Delay toggling grab on the other keyboard until all keys are released,
> >> otherwise keys could be stuck on host without a key up event.
> > 
> > Hmm, if you have two keyboards plugged into your machine, why would you
> > assign both to a virtual machine?  Instead of simply using one for the
> > host and one for the guest?
> 
> Fair enough. I only noticed the possibility during testing. I plugged in
> a second keyboard for development to avoid locking myself out and passed
> only one. Then I became confident to pass them both, but mostly because
> I already had them connected. I agree it does not seem like a typical
> setup...
> 
> This was the only code path that did not check !il->keycount before
> calling input_linux_toggle_grab(), so I added it here as well. Maybe it
> would make sense to move the condition into the function?

Should work, yes.  I think with that in place patch 2/2 can be
simplified a bit too.

take care,
  Gerd


