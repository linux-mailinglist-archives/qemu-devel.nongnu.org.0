Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB472099F5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 08:45:01 +0200 (CEST)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joLd6-0006cE-GU
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 02:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joLcM-00067D-6p
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:44:14 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26266
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joLcK-00028M-Ks
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593067451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6wCZVgfOdKIwj9zIYHyxYZMoqkmZPk0eggyXQW/jzAM=;
 b=bqEYkHi1A7AzJlqL5TQWzIuFOYvzwEaDSAe0icFLaa2vkw8PAuzTgoAgxckUvIes2WSteU
 GRGaruvn+AwppmggJF8JFASJslERg8uhmbFA+WsKwdoV8kskScD9SziSrQRhRbIru3K6OF
 P0DWaamnqoOZFsD+CQBp1DdqcAMaX0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-BYuoO65gMJSeM95apUuerw-1; Thu, 25 Jun 2020 02:44:09 -0400
X-MC-Unique: BYuoO65gMJSeM95apUuerw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D10218585A2;
 Thu, 25 Jun 2020 06:44:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F775D9DA;
 Thu, 25 Jun 2020 06:44:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1D5E11384D4; Thu, 25 Jun 2020 08:44:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 20/25] x86: Fix x86_cpu_new() error API violations
References: <20200624083737.3086768-1-armbru@redhat.com>
 <20200624083737.3086768-21-armbru@redhat.com>
 <20200624161703.153c7905@redhat.com>
 <1d6e83fa-04c2-2d3e-3695-bf85f6647bfc@redhat.com>
Date: Thu, 25 Jun 2020 08:44:02 +0200
In-Reply-To: <1d6e83fa-04c2-2d3e-3695-bf85f6647bfc@redhat.com> (Paolo
 Bonzini's message of "Wed, 24 Jun 2020 16:20:16 +0200")
Message-ID: <87tuyz3arx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 24/06/20 16:17, Igor Mammedov wrote:
>>> -    cpu = object_new(MACHINE(x86ms)->cpu_type);
>>> -
>>> -    object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
>>> -    qdev_realize(DEVICE(cpu), NULL, &local_err);
>>> -
>>> -    object_unref(cpu);
>>> -    error_propagate(errp, local_err);
>>> +    object_property_set_uint(cpu, apic_id, "apic-id", &error_abort);
>> it may fail here if user specified wrong cpu flags, but there is nothing we can do to fix it.
>> perhaps error_fatal would suit this case better?
>
> No, we need to add the error_propagate dance instead.

Thanks, will dance!


