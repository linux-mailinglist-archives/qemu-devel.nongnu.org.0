Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA29265057
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 22:12:47 +0200 (CEST)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGSw2-0006lY-K6
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 16:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGSvC-0006C3-Ci
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 16:11:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26159
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGSv9-0003Rl-No
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 16:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599768710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7vmBmN4nS51IdUhLvv3qF5v7CRq6rkLmSO7FYnSvxIs=;
 b=GfmHK4y2kZO6xx9ddmTlpiok24HFE+5FlRGbhz4xP9v8mqZQzwpdcWTibDlMKn7JBEGJYZ
 PxGIRuqhtXZHc78zIJmk0H6J+U2MMV+4ANQvW0H/XzoAvNvhopphkhv4eqUTgHz5w2U21e
 RH8XgKbrL/1hZZ1O3QQdo1r4v6UFPbM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-_vkePBXmNhCbFHvQEGJCag-1; Thu, 10 Sep 2020 16:11:45 -0400
X-MC-Unique: _vkePBXmNhCbFHvQEGJCag-1
Received: by mail-wm1-f70.google.com with SMTP id b14so419932wmj.3
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 13:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7vmBmN4nS51IdUhLvv3qF5v7CRq6rkLmSO7FYnSvxIs=;
 b=m8XNRve58Bs+cL12TkTccZ75mQeiFZ51hTYjPxxGJhhmg/iFav5pgweozj+xL9eKIM
 URl+DUAiL636tZ3T5KCc9JWCIT70jZXuLh7wdjXbQV14va4MkUb/WV1V32179lKXXmPt
 K6TZROKSL3GO4tJL6FmdrViuQllK2HdO/NnYTXjAhqqqVzbWyWijNkWeORLuKFrdBgs2
 u/OLhhgYluwco8hRC8+pVDsjZkxGqC5w0XVLDiKuxQ53dOk7SJUpo15XTIwbJUzc3MZF
 QSnwVyoIEj0BaaCPGdAPZutpLp+vXsse0uvzGTTI3Ed2UDKh3/4pcqDrw1dm5Q8BIpob
 Bt/A==
X-Gm-Message-State: AOAM532GiU/gCm+jhjV9baoo+NZIMwX0NIMw219Wu5ZZJmXvHm9llN5N
 L7NYgydlw+hwOa1hO0S+0JHkER0AHzqUArsSOAhNnWPqPxNLkBBxH5vgaAlLqh+2jy8hfOuakTe
 YYzNCYb38nuA9nUs=
X-Received: by 2002:a1c:1dc7:: with SMTP id d190mr1841914wmd.154.1599768704706; 
 Thu, 10 Sep 2020 13:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKB524p8aadNXQM1cfFvpOBFJuL8UqA+ZkCJZPvhpXpgd16Db2Tpx6X92njz86b5eeWKaerQ==
X-Received: by 2002:a1c:1dc7:: with SMTP id d190mr1841901wmd.154.1599768704501; 
 Thu, 10 Sep 2020 13:11:44 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id f126sm5201373wmf.13.2020.09.10.13.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:11:43 -0700 (PDT)
Subject: Re: [PATCH 00/77] Patch Round-up for stable 5.0.1, freeze on
 2020-09-10
To: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
 <70866614-8053-4a87-b3a6-c7448dcff56f@redhat.com>
 <159976179054.29065.10842850828338907813@sif>
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
Message-ID: <1e81d87f-abe6-cc43-13c3-177a56908839@redhat.com>
Date: Thu, 10 Sep 2020 22:11:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159976179054.29065.10842850828338907813@sif>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 09:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/20 8:16 PM, Michael Roth wrote:
> Quoting Philippe Mathieu-Daudé (2020-09-04 04:20:00)
>> On 9/3/20 10:58 PM, Michael Roth wrote:
>>> Hi everyone,
>>>
>>> The following new patches are queued for QEMU stable v5.0.1:
>>>
>>>   https://github.com/mdroth/qemu/commits/stable-5.0-staging
>>>
>>> Patch freeze is 2020-09-10, and the release is planned for 2020-09-15:
>>>
>>>   https://wiki.qemu.org/Planning/5.0
>>>
>>> Please respond here or CC qemu-stable@nongnu.org on any additional patches
>>> you think should be included in the release.
>>
>> Candidates:
>>
>> b638627c723 ("hw/sd: Fix incorrect populated function switch status data
>> structure")
> 
> I get the following breakage with this patch applied, and also see the
> error upstream

>> 6d2d4069c47 ("hw/sd: Correct the maximum size of a Standard Capacity SD
>> Memory Card")

^ the 2nd one is OK for stable.


