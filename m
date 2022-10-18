Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B5602C9E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:14:16 +0200 (CEST)
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okmQA-0003Rw-Qn
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okmIz-0007rc-HF
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okmIp-0000xU-6P
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666098398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20unh+EAQbDHoBmja5tom4yWFUq/36iete2uK/qaotE=;
 b=ZwStoHPVsBKvScoW/hRQn6bA9wtAGaj+sNz0nsw/EpN0S6enkkn5nzAdxZCQs6Rgvmod80
 N0tP99nbpbfiQYbkdFlkX88BUs/fS1TOgQ/yES39Epe3Eq9H560yl6zyClIfGWzBryn/eC
 KdPtif1ClAUfX5hKGwUzfQwAu1JV3KU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-phWVcLDgPrOFSyF77eRtWw-1; Tue, 18 Oct 2022 09:06:34 -0400
X-MC-Unique: phWVcLDgPrOFSyF77eRtWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABBAB1012461;
 Tue, 18 Oct 2022 13:06:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B971175418;
 Tue, 18 Oct 2022 13:06:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4DB2A21E6936; Tue, 18 Oct 2022 15:06:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Stefan Berger <stefanb@linux.ibm.com>,  qemu-devel@nongnu.org,
 michael.roth@amd.com,  jsnow@redhat.com,  eblake@redhat.com,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 23/28] qapi tpm: Elide redundant has_FOO in generated C
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-24-armbru@redhat.com>
 <752bcf6d-d37d-5605-d3bb-8e46c2e4b47c@linaro.org>
 <bdee0038-a29f-e517-0e12-be7a141f37b8@linux.ibm.com>
 <CAPMQPEJvED3uYnJHcan7F8G-SdHEo+HTRb0sOx4CVJ-29m5gqw@mail.gmail.com>
Date: Tue, 18 Oct 2022 15:06:23 +0200
In-Reply-To: <CAPMQPEJvED3uYnJHcan7F8G-SdHEo+HTRb0sOx4CVJ-29m5gqw@mail.gmail.com>
 ("Philippe =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Oct 2022
 14:23:38 +0200")
Message-ID: <87czap2sds.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On Tue, 18 Oct 2022 at 14:12, Stefan Berger <stefanb@linux.ibm.com> wrote:
>> On 10/18/22 08:01, Philippe Mathieu-Daud=C3=A9 wrote:
>> > On 18/10/22 08:28, Markus Armbruster wrote:
>> >> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> >> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> >> elide redundant has_FOO in generated C" provided the means to elide
>> >> them step by step.  This is the step for qapi/tpm.json.
>> >>
>> >> Said commit explains the transformation in more detail.  The invariant
>> >> violations mentioned there do not occur here.
>> >>
>> >> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> >> ---
>> >>   backends/tpm/tpm_passthrough.c | 2 --
>> >>   monitor/hmp-cmds.c             | 8 ++++----
>> >>   scripts/qapi/schema.py         | 1 -
>> >>   3 files changed, 4 insertions(+), 7 deletions(-)
>> >
>> >> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> >> index 8f8bd93df1..378f5b083d 100644
>> >> --- a/monitor/hmp-cmds.c
>> >> +++ b/monitor/hmp-cmds.c
>> >> @@ -885,10 +885,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qd=
ict)
>> >>           case TPM_TYPE_PASSTHROUGH:
>> >>               tpo =3D ti->options->u.passthrough.data;
>> >>               monitor_printf(mon, "%s%s%s%s",
>> >> -                           tpo->has_path ? ",path=3D" : "",
>> >> -                           tpo->has_path ? tpo->path : "",
>> >> -                           tpo->has_cancel_path ? ",cancel-path=3D" =
: "",
>> >> -                           tpo->has_cancel_path ? tpo->cancel_path :=
 "");
>> >> +                           tpo->path ? ",path=3D" : "",
>> >> +                           tpo->path ?: "",
>> >> +                           tpo->cancel_path ? ",cancel-path=3D" : "",
>> >> +                           tpo->cancel_path ?: "");
>> >
>> > Or simply:
>> >
>> >              monitor_printf(mon, "%s%s",
>> >                             tpo->path ? ",path=3D" : "",
>> >                             tpo->cancel_path ? ",cancel-path=3D" : "");
>> >
>>
>> this would never print any path...
>
> I need more coffee... =3D) Trying to KISS:
>
>     if (tpo->path) {
>         monitor_printf(mon, ",path=3D%s", tpo->path);
>     }
>     if (tpo->cancel_path) {
>         monitor_printf(mon, ",cancel-path=3D%s", tpo->cancel_path);
>     }

I'd prefer to keep this one mechanical.  Feel free to simplify on top!


