Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD23B2A9F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:44:11 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKy2-0004lX-Fd
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKwU-0003uC-SL
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKwT-0000cH-EQ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624524152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m8TRITcyT00RCdVrCIPxmI5RI0A9LtvyUlDXg4EulxQ=;
 b=PvjlVuwsITpCgDKMMbrnnl9ktLVvae/8m29q/mi7ddvERVUd4Rrv4WFJzeFEk0WNQufU0Z
 44g1gtJBcKHypjaQy9DtIDE38xTj6TNXgZK4BLGJBUQV/ZdG2bL5LCPNTN1PUFgiAKfq1C
 Js6Gffmz+8S3ZXMxSI+GTX1suLCfdIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-Y6fSWQs3PSGakqn0QllQcw-1; Thu, 24 Jun 2021 04:42:30 -0400
X-MC-Unique: Y6fSWQs3PSGakqn0QllQcw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC561101F001;
 Thu, 24 Jun 2021 08:42:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 760DB1002D71;
 Thu, 24 Jun 2021 08:42:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE168180060E; Thu, 24 Jun 2021 10:42:27 +0200 (CEST)
Date: Thu, 24 Jun 2021 10:42:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
Message-ID: <20210624084227.omloqfqqd3m3r3el@sirius.home.kraxel.org>
References: <CAAKa2jkj=rJVhOuE9XXC9ccsAt=2vg3_MO_NDL3OL98ALHMeFw@mail.gmail.com>
 <CAAKa2jnbOLuaDbhaVT9Pc7BVfdJ632hpbFBsfk7eCW3evzzsgA@mail.gmail.com>
 <20210623122046.q57ydwxnhomhdjrj@sirius.home.kraxel.org>
 <CAAKa2jn-YU6H1U5vzRqFpbZbCCWoq-xpOnXHPeD5dg5S1VdJTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAKa2jn-YU6H1U5vzRqFpbZbCCWoq-xpOnXHPeD5dg5S1VdJTw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:11:35AM +0800, Qiang Liu wrote:
> Hi
> 
> > This looks like your mailer mangled the patch.
> > Can you resent using 'git send-email`?
> Yes, I can. I finally figure it out how to config my Gmail. I should
> send a new email
> and this thread is supposed to be closed, right?

Yes, sending as new message (or thread for a series) is correct.
Applying v3 worked, queued up now.

thanks,
  Gerd


