Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7C269110
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 18:08:13 +0200 (CEST)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHr1Y-0002Vl-Js
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 12:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kHqvY-0005J3-OO
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 12:02:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40281
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kHqvU-0001Ad-CI
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 12:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600099315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnZd1C1Dzx808yTzg3H4cr0hvOF+Jf8RtGEPQ5T5fus=;
 b=NzEcOMW+mbCNolTMYOclBuXE5iL2WHj3+ePOiW2q/mGL7T7OBZwqF4qElFfP9kZmQD/ttV
 oQCflZtstTCdDif8iLa80zCrI7Nn3tEDvbEybjKcQaAVQLdYNa/xDKUmnbXP6C6iUGE6Yr
 ivYtTSajWUuFukxFW3+ovdO+ZBNjdtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-dXPCaz50MSaxraCzuq92KQ-1; Mon, 14 Sep 2020 12:01:50 -0400
X-MC-Unique: dXPCaz50MSaxraCzuq92KQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B8B800C60;
 Mon, 14 Sep 2020 16:01:49 +0000 (UTC)
Received: from [10.3.113.68] (ovpn-113-68.phx2.redhat.com [10.3.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F8435C1BB;
 Mon, 14 Sep 2020 16:01:49 +0000 (UTC)
Subject: Re: [PATCH] tests/check-block: Do not run the iotests with old
 versions of bash
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
References: <20200912121412.10999-1-thuth@redhat.com>
 <80c1a6a5-df83-8f48-309a-4dc8d3982a43@redhat.com>
 <ea934211-75d3-456d-1456-3aba3689db68@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <25b36a43-cf0d-c4d8-4289-8b7add39e607@redhat.com>
Date: Mon, 14 Sep 2020 11:01:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ea934211-75d3-456d-1456-3aba3689db68@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:33:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/20 10:33 AM, Thomas Huth wrote:
> On 14/09/2020 17.03, Eric Blake wrote:
>> On 9/12/20 7:14 AM, Thomas Huth wrote:
>>> macOS is shipped with a very old version of the bash (3.2), which
>>> is currently not suitable for running the iotests anymore. Add
>>> a check to skip the iotests in this case - if someone still wants
>>> to run the iotests on macOS, they can install a newer version from
>>> homebrew, for example.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    tests/check-block.sh | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>>> index 8e29c868e5..bfe1630c1e 100755
>>> --- a/tests/check-block.sh
>>> +++ b/tests/check-block.sh
>>> @@ -46,6 +46,11 @@ if ! command -v bash >/dev/null 2>&1 ; then
>>>        exit 0
>>>    fi
>>>    +if bash --version | grep 'GNU bash, version [123]' > /dev/null 2>&1
>>> ; then
>>
>> We're already running bash - why do we need to spawn another bash and a
>> grep, when we can just check $BASH_VERSION?
> 
> tests/check-block.sh uses "#!/bin/sh", so it could be running with a
> different kind of shell, I think.

Ah, right; I'm so used to most of our testsuite demanding bash that I 
forgot to check that this script sticks to the smaller subset of /bin/sh 
portability.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


