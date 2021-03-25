Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEA34884A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 06:19:17 +0100 (CET)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPIOp-00021S-VA
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 01:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPINY-0001ca-GY
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPINR-0007eQ-24
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616649467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLlcm6ZYfZugI/qFBsXdOLFIDHjXoh0kb7F8TGgYtwE=;
 b=dqxLNRz70Vy3A21acCqGh0QeEH+23OumuADngOLX38T8oaGvXPjLUufQuXFm51qzPJLJYd
 CBkuRF5p1evCS9CdBbjPBuEMdsSZ2IpdsWENXEdLF7FBinIY4SkqxZ5F5nqkyW4ks4LJbn
 5JSmA990fdPmFnT5OdlYGSxFqq6tex0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-gsY449XFNCGV_rPTMSOEuQ-1; Thu, 25 Mar 2021 01:17:41 -0400
X-MC-Unique: gsY449XFNCGV_rPTMSOEuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0228091248;
 Thu, 25 Mar 2021 05:17:40 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EF3A5D9DE;
 Thu, 25 Mar 2021 05:17:39 +0000 (UTC)
Subject: Re: [PATCH v3 15/16] qapi/expr.py: move related checks inside
 check_xxx functions
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-16-jsnow@redhat.com>
 <87r1l488vx.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <9cbaa0fe-d926-84d1-c0e2-f0bffc9cba3b@redhat.com>
Date: Thu, 25 Mar 2021 01:17:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87r1l488vx.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 10:28 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> There's not a big obvious difference between the types of checks that
>> happen in the main function versus the kind that happen in the
>> functions. Now they're in one place for each of the main types.
>>
>> As part of the move, spell out the required and optional keywords so
>> they're obvious at a glance. Use tuples instead of lists for immutable
>> data, too.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 
> No objection to changing read-only lists to tuples (applies to previous
> patch, too).
> 
> No objection to turning positional into keyword arguments where that
> improves clarity.
> 
> I have doubts on the code motion.  Yes, the checks for each type are now
> together.  On the other hand, the check_keys() are now separate.  I can
> no longer see all the keys at a glance.
> 

I guess it depends on where you wanted to see them; I thought it was 
strange that in check_foobar I couldn't see what foobar's valid keys 
were without scrolling back to the bottom of the file.

Needing to see all the keys for the disparate forms together was not a 
case I ran into, but you can always drop this patch for now if you'd 
like. I had some more adventurous patches that keeps pushing in this 
direction, but I don't know if it's really important. My appetite in 
this area has waned since November.

--js


