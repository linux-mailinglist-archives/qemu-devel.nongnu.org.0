Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1A44D9B0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:00:16 +0100 (CET)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCUp-0001ni-LP
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:00:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCF0-0005GV-AS
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCEw-0005aC-8p
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636645425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAOdwH/Yz20BDbmnKlbCtjOMu10nC3b+8REs+mFPz70=;
 b=NDnBfy7SvW1an9yAEJawVfCYGDqvdB9Nu5rZDt+3EL0WzkJm41YvGo8/4Q/sv4BQwBmkyp
 vPAncUeUnfOB3Mnf5j5lKbo5Nwbd5EosWcg/zK+hnspQlBgunLP1litIaGrjoaU9+KQSiY
 5SvR9p2y5mdDr88ToYmU8eCXVe1gDyc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-dsqZzdWmOmaEqmvdi9loRA-1; Thu, 11 Nov 2021 10:43:44 -0500
X-MC-Unique: dsqZzdWmOmaEqmvdi9loRA-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so2905823wmb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YAOdwH/Yz20BDbmnKlbCtjOMu10nC3b+8REs+mFPz70=;
 b=2qaOCW7prfGmHV24wcB772cGv+2PI5RLAxm+PmoL0zPL2SRAexPhuafzgD/xIeUO/e
 VaDCJvtsMNqW8og10tHLu4SeWBFBUJzAo/pmSQDXqD4DBQHIu/39D3uqdRaSh+LXcHyp
 HTjz2GTV00dnDyHRoXNWSnU+Th3AtY/yjtFC95RUlwhc4Nxwwq5PpLqCm0aZb8zxHFqt
 c00hsoTHfmDN/DuLmx6tCjzNcIYFpmXqh9vPe1Me8H15/towmDSjDOi4+LUDcALigpoH
 7WgqROlnWBtOwHKtgbNdoG8JRFpzhgZOHKaStZZLfCkfki3CxizU3dcq0MI5FHui28cF
 N2+A==
X-Gm-Message-State: AOAM532jOJAGX7olj8vX/h7W+ySrSjfxD+hocgShq8hRLjvh13oqwThg
 sU4/fbcd/cD22UWQ4YhEX/sIESs9kKEIahSiZG5aVnoplzrrqLXi9iVHiNmIBMHh6fqHhgIh02e
 rAcDYXfRoFnQgXC4=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr26469484wmg.67.1636645423011; 
 Thu, 11 Nov 2021 07:43:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyk/2E/XjbXb4CVVB7g3lixy1pTvJnHPPUJ77ww9Tiej/7Y1EHxl2bjsc7F0FzZBmrzuNRew==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr26469439wmg.67.1636645422670; 
 Thu, 11 Nov 2021 07:43:42 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u6sm3196105wmc.29.2021.11.11.07.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 07:43:42 -0800 (PST)
Message-ID: <bd0f1a0a-1b5e-9800-069c-764cb9cfb5e1@redhat.com>
Date: Thu, 11 Nov 2021 16:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] hw/core/loader: workaround read() size limit.
To: Jamie Iles <jamie@nuviainc.com>
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-3-jamie@nuviainc.com>
 <c9950c92-86c5-ce0d-054e-357db1de851c@redhat.com> <YY04ioqviteeKy0c@hazel>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YY04ioqviteeKy0c@hazel>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 16:36, Jamie Iles wrote:
> Hi Philippe,
> 
> On Thu, Nov 11, 2021 at 03:55:48PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Jamie,
>>
>> On 11/11/21 15:11, Jamie Iles wrote:
>>> On Linux, read() will only ever read a maximum of 0x7ffff000 bytes
>>> regardless of what is asked.  If the file is larger than 0x7ffff000
>>> bytes the read will need to be broken up into multiple chunks.
>>>
>>> Cc: Luc Michel <lmichel@kalray.eu>
>>> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
>>> ---
>>>  hw/core/loader.c | 40 ++++++++++++++++++++++++++++++++++------
>>>  1 file changed, 34 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>>> index 348bbf535bd9..16ca9b99cf0f 100644
>>> --- a/hw/core/loader.c
>>> +++ b/hw/core/loader.c
>>> @@ -80,6 +80,34 @@ int64_t get_image_size(const char *filename)
>>>      return size;
>>>  }
>>>  
>>> +static ssize_t read_large(int fd, void *dst, size_t len)
>>> +{
>>> +    /*
>>> +     * man 2 read says:
>>> +     *
>>> +     * On Linux, read() (and similar system calls) will transfer at most
>>> +     * 0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
>>
>> Could you mention MAX_RW_COUNT from linux/fs.h?
>>
>>> +     * actually transferred.  (This is true on both 32-bit and 64-bit
>>> +     * systems.)
>>
>> Maybe "This is true for both ILP32 and LP64 data models used by Linux"?
>> (because that would not be the case for the ILP64 model).
>>
>> Otherwise s/systems/Linux variants/?
>>
>>> +     *
>>> +     * So read in chunks no larger than 0x7ffff000 bytes.
>>> +     */
>>> +    size_t max_chunk_size = 0x7ffff000;
>>
>> We can declare it static const.
> 
> Ack, can fix all of those up.
> 
>>> +    size_t offset = 0;
>>> +
>>> +    while (offset < len) {
>>> +        size_t chunk_len = MIN(max_chunk_size, len - offset);
>>> +        ssize_t br = read(fd, dst + offset, chunk_len);
>>> +
>>> +        if (br < 0) {
>>> +            return br;
>>> +        }
>>> +        offset += br;
>>> +    }
>>> +
>>> +    return (ssize_t)len;
>>> +}
>>
>> I see other read()/pread() calls:
>>
>> hw/9pfs/9p-local.c:472:            tsize = read(fd, (void *)buf, bufsz);
>> hw/vfio/common.c:269:    if (pread(vbasedev->fd, &buf, size,
>> region->fd_offset + addr) != size) {
>> ...
>>
>> Maybe the read_large() belongs to "sysemu/os-xxx.h"?
> 
> I think util/osdep.c would be a good fit for this.  To make sure we're 

Yes.

> on the same page though are you proposing converting all pread/read 
> calls to a qemu variant or auditing for ones that could potentially take 
> a larger size?

Yes, I took some time wondering beside loading blob in guest memory,
what would be the other issues you might encounter. I couldn't find
many cases. Eventually hw/vfio/. I haven't audit much, only noticed
hw/9pfs/9p-local.c and qga/commands-*.c (not sure if relevant), but
since we want to fix this, I'd rather try to fix it globally.


