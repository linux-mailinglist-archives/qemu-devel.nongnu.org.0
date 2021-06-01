Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE82397990
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:57:46 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8e9-0000Ic-QL
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lo8cv-0007Pn-CO
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 13:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lo8cs-0004Ri-CB
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 13:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622570184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQjBwZaUfZ1e1v3ktM0nOpEnw8Yh0J5vCEI7nnIuKDg=;
 b=JCTzRo3Bxush4XIL9BVjnmEizcXPaYiRGFFg4qPJJtM0/AZdipK8Ebhy4rvI7ic0Cgpr5g
 Z7EnMAvc6jnR/XQTdIpQkUbE49oFllmk6JNcfxQ2v0wOdgEFqAmCUhDVXKoQ05dWHEFrGo
 EFuiGS86E78p4v0s7kSkv8X3BZ5YjgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-DJhYIEUlON-Hdi3-1XpeVA-1; Tue, 01 Jun 2021 13:56:21 -0400
X-MC-Unique: DJhYIEUlON-Hdi3-1XpeVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D9E8042A9;
 Tue,  1 Jun 2021 17:56:20 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A8235D6D3;
 Tue,  1 Jun 2021 17:56:11 +0000 (UTC)
Subject: Re: [PATCH 1/1] VM tests: account for changes in
 qemu.utils.get_info_usernet_hostfwd_port()
To: Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
 <20210601154546.130870-1-crosa@redhat.com>
 <20210601154546.130870-2-crosa@redhat.com>
 <CAKJDGDbK40mcg4n7KMNymAhv=q2R+mbGzT+NC3_OgA3a7mn6_g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9b9f9835-49f9-6f44-8eb5-b5456975b120@redhat.com>
Date: Tue, 1 Jun 2021 13:56:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbK40mcg4n7KMNymAhv=q2R+mbGzT+NC3_OgA3a7mn6_g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 1:36 PM, Willian Rampazzo wrote:
> On Tue, Jun 1, 2021 at 12:46 PM Cleber Rosa <crosa@redhat.com> wrote:
>>
>> The utility function actually accepts a string, and not the raw
>> dictionary response from QMP.  Also, it returns (optionally) an
>> integer, so that must also be accounted for.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/vm/basevm.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
>> index 6f4f0fc95e..0f2e436ed3 100644
>> --- a/tests/vm/basevm.py
>> +++ b/tests/vm/basevm.py
>> @@ -227,7 +227,7 @@ def _ssh_do(self, user, cmd, check):
>>                      "-o", "UserKnownHostsFile=" + os.devnull,
>>                      "-o",
>>                      "ConnectTimeout={}".format(self._config["ssh_timeout"]),
>> -                   "-p", self.ssh_port, "-i", self._ssh_tmp_key_file]
>> +                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
>>           # If not in debug mode, set ssh to quiet mode to
>>           # avoid printing the results of commands.
>>           if not self.debug:
>> @@ -305,7 +305,7 @@ def boot(self, img, extra_args=[]):
>>           # Init console so we can start consuming the chars.
>>           self.console_init()
>>           usernet_info = guest.qmp("human-monitor-command",
>> -                                 command_line="info usernet")
>> +                                 command_line="info usernet").get("return")
>>           self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
> 
>  From here, your file differs from the upstream and your patch does not
> work. I'm trying on commit 52848929b70dcf92a68aedcfd90207be81ba3274.
> 

Cleber is patching against my pull request -- I'll be squashing it into 
(from PR tree) 0739780d621f8fd4163ce6969a183e59113245aa -- just waiting 
on some tests to finish running before I move ahead with it.

commit 0739780d621f8fd4163ce6969a183e59113245aa
Author: Cleber Rosa <crosa@redhat.com>
Date:   Mon Apr 12 00:46:36 2021 -0400

     Python: add utility function for retrieving port redirection

     Slightly different versions for the same utility code are currently
     present on different locations.  This unifies them all, giving
     preference to the version from virtiofs_submounts.py, because of the
     last tweaks added to it.

     While at it, this adds a "qemu.utils" module to host the utility
     function and a test.

     Signed-off-by: Cleber Rosa <crosa@redhat.com>
     Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
     Reviewed-by: Eric Auger <eric.auger@redhat.com>
     Reviewed-by: Willian Rampazzo <willianr@redhat.com>
     Message-Id: <20210412044644.55083-4-crosa@redhat.com>
     Signed-off-by: John Snow <jsnow@redhat.com>


>>           if not self.ssh_port:
>>               raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
>> --
>> 2.25.4
>>
> 

thanks,
--js


