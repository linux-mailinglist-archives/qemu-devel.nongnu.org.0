Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960535E6041
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:56:53 +0200 (CEST)
Received: from localhost ([::1]:57958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJsy-0006dH-81
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obIfS-0003CQ-VS
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obIfP-0001qC-Sv
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663839527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HDkriJMU+yRv8tQrJJXlmmc4JN3lh26uYZ10S4+ccc=;
 b=RzueRZdJ+G46Qd7US0zIU8/wSBU6R0vijhsq9A7V3h9b5dxPacwn370BTH4qTeOrFSc8pf
 VoqRwikxxUcRAczp0eGr6x88Wp2lEFnCDJx46nzousaCF9eysbQWNiEeNY70+7ZmUIqSAQ
 LGOACWE011P+wYIpEeIucMbb49Cmkf4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-42eclFc4PRScPY78xqhXNA-1; Thu, 22 Sep 2022 05:38:44 -0400
X-MC-Unique: 42eclFc4PRScPY78xqhXNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92492294EDEE;
 Thu, 22 Sep 2022 09:38:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF442166B5E;
 Thu, 22 Sep 2022 09:38:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5D1721E6900; Thu, 22 Sep 2022 11:38:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
Date: Thu, 22 Sep 2022 11:38:42 +0200
In-Reply-To: <Yywcs7CpKDxahOSM@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 22 Sep 2022 09:28:35 +0100")
Message-ID: <87leqb4ul9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Sep 22, 2022 at 08:07:43AM +0200, Markus Armbruster wrote:
>> Ease of use matters, too.  When sticking to the rule leads to awkward
>> code, we should stop and think.  Should we deviate from the rule?  Or
>> can we avoid that by tweaking the interface?
>>=20
>> Philippe's proposed interface sticks to the rule.
>
> The cost is that when you see a  function   dosomething(true|false) as
> a reader you often have no idea what the effect of true vs false is
> on the behaviour of that function. You resort to looking at the
> API docs and/or code.  This is where C would really benefit from
> having named parameters like as  dosomething(ignore_errors=3Dtrue|false)
> is totally obvious. Anyway, I digress.

Right.  Quoting myself: "If having to pass a flag turns out to to be a
legibility issue, we can have wrapper functions."  :)

>> Another interface that does: return -1 for error, 0 for module not found
>> (no error), and 1 for loaded.
>
> IMHO this pattern is generally easier to understand when looking at
> the callers, as the fatal error scenario is always clear.
>
> That said I would suggest neither approach as the public facing
> API. Rather stop trying to overload 3 states onto an error reporting
> pattern that inherantly wants to be 2 states. Instead just have
> distinct methods

Like these:

>   bool module_load_one(const char *prefix, const char *name, Error *errp)
>   bool module_try_load_one(const char *prefix, const char *name, Error *e=
rrp)
>
> other names are available for the second, eg module_load_one_optional()

module_load_one_if_there()?

By the way, the "one" in "module_load_one" & friends feels redundant.
When I see "module_load", I assume it loads one module.

> Internally, both would call into a common helper following either
> Philippe's idea, or the -1/0/1 int return value. Either is fine,
> as they won't be exposed to any caller.

Yup.


