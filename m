Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE352106E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:15:46 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noLy5-0003lJ-Ls
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noLdB-0006i3-A2
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noLd9-0003U3-Rt
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652172847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJCJEF0/nkIb4XMZuyg31UyMc5KKCwYihAEZrHqPDvE=;
 b=e+/4j/yGxWjiUwIjdFBhC9meKbXZ07+Ly7r6u+pjuQDNyNxLIbzx6W6we9K/FmKk0w43zc
 vALRD3VBhp6VISYuJDVlRG1BhPahuXNxG6kdPzCSirVHytF2b2H1v3a8iZc0oIJyAQKQwW
 PO1gVbZj87n4Ms+W7Qy8yoo06/3xQFg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-Q4CGZORLP3-tnVjtHTOBXg-1; Tue, 10 May 2022 04:54:03 -0400
X-MC-Unique: Q4CGZORLP3-tnVjtHTOBXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F0473C138AB;
 Tue, 10 May 2022 08:54:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772C7463E02;
 Tue, 10 May 2022 08:54:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51FCA21E6880; Tue, 10 May 2022 10:54:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Fabiano Rosas
 <farosas@linux.ibm.com>,  muriloo@linux.ibm.com,  qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  mopsfelder@gmail.com,  qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  qemu-arm
 <qemu-arm@nongnu.org>, qemu-RISC-V <qemu-riscv@nongnu.org>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
Date: Tue, 10 May 2022 10:54:01 +0200
In-Reply-To: <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com> (Thomas Huth's
 message of "Tue, 10 May 2022 10:03:35 +0200")
Message-ID: <877d6tzs2e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Thomas Huth <thuth@redhat.com> writes:

[...]

> I once suggested in the past already that we should maybe get rid of
> the 32-bit variants in case the 64-bit variant is a full superset, so
> we can save compile- and test times (which is quite a bit for QEMU),
> but I've been told that the 32-bit variants are mostly still required
> for supporting KVM on 32-bit host machines.

Do we still care for 32-bit host machines?

[...]


