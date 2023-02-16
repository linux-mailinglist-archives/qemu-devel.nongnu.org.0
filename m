Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE576699464
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdQi-0002kx-9i; Thu, 16 Feb 2023 07:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSdQg-0002kd-Us
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSdQf-0001M8-Cz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PxlNGKMauHxl5fw7O5sTwwtjumwyORjosdW9on7IClM=;
 b=VDs3Ebtf9RbwkfWGKkxR+Ga4hUPsR13/PCFJ6FVJEsIlI4BxYQxBIhV645iT44P1QTtKyA
 fHOeCr9m4bpUm6Sa11N/YhYdBDb6NNnibI6IxQqDKrkTjtvSq/Nclbfw4a+rApPnpKt9Jl
 b+Mjx8zCTfxmY/R+Ol674fjUNBDSPKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-K3YlJYDoN5yH9SMfQA2paw-1; Thu, 16 Feb 2023 07:31:57 -0500
X-MC-Unique: K3YlJYDoN5yH9SMfQA2paw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26AEB802C16;
 Thu, 16 Feb 2023 12:31:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04709C15BA0;
 Thu, 16 Feb 2023 12:31:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C309F21E6A1F; Thu, 16 Feb 2023 13:31:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  John Snow <jsnow@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas
 Huth <thuth@redhat.com>,  Daniel Berrange <berrange@redhat.com>,  Beraldo
 Leal <bleal@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-block@nongnu.org,  Hanna Reitz
 <hreitz@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <CAFEAcA9bv-xfU4CkcMbq4LbQ6rvhVJ5JXLJ58G+=z88j4gZQRQ@mail.gmail.com>
Date: Thu, 16 Feb 2023 13:31:55 +0100
In-Reply-To: <CAFEAcA9bv-xfU4CkcMbq4LbQ6rvhVJ5JXLJ58G+=z88j4gZQRQ@mail.gmail.com>
 (Peter Maydell's message of "Thu, 16 Feb 2023 10:17:02 +0000")
Message-ID: <875yc1rdtw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 15 Feb 2023 at 19:05, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The discussion under PATCH 6 makes me think there's a bit of confusion
>> about the actual impact of dropping support for Python 3.6.  Possibly
>> because it's spelled out in the commit message of PATCH 7.  Let me
>> summarize it in one sentence:
>>
>>     *** All supported host systems continue to work ***
>>
>> Evidence: CI remains green.
>>
>> On some supported host systems, different packages need to be installed.
>> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
>> instead of 3.6.8.  Let me stress again: same repository, different
>> package.  No downsides I can see.
>
> Yes; I never had any issues with this part of it. If there was
> a "Sphinx that also used that Python" in that repo, the answer
> would be easy.
>
>> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
>> version of Sphinx that works with Python 3.7 or newer.  This series
>> proposes to simply stop building the docs there, unless the user
>> provides a suitable version of Sphinx (which is easy enough with pip).
>> That's PATCH 7.
>
> Yes; this brings CentOS 8 down from "fully supported" to "kinda
> supported but not for everything", which is less than ideal.

I acknowledge there's a difference between "you need to dnf install
python-sphinx to be able to build docs" and "you need to pip install
sphinx to be able to build docs", and that the difference is negligible
in some scenarios, and a show stopper in others.  I wasn't fully aware
of the latter.

> I think the level of not-idealness of that side of the scales
> is probably clear enough. The difficulty I think for those who
> haven't had their arms deep in QEMU's Python code is not having
> the background info to be able to weigh up how heavy the other side
> of the tradeoff scales is (since the naive "well, just keep writing
> Python 3.6 for the moment" take is clearly wrong).

Fair point.  I hope the situation is more clear now.


