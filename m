Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE516EAB62
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:19:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqef-0003D7-Kx; Fri, 21 Apr 2023 09:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqed-0003Cn-Ps
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqeZ-0001ZI-Tk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682083099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzvF2DULtypOJobk7Fu9q8xQ/OplwahSBqHm5YJpxN4=;
 b=Wxut6hXZY59d97xTbd/Q03YWHYIQ4W3yelOBh3UXkW90AsgCe54OBhNGvSdvSkw/H3LUAw
 n1EtI6sjtyO0p0kUXx4D1pI9SEjV9SkjiW/m3NlsvWnOMPY4Yuu/AJyyImuq6fbnhxHbj+
 YJJk8hbfA+hGnN/HT911lm5kPj3d8zY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-SPvlKsa_MYyWafIWVn9YFg-1; Fri, 21 Apr 2023 09:18:17 -0400
X-MC-Unique: SPvlKsa_MYyWafIWVn9YFg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f19517536eso1941285e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083096; x=1684675096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzvF2DULtypOJobk7Fu9q8xQ/OplwahSBqHm5YJpxN4=;
 b=d3EHFtDPAzAHDNRRQjd3uB3tTRYzvrcPhQqe+epnpV8ZmLKH/JVDc8f88YYCNfgMsw
 z0gPe+VrUE0Ky3CVga1HB5sH5Zg0WwWrJf9D29IcY168xjlSpha9P8s3dvJ8vJnkJY1e
 5i4uHZTIJW/tg2sNVGiS4O9UQRGwufqAFPabr9kXAn7KGN5y1oewrB9KEuDyXdRE0clY
 rDJviu6U6i7BLAwXgTk3GTsC+M/42YRkVtdDDUq+fb1Urxy8FAsewfmRin6g7qQ3iPGs
 do9WwPGBSf0CgUmluHLTQdh7jtXQYRtJQEjtSEXyyQ2Q03q12DLsBei0Wyb+NoFZCZKj
 6G5w==
X-Gm-Message-State: AAQBX9d+gNrIIhIpqW7FSwZ3s3mTbOmajYRkoSSLCybnIzzB7veLArOE
 vyKt97Lb7WEJk8f2Nan4HJ565p+zCbBjyTP7VAR+sSS3YEHUw6pfCnamRwOH1SXFqH7nW6MDgOE
 nIx0Nz4n96OtyBzg=
X-Received: by 2002:adf:f7c5:0:b0:2fb:87f7:3812 with SMTP id
 a5-20020adff7c5000000b002fb87f73812mr3877163wrq.1.1682083096746; 
 Fri, 21 Apr 2023 06:18:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350bMYCB6jVK6cgu1SA5m+Via4XzWTOi3vcBuSbnLEwTdLmsrWPOuGSU4mBxS4ywXDPm4OysxNQ==
X-Received: by 2002:adf:f7c5:0:b0:2fb:87f7:3812 with SMTP id
 a5-20020adff7c5000000b002fb87f73812mr3877143wrq.1.1682083096494; 
 Fri, 21 Apr 2023 06:18:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f79ea6746asm4378571wrq.94.2023.04.21.06.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 06:18:15 -0700 (PDT)
Message-ID: <aaa99094-9cf0-3f6c-c6bb-efc8c317aa16@redhat.com>
Date: Fri, 21 Apr 2023 15:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230421110345.1294131-1-thuth@redhat.com>
 <87ttx9bck6.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87ttx9bck6.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 15.16, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
>> See the patch description of the second patch for details.
>> Also add the test to the MAINTAINERS file (third patch).
>>
>> Thomas Huth (3):
>>    tests/avocado: Make ssh_command_output_contains() globally available
>>    tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
>>    MAINTAINERS: Cover tests/avocado/machine_aspeed.py
>>
>>   MAINTAINERS                            |  2 +-
>>   tests/avocado/avocado_qemu/__init__.py |  8 +++++++
>>   tests/avocado/linux_ssh_mips_malta.py  |  8 -------
>>   tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
>>   4 files changed, 27 insertions(+), 22 deletions(-)
> 
> Queued to testing/next, thanks.

Thanks, but could you please remove that "self.log.info('going to starrt 
*******')" line in the second patch? That was a debugging left-over...

  Thomas



