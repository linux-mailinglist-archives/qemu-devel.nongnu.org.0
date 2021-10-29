Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BB43FDD4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:04:20 +0200 (CEST)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSUU-0000Kh-TV
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgSS9-0007c4-19
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgSS7-0005Jl-5H
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635516110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jm3hIxxxnGq04StV+KURypNLlG2lLrLcCvP9eJn78C4=;
 b=fa/darJTDhNWLcCLHHOSsk6Lfswke0VLeEJLfPkH6x3FxRXhN82h+seI3vxmVCgAH2Tf0U
 iQrpTKhq1dyxYWREKnz1GZ2Xzk6hqPVWtddhLCuAiz31VIQFYdFcAdohLSl1mowigcRB7f
 9ckaVg9Pchn7tHqRlJtauf8srTGCfUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-7DvGPP1GPLOxSaL0t_alJQ-1; Fri, 29 Oct 2021 10:01:44 -0400
X-MC-Unique: 7DvGPP1GPLOxSaL0t_alJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A7EBD528;
 Fri, 29 Oct 2021 14:01:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55C8B5D9CA;
 Fri, 29 Oct 2021 14:01:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB13911380A7; Fri, 29 Oct 2021 16:01:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
 <66af3635-d6ee-d1c1-5511-af12ba816638@redhat.com>
Date: Fri, 29 Oct 2021 16:01:41 +0200
In-Reply-To: <66af3635-d6ee-d1c1-5511-af12ba816638@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 29 Oct 2021 15:31:01
 +0200")
Message-ID: <87lf2cdj5m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/28/21 12:25, Markus Armbruster wrote:
>> The generated visitor functions call visit_deprecated_accept() and
>> visit_deprecated() when visiting a struct member with special feature
>> flag 'deprecated'.  This makes the feature flag visible to the actual
>> visitors.  I want to make feature flag 'unstable' visible there as
>> well, so I can add policy for it.
>>=20
>> To let me make it visible, replace these functions by
>> visit_policy_reject() and visit_policy_skip(), which take the member's
>> special features as an argument.  Note that the new functions have the
>> opposite sense, i.e. the return value flips.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qapi/visitor-impl.h   |  6 ++++--
>>  include/qapi/visitor.h        | 17 +++++++++++++----
>>  qapi/qapi-forward-visitor.c   | 16 +++++++++-------
>>  qapi/qapi-visit-core.c        | 22 ++++++++++++----------
>>  qapi/qobject-input-visitor.c  | 15 ++++++++++-----
>>  qapi/qobject-output-visitor.c |  9 ++++++---
>>  qapi/trace-events             |  4 ++--
>>  scripts/qapi/visit.py         | 14 +++++++-------
>>  8 files changed, 63 insertions(+), 40 deletions(-)
>
>> -static bool qobject_input_deprecated_accept(Visitor *v, const char *nam=
e,
>> -                                            Error **errp)
>> +static bool qobject_input_policy_reject(Visitor *v, const char *name,
>> +                                        unsigned special_features,
>> +                                        Error **errp)
>>  {
>> +    if (!(special_features & 1u << QAPI_DEPRECATED)) {
>> +        return false;
>> +    }
>> +
>>      switch (v->compat_policy.deprecated_input) {
>>      case COMPAT_POLICY_INPUT_ACCEPT:
>> -        return true;
>> +        return false;
>>      case COMPAT_POLICY_INPUT_REJECT:
>>          error_setg(errp, "Deprecated parameter '%s' disabled by policy"=
,
>>                     name);
>> -        return false;
>> +        return true;
>>      case COMPAT_POLICY_INPUT_CRASH:
>
> Clearer as:
>
>            abort();
>        default:
>            g_assert_not_reached();

Maybe, but making it so has nothing to do with this patch.  It could
perhaps be done in PATCH 8, or in a followup patch.

> Otherwise,
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Okay to tack your R-by to the unmodified patch?

Thanks!

>
>>      default:
>>          abort();


