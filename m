Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF220CF3E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 16:47:04 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpv3n-0008Ii-4r
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 10:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpv2N-00076y-NQ
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 10:45:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47837
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpv2L-0001uQ-5m
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 10:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593441932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=a7fecLKRKzupDlyHgNg0hIBsW9MUZ8EVKSi+Yu2PhVs=;
 b=CLexVHi3ktV0MlNMQpX0evjTG6JhAwmYkKTEiLaWsrS10o4cZajyQsVDpj1/3PfI/ZgLB6
 obFGoiZNa1DsMSZpM/voXUeFD9gQE7O6HCb51otwVbXUAH/U2a7G14umzvxUXngUboIh0X
 1564H0LM2FmQRsCjoD72acnbasusNZc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-0jMN3RrcOf6dOodMg4Kn_g-1; Mon, 29 Jun 2020 10:45:26 -0400
X-MC-Unique: 0jMN3RrcOf6dOodMg4Kn_g-1
Received: by mail-ej1-f69.google.com with SMTP id lg24so10976213ejb.11
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 07:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=a7fecLKRKzupDlyHgNg0hIBsW9MUZ8EVKSi+Yu2PhVs=;
 b=WelvB+4JOfXDlGb/G5pksO9evAVPSbNv6hos7sPUmftD/mNKdDZVY8EQUpfwsdIfg3
 DTWMx8aYRHXnV/OMpYbh1Ip6bxDk+7aMC0nQ58tyBWA2CGeyhAcrh8zJvovs68utCMc+
 yHmCcebi0WU7JBeef9e+FElag6Rej27jGnZZl56nBqlD5C6z7bb/+STiSj6sMT2QNa/C
 3oBp6phqSHr/zJke08xVD1+ONSAjTF2buMtOM1PRceokq3Q75j6myCDCcU8hrwMnZfhy
 FFNw4k/Qfg5RLNFnY20IjVaz2DoSUC7EKXfUP9Dk/+YfXCUUb+00UNk002ddtTx/e6T1
 5ORg==
X-Gm-Message-State: AOAM531U0Iy8znTd+8nZkBnhV9nziUk2o2w7kxlamgYBDkFHNmOgkEDa
 jOfr2cJA0E5Kk26W+zW6dc6NYXRpYAXgjEoqGBQEcIZYBBGZ0Lv42MyIGcjrE8LOHkwcYHWH+f8
 Ahj5Er6zNltIW7Nw=
X-Received: by 2002:a17:906:a1cc:: with SMTP id
 bx12mr13771165ejb.461.1593441925475; 
 Mon, 29 Jun 2020 07:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgRfsScp2FhblNxVUgz5dNvuRzMMvI5as090uRx0eRqsaCWAFu9mruS5RnX6+qT2aoNWU4vw==
X-Received: by 2002:a17:906:a1cc:: with SMTP id
 bx12mr13771148ejb.461.1593441925300; 
 Mon, 29 Jun 2020 07:45:25 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id t21sm19188162ejr.68.2020.06.29.07.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 07:45:24 -0700 (PDT)
Subject: Re: [PATCH v1 12/18] tests/vm: allow us to take advantage of MTTCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200622143204.12921-1-alex.bennee@linaro.org>
 <20200622143204.12921-13-alex.bennee@linaro.org>
 <3ab77b68-9f5d-6b99-e226-df4abb186add@linaro.org> <87bll2rl35.fsf@linaro.org>
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
Message-ID: <7cd0d2c8-4e3a-2c73-47d3-57f05a3fef2d@redhat.com>
Date: Mon, 29 Jun 2020 16:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87bll2rl35.fsf@linaro.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:37:37
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/20 4:41 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/22/20 7:31 AM, Alex Bennée wrote:
>>>          if kvm_available(vmcls.arch):
>>>              return multiprocessing.cpu_count() // 2
>>> +        elif os.uname().machine == "x86_64" and \
>>> +             vmcls.arch in ["aarch64", "x86_64", "i386"]:
>>> +            # MTTCG is available on these arches and we can allow more cores.
>>> +            # But only up to a reasonable limit. User can always override
>>> +            # these limits with --jobs.
>>> +            return min(multiprocessing.cpu_count() // 2, 8)
>>>          else:
>>
>> And if multiprocessing.cpu_count() == 1?
>> Seems like we should add max(count, 1) as well.
> 
> As it also affects KVM:
> 
>     def get_default_jobs():
>         if multiprocessing.cpu_count > 1:
>             if kvm_available(vmcls.arch):
>                 return multiprocessing.cpu_count() // 2
>             elif os.uname().machine == "x86_64" and \
>                  vmcls.arch in ["aarch64", "x86_64", "i386"]:
>                 # MTTCG is available on these arches and we can allow more cores.
>                 # But only up to a reasonable limit. User can always override
>                 # these limits with --jobs.
>                 return min(multiprocessing.cpu_count() // 2, 8)
>         else:
>             return 1

For this hunk:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> 
>>
>>
>> r~
> 
> 


