Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FEF2D1D0C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:16:04 +0100 (CET)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOna-0003z1-RF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmOlk-0003ZP-Uz
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmOli-000334-AV
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607379245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=to2ZQY/GgL1sYSdZ9VQz543l7JtNS2q1kUAorBhFnOY=;
 b=guVyS+qgvHiVlOrqaBs7/2lAKy9+xdF+H5CQbDTsKJht+hWHAV6ZgUckdxCrH4UbtgplfD
 BhniyiXonfZ4er99S0CjylzaCutY39ns564ny7rc3dYk4TRlWaxhCmpURBqJWGkoHPuyJa
 jQ/alRW+9M7wMgIWTo3Gpelryv5dGCg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-Gpav7LTzNDutHDAf9M8q9Q-1; Mon, 07 Dec 2020 17:14:03 -0500
X-MC-Unique: Gpav7LTzNDutHDAf9M8q9Q-1
Received: by mail-ed1-f72.google.com with SMTP id g25so4225947edu.4
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=to2ZQY/GgL1sYSdZ9VQz543l7JtNS2q1kUAorBhFnOY=;
 b=eWgBzhc+mr5E0Gy93D0hLuVkmakuiOk5uiPtNyF2WQexod0QCtFUO2yCJmyzBB5G5n
 UAz6r6ggfzOBbQgu6hROUOlSYYIoeBgNFC5LNY5ZFRJnbLn0DiNpQMKeoPzh5FYPM/yk
 606WGtFsbreDgqmcPw4X9rPAWPjf8Bx2wkxDLgb269KjPBzkx4WsMM9H+6oPuUV5jk2T
 TA6b6bajvbmsFlty5/oRQQyJsGp89BSwqu864BrZ3XtPWIsGlBA3O2ndX4IsU816OPip
 cTcTU9wcT8JqUe+i7zxgDsCOnw18UIFrtIk6j/+l2K4UUcg4m4+V7st5J1zEpnEUikOw
 eHhg==
X-Gm-Message-State: AOAM531y2cfzKG5ezNwqw7hJDDPzzqEyt4+ZON+rtB4G0UiGk5tOeEGX
 ahZnJHCQtH4U7rLnQlya7IGaedqXFbRYqVGuPsIBGpx+25G1/5P31d0vsmUmcYRVQUZjHkq3Jhr
 nvqQn0n5soZqVLjY=
X-Received: by 2002:a17:906:25e:: with SMTP id
 30mr20262649ejl.544.1607379242493; 
 Mon, 07 Dec 2020 14:14:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhRtehnYU2mk3q45dGbrg3XViMOVwcY5gVbvaKijvczoAX+fG+dZMTMu5RxzO5l2V+PC5a+Q==
X-Received: by 2002:a17:906:25e:: with SMTP id
 30mr20262634ejl.544.1607379242335; 
 Mon, 07 Dec 2020 14:14:02 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id ch30sm15008535edb.8.2020.12.07.14.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:14:01 -0800 (PST)
Subject: Re: [RFC PATCH] python: add __repr__ to ConsoleSocket to aid debugging
To: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201207200737.5090-1-alex.bennee@linaro.org>
 <CAKJDGDbdHXPAKUXpJFXufs6ip0LNikacvBstdyxr4v3kv8ox=w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a605a83-1be2-fd93-988f-4b70773e11d2@redhat.com>
Date: Mon, 7 Dec 2020 23:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbdHXPAKUXpJFXufs6ip0LNikacvBstdyxr4v3kv8ox=w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Willian,

On 12/7/20 10:35 PM, Willian Rampazzo wrote:
> On Mon, Dec 7, 2020 at 5:10 PM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> While attempting to debug some console weirdness I thought it would be
>> worth making it easier to see what it had inside.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  python/qemu/console_socket.py | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
>> index f060d79e06..77966d1fe9 100644
>> --- a/python/qemu/console_socket.py
>> +++ b/python/qemu/console_socket.py
>> @@ -45,6 +45,14 @@ class ConsoleSocket(socket.socket):
>>          if drain:
>>              self._drain_thread = self._thread_start()
>>
>> +    def __repr__(self):
>> +        s = super(ConsoleSocket, self).__repr__()
>> +        s = s.rstrip(">")
>> +        s += ", logfile=%s" % (self._logfile)
>> +        s += ", drain_thread=%s" % (self._drain_thread)
>> +        s += ">"
> 
> We could use something more pythonic for this file. Instead of 3
> string concatenations, my suggestion is to go with string formatting,
> like:
> 
> s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile, self._drain_thread)
> 
> As str is immutable in Python, it avoids unnecessary copies.

With this (and John's comment) addressed, are you OK to add
your R-b tag?

> 
>> +        return s
>> +
>>      def _drain_fn(self) -> None:
>>          """Drains the socket and runs while the socket is open."""
>>          while self._open:
>> --
>> 2.20.1
>>
>>
> 
> 


