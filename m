Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E3A3CDE1E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:45:52 +0200 (CEST)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VSp-0007xs-1v
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5VQn-0006H1-8F
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5VQk-000188-5E
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626709420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZScKuRuoMrf2iLTBW+fc6HBoZZ4kehE6sEUBqFKLII=;
 b=R74YTK1beTbZ30GwLab05VOlzkfwhP9FhdJ/IzYKPqK5K5vVxu1ST5oGarnKcMrXO7QwWn
 CIknOmsbOhgk+jzpHCBxBvnPEkpdNeqc4q1ggmIyIBp4HSpmh7yogqPuE0rGQFTBxFRzqr
 wY6P24hM7KvStdaGSPbiIBxGh1PQUJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-t-eh53duPnGpRRQqXc0P-A-1; Mon, 19 Jul 2021 11:43:36 -0400
X-MC-Unique: t-eh53duPnGpRRQqXc0P-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84883804311;
 Mon, 19 Jul 2021 15:43:35 +0000 (UTC)
Received: from localhost (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8854360CA1;
 Mon, 19 Jul 2021 15:43:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
In-Reply-To: <e4865ad6-f8ec-e7ba-66ef-9c95334ba9b3@linux.ibm.com>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
 <871r7yd4gf.fsf@redhat.com> <YPFN83pKBt7F97kW@redhat.com>
 <e4865ad6-f8ec-e7ba-66ef-9c95334ba9b3@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 19 Jul 2021 17:43:29 +0200
Message-ID: <87fswa9un2.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: thuth@redhat.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 ehabkost@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(restored cc:s)

On Fri, Jul 16 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 7/16/21 11:14 AM, Daniel P. Berrang=C3=A9 wrote:
>> I increasingly worry that we're making a mistake by going down the
>> route of having custom smp_parse implementations per target, as this
>> is showing signs of inconsistent behaviour and error reportings. I
>> think the differences / restrictions have granularity at a different
>> level that is being tested in many cases too.
>>=20
>> Whether threads !=3D 1 is valid will likely vary depending on what
>> CPU model is chosen, rather than what architecture is chosen.
>> The same is true for dies !=3D 1. We're not really checking this
>> closely even in x86 - for example I can request nonsense such
>> as a 25 year old i486 CPU model with hyperthreading and multiple
>> dies
>>=20
>>    qemu-system-x86_64 -cpu 486 -smp 16,cores=3D4,dies=3D2,threads=3D2

Now that's what I'd call an upgrade :)

>>=20
>> In this patch, there is no error reporting if the user specifies
>> dies !=3D 1 or threads !=3D 1 - it just silently ignores the request
>> which is not good.
>
> yes, I should change this
>
>>=20
>> Some machine types may have constraints on CPU sockets.
>>=20
>> This can of course all be handled by custom smp_parse impls, but
>> this is ultimately going to lead to alot of duplicated and
>> inconsistent logic I fear.
>>=20
>> I wonder if we would be better off having machine class callback
>> that can report topology constraints for the current configuration,
>> along lines ofsmp_constraints(MachineState *ms,
>>=20
>>       smp_constraints(MachineState *ms,
>>                       int *max_sockets,
>>                       int *max_dies,
>>                       int *max_cores,
>>                       int *max_threads)
>
> I find the idee good, but what about making it really machine agnostic=20
> by removing names and using a generic
>
> =09smp_constraints(MachineState *ms,
> =09=09=09int *nb_levels,
> =09=09=09int *levels[]
> =09=09=09);
>
> Level can be replaced by another name like container.
> The machine could also provide the level/container names according to=20
> its internal documentation.

In theory, this could give us more flexibility; however, wouldn't
that still mean that the core needs to have some knowledge of the
individual levels? We also have the command line parsing to consider,
and that one uses concrete names (which may or may not make sense,
depending on what machine you are trying to configure), and we'd still
have to map these to 'levels'.

>
> Regards,
> Pierre
>
>
>
>>=20
>> And then have only a single smp_parse impl that takes into account
>> these constraints, to report errors / fill in missing fields / etc ?
>>=20
>> Regards,
>> Daniel
>>=20
>
> --=20
> Pierre Morel
> IBM Lab Boeblingen


