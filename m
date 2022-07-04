Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01055656AC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:13:36 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LtO-0004DR-F1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8LgD-0005Bu-8S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8Lg9-0007ZQ-T7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PFhL8VUAiJWxuOPgwfJRz26XwmGls6WLMAukUMq7NU=;
 b=KO85mWIR5Ijwsy73jrI/TDaM2T8OcVbZ2i2C0WynOOI5i0hUZxOG4NnZ/1qqYr5ljyWumL
 jKeXdD73acei5tM6dXy1t5dIvpRakEQWvPFM8zwvBneRGLWOeJUViIJC3V6UJc1AFiZtnn
 MEP2Vf9zvFALED3b2J0leKaJk/3vRtg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-Ax8HLH0zOLG7R4QxCSWCnQ-1; Mon, 04 Jul 2022 08:59:52 -0400
X-MC-Unique: Ax8HLH0zOLG7R4QxCSWCnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D25943806729
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 12:59:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 966A1400EA86;
 Mon,  4 Jul 2022 12:59:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B9FB21E690D; Mon,  4 Jul 2022 14:59:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org> <YsKtm2O8+d5d0p/N@redhat.com>
 <YsLRmYjFpdGw0AjK@work-vm> <87k08tw0bq.fsf@pond.sub.org>
 <YsLaEWcn51z3m52e@redhat.com>
Date: Mon, 04 Jul 2022 14:59:50 +0200
In-Reply-To: <YsLaEWcn51z3m52e@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 4 Jul 2022 13:16:17 +0100")
Message-ID: <87czelvxrt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jul 04, 2022 at 02:04:41PM +0200, Markus Armbruster wrote:

[...]

>> Please rephrase the documentation of @zero-copy-copied in terms of
>> @dirty-sync-count.  Here's my attempt.
>>=20
>> # @zero-copy-copied: Number of times dirty RAM synchronization could not
>> #                    avoid copying zero pages.  This is between 0 and
>> #                    @dirty-sync-count.  (since 7.1)
>
> Any one have preferences on the name - i get slight put off by the
> repeated word in the property name here.
>
>    @zero-copy-rejects ?
>    @zero-copy-misses ?
>    @zero-copy-fails ?

I'd consider any of these an improvement.  Not a native speaker, but
perhaps "failures" instead of "fails".

We could also express the connection to @dirty-sync-count right in the
name, like @dirty-sync-rejected-zero-copy, @dirty-sync-missed-zero-copy,
@dirty-sync-failed-zero-copy.  Or maybe -copies.


