Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E854F55B822
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:19:16 +0200 (CEST)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j1f-0005C7-GI
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5iyc-0003IT-K3
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5iyV-0003ox-34
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656314158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tqpybjirnsXp1mLFCjYf1qoMeU5jNV6h1bZaiNKfuzA=;
 b=LpgsY9U0OA9L5IvBvH7/fWzrx6hpPzA/qXULicZ2v0f/C55D0Y1uVsVvjkNcF3OL0/FAWY
 2mqVQb3J8QazTQ1ATbmLyq8W1pL3XKWL/MTF4Oeao+VaDIbfqDN0kkJ6ZkL5iRuKPRiCDm
 1STchmIq3GUS5bFl/w/Tec+9R399MzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-i63ay0w1O6-9AvlPKZilCA-1; Mon, 27 Jun 2022 03:15:55 -0400
X-MC-Unique: i63ay0w1O6-9AvlPKZilCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B7FC1818801
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 07:15:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4267D2026D64;
 Mon, 27 Jun 2022 07:15:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E113221E690D; Mon, 27 Jun 2022 09:15:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Andrea Bolognani <abologna@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
References: <20220617121932.249381-1-victortoso@redhat.com>
Date: Mon, 27 Jun 2022 09:15:53 +0200
In-Reply-To: <20220617121932.249381-1-victortoso@redhat.com> (Victor Toso's
 message of "Fri, 17 Jun 2022 14:19:24 +0200")
Message-ID: <87fsjq60gm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> This is the second iteration of RFC v1:
>   https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00226.html
>
>
> # What this is about?
>
> To generate a simple Golang interface that could communicate with QEMU
> over QMP. The Go code that is generated is meant to be used as the bare
> bones to exchange QMP messages.
>
> The goal is to have this as a Go module in QEMU gitlab namespace,
> similar to what have been done to pyhon-qemu-qmp
>   https://gitlab.com/qemu-project/python-qemu-qmp

Aspects of review:

(1) Impact on common code, if any

    I care, because any messes made there are likely to affect me down
    the road.

(2) The generated Go code

    Is it (close to) what we want long term?  If not, is it good enough
    short term, and how could we make necessary improvements?

    I'd prefer to leave this to folks who actually know their Go.

(3) General Python sanity

    We need eyes, but not necessarily mine.  Any takers?

[...]

>  scripts/qapi/golang.py | 765 +++++++++++++++++++++++++++++++++++++++++
>  scripts/qapi/main.py   |   2 +
>  2 files changed, 767 insertions(+)
>  create mode 100644 scripts/qapi/golang.py

This adds a new generator and calls it from generate(), i.e. review
aspect (1) is empty.  "Empty" is a quick & easy way to get my ACK!

No tests?

No documentation?


