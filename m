Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476A31550F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:29:16 +0100 (CET)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Wp9-0000ky-9g
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9Wfn-0002OM-Df
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9Wfj-0003Ib-PG
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612891170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7urXYhpk9sbVwN9nQ7RzBSuT4loP9hPftS7t0v944q4=;
 b=N41OQSX1uJuJ604leEQQnw9rGKTTcEzP4cNl4eAc1RNydTBBgEubhjRc92bHcgpC3MP3w8
 5vYP+RFoBe9dc+DgnoyQ5CAm+j20g5IELxh2WwRTq9MhWBuS5RN7bTiGAFINqnvj0Tz4El
 oFdeCc3e0IYkYusHuRjhaDaC6Tq4jp4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-otIFZHwDMCqXC7ewd3W6SQ-1; Tue, 09 Feb 2021 12:19:28 -0500
X-MC-Unique: otIFZHwDMCqXC7ewd3W6SQ-1
Received: by mail-ej1-f72.google.com with SMTP id m4so16279233ejc.14
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7urXYhpk9sbVwN9nQ7RzBSuT4loP9hPftS7t0v944q4=;
 b=cNzVuNZlrOXLKVPAAjxqvFcGeq09zyZqYlkmOqhK9UQzcwqo/Kt0mURuXpG2bLjAqq
 rRPzwD2eNiql4fNifoaLVpwavGCpQBiBYb/pMkkl4qzdaf4j7CyJ3KSja1uIlFGrz2/U
 rxmzPex9Y/pF0Pftvxz3b6j15inGuj64LJ+r6L22GrXR3NW3cEN/lBnx/TLATS7H+5qH
 c6PhvMcOd2rhhU+yhKMToK6Z9l2cP4UJKORujW5Q7G23IYD5yaRwtWwuAbm36cUHeJUb
 k8sEBOAM2ofywpyTOz2j3UTXfR15QzrF4PGfztd7Krvw6ep7fq9vZ0Ju49Ue/HVzuY2M
 k4KA==
X-Gm-Message-State: AOAM533Gocj3RpCE1sT75CzzxnCdLgGJTPZ7gCwsaGULHLGazYuZLl+o
 TpqB30DxwZmtlqlAqPEa8HDnwBgh5aKDTHz5eCzrxwsd/MlcgyU+TjptvpryuxhAQox3ldcvgmi
 +4PrjOloNZeOA8Ok=
X-Received: by 2002:a05:6402:3069:: with SMTP id
 bs9mr22678591edb.151.1612891167604; 
 Tue, 09 Feb 2021 09:19:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylg93utsPXmQDDZrFhy2e/QMV+3ekVBDYHJe6cNU4w63hEI0WiCY7DQ+MJjab6u+xUxuBCwA==
X-Received: by 2002:a05:6402:3069:: with SMTP id
 bs9mr22678570edb.151.1612891167478; 
 Tue, 09 Feb 2021 09:19:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o6sm268506ejx.78.2021.02.09.09.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 09:19:26 -0800 (PST)
Subject: Re: [RFC PATCH] block/null: Use 'read-zeroes' mode by default
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210209170121.3310151-1-philmd@redhat.com>
 <8abd4d2a-8afc-5386-e888-1a4302b25514@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a82d922e-956a-4c0f-9b25-7abc326ff870@redhat.com>
Date: Tue, 9 Feb 2021 18:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8abd4d2a-8afc-5386-e888-1a4302b25514@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 6:11 PM, Eric Blake wrote:
> On 2/9/21 11:01 AM, Philippe Mathieu-Daudé wrote:
>> The null-co driver is meant for (performance) testing.
>> By default, read operation does nothing, the provided buffer
>> is not filled with zero values and its content is unchanged.
>>
>> This can confuse security experts. For example, using the default
>> null-co driver, buf[] is uninitialized, the blk_pread() call
>> succeeds and we then access uninitialized memory:
>>
>>   static int guess_disk_lchs(BlockBackend *blk,
>>                              int *pcylinders, int *pheads,
>>                              int *psectors)
>>   {
>>       uint8_t buf[BDRV_SECTOR_SIZE];
>>       ...
>>
>>       if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE) < 0) {
>>           return -1;
>>       }
>>       /* test msdos magic */
>>       if (buf[510] != 0x55 || buf[511] != 0xaa) {
>>           return -1;
>>       }
>>
>> We could audit all the uninitialized buffers and the
>> bdrv_co_preadv() handlers, but it is simpler to change the
>> default of this testing driver. Performance tests will have
>> to adapt and use 'null-co,read-zeroes=on'.
> 
> Wouldn't this rather be read-zeroes=off when doing performance testing?

Oops, yes ;)

> 
>>
>> Suggested-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> RFC maybe a stricter approach is required?
> 
> Since the null driver is only for testing in the first place, opting in
> to speed over security seems like a reasonable tradeoff.  But I consider
> the patch incomplete without an audit of the iotests that will want to
> use explicit read-zeroes=off.

Correct. I don't know about each iotest but I can send a patch with
explicit option, so review would be trivial.

Thanks,

Phil.


