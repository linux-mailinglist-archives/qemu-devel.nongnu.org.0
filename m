Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979B28680D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 21:06:43 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQEln-0000f1-LO
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 15:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQEjQ-0007LB-LA
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 15:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQEjM-0004Yn-Io
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 15:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602097439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2GEWLiKuixQ3QHHLWnlm8X9RZjtJYjX5HQ97JeKg0o=;
 b=iQfX/bZvwvHNReaT15MG+ZNuzTR+Ick/rX17C9SWgRyHwd0od8guujsf3I/JgIoCw/cXYo
 LbNfSQMscMosurZZnpREfOuaEvoQUK4HmCM3hWI+LmZiloVS13VXEyv0jSIdWiZuBJnpv8
 qWU/QEmVVglxUlSg1BUJLqWv3XV3T8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-EI763up2MdebKobBoB1mDQ-1; Wed, 07 Oct 2020 15:03:56 -0400
X-MC-Unique: EI763up2MdebKobBoB1mDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A2A8070E2;
 Wed,  7 Oct 2020 19:03:54 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49E1C702E7;
 Wed,  7 Oct 2020 19:03:54 +0000 (UTC)
Subject: Re: [PATCH 17/20] python/qemu/qmp.py: Preserve error context on
 re-raise
To: Kevin Wolf <kwolf@redhat.com>
References: <20201006235817.3280413-1-jsnow@redhat.com>
 <20201006235817.3280413-18-jsnow@redhat.com>
 <20201007112107.GK7212@linux.fritz.box>
From: John Snow <jsnow@redhat.com>
Message-ID: <23b52cc1-6e82-4749-f9cd-566ef07ac15b@redhat.com>
Date: Wed, 7 Oct 2020 15:03:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007112107.GK7212@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/20 7:21 AM, Kevin Wolf wrote:
> Am 07.10.2020 um 01:58 hat John Snow geschrieben:
>> Use the "from ..." phrasing when re-raising errors to preserve their
>> initial context, to help aid debugging when things go wrong.
>>
>> This also silences a pylint 2.6.0+ error.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> I don't really understand what this improves compared to the implicit
> chaining we got before, but if pylint says so...
> 
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> 

Yeah, it's a pretty minimal change. Depending on the context, I think it 
makes a bigger difference depending on how far away you are from the 
error you are re-raising, but I couldn't find a great real-world example 
for you right now.

In summary, it changes this line:

"During handling of the above exception, another exception occurred:"

to this one:

"The above exception was the direct cause of the following exception:"

Which disambiguates between wrapping an exception with a more 
semantically meaningful exception class, vs. your handler code itself 
faulted.

Minor change, I know. You are also allowed to use "from None" to 
suppress the chain. I use this in the QAPI series at one point because I 
felt the underlying error was not useful to see in the traceback.

I see the pylint change as forcing you not to rely on the implicit 
chaining. Eh, fine.

--js


