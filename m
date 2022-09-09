Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D45B2D81
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 06:26:05 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWVae-0000ws-Ko
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 00:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWVZ6-0007u6-Ix
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWVZ3-0003yt-53
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662697464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PcILEiy6q9YgqkFoiMLhvTGsTam40LOPEOZu+SXVdGI=;
 b=FJsrUIdXbdmDpbyNlbA2xvao/313cFO4l/qJOPY97J+oRqqRpb2wbGkO02r94p+EM700xy
 3Mez9RKk/aOM74h1DGUlfbO8+JFRX2ZJH02Ox7S535+y1kFC9w2CYAXKnwZ/buTMWpRCK/
 CQMxKpnReGG+yhSleIqr/alUMOVfvmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-uATh8eyMPrWML5ziFydfIQ-1; Fri, 09 Sep 2022 00:24:23 -0400
X-MC-Unique: uATh8eyMPrWML5ziFydfIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD80C294EDF2;
 Fri,  9 Sep 2022 04:24:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88B1E1410F38;
 Fri,  9 Sep 2022 04:24:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69BA721E6900; Fri,  9 Sep 2022 06:24:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Patrick Venture <venture@google.com>,  QEMU Developers
 <qemu-devel@nongnu.org>,  Peter Foley <pefoley@google.com>
Subject: Re: Seeing qtest assertion failure with 7.1
References: <CAO=notwARj6d+UygiU4-JBKMJtyOhHmcNFp7C5jwqJReFT-kew@mail.gmail.com>
 <CAFEAcA9brqMEZfyB-c2OjYFWuQPSS28u9_8vFte=zGwePh_Srw@mail.gmail.com>
 <CAO=notxqhKoUS8Mahp=HLGO1XKt07Z7qH3SEe3-Tfo9skk9rBQ@mail.gmail.com>
 <CAFEAcA9mGBjYFNGEVyiUeCMw38zrMCfTyEgpuHO+n3aR-6JjxQ@mail.gmail.com>
Date: Fri, 09 Sep 2022 06:24:21 +0200
In-Reply-To: <CAFEAcA9mGBjYFNGEVyiUeCMw38zrMCfTyEgpuHO+n3aR-6JjxQ@mail.gmail.com>
 (Peter Maydell's message of "Thu, 8 Sep 2022 17:00:26 +0100")
Message-ID: <87h71h18ga.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 8 Sept 2022 at 16:54, Patrick Venture <venture@google.com> wrote:
>> On Wed, Sep 7, 2022 at 10:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Have a look in the source at what exactly the assertion
>>> failure in libqtest.c is checking for -- IIRC it's a pretty
>>> basic "did we open a socket fd" one. I think sometimes I
>>> used to see something like this if there's an old stale socket
>>> lying around in the test directory and the randomly generated
>>> socket filename happens to clash with it.
>
>> Thanks for the debugging tip! I can't reproduce it at this point. I
>> saw it 2-3 times, and now not at all.  So more than likely it's
>> exactly what you're describing.
>
> Mmm. We do clean up the socket after ourselves in the test
> harness, but I think what can happen is that if a test case
> crashes then the cleanup doesn't happen. Then there's a stale
> file left in the build tree, and then you only hit it if you
> get unlucky with PID allocation on a future run...

Yes, and that's bad behavior.

I think we should run each test in its own directory, which we delete
afterwards.  That way anything the test creates there will be cleaned up
whether it succeeds or fails.


