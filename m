Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935754CC939
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 23:39:00 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPu67-000899-N7
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 17:38:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nPu5E-0007Fe-4M
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nPu5C-0006KL-E7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646347081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AClD96pbilBUTOa5KIL+cYC1Y9UuVBHc1A6FONagaX0=;
 b=II42yhSHDOFfuVN1CwZNTgDgj4CUlsiXHRcFSOkNtotdhCti1x8B8f7BDM1rvXjgopecVf
 ZZpH6VtGOaMgvuYApjjYi0lXl0m2Gfo68JeYWNRYXhkJnJhaK7R5pZik2OLmxC6waIdKuo
 trwH+LAle9eEIwq96DAlF+bCYD/QdBc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-9EnqN16QOmiyzAp2hUX_ew-1; Thu, 03 Mar 2022 17:37:58 -0500
X-MC-Unique: 9EnqN16QOmiyzAp2hUX_ew-1
Received: by mail-ua1-f72.google.com with SMTP id
 v25-20020a9f2d99000000b00346c0bb4153so2913710uaj.12
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 14:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AClD96pbilBUTOa5KIL+cYC1Y9UuVBHc1A6FONagaX0=;
 b=evSeupvgft4bdODyMeuCOjvc97A77azwdQzC7JBnR7qrdFjqeq1k21zFPmT7z7eCuO
 ziDbtXfTLRZQ4xDskxCAmuo9IvZwWPgObM/cCSrDHF9zztxBna80ezKIKMbuNQQ1CUdc
 E1QdLaLwaWSezkn/gRdmBeDed+aRUiKbdItjAAE7YDD+Fy+t3TuB/ufZS9o61LKLLdcy
 Z0J9DaiF/Y4CVNyOzEj04KonDL6rDHVD/0YvIBVK63mAqOZzrd+GSwY+floQEuHgO2zV
 0HfCcGnLU+DUQb4hhgMovtG2/1cZ856fZLP2cE5X44SFd7mGkKogq7nJtD2z5Fw7Sy4C
 w9aw==
X-Gm-Message-State: AOAM533py3VUOVRCTsmIOvMbudBW9kEv7UutW0KejLrXNFaWPco3hNsl
 mPAyrmZlILhAR1ow6QLURvI75GDAIjfpYQVC8YzBPFkb7bRuG0KeQJd+fX3AGkg3TZY5GfyFYxl
 pQ9JXP8ujfQ+bHRzFo073TIhT6WFBa5g=
X-Received: by 2002:a05:6122:985:b0:32d:a8d5:7b12 with SMTP id
 g5-20020a056122098500b0032da8d57b12mr16516542vkd.3.1646347077941; 
 Thu, 03 Mar 2022 14:37:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIepcxkVszVB3phyEzyneC6pWGT+0b4uU6H9OK/1t+cedbF03qYQqkMACZvefEtxPwSJ9o7XbsqHYN2KhHFTU=
X-Received: by 2002:a05:6122:985:b0:32d:a8d5:7b12 with SMTP id
 g5-20020a056122098500b0032da8d57b12mr16516531vkd.3.1646347077669; Thu, 03 Mar
 2022 14:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20220225205948.3693480-1-jsnow@redhat.com>
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Mar 2022 17:37:46 -0500
Message-ID: <CAFn=p-ZVEG5O6HZ5awp49fVuPVKLZ-4+CkGg2O0kunELUYnUJQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Python: Fix qmp race condition on accept()
To: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping - Dan, Kevin: Any thoughts on the new API here? I only ask
because there was a bit of feedback in response to the last patch and
I didn't want to stage this without giving you a fair chance to look.

I'm not expecting any real review on the Python, just wanted to see if
you felt like this design adequately addressed your feedback from
before.

Here is the super high level:

1. what was accept() is renamed start_server_and_accept(). It's a
one-shot command to do (effectively) bind(2) listen(2) accept(2).
2. start_server() method is added. It calls bind() and listen(), and
new connections will be accept(2)'d asynchronously.
3. accept() method is added. It does not *actually* call accept(2),
it's more like "wait for accept(2) to be called in the bottom half".
Similar enough.
4. start_server_and_accept() is, by the end of the series, literally
just two calls to start_server() and accept().

Otherwise, I'll just assume no news is good news and I'll send a
pullreq soon so that Peter's NetBSD tests stop being flaky.

--js


On Fri, Feb 25, 2022 at 4:00 PM John Snow <jsnow@redhat.com> wrote:
>
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-accept-changes
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/479795153
>
> This redesigns the async QMP interface to allow for race-free
> connections from the synchronous interface. It should hopefully address
> the race conditions Peter has been seeing on the NetBSD vm tests.
>
> John Snow (10):
>   python/aqmp: add _session_guard()
>   python/aqmp: rename 'accept()' to 'start_server_and_accept()'
>   python/aqmp: remove _new_session and _establish_connection
>   python/aqmp: split _client_connected_cb() out as _incoming()
>   python/aqmp: squelch pylint warning for too many lines
>   python/aqmp: refactor _do_accept() into two distinct steps
>   python/aqmp: stop the server during disconnect()
>   python/aqmp: add start_server() and accept() methods
>   python/aqmp: fix race condition in legacy.py
>   python/aqmp: drop _bind_hack()
>
>  python/qemu/aqmp/legacy.py   |   7 +-
>  python/qemu/aqmp/protocol.py | 393 +++++++++++++++++++++--------------
>  python/tests/protocol.py     |  45 ++--
>  3 files changed, 273 insertions(+), 172 deletions(-)
>
> --
> 2.34.1
>
>


