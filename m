Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DE20785B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:05:42 +0200 (CEST)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo7u9-0002AX-Hr
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo7rb-00084H-Ku
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:03:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40260
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo7rZ-00080G-Fj
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593014580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUyiQ5CXbOxrIdOxVlPWNtHeba8Ra6r7sH0qIw6XT5g=;
 b=WUiy06mFg89OnZPuI7XfSVPovNDY/zvkaR2p7Cp/mFp+vEXwc4999QrFKS6quGeo53PEDu
 d8oq8vUFaIzrdmRf+QCC5GT8/i8AnkLCaxsiQaQdQsJIbKzvMHiIUgAE5WDtW6xtUssYWk
 +CPT3tw158przL3Yz2IovmOQuuAAzbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-KXQlVnP9Pe2eLniOz5KbLA-1; Wed, 24 Jun 2020 12:02:58 -0400
X-MC-Unique: KXQlVnP9Pe2eLniOz5KbLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC78EC1A0;
 Wed, 24 Jun 2020 16:02:57 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 585F85D9DC;
 Wed, 24 Jun 2020 16:02:56 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] qom: Introduce object_property_try_add_child()
From: Auger Eric <eric.auger@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
References: <20200624124301.7112-1-eric.auger@redhat.com>
 <20200624124301.7112-2-eric.auger@redhat.com>
 <1a144355-27bd-a26f-752e-00c2751d3a1f@redhat.com>
 <2bf606dd-4ed3-ec65-3dc2-72089bc7cef5@redhat.com>
Message-ID: <430f6b32-8456-ac1d-72b3-85e0e59ae9b5@redhat.com>
Date: Wed, 24 Jun 2020 18:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2bf606dd-4ed3-ec65-3dc2-72089bc7cef5@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 6/24/20 4:17 PM, Auger Eric wrote:
> Hi Paolo,
> 
> On 6/24/20 4:12 PM, Paolo Bonzini wrote:
>> On 24/06/20 14:43, Eric Auger wrote:
>>> +    op = object_property_try_add(obj, name, type, object_get_child_property,
>>> +                                 NULL, object_finalize_child_property,
>>> +                                 child, errp);
>>> +    if (!op) {
>>> +        goto out;
>>> +    }
>>>      op->resolve = object_resolve_child_property;
>>> +out:
>>>      object_ref(child);
>>>      child->parent = obj;
>>>      return op;
>>
>> I think if there's an error you need to return NULL without ref-ing
>> child, shouldn't you?
> hum yes you're fully right, the out label is badly placed.
Looks the unref is done in user_creatable_add_type() in case of error.
Isn't it the corresponding one? Anyway I think it is better to avoid
getting the ref here as you suggest (and also free type) and don't unref
in user_creatable_add_type.

Thanks

Eric
>>
>> You can then add another test that object_property_add_child succeeds
>> after object_property_try_add_child fails.
> OK
> 
> Thanks
> 
> Eric
>>
>> Paolo
>>


