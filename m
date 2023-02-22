Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49169FAFC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:29:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtrU-0000do-B9; Wed, 22 Feb 2023 13:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUtrR-0000bE-Oo
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUtrP-0003Rw-Rw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677090538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0zMOWQrn1EHqDPtEHLXu4pS81jBjb8D5Oqw5wMkmEI=;
 b=AH/vZB2PVGXS6u5wj5ogDX2cr13S8mcwSVXaxIUcLIG+43TWTrikgvogtcYdwr0lpHiUvh
 Ag2AMwlcBXX5kCKdRDgf5yLpa9Ymbgc/enAAaPYUn4MD+pia2FUfunVRdKZqQ1H/7zI0nV
 AmezVGfmrpBB9cTwisgtIBz6G4B6Cco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-mFmNc895P_qSF7vYvo_8lA-1; Wed, 22 Feb 2023 13:28:56 -0500
X-MC-Unique: mFmNc895P_qSF7vYvo_8lA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D54B280AA28;
 Wed, 22 Feb 2023 18:28:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D089E492B00;
 Wed, 22 Feb 2023 18:28:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B171D21E6A1F; Wed, 22 Feb 2023 19:28:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>,  Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>,  <linuxarm@huawei.com>,  "Ira Weiny"
 <ira.weiny@intel.com>,  Gregory Price <gourry.memverge@gmail.com>,  Mike
 Maslenkin <mike.maslenkin@gmail.com>,  Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
Date: Wed, 22 Feb 2023 19:28:54 +0100
In-Reply-To: <20230222145330.000021ef@huawei.com> (Jonathan Cameron's message
 of "Wed, 22 Feb 2023 14:53:30 +0000")
Message-ID: <877cw9k109.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> On Tue, 21 Feb 2023 23:15:49 +0100
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>
>> Hi Jonathan,
>>=20
>> On 21/2/23 16:21, Jonathan Cameron wrote:
>> > CXL uses PCI AER Internal errors to signal to the host that an error h=
as
>> > occurred. The host can then read more detailed status from the CXL RAS
>> > capability.
>> >=20
>> > For uncorrectable errors: support multiple injection in one operation
>> > as this is needed to reliably test multiple header logging support in =
an
>> > OS. The equivalent feature doesn't exist for correctable errors, so on=
ly
>> > one error need be injected at a time.
>> >=20
>> > Note:
>> >   - Header content needs to be manually specified in a fashion that
>> >     matches the specification for what can be in the header for each
>> >     error type.
>> >=20
>> > Injection via QMP:
>> > { "execute": "qmp_capabilities" }
>> > ...
>> > { "execute": "cxl-inject-uncorrectable-errors",
>> >    "arguments": {
>> >      "path": "/machine/peripheral/cxl-pmem0",
>> >      "errors": [
>> >          {
>> >              "type": "cache-address-parity",
>> >              "header": [ 3, 4]
>> >          },
>> >          {
>> >              "type": "cache-data-parity",
>> >              "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18=
,19,20,21,22,23,24,25,26,27,28,29,30,31]
>> >          },
>> >          {
>> >              "type": "internal",
>> >              "header": [ 1, 2, 4]
>> >          }
>> >          ]
>> >    }}
>> > ...
>> > { "execute": "cxl-inject-correctable-error",
>> >      "arguments": {
>> >          "path": "/machine/peripheral/cxl-pmem0",
>> >          "type": "physical"
>> >      } }
>> >=20
>> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> Hi Philippe,
>
> Thanks for your review.  One question inline.
>
>> > +#
>> > +# Type of uncorrectable CXL error to inject. These errors are reporte=
d via
>> > +# an AER uncorrectable internal error with additional information log=
ged at
>> > +# the CXL device.
>> > +#
>> > +# @cache-data-parity: Data error such as data parity or data ECC erro=
r CXL.cache
>> > +# @cache-address-parity: Address parity or other errors associated wi=
th the
>> > +#                        address field on CXL.cache
>> > +# @cache-be-parity: Byte enable parity or other byte enable errors on=
 CXL.cache
>> > +# @cache-data-ecc: ECC error on CXL.cache
>> > +# @mem-data-parity: Data error such as data parity or data ECC error =
on CXL.mem
>> > +# @mem-address-parity: Address parity or other errors associated with=
 the
>> > +#                      address field on CXL.mem
>> > +# @mem-be-parity: Byte enable parity or other byte enable errors on C=
XL.mem.
>> > +# @mem-data-ecc: Data ECC error on CXL.mem.
>> > +# @reinit-threshold: REINIT threshold hit.
>> > +# @rsvd-encoding: Received unrecognized encoding.
>> > +# @poison-received: Received poison from the peer.
>> > +# @receiver-overflow: Buffer overflows (first 3 bits of header log in=
dicate which)
>> > +# @internal: Component specific error
>> > +# @cxl-ide-tx: Integrity and data encryption tx error.
>> > +# @cxl-ide-rx: Integrity and data encryption rx error.
>> > +##
>> > +
>> > +{ 'enum': 'CxlUncorErrorType',=20=20
>>=20
>> Doesn't these need
>>=20
>>       'if': 'CONFIG_CXL_MEM_DEVICE',
>>=20
>> ?
>
> If I make this change I get a bunch of
>
> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CONFIG_CXL=
_MEM_DEVICE"
>    18 | #if defined(CONFIG_CXL_MEM_DEVICE)

This means you're trying to use target-dependent stuff in
target-independent code.

Have a look at the thread

    Subject: Can we unpoison CONFIG_FOO macros?
    Message-ID: <87lel9o56z.fsf@pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg01885.html

and if questions remain, ask them right here.

> It's a target specific define (I think) as built alongside PCI_EXPRESS
> Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)
>
> To be honest though I don't fully understand the QEMU build system so the=
 reason
> for the error might be wrong.

[...]


