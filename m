Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D726338933
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:50:51 +0100 (CET)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeRR-0006E6-86
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKeQQ-0005ln-RI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:49:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:58296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKeQP-0003rB-6L
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:49:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B31CAF54;
 Fri, 12 Mar 2021 09:49:39 +0000 (UTC)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Paolo Bonzini <pbonzini@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <b852304c-2123-f84f-2667-3682e7f48569@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8b2589eb-285a-9b89-6cd7-a139353bc27b@suse.de>
Date: Fri, 12 Mar 2021 10:49:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b852304c-2123-f84f-2667-3682e7f48569@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 10:46 AM, Paolo Bonzini wrote:
> On 12/03/21 10:31, Claudio Fontana wrote:
>> Hello Paolo and all,
>>
>> while debugging a class init ordering issue, I noticed that
>>
>> _all_ class init functions for all types registered in the QEMU QOM are called in select_machine().
>> Expected?
>>
>> In particular it happens here:
>>
>> static MachineClass *select_machine(void)
>> {
>>      GSList *machines = object_class_get_list(TYPE_MACHINE, false);
>>
>>
>> object_class_get_list() ->
>>    object_class_foreach() ->
>>      g_hash_table_foreach() ->
>>        object_class_foreach_tramp ->
>>          type_initialize(type);
>>
>> Is this really desired? It looks suspect to me.
> 
> It is not a problem because class_init should be idempotent.  Changing 
> QEMU to not do this would not be impossible, but most likely not worth 
> the effort.  To do this, I think one would have to reimplement all of 
> object_class_dynamic_cast to operate on TypeInfos (so for example walk 
> all interfaces in the type info instead of using class->interfaces).
> 
>> If not here, where should be the right place, for example, for CPU class inits to be called?
> 
> The first time they're used, upon a call to one of object_new, 
> object_initialize, object_class_get_list or object_class_foreach.


Right, this is what I would have expected. Instead everything known to QOM at that time (there is more stuff added later on),
is initialized right there.

> 
>> At the very least I would put a comment there around the beginning of select_machine() saying:
>>
>> /* all types, all classes in QOM are initialized here, as a result of the object_class_get_list call */
> 
> No, it's just a side effect that is not (or should not) be visible.
> 
> Paolo
> 

Well it's an interesting side effect to me, seems useful to know (add a comment at least) when debugging.
Can be found out quickly, but why hide it..

Ciao,

Claudio

