Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7C3D3A83
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:50:27 +0200 (CEST)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6udH-0001tk-1I
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6ubx-0000tU-7D
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6ubu-0007HY-PY
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e292V+b0Jy+nItf6M6H3LH24NT5PbX7YXcmD/l9SAkI=;
 b=cwMb7zklFga1G4TPmDHEDfiWAJaHNlnqCPMoiLs/hqyMIuDB27gArM/zWtKRXyb+i5vdd6
 Wpq7WVT9FuI+i3roZWuEgErvRam/zv3om4pqVZnMXP8LcGGhE3YZ8T7bm/4L5dOEZpObRk
 8MqNa9+GKzRFTH4Bnn8s3ZWCpQiLrOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-SNXCXMEEOT2iQalGKLDn1g-1; Fri, 23 Jul 2021 08:49:01 -0400
X-MC-Unique: SNXCXMEEOT2iQalGKLDn1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E7E871805;
 Fri, 23 Jul 2021 12:48:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75062102AE7E;
 Fri, 23 Jul 2021 12:48:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B5F818000A3; Fri, 23 Jul 2021 14:48:58 +0200 (CEST)
Date: Fri, 23 Jul 2021 14:48:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
Message-ID: <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
MIME-Version: 1.0
In-Reply-To: <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: pbonzini@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 richard.henderson@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > bool have_tcg = accel_find("tcg");
> > 
> > return true when the code is actually not there, there seems to be a larger issue to solve.
> > 
> > I think we need to think more broadly about this.
> 
> Overall, building the whole code base to be modular,
> and then _not_ including unwanted modules in the base distro package,
> is the whole point of going through this at all.

Yes.

Right now we are only half-through.  tcg-accel-ops is modular, but
tcg-accel is not (yet).  Which I guess is why the assert() can trigger
now.

So add a patch with error message and a FIXME comment, which we can
revert when isn't needed any more?

> So we need more work to make this actually work right.

Yes.  I want have all of tcg in the tcg accel module, not only parts of
it, but that needs some more refactoring.  I'll go start looking at this
once I managed to wade through my vacation backlog.

take care,
  Gerd


