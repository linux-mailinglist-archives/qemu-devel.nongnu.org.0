Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84942AD161
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:36:15 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcP8R-0005b6-1H
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcP55-0002rG-Ne
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:32:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcP53-0007fb-Ij
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604997164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JysqR8oOVyUyJxbpJsiSJq56eMUm7V6fbBBMCGM7NMw=;
 b=Af1QifiDl8lnRwc9BRd1lZlqcYBioesOeRiYDj7tlIOE+idHIFZjI8v+MaFEJKwwZLdboN
 NI/AJOPkibEg/z1j+YW0hKHmx8FB82Hx2t5Ym/p5WzZ3rYmCxl3l4lJ93xk4fuB87PAq0t
 OFiHdsvto/76YHGqDhTXDiXoJHaxXdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-aljJp7IbNpOzxz9IicCDjg-1; Tue, 10 Nov 2020 03:32:42 -0500
X-MC-Unique: aljJp7IbNpOzxz9IicCDjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDC54106B20B
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:32:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7C95E9D0;
 Tue, 10 Nov 2020 08:32:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18E681132BD6; Tue, 10 Nov 2020 09:32:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 6/6] qemu-option: warn for short-form boolean options
References: <20201109133931.979563-1-pbonzini@redhat.com>
 <20201109133931.979563-7-pbonzini@redhat.com>
 <87h7py2ppj.fsf@dusky.pond.sub.org>
 <CABgObfaZESSsvTvSR_BUdRWQ-UPtoFyP7r1RPET2kzvjbWiE3w@mail.gmail.com>
Date: Tue, 10 Nov 2020 09:32:40 +0100
In-Reply-To: <CABgObfaZESSsvTvSR_BUdRWQ-UPtoFyP7r1RPET2kzvjbWiE3w@mail.gmail.com>
 (Paolo Bonzini's message of "Mon, 9 Nov 2020 22:42:37 +0100")
Message-ID: <87h7pxzk5z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il lun 9 nov 2020, 22:19 Markus Armbruster <armbru@redhat.com> ha scritto:
>
>> This function now warns, except for "help" and "?".  The exception
>> applies even when we treat "help" and "?" as sugar for "help=on" and
>> "?=on" because opts_accepts_any().
>>
>
> Right, because again help_wanted will be false for non-validated
> QemuOptsList.
>
>> Summary: only qemu_opts_parse_noisily() warns.  This is airtight only if
>> all user input flows through qemu_opts_parse_noisily().
>
>
> HMP doesn't. But that's too hard to change now, and it's not considered as
> much of a stable interface as the command line.
>
> Anyway I am not going to push this for 5.2. Thanks for the speedy reviews
> anyway!

You're welcome!  It was worth a try.  We can try again for 6.0 without
time pressure.


