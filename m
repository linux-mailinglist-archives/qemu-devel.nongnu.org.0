Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3051D26D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:38:59 +0200 (CEST)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsYE-0000Ua-UV
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nmsUE-0006O7-8b
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:34:51 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:22478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nmsU5-0001ME-G3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651822479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wz23Z7hjMcktWucrAf8reggid2DSWYRj0Widij1/TT4=;
 b=THYeLDJAmNNROfWztZhGBzWI2PuDVNZ3f2MiDU+t1ipEjYnWnPpgzLYFpOH9cnKtTp7R56
 /QWBgN6AbqZnlPmK9iV8GvbSX44XccubGZlZkQ3haF++d7JGgcM3FjbrQnw7dqdCsST/VR
 6NLV7t/KeypgetBZQIqHpX/+wE5Pzak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-rNNelrIyNx-kaErUeNS9EA-1; Fri, 06 May 2022 03:34:30 -0400
X-MC-Unique: rNNelrIyNx-kaErUeNS9EA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F28FF811E76;
 Fri,  6 May 2022 07:34:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B76C27DB8;
 Fri,  6 May 2022 07:34:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 stefanb@linux.vnet.ibm.com, f4bug@amsat.org
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
In-Reply-To: <019b265a-2489-c595-acd4-b1b5c1772707@redhat.com>
Organization: Red Hat GmbH
References: <20220428134945.511829-1-eric.auger@redhat.com>
 <20220428141423.6e2da84c.alex.williamson@redhat.com>
 <019b265a-2489-c595-acd4-b1b5c1772707@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 06 May 2022 09:34:28 +0200
Message-ID: <875ymj5d2z.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.74; envelope-from=cohuck@redhat.com;
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

> Hi Alex,
>
> On 4/28/22 22:14, Alex Williamson wrote:
>> On Thu, 28 Apr 2022 15:49:45 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:

>>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>> +{
>>> +    MemoryRegion *mr =3D section->mr;
>>> +
>>> +    if (!TPM_IS_CRB(mr->owner)) {
>>> +        return false;
>>> +    }
>> It looks like this test is going to need to be wrapped in #ifdef
>> CONFIG_TPM:
>
> sorry for the delay. Your message fell though the cracks :-(
>
> if I put an '#ifdef CONFIG_TPM' I need to inverse the logic because by
> default the function shall return false.
>
> solution #1
>
> #ifdef CONFIG_TPM=C2=A0=C2=A0
> =C2=A0if (TPM_IS_CRB(mr->owner)) {
>
>     /* this is a known safe misaligned region, just trace for debug purpo=
se */
>     trace_vfio_known_safe_misalignment(memory_region_name(mr),
>                                        section->offset_within_address_spa=
ce,
>                                        section->offset_within_region,
>                                        qemu_real_host_page_size());
>
>     return true;
>    }
>
> #endif
> return false;
>
> This looks weird to me.
>
> +    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {
> +        return false;
> +    }
>
>
> solution #2
> replace !object_dynamic_cast(mr->owner, TYPE_TPM_CRB) by
> !object_dynamic_cast(mr->owner, "tpm-crb")
> and add a comment saying that we don't use TYPE_TPM_CRB on purpose
>
> solution #3
> Move #define TPM_IS_CRB(chr) and related defined out of
> #ifdef CONFIG_TPM hoping it does not have other side effects
>
> Thoughts?
> Eric

solution #4

#ifndef CONFIG_TPM
/* needed for an alignment check in non-tpm code */
static inline Object *TPM_IS_CRB(Object *obj)
{
    return NULL;
}
#endif

I think it would be good if we could hide the configuration details in
the header.


