Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA5D20B1C6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 14:56:00 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jontf-0000iL-Qn
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 08:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jonsX-0007n1-8Y
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:54:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32831
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jonsV-0000c4-12
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593176085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jG5xHbQkOPXS4K7vTb1CE/G2bqEpbQxgwGKver9eOIg=;
 b=JdQhY4gLSe8gocAYzjfjXNulDaunlmlBtKO/p51TUFbA7iDKBrT2b02J3t94jCj/XC2JTg
 vbtnYb82IntIeJY9EDvs3XH8xPAxdEYxaNLGSgIemHgjQ4Nj2FPWuLhtCOUFqW7PlcFagL
 lDclIWciqXnFCUTNmYFoGclJSKpMkfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-QKMxRdfMOASzSbq0in78pQ-1; Fri, 26 Jun 2020 08:54:43 -0400
X-MC-Unique: QKMxRdfMOASzSbq0in78pQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C675E184D17D;
 Fri, 26 Jun 2020 12:54:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8745219C4F;
 Fri, 26 Jun 2020 12:54:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0FEDD11384D4; Fri, 26 Jun 2020 14:54:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 20/25] x86: Fix x86_cpu_new() error API violations
References: <20200624083737.3086768-1-armbru@redhat.com>
 <20200624083737.3086768-21-armbru@redhat.com>
 <20200624161703.153c7905@redhat.com>
Date: Fri, 26 Jun 2020 14:54:38 +0200
In-Reply-To: <20200624161703.153c7905@redhat.com> (Igor Mammedov's message of
 "Wed, 24 Jun 2020 16:17:03 +0200")
Message-ID: <875zbeugvl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 24 Jun 2020 10:37:32 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
>> pointer to a variable containing NULL.  Passing an argument of the
>> latter kind twice without clearing it in between is wrong: if the
>> first call sets an error, it no longer points to NULL for the second
>> call.
>> 
>> x86_cpu_new() is wrong that way: it passes &local_err to
>> object_property_set_uint() without checking it, and then to
>> qdev_realize().  Harmless, because the former can't actually fail
>> here.
>> 
>> Fix by checking for failure right away.  While there, replace
>> qdev_realize(); object_unref() by qdev_realize_and_unref().
>> 
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/i386/x86.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>> 
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 34229b45c7..3a7029e6db 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -118,16 +118,10 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
>>  
>>  void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>>  {
>> -    Object *cpu = NULL;
>> -    Error *local_err = NULL;
>> +    Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
>>  
>> -    cpu = object_new(MACHINE(x86ms)->cpu_type);
>> -
>> -    object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
>> -    qdev_realize(DEVICE(cpu), NULL, &local_err);
>> -
>> -    object_unref(cpu);
>> -    error_propagate(errp, local_err);
>> +    object_property_set_uint(cpu, apic_id, "apic-id", &error_abort);
> it may fail here if user specified wrong cpu flags, but there is nothing we can do to fix it.

Really?

object_property_set_uint() fails when property "apic-id" doesn't exist,
has no ->set() method, or its ->set() fails.

Property "apic-id" is defined in x86_cpu_properties[] as

    DEFINE_PROP_UINT32("apic-id", X86CPU, apic_id, UNASSIGNED_APIC_ID),

This means "apic-id" exists, and its ->set() is set_uint32().  That
leaves only set_uint32() as possible source of failure.

It fails when

* the device is already realized: programming error

* the value to be stored is not an integer: object_property_set_uint()
  makes it one, can't fail

* the value is not representable as uint32_t: @api_id is declared as
  int64_t, but:

  - pc_hot_add_cpu() passes x86_cpu_apic_id_from_index(), which is
    uint32_t, converted to int64_t.  Can't fail.

  - x86_cpus_init() passes possible_cpus->cpus[i].arch_id, which is
    uint64_t.  Is this the "if user specified wrong cpu flags" case?

  Aside: should the integer types be cleaned up?

To assess the bug's impact, we need to know when the other call in this
error pileup fails.  If we can make both fail, we have a crash bug.
Else, we have a harmless API violation.

Any ideas on how to make the qdev_realize() fail?

[...]


