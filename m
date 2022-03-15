Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CBB4D9C1A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:26:18 +0100 (CET)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7Bp-0007HS-Er
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:26:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU79S-0004MB-29
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU79O-0004nS-6U
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647350624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fuk7v2TvHcg+DhTTnrLoH5X3z8TR/xcQmzcuQMI8JtM=;
 b=Xtz7tcRy8EqH9XLoscLMC4ufRvr5rdlHLB45VKC/Hc1zMmcp5N/ixBHYkcgIavdRE9YeNk
 8Pi37J6PPHJQDIM4+y0usnwsmurhR5S6NICSsVCEPqUdGJAALUxeQ7oBcNgKQpzOvhk3i2
 tdLOc084ut3ze7DYm2m8LtKwVhvxA3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-jlHMVg_OPV61ijDy1RayVQ-1; Tue, 15 Mar 2022 09:23:37 -0400
X-MC-Unique: jlHMVg_OPV61ijDy1RayVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E011899EC1;
 Tue, 15 Mar 2022 13:23:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C991402400;
 Tue, 15 Mar 2022 13:23:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A93721E66C8; Tue, 15 Mar 2022 14:23:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG.
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
 <871qz88yu7.fsf@pond.sub.org>
 <30e38de3-3b07-b440-ad32-a189720db301@nutanix.com>
 <87r173o7h4.fsf@pond.sub.org> <YjBoS6qvjE6EHokR@redhat.com>
Date: Tue, 15 Mar 2022 14:23:36 +0100
In-Reply-To: <YjBoS6qvjE6EHokR@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 15 Mar 2022 10:19:55 +0000")
Message-ID: <87pmmnl57r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: soham.ghosh@nutanix.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 kraxel@redhat.com, thuth@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Mar 15, 2022 at 11:06:31AM +0100, Markus Armbruster wrote:
>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>=20
>> > On 11/03/22 5:50 pm, Markus Armbruster wrote:
>> >> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>> >>
>> >>> Currently screendump only supports PPM format, which is un-compresse=
d and not
>> >>> standard. Added a "format" parameter to qemu monitor screendump capa=
bilites
>> >>> to support PNG image capture using libpng. The param was added in QA=
PI schema
>> >>> of screendump present in ui.json along with png_save() function whic=
h converts
>> >>> pixman_image to PNG. HMP command equivalent was also modified to sup=
port the
>> >>> feature.
>> >>>
>> >>> Example usage:
>> >>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> >>> "format":"png" } }
>> >>>
>> >>> Resolves: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git=
lab.com_qemu-2Dproject_qemu_-2D_issues_718&d=3DDwIBAg&c=3Ds883GpUCOChKOHioc=
YtGcg&r=3Dutjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=3DSxmcA4FlCCy9O9eUa=
DUiSY37bauF6iJbDRVL--VUyTG5Vze_GFjmJuxgwAVYRjad&s=3DOIKnm9xXYjeat7TyIJ_-z9E=
vG2XYXMULNbHe0Bjzyjo&e=3D
>> >>>
>> >>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>=20
>> [...]
>>=20
>> >>> diff --git a/qapi/ui.json b/qapi/ui.json
>> >>> index 9354f4c467..6aa0dd7c1b 100644
>> >>> --- a/qapi/ui.json
>> >>> +++ b/qapi/ui.json
>>=20
>> [...]
>>=20
>> >>>   ##
>> >>>   # @screendump:
>> >>>   #
>> >>> -# Write a PPM of the VGA screen to a file.
>> >>> +# Write a screenshot of the VGA screen to a file.
>> >>
>> >> Is "VGA screen" accurate?  Or does this work for other displays, too?
>> >
>> > The patch didn't modify any display changes and VGA screen was
>> > previously supported display type.
>>=20
>> Let me rephrase my question: was "VGA screen" accurate before your
>> patch?
>
> No, it would be better phrased as
>
>   "Capture the specified screen contents and write it to a file"
>
> In a multi-head scenario, it can be any of the output heads, and
> whether the head is in a VGA mode or not is irrelevant to the
> command functionality.

Makes sense to me.


