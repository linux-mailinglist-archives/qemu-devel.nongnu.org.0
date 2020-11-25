Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B52C449F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:05:45 +0100 (CET)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khxId-0006RT-S8
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khxHE-0005uR-2R
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khxHB-0007IT-IQ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606320251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCkBjTzPLv4IgCwTupsg3WitZgfpR7NPCe/llhX5fkA=;
 b=I9Hp7aVgAZNmtaVVlwgwGvASgI9Vb/EKVTrub2Js79rNGFUdJl1b0401mmjIGneJe2+PDG
 9xvl6/J5soLdkHkuJ841wfzGs5W7ZgHUxTT7/yEFHcxj4Ha9cEEjGZDSKJJWkMcKZLTyYs
 ezv985uvFHVTNgB6ox5zOrkXU8n6VrA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-SU9e6ZdxNRKCtq9fPxrEGQ-1; Wed, 25 Nov 2020 11:04:09 -0500
X-MC-Unique: SU9e6ZdxNRKCtq9fPxrEGQ-1
Received: by mail-ej1-f71.google.com with SMTP id r2so916962ejx.9
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 08:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nCkBjTzPLv4IgCwTupsg3WitZgfpR7NPCe/llhX5fkA=;
 b=OB2cSbyfG3AfL+WYISNbN6SKkM6drhfV9mARgjAxtgRlPbWaTOjzTdtM8VnJWZWmDQ
 TvTdWUGss3ZXoCeYUfC/XyOa6aaj3++31qz7c3rvQLEByWPmufKmLMn1aWKx4w6PuK1u
 VR29wNS2zcKlaZ3I421uD2L7fTVy+Q6vO+ERLRVWwrjDYykoS99sJ/Zr5LdYLC2oV4nP
 2d0hNHiINTCkwFWTUMxg63g2uLHK/njRm7xC9kQdkcjLvQU7Vc7XWOYQMPT/WorMDMMZ
 U9oce+73rdN5J+0kpwpf9eSsgEMpAJZ6DkLw9I/U64AoWwgAEshc8+SUZAwsJdJHDPO1
 4jSw==
X-Gm-Message-State: AOAM531kVqhfFQjlurOHIiWOAlocV5aEdfhEOhFDJceqWb4aNiL7YRHR
 zbRxkJAx7/WbpO/7KTJpbdRspup39X0xg79HooDeGmEr0tK3azL4ByQ3c1Yb34YKGud+ZueUMNO
 v9vYpXwV6kx8eqqk=
X-Received: by 2002:a50:cd84:: with SMTP id p4mr3991956edi.81.1606320248294;
 Wed, 25 Nov 2020 08:04:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOV4hCg8SIB33rDc+tsZCQImrKEK9JQyd0YtMKTDvPcUOsfSk3/VoeGvrhqNq5Q6AB1XSrnw==
X-Received: by 2002:a50:cd84:: with SMTP id p4mr3991906edi.81.1606320247958;
 Wed, 25 Nov 2020 08:04:07 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c8sm1538078edr.29.2020.11.25.08.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 08:04:07 -0800 (PST)
Subject: Re: [PATCH RFC] tests/acceptance: add a test for devices on s390x
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
References: <20201125135820.1442611-1-cohuck@redhat.com>
 <148a7ef1-aae2-89ae-88f7-3c70c9f02999@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79a12074-e63d-6362-5359-612069d10d26@redhat.com>
Date: Wed, 25 Nov 2020 17:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <148a7ef1-aae2-89ae-88f7-3c70c9f02999@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: qemu-s390x@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cornelia,

On 11/25/20 4:03 PM, Thomas Huth wrote:
> On 25/11/2020 14.58, Cornelia Huck wrote:
>> This adds a very basic test for checking that we present devices
>> in a way that Linux can consume: boot with both virtio-net-ccw and
>> virtio-net-pci attached and then verify that Linux is able to see
>> and detect these devices.
> 
> Thanks for tackling it!
> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>
>> A very basic test, but it would have caught the recent zPCI regression.

Thanks for adding this test :)

>>
>> If anyone has a better idea than using early debug shells in the Debian
>> install image, please let me know. At least it's quick, as we can check
>> for the devices quite early in the boot sequence.

This is the simplest cheaper way I think.

Alternative is to use Guenter's images:
https://github.com/groeck/linux-build-test/tree/master/rootfs/s390

>>
>> Not sure if running under both kvm and tcg on an s390 host would add
>> useful extra coverage. Also not sure if this needs fencing on any of the
>> public CIs (have not tried yet).
> 
> We're only running the acceptance tests in the gitlab-CI, no worries about
> the others.
> 
>> ---
>>  tests/acceptance/s390_devices.py | 68 ++++++++++++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>  create mode 100644 tests/acceptance/s390_devices.py
>>
>> diff --git a/tests/acceptance/s390_devices.py b/tests/acceptance/s390_devices.py
>> new file mode 100644
>> index 000000000000..6ce47061f35d
>> --- /dev/null
>> +++ b/tests/acceptance/s390_devices.py
> 
> s390x_devices.py ?
> 
> Or maybe even machine_s390x.py instead, like the other machine*.py files?

Feel free to use whatever name/directory structure that help others to
find your tests (don't forget to add an entry to MAINTAINERS).

Regards,

Phil.


