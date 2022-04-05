Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3B4F24BB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 09:31:12 +0200 (CEST)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbdeg-0001Ks-Fi
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 03:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbdYC-0006hu-2p
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 03:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbdY8-0004DQ-SQ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 03:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649143463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwBGSkpe/3/TDvBab49ELCrdDZWEkhQL/Tg2K4iLHVM=;
 b=T/27lYQ9mJkvXrsA/Ccs6Sd7AvvIg80wWh5cD1mLbAhXA4gYpPg5ldEHSnEkZwP8EiiyVV
 giqoCEeuYOsQH1HTix1BOIya9KdclSXxIP4jyQs3Rwc+9LC7Z8Ks6vex1S1LdVTui0zSlz
 wfth9f5l28Q8aZ7nzy0vHXxu3mGhNzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-rdf1eQprNdC-PKHlA6kVsg-1; Tue, 05 Apr 2022 03:24:20 -0400
X-MC-Unique: rdf1eQprNdC-PKHlA6kVsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD6EC802803;
 Tue,  5 Apr 2022 07:24:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6F9145F941;
 Tue,  5 Apr 2022 07:24:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6629C21E6906; Tue,  5 Apr 2022 09:24:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v4 2/2] Added parameter to take screenshot with
 screendump as PNG
References: <20220330061134.59254-1-kshitij.suri@nutanix.com>
 <20220330061134.59254-3-kshitij.suri@nutanix.com>
 <87wng96oep.fsf@pond.sub.org>
 <b2691f71-0693-4971-cd06-435d6be7ae9b@nutanix.com>
Date: Tue, 05 Apr 2022 09:24:18 +0200
In-Reply-To: <b2691f71-0693-4971-cd06-435d6be7ae9b@nutanix.com> (Kshitij
 Suri's message of "Tue, 5 Apr 2022 11:18:44 +0530")
Message-ID: <877d84at7h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> On 01/04/22 4:50 pm, Markus Armbruster wrote:
>> Dave, please have a look at the HMP compatibility issue in
>> hmp-command.hx below.
>>
>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>
>>> Currently screendump only supports PPM format, which is un-compressed a=
nd not
>>> standard.
>> If "standard" means "have to pay a standards organization $$$ to access
>> the spec", PPM is not standard.  If it means "widely supported", it
>> certainly is.  I'd drop "and not standard".  Suggestion, not demand.
>
> Makes sense. Will modify it in the updated patch.
>
>>>            Added a "format" parameter to qemu monitor screendump capabi=
lites
>>> to support PNG image capture using libpng. The param was added in QAPI =
schema
>>> of screendump present in ui.json along with png_save() function which c=
onverts
>>> pixman_image to PNG. HMP command equivalent was also modified to suppor=
t the
>>> feature.
>> Suggest to use imperative mood to describe the commit, and omit details
>> that aren't necessary here:
>>
>>              Add a "format" parameter to QMP and HMP screendump command
>>    to support PNG image capture using libpng.
>
> Yes, will reduce the verbosity of the commit message.
>
>>> Example usage:
>>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>>> "format":"png" } }
>>
>> Providing an example in the commit message is always nice, thanks!
>
> Thank you!
>
>>> Resolves: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gitlab=
.com_qemu-2Dproject_qemu_-2D_issues_718&d=3DDwIFaQ&c=3Ds883GpUCOChKOHiocYtG=
cg&r=3Dutjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=3DoODILSxODcEhktuPJ-Sf=
Vt-MW867cpF_TvDe-WJyNRXx84FinSifhtp6-Racosb0&s=3D89nTa5MLAr16WtPfrm4aYkwWlP=
uRs6yuaD22dZTE_pM&e=3D
>>>
>>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>>
>>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>> ---
>>>   hmp-commands.hx    |  11 ++---
>>>   monitor/hmp-cmds.c |  12 +++++-
>>>   qapi/ui.json       |  24 +++++++++--
>>>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++-=
-
>>>   4 files changed, 136 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>> index 8476277aa9..19b7cab595 100644
>>> --- a/hmp-commands.hx
>>> +++ b/hmp-commands.hx
>>> @@ -244,11 +244,12 @@ ERST
>>>         {
>>>           .name       =3D "screendump",
>>> -        .args_type  =3D "filename:F,device:s?,head:i?",
>>> -        .params     =3D "filename [device [head]]",
>>> -        .help       =3D "save screen from head 'head' of display devic=
e 'device' "
>>> -                      "into PPM image 'filename'",
>>> -        .cmd        =3D hmp_screendump,
>>> +        .args_type  =3D "filename:F,format:s?,device:s?,head:i?",
>>
>> Incompatible change: meaning of "screendump ONE TWO" changes from
>> filename=3DONE, device=3DTWO to filename=3DONE, format=3DTWO.
>>
>> As HMP is not a stable interface, incompatible change is permissible.
>> But is this one wise?
>>
>> Could we add the new argument at the end instead?
>>
>>              .args_type  =3D "filename:F,device:s?,head:i?,format:s?",
>>
>> Could we do *without* an argument, and derive the format from the
>> filename extension?  .png means format=3Dpng, anything else format=3Dppm=
.
>> Would be a bad idea for QMP.  Okay for HMP?
>
> Should I go ahead with extracting format from filename provided for HMP?

Let's give Dave a chance to chime in.

[...]


