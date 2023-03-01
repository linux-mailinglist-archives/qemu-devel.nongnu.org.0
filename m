Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDD6A6840
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:36:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGzs-0001Q6-QF; Wed, 01 Mar 2023 02:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXGzp-0001J9-0S
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXGzm-0003fe-Ms
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677656125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HYF4RCZ3NLX6x5O6feGJIHu2VDXXKtj8N3eWJ+tbjLE=;
 b=FqTuBmlhHkleinulaIMnHgibUeYK1ZXphxB+ZnqXA3UIfdtVzoIBDpa6xi4uErUxR21Xev
 srDwOq3PcD14imWPuS5jKqU8ismJLXSSqhHmOtTpYrV/3PY3T4zRYcVGX2eR9OWnocjng/
 JVc8kY2PDx74xJlcraaCuE3zj8qbD8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-RI74EMrUNE2QrJP1w4yKng-1; Wed, 01 Mar 2023 02:35:22 -0500
X-MC-Unique: RI74EMrUNE2QrJP1w4yKng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D0918E0925;
 Wed,  1 Mar 2023 07:35:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0751C400D796;
 Wed,  1 Mar 2023 07:35:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC27621E6A1F; Wed,  1 Mar 2023 08:35:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  qemu-arm@nongnu.org,
 Maxim Levitsky
 <mlevitsk@redhat.com>,  libvir-list@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  xen-devel@lists.xenproject.org,  Reinoud
 Zandijk <reinoud@netbsd.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
 <20230228162938-mutt-send-email-mst@kernel.org>
Date: Wed, 01 Mar 2023 08:35:20 +0100
In-Reply-To: <20230228162938-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 28 Feb 2023 16:32:43 -0500")
Message-ID: <87lekg53gn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
>> Well, without CI, I assume that the code will bitrot quite fast (considering
>> that there are continuous improvements to TCG, for example).
>
> We have lots of hosts which we don't test with CI.  They don't bitrot
> because people do testing before release. This is what RCs are for.
> We did releases before CI - it is a cost/benefit thing.

Dropping 32-bit x86 from CI feels like a no-brainer in the current
situation.

As to deprecating 32-bit x86: the people by far most qualified to judge
the "cost/benefit thing" are the regulars who are bearing the cost,
i.e. the people who are actually maintaining it.  Their opinion should
overrule any "but somebody out there might still want to use it".

Maintainers, please state your opinion, if any: aye or nay.

Richard tells us "the maint overhead is large."  Makes me think he's in
favour of dropping 32-bit x86.  Richard?

Peter seems to be reluctant to drop 32-bit ARM at this point.  Peter?


