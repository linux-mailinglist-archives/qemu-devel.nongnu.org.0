Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58C339E0E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:34:09 +0100 (CET)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL3T6-0002Li-JG
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL3RV-0001i4-4F
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL3RT-0006Tx-L3
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615638746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xGUUWtqDLKVgmMkxTUPsDECPzvNy6cFRCx/LPZqlxyo=;
 b=FbBG6KCdiYD1uOYqsMD0eT7zEGBznBTDjMMKPDLgvUXD6wKzwNCRhKwv9NqPTVlY8+K+nn
 tqPEMUUKpVsVgUeQVZlSXfUVjMzzydlfixFrKT0Ypk5y0EIK2NM1y6/L+zNwcD8bcKgJO1
 +fehmCw0HLTIldqDArxcKhSZYvUc7gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-GeAxwIhSPjK9gt57rU522A-1; Sat, 13 Mar 2021 07:32:25 -0500
X-MC-Unique: GeAxwIhSPjK9gt57rU522A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D93800D55
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 12:32:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC3F019CB4;
 Sat, 13 Mar 2021 12:32:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 555571132C12; Sat, 13 Mar 2021 13:32:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
 <87czw3wg4r.fsf@dusky.pond.sub.org>
 <d53a6c02-7503-71bf-45ca-9036b2d48014@redhat.com>
Date: Sat, 13 Mar 2021 13:32:22 +0100
In-Reply-To: <d53a6c02-7503-71bf-45ca-9036b2d48014@redhat.com> (Paolo
 Bonzini's message of "Sat, 13 Mar 2021 10:40:18 +0100")
Message-ID: <87ft0ztesp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 13/03/21 10:35, Markus Armbruster wrote:
>>> +    object_option_foreach_add(object_create_late, &error_fatal);
>> Likewise.
>> 
>> Before and after the patch, object_create_late(opt) ==
>> !object_create_early(opt).  Your patch provides us with an opportunity
>> to assert this: object_opts must be empty now.  Suggestion, not demand.
>> 
>
> Nice idea, I'll include it.

Possible alternative:

    static bool object_create_late(const char *type)
    {
        return true;
    }

Your choice.


