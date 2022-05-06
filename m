Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ACE51D2AE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:58:11 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsqo-0002pN-5t
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nmspY-0001Zv-RI
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:56:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:31567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nmspV-0004TZ-JD
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651823808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAwznink3OcOk/iodEfQpqvgIWTP8mRaxv0pR7zYc7c=;
 b=ThXc0h8oj5u5XDuzQNg+pEeQqTNUAthY6APUiwipX8w5QOxzG0ysbRpiO/OqgekdqlsKBI
 h7gB8kEDVKGDvhL3++mYOZt1nlrG09337SxlYd/NyCko2NCDjZZ3E43y+I6Ah4P5RowDHc
 nFTq4wVEeMSPRRME1KoH8NEyHO/s2iA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-nHDqRVSZM3CnM7_Wbc_hXA-1; Fri, 06 May 2022 03:56:44 -0400
X-MC-Unique: nHDqRVSZM3CnM7_Wbc_hXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6BCF8038E3;
 Fri,  6 May 2022 07:56:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5686340CF8E8;
 Fri,  6 May 2022 07:56:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 stefanb@linux.vnet.ibm.com, f4bug@amsat.org
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
In-Reply-To: <2b710806-cecc-aeb9-aca6-ae5a8ddaa136@redhat.com>
Organization: Red Hat GmbH
References: <20220428134945.511829-1-eric.auger@redhat.com>
 <20220428141423.6e2da84c.alex.williamson@redhat.com>
 <019b265a-2489-c595-acd4-b1b5c1772707@redhat.com>
 <875ymj5d2z.fsf@redhat.com>
 <2b710806-cecc-aeb9-aca6-ae5a8ddaa136@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 06 May 2022 09:56:42 +0200
Message-ID: <8735hn5c1x.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 06 2022, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie,
>
> On 5/6/22 09:34, Cornelia Huck wrote:
>> On Fri, May 06 2022, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> Hi Alex,
>>>
>>> On 4/28/22 22:14, Alex Williamson wrote:
>>>> On Thu, 28 Apr 2022 15:49:45 +0200
>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *sectio=
n)
>>>>> +{
>>>>> +    MemoryRegion *mr =3D section->mr;
>>>>> +
>>>>> +    if (!TPM_IS_CRB(mr->owner)) {
>>>>> +        return false;
>>>>> +    }
>>>> It looks like this test is going to need to be wrapped in #ifdef
>>>> CONFIG_TPM:
>>> sorry for the delay. Your message fell though the cracks :-(
>>>
>>> if I put an '#ifdef CONFIG_TPM' I need to inverse the logic because by
>>> default the function shall return false.
>>>
>>> solution #1
>>>
>>> #ifdef CONFIG_TPM=C2=A0=C2=A0
>>> =C2=A0if (TPM_IS_CRB(mr->owner)) {
>>>
>>>     /* this is a known safe misaligned region, just trace for debug pur=
pose */
>>>     trace_vfio_known_safe_misalignment(memory_region_name(mr),
>>>                                        section->offset_within_address_s=
pace,
>>>                                        section->offset_within_region,
>>>                                        qemu_real_host_page_size());
>>>
>>>     return true;
>>>    }
>>>
>>> #endif
>>> return false;
>>>
>>> This looks weird to me.
>>>
>>> +    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {
>>> +        return false;
>>> +    }
>>>
>>>
>>> solution #2
>>> replace !object_dynamic_cast(mr->owner, TYPE_TPM_CRB) by
>>> !object_dynamic_cast(mr->owner, "tpm-crb")
>>> and add a comment saying that we don't use TYPE_TPM_CRB on purpose
>>>
>>> solution #3
>>> Move #define TPM_IS_CRB(chr) and related defined out of
>>> #ifdef CONFIG_TPM hoping it does not have other side effects
>>>
>>> Thoughts?
>>> Eric
>> solution #4
>>
>> #ifndef CONFIG_TPM
>> /* needed for an alignment check in non-tpm code */
>> static inline Object *TPM_IS_CRB(Object *obj)
>> {
>>     return NULL;
>> }
>> #endif
>>
>> I think it would be good if we could hide the configuration details in
>> the header.
>>
> Yep, I forgot to mention solution #3 also happened in include/sysemu/tpm.=
h.
> Connie, either we add your stub function or we move the following out of
> the #ifdef CONFIG_TPM. This should be harmless, no?
> Stefan, any preference?
>
> #define TYPE_TPM_TIS_ISA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "tpm-tis"
> #define TYPE_TPM_TIS_SYSBUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "tpm-tis-device"
> #define TYPE_TPM_CRB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "tpm-crb"
> #define TYPE_TPM_SPAPR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "tpm-spapr"
>
> #define TPM_IS_TIS_ISA(chr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
> #define TPM_IS_TIS_SYSBUS(chr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
> #define TPM_IS_CRB(chr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
> #define TPM_IS_SPAPR(chr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)

If it's just those simple defines, I can't see how that could break
things (you won't have the respective objects anyway). So yes, I think
that is the best solution.


