Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE78E60FF34
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:18:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6W3-0004NF-Dv; Thu, 27 Oct 2022 13:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oo6Va-0004De-NQ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oo6VX-00076s-T4
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iu1svqQ4f3xiNzjvCMN4+iRLdeioE0gTOzfKVRYrLnA=;
 b=VPTJbpl0+vi/eRspr+NCX1VWn98xo3cYd9SG8jc4cdjEtyu5Z2MLCQQ/I21vUuAec5pO3W
 zdRL4gtCco7KGDLnqEiDygi/qjBzPdtoSiXF2jFyY3vMwrDUEDgoiX25IDtW6WQ/MR4IwU
 VnWlXS7a7xC5fBfCFSlvfCnTvjOKp+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-BhxY-oExMcSm2JQInedMGw-1; Thu, 27 Oct 2022 13:17:27 -0400
X-MC-Unique: BhxY-oExMcSm2JQInedMGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57E6C1C0BC69;
 Thu, 27 Oct 2022 17:17:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89C061415117;
 Thu, 27 Oct 2022 17:17:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CBCE21E6921; Thu, 27 Oct 2022 19:17:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,  Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
References: <20221025235006.7215-1-philmd@linaro.org>
 <87bkpxl4a1.fsf@pond.sub.org>
 <CAFEAcA_WefVz8fefKTVq8vkiOkdXhrXkcwj4G6bSZPaFoRTSMg@mail.gmail.com>
Date: Thu, 27 Oct 2022 19:17:24 +0200
In-Reply-To: <CAFEAcA_WefVz8fefKTVq8vkiOkdXhrXkcwj4G6bSZPaFoRTSMg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 27 Oct 2022 16:01:01 +0100")
Message-ID: <87r0ytjie3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 27 Oct 2022 at 15:40, Markus Armbruster <armbru@redhat.com> wrote:
>> I wonder why we use any of .def, .h.inc, .inc.h, .c.inc, .inc.c.  Why
>> not .h and call it a day?  No need to configure each and every editor to
>> tread these as C code.
>
> It says "this isn't actually a header in the usual sense". That's
> useful for automated scripted checks (eg we don't want
> scripts/clean-header-guards.pl to add the standard #include header
> guards to this sort of file) and for humans (if you see one of these
> files included as part of the normal #include block at the top of
> a .c file that's probably a mistake; if you see it being used then
> you know there's likely multiple-inclusion shenanigans going on.)

scripts/clean-header-guards.pl needs exclude patterns anyway.

Comments would likely work better for humans than obscure naming
conventions.

Make them stylized, and they work for scripts, too.


