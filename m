Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B256A0356
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:38:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV6Av-0006JD-Qd; Thu, 23 Feb 2023 02:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pV6Ar-0006E4-QT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:37:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pV6Aq-0003vC-AX
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677137871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uH+1Sqo4hVXnBusAKLLJtA0XYKW3rMDEl8RZR2Cxk1w=;
 b=WnOQ+5USFayruslvhdvUkJK64Oy51SdPlebq1IDZANm3fo3EfiBsTt63OqW9Zs+AVXmWO6
 W3Hoy1y0zqcEOmSngrDDjkSefqhJi0IUScIDrIx6TYD3F0ZQblMROAngQnESPu28XbdSDC
 ohD4lwg7LYAem3798wYLeIGs3Sw+K9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-8Kl7AwByOp2hbB9YKbSgww-1; Thu, 23 Feb 2023 02:37:48 -0500
X-MC-Unique: 8Kl7AwByOp2hbB9YKbSgww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6358E80351F;
 Thu, 23 Feb 2023 07:37:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EE812026D38;
 Thu, 23 Feb 2023 07:37:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3804621E6A1F; Thu, 23 Feb 2023 08:37:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Jonathan
 Cameron
 <Jonathan.Cameron@Huawei.com>,  qemu-devel@nongnu.org,  Michael Tsirkin
 <mst@redhat.com>,  Ben Widawsky <bwidawsk@kernel.org>,
 linux-cxl@vger.kernel.org,  linuxarm@huawei.com,  Ira Weiny
 <ira.weiny@intel.com>,  Gregory Price <gourry.memverge@gmail.com>,  Mike
 Maslenkin <mike.maslenkin@gmail.com>,  Dave Jiang <dave.jiang@intel.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
 <c2fb77b0-0734-3be5-1b54-7c797b3daa15@linaro.org>
 <20230222164947.0000554f@Huawei.com>
 <b9bd5698-1f73-b912-0344-4b70c30dd02a@linaro.org>
 <586d040f-d712-905e-fd68-bcde3713478b@redhat.com>
Date: Thu, 23 Feb 2023 08:37:46 +0100
In-Reply-To: <586d040f-d712-905e-fd68-bcde3713478b@redhat.com> (Thomas Huth's
 message of "Thu, 23 Feb 2023 07:58:18 +0100")
Message-ID: <875ybsg7cl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Thomas Huth <thuth@redhat.com> writes:

> On 22/02/2023 19.16, Philippe Mathieu-Daud=C3=A9 wrote:
>> +Thomas (meson) & Marc-Andr=C3=A9 (conditional QAPI)
>
> + Markus
>
>> On 22/2/23 17:49, Jonathan Cameron wrote:

[...]

>>>>>> Doesn't these need
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'if': 'CONFIG_CXL_MEM_DEV=
ICE',
>>>>>>
>>>>>> ?
>>>>>
>>>>> If I make this change I get a bunch of
>>>>>
>>>>> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CONFIG=
_CXL_MEM_DEVICE"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 18 | #if defined(CONFIG_CXL_MEM_DEVICE)
>>>>
>>>> Err, I meant the generic CONFIG_CXL, not CONFIG_CXL_MEM_DEVICE.
>>>>
>>>>> It's a target specific define (I think) as built alongside PCI_EXPRESS
>>>>> Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)
>>>>>
>>>>> To be honest though I don't fully understand the QEMU build system so=
 the reason
>>>>> for the error might be wrong.
>>>>
>>>> You need to restrict to system emulation (the 'have_system' check):
>>>
>>> This doesn't help - still have
>>> attempt to used poisoned "CONFIG_CXL"
>
> Not sure how the QAPI generator works, but target specific config switche=
s can only be used in target specific json files there, so that's machine-t=
arget.json and misc-target.json currently, as far as I know. Not sure how t=
he QAPI generator distinguishes between common and target specific code, th=
ough ... just by the "-target" suffix? Maybe Markus or Marc-Andr=C3=A9 can =
comment on that.

Whenever you use a poisoned macro in a conditional, all the code
generated for this .json file (we call it a "QAPI schema module")
becomes target-dependent.  The QAPI code generator itself is blissfully
unaware of this.

Since target-dependent code needs to be compiled differently, the build
process needs to be know which modules are target-dependent.  We do this
in one of the stupidest ways that could possibly work: a module is
target-dependent if its name ends with "-target".  There are just two
right now: qapi/machine-target.json and qapi/misc-target.json.

The logic resides in qapi/meson.build.  Look for

    if module.endswith('-target')

Questions?

[...]


