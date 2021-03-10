Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07593343B1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:52:16 +0100 (CET)
Received: from localhost ([::1]:40846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK24F-0000WG-ON
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1mr-0003Vp-4S
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1mp-0005vj-PL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615394055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IJTg1Opjf9btKZST6m7Btr+ilCpeaD24GbYdLo1RjY=;
 b=CzzT5EiOTXuK794ISYOJJM9WKcP6E4Ft6eZiqq6zGu9dCqLpr8UCo5b6QykaA1i3kPsBsj
 oqY6FUWm/CCsFuVa1kFScqPiSwpTARqN/Alx0vnS36mAzJjoGv0RsZFbQdTpYYgtuSVZBy
 VaHW5MaZ/Ud70UYJRG+GoQt6PehYZko=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-aYfsH90SMHmdDhmRgVKLhQ-1; Wed, 10 Mar 2021 11:34:11 -0500
X-MC-Unique: aYfsH90SMHmdDhmRgVKLhQ-1
Received: by mail-ej1-f71.google.com with SMTP id mj6so7492903ejb.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8IJTg1Opjf9btKZST6m7Btr+ilCpeaD24GbYdLo1RjY=;
 b=kK8efM0v2ysvp6Y2xLYM7cFMsfRrNKkvl+vMEnUGfw2xQAXbpImBGaxH0bEv4K6IHz
 mSabadapvt713CyzhZASRD/ytFd0sOa0cKvmrrAAw6Wovm/1zNTpewDXw+f6nBedJhsr
 9H1ND4emRXB/X7SMNxJjUMhQMvfyCEv5ppigpLxiJWhIOcGFt16nvf+wp6d9hDQZ19j1
 eIrkJkYLMEnQOI8Zq7DMfeNPpDb1GawcGwGppeosvdo2Ue2yzx2qe6BBhLb60NQ8EqjW
 /t6IB9/cweU31NxxjfsvNw4l9LK3ddUdx0tYfkzxsXwVxQx+GriygCmPf7uW6cqoXIsN
 wnrA==
X-Gm-Message-State: AOAM531TZfMf6VUtPlhu7T0bB4tJU/PZQNmpJzYa8qGAYZ4RANSl22tE
 fZlRtlBvGzDR79fmdUS5LIT5YsFRhmd0NCjtuoYP7OKQYTpAIcdOlqg/GnIWgivoLotM8Ufvz+C
 i7b2Fxz0ZaTEfj20=
X-Received: by 2002:a17:906:4015:: with SMTP id
 v21mr4659526ejj.433.1615394050003; 
 Wed, 10 Mar 2021 08:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyANs51R39StovbU7MRLoz0mQ/CIyB2tItY07eDeKqppyImGh5KlZLpe6VauvvJqENts/6gMA==
X-Received: by 2002:a17:906:4015:: with SMTP id
 v21mr4659511ejj.433.1615394049849; 
 Wed, 10 Mar 2021 08:34:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b19sm11092487edu.51.2021.03.10.08.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:34:09 -0800 (PST)
Subject: Re: [PATCH 4/9] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-5-philmd@redhat.com> <m2r1knff73.fsf@dme.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc8c72aa-c625-61a4-750a-496500b5c47b@redhat.com>
Date: Wed, 10 Mar 2021 17:34:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <m2r1knff73.fsf@dme.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 11:58 AM, David Edmondson wrote:
> On Wednesday, 2021-03-10 at 00:50:23 +01, Philippe Mathieu-Daudé wrote:
> 
>> There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
>> to boolean and set it to true directly within pflash_setup_mappings().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/pflash_cfi02.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>> index 845f50ed99b..5f949b4c792 100644
>> --- a/hw/block/pflash_cfi02.c
>> +++ b/hw/block/pflash_cfi02.c
>> @@ -108,7 +108,7 @@ struct PFlashCFI02 {
>>      MemoryRegion mem;
>>      MemoryRegion *mem_mappings;    /* array; one per mapping */
>>      MemoryRegion orig_mem;
>> -    int rom_mode;
>> +    bool rom_mode;
> 
> Given this, doesn't the second argument to pflash_register_memory() need
> to change to bool, affecting its callers?

Indeed, thanks.


