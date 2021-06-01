Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD3397A0E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:24:46 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo94H-0005H5-30
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo91B-0006X6-R6
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo918-0004J8-9J
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NR85mYWRWuNKsaFvr4UgFaMk4DE3k12fjXxe5hO9moU=;
 b=RMDusJ4P2V8lgj2+JBVGisW8eYp4Lvnp1WGPMLUzuEFkZifFzB7WxOooJJLO1ES6j50dfk
 FD7vh4vM5EWuPpWWlRKlFWr5KoSDJ3yuqPoJ7Qzqp4BwnI3Q+xRSOL0SirvjANCVx5QRgU
 /q1ABmvDOYkUlMFCz9gzNT9OTqm7mVU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-yV0OKbGPMS-kOJDhIckFIw-1; Tue, 01 Jun 2021 14:21:25 -0400
X-MC-Unique: yV0OKbGPMS-kOJDhIckFIw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so8301384edd.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 11:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NR85mYWRWuNKsaFvr4UgFaMk4DE3k12fjXxe5hO9moU=;
 b=iGARKNHnF4gJ2hIB7W+gMzJJfAfbgKpqXsUTkX6WE/zrN28AjuTxnQzL7N5cFvdCQb
 W0soVs2ERAHXJX4KsoVE487LubYq5cZ3IOh/Azktg6t2tb+ZCmMh1s+OXYAWPym1aqlx
 ly8zAWSfz4vSc1WpmqFIIrSwTmc221dovw3wVSdeUDrsA7UIw6MbS90F9eqOkev2v62H
 aq39Tk4/y23yDerGwly5sh/IwAbNuW/juNa7EIu/qcirMd8nQf+JO3Xqp1DqHs6NlxaD
 CnUuJhaL+XaI6UGvWRSVI9GbcPuCd8o/JKicaQHYpQdgFvzFTGriG+5HxLJcSQqUfI10
 l44Q==
X-Gm-Message-State: AOAM530w1SP+ftCupwqaGOdBkkPY8mYeN7hSIz+GNCBqi2d1qqUuKCWA
 t0fTBs11zWapvoRypEFW05dAh3ThnWZtIDKK8VTleDX6H0iekmVyMIdLYBHNUT89I7hMWoPZdcb
 HoXp5f9QRUUbuP3U=
X-Received: by 2002:a17:906:4e96:: with SMTP id
 v22mr8702661eju.23.1622571684447; 
 Tue, 01 Jun 2021 11:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweQnWwotWErJOVFRqF616FD3vD2gnPhYaPmhbhkk9LWFVGrlwEFJQJs/AJZ/fNtnoGeDO6rQ==
X-Received: by 2002:a17:906:4e96:: with SMTP id
 v22mr8702626eju.23.1622571684188; 
 Tue, 01 Jun 2021 11:21:24 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h23sm3661694eds.73.2021.06.01.11.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 11:21:23 -0700 (PDT)
Subject: Re: [PATCH 1/1] VM tests: account for changes in
 qemu.utils.get_info_usernet_hostfwd_port()
To: Cleber Rosa <crosa@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
 <20210601154546.130870-1-crosa@redhat.com>
 <20210601154546.130870-2-crosa@redhat.com>
 <CAKJDGDbK40mcg4n7KMNymAhv=q2R+mbGzT+NC3_OgA3a7mn6_g@mail.gmail.com>
 <CAKJDGDY00HEtoSzLD01c-oHeWA6n5-Er-s=+mFMQJ7T4frFx3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9c314b13-1cd0-e8e7-0685-b8ee36e7820b@redhat.com>
Date: Tue, 1 Jun 2021 20:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDY00HEtoSzLD01c-oHeWA6n5-Er-s=+mFMQJ7T4frFx3g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 8:07 PM, Willian Rampazzo wrote:
> On Tue, Jun 1, 2021 at 2:36 PM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>
>> On Tue, Jun 1, 2021 at 12:46 PM Cleber Rosa <crosa@redhat.com> wrote:
>>>
>>> The utility function actually accepts a string, and not the raw
>>> dictionary response from QMP.  Also, it returns (optionally) an
>>> integer, so that must also be accounted for.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>  tests/vm/basevm.py | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
>>> index 6f4f0fc95e..0f2e436ed3 100644
>>> --- a/tests/vm/basevm.py
>>> +++ b/tests/vm/basevm.py
>>> @@ -227,7 +227,7 @@ def _ssh_do(self, user, cmd, check):
>>>                     "-o", "UserKnownHostsFile=" + os.devnull,
>>>                     "-o",
>>>                     "ConnectTimeout={}".format(self._config["ssh_timeout"]),
>>> -                   "-p", self.ssh_port, "-i", self._ssh_tmp_key_file]
>>> +                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
>>>          # If not in debug mode, set ssh to quiet mode to
>>>          # avoid printing the results of commands.
>>>          if not self.debug:
>>> @@ -305,7 +305,7 @@ def boot(self, img, extra_args=[]):
>>>          # Init console so we can start consuming the chars.
>>>          self.console_init()
>>>          usernet_info = guest.qmp("human-monitor-command",
>>> -                                 command_line="info usernet")
>>> +                                 command_line="info usernet").get("return")
>>>          self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
>>
>> From here, your file differs from the upstream and your patch does not
>> work. I'm trying on commit 52848929b70dcf92a68aedcfd90207be81ba3274.
> 
> Talking to Cleber he mentioned he submitted In-reply-to

Please don't, as the series end up buried in the other email thread.

> John's PR, but
> Gmail did not show it for me.
> 
> On top of John's PR
> (https://patchew.org/QEMU/20210528023220.417057-1-jsnow@redhat.com/):

The syntax is:

Based-on: 20210528023220.417057-1-jsnow@redhat.com

https://wiki.qemu.org/Contribute/SubmitAPatch#Base_patches_against_current_git_master

> 
> Tested-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 
>>
>>>          if not self.ssh_port:
>>>              raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
>>> --
>>> 2.25.4
>>>
> 


