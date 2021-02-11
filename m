Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4820319343
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:42:42 +0100 (CET)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHrN-0000xG-K5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAHV3-0004Bm-4X
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAHV0-0004Nh-H8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613071171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgXtkTTj9DVBP41oxrYxxySuD5oGRX9h4dMIvdQ06Iw=;
 b=PQhdqF2TCqCh7Su0Y0FsAYqIS/TTmdWZj3UF74fJlal1Wm+06C2E/6B+qPmQawIjhTCMSS
 PeMQWi4zEmbs23R+odOi5ePQQxKFZP/s+ig/ModSsIl83rwe9aC1GB3s6YTD/5UamC3+EV
 9XgzM2AX7kyKNx4iQcwB53rfqs1gtGA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-_i9jXCo1OLylXUED__RHQw-1; Thu, 11 Feb 2021 14:19:29 -0500
X-MC-Unique: _i9jXCo1OLylXUED__RHQw-1
Received: by mail-wr1-f69.google.com with SMTP id c1so2946589wrx.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MgXtkTTj9DVBP41oxrYxxySuD5oGRX9h4dMIvdQ06Iw=;
 b=XDC7OpbYTx5C0sORDs/HZqO1OnSzppObhqJ6g4jZWD0cpQdSi20eHurYT/0Hp029cb
 SkIwl9Rj3PaA/qbFkChbeCMwgJGxvts4K8iSkBsk80yJtPulmU8KINgMKI+72kQ1LXZl
 59NqFpMEHGSHLxD/gZJOG9X06y20NdMNUwWGgRrJVdMjApnXYdMBi/k+g4ucOgIwMBQL
 jj0g+U5qzP9bepH7Ii8OzorqHSfTvF3SoBXHN4ZClHfvBLYVzAmrvoCoULqDNMIpZPGZ
 PmdUeQKY9W9usRC8ebLo/fBB60sRwKSErAxII7QClCXzqjOMVD82aGO7vt+P4bB4Vh5b
 +gHg==
X-Gm-Message-State: AOAM5300YmNpfWtAs89Jhdk6WbipH0o9zhjXBua1LDTOKVaYz4D354FD
 tSG0jomH8n8rN/UdrsVmlG2psrMgUC6RB2x/yA6M2pn5bGkRW2o49lFrlSwJfbWEQawcDWjhd7e
 FKx5Rg0BRA0rTAzY=
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr7060951wrx.47.1613071168159; 
 Thu, 11 Feb 2021 11:19:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJzhkNzr84kQbe91s62fxjmG5SvgEqeYcVDlKJ7HRB2/MHY09igQs10Bq5P4K1lz+AiN15/w==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr7060918wrx.47.1613071167848; 
 Thu, 11 Feb 2021 11:19:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h13sm6479389wrv.20.2021.02.11.11.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 11:19:27 -0800 (PST)
Subject: Re: [PATCH v2 1/2] block: Explicit null-co uses 'read-zeroes=false'
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211142656.3818078-2-philmd@redhat.com>
 <602836f0-848d-1840-635d-4a972e7a205f@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <650c0cca-cc5d-6314-5c9d-4ec37c59b982@redhat.com>
Date: Thu, 11 Feb 2021 20:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <602836f0-848d-1840-635d-4a972e7a205f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vladimir,

On 2/11/21 5:29 PM, Vladimir Sementsov-Ogievskiy wrote:
> 11.02.2021 17:26, Philippe Mathieu-Daudé wrote:
>> We are going to switch the 'null-co' default 'read-zeroes' value
>> from FALSE to TRUE in the next commit. First explicit the FALSE
>> value when it is not set.
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> - Missing: 056 & 155. I couldn't figure out the proper syntax,
>>    any help welcomed...
>> - I'm unsure about 162, this doesn't seem to use the null-co
>>    driver but rather testing global syntax.
>> ---
>>   docs/devel/testing.rst                     | 14 +++++++-------
>>   tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
>>   tests/test-bdrv-drain.c                    | 10 ++++++++--
>>   tests/acceptance/virtio_check_params.py    |  2 +-
>>   tests/perf/block/qcow2/convert-blockstatus |  6 +++---
>>   tests/qemu-iotests/040                     |  2 +-
>>   tests/qemu-iotests/041                     | 12 ++++++++----
>>   tests/qemu-iotests/051                     |  2 +-
>>   tests/qemu-iotests/051.out                 |  2 +-
>>   tests/qemu-iotests/051.pc.out              |  4 ++--
>>   tests/qemu-iotests/087                     |  6 ++++--
>>   tests/qemu-iotests/118                     |  2 +-
>>   tests/qemu-iotests/133                     |  2 +-
>>   tests/qemu-iotests/153                     |  8 ++++----
>>   tests/qemu-iotests/184                     |  2 ++
>>   tests/qemu-iotests/184.out                 | 10 +++++-----
>>   tests/qemu-iotests/218                     |  3 +++
>>   tests/qemu-iotests/224                     |  3 ++-
>>   tests/qemu-iotests/224.out                 |  8 ++++----
>>   tests/qemu-iotests/225                     |  2 +-
>>   tests/qemu-iotests/227                     |  4 ++--
>>   tests/qemu-iotests/227.out                 |  4 ++--
>>   tests/qemu-iotests/228                     |  2 +-
>>   tests/qemu-iotests/235                     |  1 +
>>   tests/qemu-iotests/245                     |  2 +-
>>   tests/qemu-iotests/270                     |  2 +-
>>   tests/qemu-iotests/283                     |  3 ++-
>>   tests/qemu-iotests/283.out                 |  4 ++--
>>   tests/qemu-iotests/299                     |  1 +
>>   tests/qemu-iotests/299.out                 |  2 +-
>>   tests/qemu-iotests/300                     |  4 ++--
> 
> Why do you think these tests will work bad with new default?

As I don't understand the tests, this was the deal with Eric :)

"OK to change default if current default is explicited" then
block maintainers could audit each case and see which one can
safely use read-zeroes=true.

> 
> At least everything under tests/qemu-iotests/ and tests/test-bdrv-drain
> are not about performance
> 
> tests/perf/block/qcow2/convert-blockstatus is OK with new default too.

OK, I'll see who should send these patches on top with Eric & Max.

Thank for your review,

Phil.


