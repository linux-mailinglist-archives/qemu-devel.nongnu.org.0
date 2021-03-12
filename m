Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951FD338A5B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:38:55 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfC2-0002pX-J5
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKerC-0004My-Lb
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKerA-0003In-IP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615544239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkBW1vSB5MQk0vHZvicI9Jf6YmbE4mXWvryvO4+i9SY=;
 b=anDnwW29K7FRf99/xON+bh1u83vcmrBuO+oi7PeBR7NOB9Fla7wEQtz6dXsRiYSqVOc241
 syAWADqtfytiNcs/4SwxWVkwPLxMKtGWCQox+f8haIBavjChXZEIm6URgizkg/xwf00If3
 2UFoDKrN0G1oQLAELXzcK40yk+lE50U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-rA9wRtJUMEyAt_qKAWyWjQ-1; Fri, 12 Mar 2021 05:17:18 -0500
X-MC-Unique: rA9wRtJUMEyAt_qKAWyWjQ-1
Received: by mail-wm1-f72.google.com with SMTP id a65so1926908wmh.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wkBW1vSB5MQk0vHZvicI9Jf6YmbE4mXWvryvO4+i9SY=;
 b=W6bONK8otABCKeIVcdDnyZhMceZrDk5wevjCZp5k9wGjKRm/pCgxwmSzSI+VgVj5zW
 DcdveUNiBzOs4w32vGG3eNUPERNBH3jb36uQafV9+RTxtXz0sTHtqq+8FNJZGl2mUkN/
 sJkU9H8OwJuS6ESmxl1irL/dH6a4C3T405Z27vcDXOZRHNbbr8UvVaCOYMluV9Dj4ghg
 yvTNO78Nw3ySuSs9ufNsbqkRT7V6DQfYNa8H55AvjN2TjHltyR/WR/sb1ad19/Yrsfz8
 SCylJMzfCiyt0v/Mak6CuIO0KhXCIFk+eUOgNoNWbJJvNMXZYpcI/P4vUwYB7pTmSjz3
 YZSQ==
X-Gm-Message-State: AOAM531vp5nly1jB6VayjXzu0jm5xka98GT9jRqCiIhDwCW7EnMY5+Mx
 AlccmB6jxK527DiCJfD0cmuQa9b9sIH49iz4SZnVPZcIp5JbQhTB4QOuqySg5LYiZyjpYn9MV5Q
 cE2WkqNglH7QA2mKOlJ5ib10i+5HJkp76AC0QpdCfW32apCQ58Wz8bN/Ipw5S/DYw
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr12794690wrt.426.1615544237107; 
 Fri, 12 Mar 2021 02:17:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys+MyD3uFSzlTENKw6aRBVFlzHY5ZTCTe19HCGU6omZ/XCjMgOYOMLBHzSeoO1lNTU5lmD2Q==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr12794662wrt.426.1615544236791; 
 Fri, 12 Mar 2021 02:17:16 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 13sm1069945wmw.5.2021.03.12.02.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:17:16 -0800 (PST)
Subject: Re: [PULL 47/53] scripts: Coccinelle script to use ERRP_GUARD()
To: Markus Armbruster <armbru@redhat.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
 <20200707212503.1495927-48-armbru@redhat.com>
 <a569c1e3-401e-c6d2-128d-3a846f46440c@redhat.com>
 <87sg506a51.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5af5fbb4-3b25-a4b8-4683-6ca388a0f441@redhat.com>
Date: Fri, 12 Mar 2021 11:17:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87sg506a51.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:36 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 7/7/20 11:24 PM, Markus Armbruster wrote:
>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>>> Script adds ERRP_GUARD() macro invocations where appropriate and
>>> does corresponding changes in code (look for details in
>>> include/qapi/error.h)
>>>
>>> Usage example:
>>> spatch --sp-file scripts/coccinelle/errp-guard.cocci \
>>>  --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
>>>  --max-width 80 FILES...
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> Message-Id: <20200707165037.1026246-3-armbru@redhat.com>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> [ERRP_AUTO_PROPAGATE() renamed to ERRP_GUARD(), and
>>> auto-propagated-errp.cocci to errp-guard.cocci]
>>> ---
>>>  scripts/coccinelle/errp-guard.cocci | 336 ++++++++++++++++++++++++++++
>>>  include/qapi/error.h                |   2 +
>>>  MAINTAINERS                         |   1 +
>>>  3 files changed, 339 insertions(+)
>>>  create mode 100644 scripts/coccinelle/errp-guard.cocci
>>
>> Odd, this script fails on Fedora rawhide:
>>
>> $ spatch --macro-file scripts/cocci-macro-file.h --sp-file
>> scripts/coccinelle/errp-guard.cocci --use-gitgrep --dir .
>> There is no standard.iso in /usr/lib64/coccinelle.
>> Are you sure you run a properly installed version of spatch
>> ?\ninit_defs_builtins: /usr/lib64/coccinelle/standard.h
>> init_defs: scripts/cocci-macro-file.h
>> minus: parse error:
>>   File "scripts/coccinelle/errp-guard.cocci", line 54, column 5, charpos
>> = 1899
>>   around = '<...',
>>   whole content =      <...
> 
> Double-checking: it fails only for this script, other scripts work?

Ah good point, this is the first one I checked...
I'll see with the others and update.


