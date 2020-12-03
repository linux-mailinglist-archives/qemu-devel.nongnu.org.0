Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CED2CDD28
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:15:42 +0100 (CET)
Received: from localhost ([::1]:37792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkt8n-0002s0-Ub
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkt4n-00011O-MH
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkt4j-0002jD-2h
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607019088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHwkGH/7wGfD/bz7tzVWZoWIn9sOc3VRxGRp/RaUWEU=;
 b=gLQCTLJaZXMXFMEXWEwKJcb37DeXPOI7h9jjAhRTdkgvzEi4EleweZDAFmILAT/M6f2nHQ
 X03MTh2GbBeiaJYRORcB3zlY3cJJKqpa2Bb61xWrepyXK110zzr2V/0lnGg8nL8KNEUqmU
 G1n70hXJDpMHL4PBKE6fDFRmXQi3xUg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-TrZuaVHQM7-AyltUxlg9hA-1; Thu, 03 Dec 2020 13:11:26 -0500
X-MC-Unique: TrZuaVHQM7-AyltUxlg9hA-1
Received: by mail-ej1-f72.google.com with SMTP id a8so1084318ejc.19
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 10:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wHwkGH/7wGfD/bz7tzVWZoWIn9sOc3VRxGRp/RaUWEU=;
 b=Jn3Bsqgi3r6fB6rimKVxXuOTEtuXM4O+kheWkDPJaeSvlGv19ARTAm21sehNkDNfcI
 9hugQmzNruKVrNj4xveRYEMHLh+giF9ioWe9m3rIXi4SjkBo7CgPi/1v1AxL0R0DRztN
 YmGc7q5z4ofUjpQpd1IsWpxMoDTI6XM+dSiIInTkjHnY+wws8WZ82FQjcbEIJrcAl5kB
 JG3iCgzvz1FPgbmeYafLlL3TJNC6QVRypk3SZ+ynO4NIk1L7jJNQf7DQ1oyumPKkIpoJ
 uWkmMh8NKUmlnQ40U2ulyqXasjNpu5tPRaMjx/F7z1oIKYJwxVud6L7bSB80kX3DIY3s
 UrTw==
X-Gm-Message-State: AOAM5302kCDNEgHcmqKLdL3bt7MMCKT7hszokNLYaWchsZ3nKEf6RFXO
 XRQ49m+/T2N98/7Qap5V4qTl3kb+Tks29JaMIxj6pcdxgHhYvSzXTeU3pZpGa6lVrdSBdCh4iuS
 UFQBOkaEnmkbS5fo=
X-Received: by 2002:a50:9f4e:: with SMTP id b72mr4040337edf.200.1607019085211; 
 Thu, 03 Dec 2020 10:11:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo3Gn1c92F76xJMUZyD4srvQuENC2bG9VmOJmkpCepgW1NPHHfOJR5eDutrmvdj8WS7VR3FQ==
X-Received: by 2002:a50:9f4e:: with SMTP id b72mr4040319edf.200.1607019084958; 
 Thu, 03 Dec 2020 10:11:24 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a15sm1650506eds.4.2020.12.03.10.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 10:11:24 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: test hot(un)plug of ccw devices
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
References: <20201203153917.66685-1-cohuck@redhat.com>
 <71a7ee0f-8ca1-e3d0-8817-e51d0cb4c02c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c4c7adf-4152-2f83-082f-f208aa8d7f7d@redhat.com>
Date: Thu, 3 Dec 2020 19:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <71a7ee0f-8ca1-e3d0-8817-e51d0cb4c02c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 6:22 PM, Thomas Huth wrote:
> On 03/12/2020 16.39, Cornelia Huck wrote:
>> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> 
> Good idea! ... is it also possible with a pci device?
> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
...
>> +        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')
> 
> That looks like it could be a little bit racy ... what if the kernel outputs
> another log message by chance, so that tail -n 1 reports that instead.
> 
> I think it would be better to clear the dmesg log ("dmesg -c") before
> plugging, and then look at all the new output of "dmesg" without using
> "tail" afterwards.

"dmesg --follow"?


