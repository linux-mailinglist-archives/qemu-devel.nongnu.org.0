Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0C4D9876
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:11:47 +0100 (CET)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU49a-0006Hx-Cc
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:11:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU44o-0001a7-Td
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:06:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU44i-0001h3-Lc
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647338803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cWc3t83V9sG3g7fPj8L1gbXwPM3LCcPvcXUA4WVq2qY=;
 b=RtTGLrkJNjqlYDLEy2IVMnHxj3v2pI3hSbkqZQa/uKjhq3nanWChJ9J7hyAruTpkiDPy50
 SE20UyLPUyEV9+oAPNMfMvVb2Qf8nZEJ4MHWlftmbJQCX8mzyZBlgUbHlGRHVpFcl+2Kbj
 n9tZfXFHO0on1hcaV79Jv0ECrNHMVpE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-62kEagbHNNaA4MJmHko18w-1; Tue, 15 Mar 2022 06:06:39 -0400
X-MC-Unique: 62kEagbHNNaA4MJmHko18w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CC17803B22;
 Tue, 15 Mar 2022 10:06:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F6F32023A1F;
 Tue, 15 Mar 2022 10:06:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2BA4821E66FC; Tue, 15 Mar 2022 11:06:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG.
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
 <871qz88yu7.fsf@pond.sub.org>
 <30e38de3-3b07-b440-ad32-a189720db301@nutanix.com>
Date: Tue, 15 Mar 2022 11:06:31 +0100
In-Reply-To: <30e38de3-3b07-b440-ad32-a189720db301@nutanix.com> (Kshitij
 Suri's message of "Tue, 15 Mar 2022 10:06:46 +0530")
Message-ID: <87r173o7h4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> On 11/03/22 5:50 pm, Markus Armbruster wrote:
>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>
>>> Currently screendump only supports PPM format, which is un-compressed and not
>>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>>> to support PNG image capture using libpng. The param was added in QAPI schema
>>> of screendump present in ui.json along with png_save() function which converts
>>> pixman_image to PNG. HMP command equivalent was also modified to support the
>>> feature.
>>>
>>> Example usage:
>>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>>> "format":"png" } }
>>>
>>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=SxmcA4FlCCy9O9eUaDUiSY37bauF6iJbDRVL--VUyTG5Vze_GFjmJuxgwAVYRjad&s=OIKnm9xXYjeat7TyIJ_-z9EvG2XYXMULNbHe0Bjzyjo&e=
>>>
>>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

[...]

>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index 9354f4c467..6aa0dd7c1b 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json

[...]

>>>   ##
>>>   # @screendump:
>>>   #
>>> -# Write a PPM of the VGA screen to a file.
>>> +# Write a screenshot of the VGA screen to a file.
>>
>> Is "VGA screen" accurate?  Or does this work for other displays, too?
>
> The patch didn't modify any display changes and VGA screen was
> previously supported display type.

Let me rephrase my question: was "VGA screen" accurate before your
patch?

[...]


