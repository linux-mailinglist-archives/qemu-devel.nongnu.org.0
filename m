Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8116A8390
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:32:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXj1z-0007v0-8I; Thu, 02 Mar 2023 08:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXj0t-0007qJ-IR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXj0e-0005MF-7w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+OkBygezGPHOPKqQqREht+ZV/kS4zTnzhHwmcDaunI=;
 b=ENvj8h5I30uILp+KbNDnF3GnH0hrWgak2slDON8y9IkjAieIY9kmTYTubfKrLK+JVeK4wx
 y9C8OcgULSla3bjQURp8LxGbmhQeAxKHIHlhVet8nAgW1TVxdFpjm/DFtzt9bF8A30vJGF
 RKXKVXaiTnoBFSoUXycj2/Nc6ZSqDiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-oj9Q2PQ8MyyZf4NjpX2cpA-1; Thu, 02 Mar 2023 08:30:06 -0500
X-MC-Unique: oj9Q2PQ8MyyZf4NjpX2cpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A89185A78B;
 Thu,  2 Mar 2023 13:30:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B1B40C6EC4;
 Thu,  2 Mar 2023 13:30:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 081E521E6A1F; Thu,  2 Mar 2023 14:30:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eric Blake <eblake@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
References: <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org>
 <20230228155801.s2imkaybh3a4d5x3@redhat.com>
 <Y/8Zy/Lk8i9RCOdc@redhat.com> <875ybkwr10.fsf@pond.sub.org>
 <CAJ+F1C+S+ChMdk0y5VHzFj94y5UV3iPjHweeLoUTHcBHW-pkYw@mail.gmail.com>
 <87wn3zskq3.fsf@pond.sub.org> <ZABtAt78by0TIPf7@redhat.com>
 <87r0u7mmtr.fsf@pond.sub.org>
Date: Thu, 02 Mar 2023 14:30:05 +0100
In-Reply-To: <87r0u7mmtr.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 02 Mar 2023 12:09:36 +0100")
Message-ID: <877cvzl1r6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Markus Armbruster <armbru@redhat.com> writes:

[...]

> I'd like to tighten the restriction instead: conditional arguments
> require boxed.  Less ugly and less awkward to document, I think.

I had a look, and realized that doing it right will be a bit more
involved than I thought, since a couple of test cases need fixing.  I'll
give it a try.


