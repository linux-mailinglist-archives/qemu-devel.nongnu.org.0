Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B508D203E96
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 19:58:41 +0200 (CEST)
Received: from localhost ([::1]:54118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnQiO-0007lo-RX
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 13:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnQhA-0006qe-F7
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 13:57:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43682
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnQh8-0002Ro-1S
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 13:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592848641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KUNTLOIEQg28i2cPiGf3dEdk6QIvKYDn6l3MKevpGq0=;
 b=Kptsenwb9b2JyDZ2o+8QAy09+KtFGFkBLzrAFQqDYZEdepBnQ43MkyJAcPho2XWDIloXZX
 tMZvmVoWJRo7RtHwfuEdb8TybmX0rRcKTKwaGe32eNMAPTDppaZD5oX6FCf02s79P7dOUQ
 hH0n2espuQ6Z9IHPhVw4DeTgL8PbDdc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-ZqA4La1iNam9xSMCnzNKug-1; Mon, 22 Jun 2020 13:57:19 -0400
X-MC-Unique: ZqA4La1iNam9xSMCnzNKug-1
Received: by mail-wm1-f70.google.com with SMTP id 23so258225wmi.4
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 10:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KUNTLOIEQg28i2cPiGf3dEdk6QIvKYDn6l3MKevpGq0=;
 b=Vr1HrjkYLopxuJ5wZbIYvqltnwOnTgp/9zbeHXb9rbBz7spZke4zT6qZM81YzhnO1F
 jqei14gVRXIVK7HWhml6l+bodMAZmqrp+PPC/dM7txHMhkt6Hs6kpH5wA0xQEyNFa//C
 mSdSRf74A1Ct8yem2xooj5c7OjMUw94XW7yJYDV/4kFBNlxAfPxQZbvISniVwq8ueHco
 NcHfFXdxREcTmbK5y/liu5fH9bXYrYCxjt5Qye6B2Auz2ehB3zZ3bweSrF/BCkBHb7ub
 /+JLUaoeNdqoi8qdJrhu8t3M5WJvQe0bAtXllAzX//Rt6ij4TbumNsUtvVOuTbVUfw0U
 YlBw==
X-Gm-Message-State: AOAM530CPW4VTrJ4jGqGoQQHrGSyVTCCZXKHxgQdfBTaP+qxz00v72BK
 3PZ7Mzm/9xV8DTcSY2jGkYXIvzG4akqpaUBK8M7lDta2Pagoji1guHdgZMToQXVf/mzXu/rafbl
 trk2A5Sb1lmSUXFU=
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr3899980wmf.0.1592848638183; 
 Mon, 22 Jun 2020 10:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIpsotOCNhxH6O07emTNEStkCh9yN8Nc0mgFP6A5Jey5/11MsecS6/ZhAyO7MnkgV114CLsA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr3899959wmf.0.1592848637969; 
 Mon, 22 Jun 2020 10:57:17 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v24sm21673688wrd.92.2020.06.22.10.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 10:57:17 -0700 (PDT)
Subject: Re: [PATCH v1 01/18] iotests: Fix 051 output after qdev_init_nofail()
 removal
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20200622143204.12921-1-alex.bennee@linaro.org>
 <20200622143204.12921-2-alex.bennee@linaro.org>
 <9ad1234e-bbb7-9396-21e1-58041cffd847@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <75400a0b-7544-cd45-c4d3-e523a1791263@redhat.com>
Date: Mon, 22 Jun 2020 19:57:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9ad1234e-bbb7-9396-21e1-58041cffd847@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, Max Reitz <mreitz@redhat.com>,
 cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/20 7:52 PM, John Snow wrote:
> 
> 
> On 6/22/20 10:31 AM, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Commit 96927c744 replaced qdev_init_nofail() call by
>> isa_realize_and_unref() which has a different error
>> message. Update the test output accordingly.
>>
>> Gitlab CI error after merging b77b5b3dc7:
>> https://gitlab.com/qemu-project/qemu/-/jobs/597414772#L4375
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20200616154949.6586-1-philmd@redhat.com>
>> ---
>>  tests/qemu-iotests/051.pc.out | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
>> index 0ea80d35f0e..da8ad871876 100644
>> --- a/tests/qemu-iotests/051.pc.out
>> +++ b/tests/qemu-iotests/051.pc.out
>> @@ -142,7 +142,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>  
>>  Testing: -drive if=ide
>>  QEMU X.Y.Z monitor - type 'help' for more information
>> -(qemu) QEMU_PROG: Initialization of device ide-hd failed: Device needs media, but drive is empty
>> +(qemu) QEMU_PROG: Device needs media, but drive is empty
>>  
>>  Testing: -drive if=virtio
>>  QEMU X.Y.Z monitor - type 'help' for more information
>> @@ -214,7 +214,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>  
>>  Testing: -drive file=TEST_DIR/t.qcow2,if=ide,readonly=on
>>  QEMU X.Y.Z monitor - type 'help' for more information
>> -(qemu) QEMU_PROG: Initialization of device ide-hd failed: Block node is read-only
>> +(qemu) QEMU_PROG: Block node is read-only
>>  
>>  Testing: -drive file=TEST_DIR/t.qcow2,if=virtio,readonly=on
>>  QEMU X.Y.Z monitor - type 'help' for more information
>>
> 
> Just ran into this and wrote an identical fix. The error is not in
> 051.out so the pc-only fix appears to be fine.
> 
> Reviewed-by: John Snow <jsnow@redhat.com>

Also:

Reviewed-by: Thomas Huth <thuth@redhat.com>

> 
> (There seem to be other problems with the CI at the moment, but the
> failures I am seeing are not related to this, so I think it's probably fine)
> 


