Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BAA30C56E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:24:46 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yTr-0006sq-De
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6yBn-0000L8-UY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:06:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6yBm-0006Rn-C1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNFrwngMakD0Sr/woL61YwKXmgWxqlWg2RHhBHIx9uA=;
 b=c4HgrxoITNirQ6JZDRiUbD1EJ41Y9GWs7uFqD5f8VElXCeRqNtRNLde/6/GZZLEXsFc9Xs
 phUBBK6Jb+//09KvcwBw67hqcJ/upz1V/2C0S+n8C17eznd0xrG7OcwJWa4vTDrVgoSpPy
 gT9Q2eNAcmRQutZ6z9nLQRch+R+LKTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Yv5n4a5HNrGEpioW-uR2jA-1; Tue, 02 Feb 2021 11:05:58 -0500
X-MC-Unique: Yv5n4a5HNrGEpioW-uR2jA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 540B185B690;
 Tue,  2 Feb 2021 16:05:45 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DEC35D749;
 Tue,  2 Feb 2021 16:05:44 +0000 (UTC)
Subject: Re: [PATCH v4 05/16] qapi: centralize is_[user|system|builtin]_module
 methods
To: Markus Armbruster <armbru@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
 <20210201193747.2169670-6-jsnow@redhat.com>
 <87r1lyg77w.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <4c9dfec2-ecee-0bd3-d463-e84d09e46f74@redhat.com>
Date: Tue, 2 Feb 2021 11:05:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87r1lyg77w.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:16 AM, Markus Armbruster wrote:
> Putting these functions into a class feels awkward.  But it does the
> job.

Yes, I recognize that. I really wanted:

1) To centralize them somewhere, so there was somewhere obvious to look 
for these definitions, but

2) We aren't really using the classiness in a meaningful way, so

3) The names are a little awkward as you mentioned.

We can rewrite them as functions if you want, maybe with a comment for 
the class that says "Hey, go look at these functions!" but that didn't 
feel less messy to me. I couldn't really find anything that I actually 
genuinely liked. I went with a subjective least-worst.

--js


