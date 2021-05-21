Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C597338C5C7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:36:33 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3SC-0004qf-TU
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk3Q9-0003n3-S9
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk3Q7-0003lC-LE
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621596862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=no9p0R+y5kF5LQpRTEFjl0DDd6xJGSW3Yvax0ez0SOM=;
 b=AJzY3ahSkyYdm5ftcwQuRYgXP0aYaA6W4SCZcgr8IG3mVsra6lhh61aiKjv0Ti18NkIxpz
 tWaA2lbkDYfJPXYelho3VKmMGquzu1eGik/O32tmITVCtdTZKs8i4aQpf3k5j1xf51UMbr
 O0lyLfuULLe0Upx8hSjN+Ja/IWiC2aw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-d-_-_F5kM5ubmddRYv-zXQ-1; Fri, 21 May 2021 07:34:20 -0400
X-MC-Unique: d-_-_F5kM5ubmddRYv-zXQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 7-20020adf95070000b02901104ad3ef04so9343476wrs.16
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 04:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=no9p0R+y5kF5LQpRTEFjl0DDd6xJGSW3Yvax0ez0SOM=;
 b=cDv3Swby3sVYc+CwZnfle9tTYHL68MLsCYWMnv04BS5JV0JH/MoWDPWIJ9UIZRp8vF
 mNXyb1agQzChabVsaf6cMTaePRrqrQOZbbGDQxDywYVw9zLqjsdHI8/0plLt0d7b7h94
 CcXL+Lvv6OlVXWaiXNU6Hm9PbWQ7pwks1rn26NkFEAcs4NseR7LJRTrZmrigh7b4KHS1
 KsX+cIY4mEZL3ZSuhJfCb9KuGYmtNKZnUf8RFZ4GCzPmsv77M9jOb6FnitLW1+zeELYk
 HOGcNt6UTEtcNbGBNHVqO8RbTdX/hrL7C5PuVvDd8mo/eEF9LlQgReMJ9p3yri/L5xd9
 ZdMQ==
X-Gm-Message-State: AOAM531ZvKiSipBAPJxDN5eMmqMg2YBLTFaiby5bnbtDEyGSXQKTHVQW
 ycRbFr2dN9wreB2BwCgVj5NawLCiAQlZ8r1FErJeeSVpPLFiuqNGa4DMFSNZqtMRkfgJFEkiT1V
 +zBivECWOybfoOBk=
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr9347751wrm.145.1621596859277; 
 Fri, 21 May 2021 04:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw+9WUtKcDq1+jXGYguu3if7O/VsoKePPga2wqwDc9ZApA/ff/zxkWJzfPt7lXXjmWlqf2dw==
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr9347727wrm.145.1621596859048; 
 Fri, 21 May 2021 04:34:19 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o21sm1767502wrf.91.2021.05.21.04.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 04:34:18 -0700 (PDT)
Subject: Re: [PULL 02/19] sev: update sev-inject-launch-secret to make gpa
 optional
To: jejb@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <20210215131626.65640-3-pbonzini@redhat.com>
 <66d0ca68-2f9f-1ae5-16ee-9dac4873dcbe@redhat.com>
 <25edd87f17b87db14b0b09b5dca1a41644ce4169.camel@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <796fab4e-1490-e7b1-f73e-9bbf0827f43a@redhat.com>
Date: Fri, 21 May 2021 13:34:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <25edd87f17b87db14b0b09b5dca1a41644ce4169.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 12:19 AM, James Bottomley wrote:
> On Thu, 2021-05-20 at 23:36 +0200, Philippe Mathieu-Daudé wrote:
>> On 2/15/21 2:16 PM, Paolo Bonzini wrote:
>>> From: James Bottomley <jejb@linux.ibm.com>
>>>
>>> If the gpa isn't specified, it's value is extracted from the OVMF
>>> properties table located below the reset vector (and if this
>>> doesn't
>>> exist, an error is returned).  OVMF has defined the GUID for the
>>> SEV
>>> secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format
>>> of
>>> the <data> is: <base>|<size> where both are uint32_t.  We extract
>>> <base> and use it as the gpa for the injection.
>>>
>>> Note: it is expected that the injected secret will also be GUID
>>> described but since qemu can't interpret it, the format is left
>>> undefined here.
>>>
>>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>>>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Message-Id: <20210204193939.16617-3-jejb@linux.ibm.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>  qapi/misc-target.json |  2 +-
>>>  target/i386/monitor.c | 23 ++++++++++++++++++++++-
>>>  2 files changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>>> index 06ef8757f0..0c7491cd82 100644
>>> --- a/qapi/misc-target.json
>>> +++ b/qapi/misc-target.json
>>> @@ -216,7 +216,7 @@
>>>  #
>>>  ##
>>>  { 'command': 'sev-inject-launch-secret',
>>> -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa':
>>> 'uint64' },
>>> +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa':
>>> 'uint64' },
>>>    'if': 'defined(TARGET_I386)' }
>>>  
>>>  ##
>>> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
>>> index 1bc91442b1..5994408bee 100644
>>> --- a/target/i386/monitor.c
>>> +++ b/target/i386/monitor.c
>>> @@ -34,6 +34,7 @@
>>>  #include "sev_i386.h"
>>>  #include "qapi/qapi-commands-misc-target.h"
>>>  #include "qapi/qapi-commands-misc.h"
>>> +#include "hw/i386/pc.h"
>>>  
>>>  /* Perform linear address sign extension */
>>>  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
>>> @@ -730,9 +731,29 @@ SevCapability
>>> *qmp_query_sev_capabilities(Error **errp)
>>>      return sev_get_capabilities(errp);
>>>  }
>>>  
>>> +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
>>> +struct sev_secret_area {
>>> +    uint32_t base;
>>> +    uint32_t size;
>>> +};
>>> +
>>>  void qmp_sev_inject_launch_secret(const char *packet_hdr,
>>> -                                  const char *secret, uint64_t
>>> gpa,
>>> +                                  const char *secret,
>>> +                                  bool has_gpa, uint64_t gpa,
>>>                                    Error **errp)
>>>  {
>>> +    if (!has_gpa) {
>>> +        uint8_t *data;
>>> +        struct sev_secret_area *area;
>>> +
>>> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data,
>>> NULL)) {
>>
>> FYI trying to build MicroVM standalone (--without-default-devices):
>>
>> /usr/bin/ld: libqemu-i386-softmmu.fa.p/target_i386_monitor.c.o: in
>> function `qmp_sev_inject_launch_secret':
>> target/i386/monitor.c:749: undefined reference to
>> `pc_system_ovmf_table_find'
>>
>> I'm adding this to my TODO list.
> 
> I'm pretty clueless with the new meson build system but I think this is
> something to do with CONFIG_PC not being defined ... can you verify? in
> which case it could be fixed with a pc_sysfw-stub.c that builds it as a
> function returning false.

Oh actually I wrote the fix this morning, but haven't posted it yet.

Beside what you said, I added a X86_FW_OVMF symbol and have SEV
depends on it.

I'll cc you when posting.

Regards,

Phil.


