Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799213947FD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 22:35:05 +0200 (CEST)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmjCC-0001fl-IG
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 16:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmj8x-0005w5-6F
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmj8t-0002f2-GO
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622233897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQqEigNxgu/QeHkjXKRrh8QRepX9lxFn6nG+vO6GZDE=;
 b=e/1vc9Z2WNaN+XHT0y/Zy56ApaPhKUeqzYj5lRzRtLi53JeZ+oAeMXxkgiMYuYaqElhjP4
 Lh2pLy9NV+95oMsWR+b4U5bspXLW6scpi7LIvTAKFdvluULwaGWsm7YTzw7m0K8noIjI22
 tJLg8fx4FrapRNS3IRvS5DWvVtqz4js=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-o4IrHlNlPqCJqnCGE3JSyQ-1; Fri, 28 May 2021 16:31:34 -0400
X-MC-Unique: o4IrHlNlPqCJqnCGE3JSyQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so1492894ejw.22
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 13:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xQqEigNxgu/QeHkjXKRrh8QRepX9lxFn6nG+vO6GZDE=;
 b=FFusoHYdhiq4t8idloUqYFf4qsSnnp98fW03pUkOSUeQFy+Shq7JnXSJGdERc58nSG
 Cui6biJL2v9orMA56INDDG/4Ok8iPr6/lSsoOnycUJ66Funb9yqe1Bc4x6ulso4/KZ6s
 lpjAiwW2FCOrtbTKZCeIAtlT3qxuEWMDZFF5MkfpxOHv7YXIFDPnXk8wcjaBQjUHIpqZ
 QT54WXupT6GvkYETxOoSM3DWZbgsS8zNWiqAvE0WHptmyAqRTfVAUPhVu6oeNiFng6AU
 BEbeNgZzRhdKaXuPcT+qFVxVLpQA6Z7gAP7j3qQKGP+TAVh0fMziWRGO8n+HpONmQ4W2
 1HEw==
X-Gm-Message-State: AOAM533wo+0YYds1Z4812ITr4WAfvTItGihN0x1SBElkxZ2AlDK6yzZR
 bs3kagKBlTRzWJoLUKZyMK6B0pgYbnVL6VCyKZgjp5WMIH9unzhhI6oSIJIaIMN9/21BSY0h5FN
 kNRf6eSVf+JrLWhY=
X-Received: by 2002:a17:906:13d9:: with SMTP id
 g25mr9206881ejc.143.1622233892923; 
 Fri, 28 May 2021 13:31:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiSayZ+9DGmI+4F/AgKoMUMKIoHSBMgwiQVtHbE1Gp+OTd3nBSuEi8Ej2DxNHyGs4MoHkHfg==
X-Received: by 2002:a17:906:13d9:: with SMTP id
 g25mr9206845ejc.143.1622233892586; 
 Fri, 28 May 2021 13:31:32 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 da14sm3229632edb.44.2021.05.28.13.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 13:31:31 -0700 (PDT)
Subject: Re: [PATCH v4 08/15] docs/devel/testing: add -gdb option to the
 debugging section of QEMU iotests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-9-eesposit@redhat.com>
 <69bf0953-1554-5865-1416-478a4aa7197d@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <b4caad94-71a3-e349-5975-9a1199bdda2b@redhat.com>
Date: Fri, 28 May 2021 22:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <69bf0953-1554-5865-1416-478a4aa7197d@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 28/05/2021 19:16, Vladimir Sementsov-Ogievskiy wrote:
> 20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>> ---
>>   docs/devel/testing.rst | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 8144e316a4..a746cab745 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -229,6 +229,17 @@ Debugging a test case
>>   The following options to the ``check`` script can be useful when 
>> debugging
>>   a failing test:
>> +* ``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which 
>> waits for a
>> +  connection from a gdb client.  The options given to ``gdbserver`` 
>> (e.g. the
>> +  address on which to listen for connections) are taken from the 
>> ``$GDB_OPTIONS``
>> +  environment variable.  By default (if ``$GDB_OPTIONS`` is empty), 
>> it listens on
>> +  ``localhost:12345``.
>> +  It is possible to connect to it for example with
>> +  ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
>> +  ``gdbserver`` listens on.
>> +  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
>> +  regardless on whether it is set or not.
>> +
>>   * ``-d`` (debug) just increases the logging verbosity, showing
>>     for example the QMP commands and answers.
>>
> 
> Didn't you think of an interface as simple as just wrap qemu binary by 
> "gdb --args" and redirect stdin and stdout directly to the terminal 
> where test is running? Wouldn't it more convenient? So, you just start 
> ./check -gdb <test>, and you are in gdb. Or you need exactly gdb server, 
> to attach from another machine?
> 
> Keeping this possibility in mind, it's probably better to call you 
> option "-gdbserver"... But we can rename later if needed, finally, it's 
> only a test framework.
> 
>
See 
https://patchew.org/QEMU/20210414170352.29927-1-eesposit@redhat.com/20210414170352.29927-5-eesposit@redhat.com/ 

(penultimate email), there was a similar question:

>> 
>> Out of interest: Why gdbserver and not “just” gdb?  On Fedora, those are 
>> separate packages, so I don’t have gdbserver installed, that’s why I’m 
>> asking.
> 
> As far as I have tried, using only gdb with ./check is very hard to use, 
> because the stdout is filtered out by the script.
> So invoking gdb attaches it to QEMU, but it is not possible to start 
> execution (run command) or interact with it, because of the python 
> script filtering. This leaves the test hanging.
> 
> gdbserver is just something that a gdb client can attach to (for 
> example, in another console or even in another host) for example with 
> the command
> # gdb -iex "target remote localhost:12345" . This provides a nice and 
> separate gdb monitor to the client.

At this point I should put this somewhere, either in commit message or 
in the actual documentation...

I don't know about the name. "gdb" should also be short for "gdbserver" 
in a way.

Thank you,
Emanuele


