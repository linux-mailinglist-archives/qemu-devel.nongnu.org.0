Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249935A0AA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:06:53 +0200 (CEST)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrme-0008Kw-Dp
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUrlO-0007Uh-Mb
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUrlB-0001oH-Dh
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617977119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6J+cb+EktczcAw0/qELrNQhW9zS46QV9wdRfeWiJVb4=;
 b=SVtnR3qqFNL7tPJuUg5hTF6dkt8z6t+zY6CZ3yKC8dyLAkBdL9wjtgtZIEIt/LB146MCxD
 WYmEOZt8P3byt9879WSUK6M9jsJCUq8hYNVionCnE/7CspBoVlu8TGTz06+aavRv1veQBE
 xQ9kNsE5IG2QIZqjKpoyF1Hp6VYNXgo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-cZxHThAPP4K5StXPfnzk4Q-1; Fri, 09 Apr 2021 10:05:17 -0400
X-MC-Unique: cZxHThAPP4K5StXPfnzk4Q-1
Received: by mail-oi1-f200.google.com with SMTP id h2so214967oih.4
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6J+cb+EktczcAw0/qELrNQhW9zS46QV9wdRfeWiJVb4=;
 b=TeD6c8tNgv91Te6QFavsJF/SbtpumnrrkyC51rcjUqNGdbSn/s21eseqty9FmOJKqj
 w5NCLfUqwV1XHvn+yurS8rPP39Zg404XVO2J/t3mAu87bwSiX9tHu98WKFzrjm7bxSYN
 NscvwQY/UgiJ1/udoxk6ElEyMrO5xQ9JYOxpTS8HiKEobWLyJNxjSriSFxmImWhV6WGm
 UMFn6pDEK4ZslGbkTCjSle822pNvzhWhlV6koH+iVXEfsUiUJvHa7H4K1Eiq2SPG7xzM
 cetzGV/a6k2OxNXW14ZgaX/flaX32bv0hcwJNodYCkISMIMvTgkeAFFB8bDIUrLywIb0
 UwGA==
X-Gm-Message-State: AOAM532zzyhILfwlLN/iYkg3aCM9oshPBA1h5HYp25k4Py5PrikBjWXd
 Wc65wFcQ9DqAy8kbe17azWpzDrRL4QwkYRj5KvQ83f8gNLsfAtigopsLVS+whDGl7sfsVq5zncd
 M2X8xTMlT/oaQq4s=
X-Received: by 2002:a54:4586:: with SMTP id z6mr1088454oib.159.1617977116588; 
 Fri, 09 Apr 2021 07:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyRT/o3q9ydNWjEyzlUqbE1RNAfPPL6LT6x2LNEFFb38YjNhceXbZmDKQc2jz0ag0GcjgUdg==
X-Received: by 2002:a54:4586:: with SMTP id z6mr1088443oib.159.1617977116378; 
 Fri, 09 Apr 2021 07:05:16 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 w2sm539667oov.23.2021.04.09.07.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 07:05:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] block/rbd: Add an escape-aware strchr helper
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210401210150.2127670-1-ckuehl@redhat.com>
 <20210401210150.2127670-3-ckuehl@redhat.com>
 <bc5865f8-bb7f-58b5-5f1c-9ec3e5c09ad9@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <ad6beb34-7e80-3e60-7c2d-faa2836febf9@redhat.com>
Date: Fri, 9 Apr 2021 09:05:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc5865f8-bb7f-58b5-5f1c-9ec3e5c09ad9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/21 9:24 AM, Max Reitz wrote:
> On 01.04.21 23:01, Connor Kuehl wrote:
>> [..]
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 9071a00e3f..c0e4d4a952 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -134,6 +134,22 @@ static char *qemu_rbd_next_tok(char *src, char 
>> delim, char **p)
>>       return src;
>>   }
>> +static char *qemu_rbd_strchr(char *src, char delim)
>> +{
>> +    char *p;
>> +
>> +    for (p = src; *p; ++p) {
>> +        if (*p == delim) {
>> +            return p;
>> +        }
>> +        if (*p == '\\') {
>> +            ++p;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
> 
> So I thought you could make qemu_rbd_do_next_tok() to do this.  (I 
> didn’t say you should, but bear with me.)  That would be possible by 
> giving it a new parameter (e.g. @find), and if that is set, return @end 
> if *end == delim after the loop, and NULL otherwise.
> 
> Now, if you add wrapper functions to make it nice, there’s not much more 
> difference in lines added compared to just adding a new function, but it 
> does mean your function should basically be the same as 
> qemu_rbd_next_tok(), except that no splitting happens, that there is no 
> *p, and that @end is returned instead of @src.

Do you have a strong preference for this? I agree that 
qemu_rbd_next_tok() could grow this functionality, but I think it'd be 
simpler to keep it separate in the form of qemu_rbd_strchr().

> 
> So there is one difference, and that is that qemu_rbd_next_tok() has 
> this condition to skip escaped characters:
> 
>      if (*end == '\\' && end[1] != '\0') {
> 
> where qemu_rbd_strchr() has only:
> 
>      if (*p == '\\') {
> 
> And I think qemu_rbd_next_tok() is right; if the string in question has 
> a trailing backslash, qemu_rbd_strchr() will ignore the final NUL and 
> continue searching past the end of the string.

Aha, good catch. I'll fix this up.

Thank you,

Connor


