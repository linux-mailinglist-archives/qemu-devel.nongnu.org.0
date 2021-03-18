Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2C340885
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:15:01 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuMW-0001ug-3F
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMuBf-0007UI-2o
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMuBd-0007EH-EG
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616079824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zy/+Q8zISyB0mTrv88w+N3/y0KdjuUg/Wu75gygO9N8=;
 b=Z20SiJHYt7/6v/JZJ34ZnXvqGonhN3BKwX9yhA2Jk4Y+GJE2rk39ai9xWLwnYlnem+xBC/
 TAHzROJng53u5xKHbB0/z/1peap+hScHvo2hK1281aWQHNyiz7xsd1BvuhmK16Xs2tZJWd
 dnLNTq1+j5bOvSDtq3cKj/AnDVq6XUw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-g06kRKrsNBOcsVSh2Jju8Q-1; Thu, 18 Mar 2021 11:03:40 -0400
X-MC-Unique: g06kRKrsNBOcsVSh2Jju8Q-1
Received: by mail-wm1-f72.google.com with SMTP id k132so1872472wma.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zy/+Q8zISyB0mTrv88w+N3/y0KdjuUg/Wu75gygO9N8=;
 b=dtPZS8f2zK0Kl8JvyqEnjiSnQ0OvghdAKmmSil6neVRzVovbop/itRv4Jft/FRc04G
 OT3Nv2EdbnPKM3ZHcvAubeX45+ksll7ThXJIkktKW8VeQDhVZD1l/hKCRRbwEALUMcHs
 LMkZu5D2pRI9SSCeG0XlD+r+IDAr1mwujfLkipAAXzoKXafglZMRIbL4nwj1PxtXBTRv
 fSB2v9TCOGnJSLpwKsJSbdJjpjEsdWPUrB8c+D4hQEB0GZolg6yvlC6ulN7KZylHtcHW
 7hQuHoS/+wzvruOJh6ZoWiy1FMB16LtxwMM77FI64rtoVthVgKavo4HM3EthMvITv3xU
 TNIg==
X-Gm-Message-State: AOAM531SJq15H4AR32wr98O5H+gTEhVYCh+exxYGpPcWcBeNQ0tb9UKZ
 /N2By9+2RsYqwyp90L4nZJp7fepH0picd/iOh4lc6NIc8LuK1LOdHULIyNq1LRRCtkVeq55qQnq
 08AIP5LId6BhMgPg=
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr10181473wrw.351.1616079818486; 
 Thu, 18 Mar 2021 08:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzb18N5ibFzgS7xhc3dEge9XtaPjU0LKFp9LTlp/KVlEhTFJ9Pw0uX5hKn32TFgtBkqTx/dA==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr10181452wrw.351.1616079818270; 
 Thu, 18 Mar 2021 08:03:38 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w11sm3311253wrv.88.2021.03.18.08.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:03:37 -0700 (PDT)
Subject: Re: "make check" broken with everything but tools disabled
To: Claudio Fontana <cfontana@suse.de>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel@nongnu.org
References: <877dm7jkib.fsf@dusky.pond.sub.org>
 <42de1769-e1c3-0486-b434-88813aec8ef4@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76bb34a6-d12a-5909-04b0-fbc6dcf71e4f@redhat.com>
Date: Thu, 18 Mar 2021 16:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <42de1769-e1c3-0486-b434-88813aec8ef4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 10:16 AM, Claudio Fontana wrote:
> On 3/16/21 2:28 PM, Markus Armbruster wrote:
>> Watch this:
>>
>>     $ mkdir bld-tools
>>     $ cd bld-tools
>>     $ ../configure --disable-system --disable-user --enable-tools
>>     $ make check
>>     [...]
>>     make: *** No rule to make target 'tests/qemu-iotests/socket_scm_helper', needed by 'check-block'.  Stop.
>>
>>
> 
> Hi Markus,
> 
> I can reproduce this error too.

I'm having a slightly different one:

$ make check-block
/home/phil/.local/bin/meson introspect --targets --tests --benchmarks |
/usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
No such file: tests/qemu-iotests/../../qemu-img
make: *** [/home/phil/source/qemu/tests/Makefile.include:148:
check-block] Error 1

Apparently I was luckier because still having an old socket_scm_helper
built, not sure this is a good thing or not...

$ ls -l tests/qemu-iotests/socket_scm_helper
-rwxr-xr-x. 1 phil root   28824 Mar  3 15:50
tests/qemu-iotests/socket_scm_helper


