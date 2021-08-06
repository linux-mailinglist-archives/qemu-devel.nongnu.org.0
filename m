Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5183E2C57
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:16:58 +0200 (CEST)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0ef-0006hm-MP
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mC0bh-00029G-4H
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mC0bf-0002JT-3x
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628259230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcTOh7eNHVibjBsOQV7j5rVfNV41Flc0Ujcqmn3ram4=;
 b=ChwrBZzDryYN4q5c+05Y/j3+Jf53Ep7AhSoS/VY3hg0B/U3nbzcuphDJrwF41ltN8z/OH+
 ukFDtcniLrcSe+xHKCo5fmN9BYhxafLzATkOvFp5hR/5i1IPfua+F+i9fmmT5rBUPMdc/v
 bPEnLWjFILzFCCOylWXMG72hEiq6OCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-VXeQ_0dMO_eAphD39bqIbg-1; Fri, 06 Aug 2021 10:13:49 -0400
X-MC-Unique: VXeQ_0dMO_eAphD39bqIbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD8BD87D544;
 Fri,  6 Aug 2021 14:13:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A75310016F7;
 Fri,  6 Aug 2021 14:13:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 12/12] hw/s390x/s390-skeys: lazy storage key
 enablement under TCG
In-Reply-To: <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com>
Organization: Red Hat GmbH
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-13-david@redhat.com>
 <a44f1cd2-215b-a983-c2cb-a524e308eae9@redhat.com>
 <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 16:13:42 +0200
Message-ID: <87r1f6y82x.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06 2021, David Hildenbrand <david@redhat.com> wrote:

> On 06.08.21 11:42, Thomas Huth wrote:
>> On 05/08/2021 17.28, David Hildenbrand wrote:
>>> -static void qemu_s390_skeys_init(Object *obj)
>>> +static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>>    {
>>> -    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(obj);
>>> -    MachineState *machine = MACHINE(qdev_get_machine());
>>> +    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
>>>    
>>> -    skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
>>> -    skeys->keydata = g_malloc0(skeys->key_count);
>>> +    /* Lockless check is sufficient. */
>>> +    return !!skeys->keydata;
>>>    }
>>>    
>>> -static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>> +static int qemu_s390_skeys_enable(S390SKeysState *ss)
>> 
>> Could you please call this qemu_s390_skeys_activate() so that it's not so
>> easily confused with the ..._enabled() function?
>
> Well, you enable it and you check if it's enabled ... so using different 
> terminology is more confusing, no?
>
> I could rename _enabled to is_enabled to make the difference easiert to 
> sport here.

is_enabled certainly is better than just enabled; otherwise, the two
function names are just way too similar.


