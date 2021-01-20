Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DD2FD04D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:52:52 +0100 (CET)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Cyh-0003QJ-Tb
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2Cwc-0001rW-FG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:50:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2Cwa-0007jE-I4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611147038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuyRM1TvEnHYsrUsqvc8WSByJEBCyWBKWp2CzKyJsuM=;
 b=KJAhTsfcdpCRQN8KzNvhfcro8X9hbxmDd5r654qU7/ebnBBS8OXNDGn6Ui73nCYDkYDUf7
 a/rdUCGyCBWdliqTmx0Q5b4SEC4M4EYseLeTvca9KBoOE+8tO946nhtmaI569AptgTMfe3
 1qqkaICplMPSIAULSIy1p2rutBt0P0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-8ef5PvcmMZeR9VpCqXkdcQ-1; Wed, 20 Jan 2021 07:50:36 -0500
X-MC-Unique: 8ef5PvcmMZeR9VpCqXkdcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3A059
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:50:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 813C55C8A7;
 Wed, 20 Jan 2021 12:50:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F19EB113865F; Wed, 20 Jan 2021 13:50:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/25] qemu-option: clean up id vs. list->merge_lists
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-2-pbonzini@redhat.com>
 <87y2gpxc2q.fsf@dusky.pond.sub.org>
 <0802f4d3-f9b1-540f-b83a-977c01ce8f62@redhat.com>
 <87eeigqbkk.fsf@dusky.pond.sub.org>
 <890ad395-ba63-b5d4-c404-a3a7430bb894@redhat.com>
Date: Wed, 20 Jan 2021 13:50:33 +0100
In-Reply-To: <890ad395-ba63-b5d4-c404-a3a7430bb894@redhat.com> (Paolo
 Bonzini's message of "Wed, 20 Jan 2021 13:37:30 +0100")
Message-ID: <87mtx3srfq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 20/01/21 09:03, Markus Armbruster wrote:
>> The detour should be avoided, because QemuOpts should be avoided.  Using
>> the appropriate visitor, we get:
>>          char *optarg
>>               |
>>               |  v = qobject_input_visitor_new_str(string, NULL, errp)
>>               |  visit_type_q_obj_set_action_arg(v, NULL, &arg, errp);
>>               v
>>    q_obj_set_action_arg arg
>> except visit_type_q_obj_set_action_arg() doesn't exist, because the
>> QAPI
>> type is anonymous.  So give it a name:
>>      { 'struct: 'Action',
>>        'data': { '*reboot': 'RebootAction',
>>                  '*shutdown': 'ShutdownAction',
>>                  '*panic': 'PanicAction',
>>                  '*watchdog': 'WatchdogAction' } }
>>      { 'command': 'set-action',
>>        'data': 'Action',
>>        'allow-preconfig': true }
>>          char *optarg
>>               |
>>               |  v = qobject_input_visitor_new_str(string, NULL, errp)
>>               |  visit_type_Action(v, NULL, &arg, errp);
>>               v
>>           Action act
>> To avoid having to pass the members of Action to qmp_set_action(),
>> throw
>> in 'boxed': true, so you can simply call qmp_set_action(&act, errp).
>
> Ok, so the idea of a 1:1 CLI<->QMP mapping is good, the implementation
> is bad.  The reason it was done with QemuOpts was mostly to have 
> "-action help" for free.  Something to remember when working on
> autogenerated boilerplate.

Yes, help is another gap we still need to bridge.


