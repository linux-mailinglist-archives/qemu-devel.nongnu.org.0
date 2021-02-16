Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8731CCD7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:23:01 +0100 (CET)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2Bo-0006Wq-Qk
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC28m-0005Xb-7a
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:19:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC28j-00080F-U4
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgexAIkG3GJrP9Wm4a/6DAxTkm6kAxFPr1jEK0/qvWs=;
 b=F+J0mPihiKDjs4FHMDMEexIpr+0xizywD7iXZh8wgjK3lAcsgogJVmJ4Xq0KPvJUyyF0ea
 mKQzKEol1ChnZrCFpy9Y8on8QCdI0zle4II5thtachDwwrekvCdcZebVFfAtjrEuo1GSGL
 m1GpbqIKdlwsVhISfx8ovQPLTaql3NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-OmMmAbrdPDCULT__P3t0Tw-1; Tue, 16 Feb 2021 10:19:44 -0500
X-MC-Unique: OmMmAbrdPDCULT__P3t0Tw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E12107ACF2;
 Tue, 16 Feb 2021 15:19:43 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D8645D74C;
 Tue, 16 Feb 2021 15:19:42 +0000 (UTC)
Subject: Re: [PATCH v6 01/19] qapi: Replace List[str] with Sequence[str] for
 ifcond
To: Markus Armbruster <armbru@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-2-jsnow@redhat.com>
 <87h7mcpflg.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <cbe912f8-ede2-870c-1ad6-a8080840b374@redhat.com>
Date: Tue, 16 Feb 2021 10:19:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87h7mcpflg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/16/21 3:43 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> It does happen to be a list (as of now), but we can describe it in more
>> general terms with no loss in accuracy to allow tuples and other
>> constructs.
>>
>> In the future, we can write "ifcond: Sequence[str] = ()" as a default
>> parameter, which we could not do with a Mutable type like a List.
> 
> Well, we could write "= []", but we shouldn't.  Worth a commit message
> tweak?
> 

It would be funny to leave it in to see if anyone tries to disprove me, 
and in the act of disproving me, learns for themselves why you "can't" 
do that. Rite of passage for Python programming.

Jokes aside:

"which we could not do ^safely^ with a Mutable type like a List."

If that warrants further exposition by Professor Snow:

"(Unsafe due to how Python initializes defaults, see 
https://docs.python-guide.org/writing/gotchas/#mutable-default-arguments)"

I leave it to your discretion.

>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

These are worth more than BTC!

--js


