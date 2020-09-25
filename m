Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C72789BB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:37:58 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLnvB-0000rx-VJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kLnsE-0007UJ-LT
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kLnsB-00078j-Lm
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:34:54 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601040890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gg3kzO1tYh4aYj70+XjYNxuj3ezCUx3J0H/7GGCTmbQ=;
 b=ZsUnUmPvEjmfqsVYHwfbVh7V2IS8kfR7c1jTp6GPPzbyhtDJUPBQ89Pmxdvwl1UEVP8bq2
 fK5bJro9ThglGFDUqLCq2kgXDH0pXpvoTtRogBckPP5aC9VC+uF8ec5vWy4ftNhYGR27k6
 ++kUJKidUJPdOEMSRkxXJ7ASFQ050yU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-Y1B2j6XONvODSMYCYJL-5w-1; Fri, 25 Sep 2020 09:34:33 -0400
X-MC-Unique: Y1B2j6XONvODSMYCYJL-5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE77064146;
 Fri, 25 Sep 2020 13:34:32 +0000 (UTC)
Received: from [10.3.114.148] (ovpn-114-148.phx2.redhat.com [10.3.114.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C31927BC3;
 Fri, 25 Sep 2020 13:34:31 +0000 (UTC)
Subject: Re: [PATCH v2 28/38] qapi/gen.py: update write() to be more idiomatic
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-29-jsnow@redhat.com>
 <20200923152624.GO3312949@habkost.net>
 <c0b8ed9e-c66a-a6fa-43e1-c3c61581d928@redhat.com>
 <20200924155959.GC191229@localhost.localdomain>
 <87r1qqro8i.fsf@dusky.pond.sub.org> <20200925132458.GJ2178035@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <af03463e-b0f4-7468-9c6d-320067e4b60e@redhat.com>
Date: Fri, 25 Sep 2020 08:34:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925132458.GJ2178035@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/20 8:24 AM, Daniel P. Berrangé wrote:

>> This code:
>>
>>          fd = os.open(pathname, os.O_RDWR | os.O_CREAT, 0o666)
>>          f = open(fd, 'r+', encoding='utf-8')
>>

>> This was my best attempt to open the file read/write, creating it if it
>> doesn't exist.
>>
>> Plain
>>
>>          f = open(pathname, "r+", encoding='utf-8')
>>
>> fails instead of creates, and

Checking what POSIX says for fopen():
https://pubs.opengroup.org/onlinepubs/9699919799/functions/fopen.html

Yep, "r+" does not use O_CREAT.

>>
>>          f = open(pathname, "w+", encoding='utf-8')
>>
>> truncates.

Yep, "w+" uses O_TRUNC.

>>
>> If you know a better way, tell me!
> 
> IIUC, you need  "a+" as the mode, rather than "w+"

That uses O_APPEND.  Which is fine if you are only appending and not 
touching existing contents, but not what you want if you are doing 
random access.

Yeah, the fopen() interface is rather puny, in that it does not express 
as many modes as open() supports.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


