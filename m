Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94C6321C4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:19:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5ks-0004WR-V4; Mon, 21 Nov 2022 07:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox5kk-0004Un-UK
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:18:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox5ki-0006g6-LM
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669033099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FOGiVvF3QeeV2/MFLjHBlsAgN9lKvTvIkclQR2esbY=;
 b=XC281ahwFifKwH6+JePSNSoVdTICWtKWb60+rSBNuL1vQJN8tfjdY++tda2zRpJSTkiHzu
 /a8q8GbaSCeEHb2zEYzn722bqa2NowYL4CCayKliifFJk8WnF+LPjRbXisjHWPPv3jAwsi
 xG/WB3osm/CLsYq1Nc80A0G1+/FtdNk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-HDaiBc4RNViO87L6Dyudqg-1; Mon, 21 Nov 2022 07:18:18 -0500
X-MC-Unique: HDaiBc4RNViO87L6Dyudqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 t4-20020a056402524400b004620845ba7bso6682586edd.4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FOGiVvF3QeeV2/MFLjHBlsAgN9lKvTvIkclQR2esbY=;
 b=gKrT0TbYIXV+6JMkekeZh2xBWYq3PGLDeXlxpy/YNqkPRQIlWuP01hJuhN1F4MO2Vg
 KEQIWUdzGR1cII76P3PvKm4ct+ZpcFFz17NpaW3w3o/JMbSD2v5XHRT27B4Lgo6LDB5P
 M6VD6Dvoq93xDTXYt2vC1RlvPFhXmky3oPTwgGy+lQwrhpm2NMFGCktfAyf8dC7/Xa+q
 zKbr2P2dmuFvVUl6LCVn6qp4vifapWSKzJdC4XAvXwMVXcCAN8I6M/HmDeZzQJcrYlVn
 EYaKVtacnGgFvWL8qdOziveqdg5bvtFMqY9cEwkUugglJwTQ8JJsH7g7/57bTqXoqC/S
 oYPg==
X-Gm-Message-State: ANoB5pmjuqVoXkoLeS7Dv/HsHCSQQziZARgytKy6pNqDzXkV1drprRqn
 8W4v3ZreX01elXMgIz2VDmUvCavRaVF2f+FkCCTSFt/3/vEZ14hWOgTeqfHMUnqO/MLgQ01wt7R
 CNfrNr1hHnZIHaBg=
X-Received: by 2002:a17:906:68db:b0:7b4:869f:f944 with SMTP id
 y27-20020a17090668db00b007b4869ff944mr5085600ejr.427.1669033097032; 
 Mon, 21 Nov 2022 04:18:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62f8QWyqIF89zlrWdec9tPuiJIMcHoRFna7KY6UmewT+62xwKpn/Z6QBq6JGaxFw6TW1B5DA==
X-Received: by 2002:a17:906:68db:b0:7b4:869f:f944 with SMTP id
 y27-20020a17090668db00b007b4869ff944mr5085581ejr.427.1669033096811; 
 Mon, 21 Nov 2022 04:18:16 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-253.web.vodafone.de.
 [109.43.177.253]) by smtp.gmail.com with ESMTPSA id
 x10-20020a1709064a8a00b0078d3a075525sm4984810eju.56.2022.11.21.04.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:18:16 -0800 (PST)
Message-ID: <8db5bce3-5829-61ea-e3b9-236d2c2f2c6b@redhat.com>
Date: Mon, 21 Nov 2022 13:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/avocado: Update the URLs of the advent calendar
 images
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221121102436.78635-1-thuth@redhat.com>
 <21cfb02a-dec8-3a78-8a7c-e99ac06a090e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <21cfb02a-dec8-3a78-8a7c-e99ac06a090e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/11/2022 12.12, Philippe Mathieu-Daudé wrote:
> On 21/11/22 11:24, Thomas Huth wrote:
>> The qemu-advent-calendar.org server will be decommissioned soon.
>> I've mirrored the images that we use for the QEMU CI to gitlab,
>> so update their URLs to point to the new location.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/avocado/boot_linux_console.py     |  4 +--
>>   tests/avocado/machine_arm_canona1100.py |  4 +--
>>   tests/avocado/machine_microblaze.py     |  4 +--
>>   tests/avocado/machine_sparc64_sun4u.py  |  4 +--
>>   tests/avocado/ppc_mpc8544ds.py          |  6 ++--
>>   tests/avocado/ppc_virtex_ml507.py       |  6 ++--
>>   tests/avocado/replay_kernel.py          | 40 ++++++++++++-------------
>>   7 files changed, 34 insertions(+), 34 deletions(-)
>>
>> diff --git a/tests/avocado/boot_linux_console.py 
>> b/tests/avocado/boot_linux_console.py
>> index 4c9d551f47..f3e6f44ae9 100644
>> --- a/tests/avocado/boot_linux_console.py
>> +++ b/tests/avocado/boot_linux_console.py
>> @@ -1029,8 +1029,8 @@ def test_m68k_q800(self):
>>           self.wait_for_console_pattern(console_pattern)
>>       def do_test_advcal_2018(self, day, tar_hash, kernel_name, console=0):
>> -        tar_url = ('https://www.qemu-advent-calendar.org'
>> -                   '/2018/download/day' + day + '.tar.xz')
>> +        tar_url = ('https://qemu-advcal.gitlab.io'
>> +                   '/qac-best-of-multiarch/download/day' + day + '.tar.xz')
> 
> You could insert the year in the url, so you can eventually add other 
> editions :)

It's a "best-of" edition now - I don't plan any more new editions ;-)

  Thomas


