Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257E1FBC50
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 19:05:33 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlF1g-0007We-HC
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 13:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlF0g-00076k-2a
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 13:04:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25158
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlF0e-0006a5-93
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 13:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592327067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rxg3yOtzUwFduDAthgD6ab3fEzKmpelLiyy0cD+hriE=;
 b=CQSHbaXmKKP5H5ksXxMSb5PgnVyOgJ0EC5hsN47MmszvL+xQPv0qaTDVVZz6w8L8ss5COo
 GRgim/qds2+WhWJOmQYegDH0MkVRKMESF9uYjGkNOyzCNFNGiVrYX7uO7mjbwr6acYRw9S
 uJkM/6J2kCTxITdap3EC7PcsXc7pcPI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-BJsVVUkvORmuVrWZKvUf5Q-1; Tue, 16 Jun 2020 13:04:24 -0400
X-MC-Unique: BJsVVUkvORmuVrWZKvUf5Q-1
Received: by mail-wr1-f72.google.com with SMTP id a4so8465733wrp.5
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 10:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rxg3yOtzUwFduDAthgD6ab3fEzKmpelLiyy0cD+hriE=;
 b=mtxkhE9FcwLdq9f11hpUVtIHVLVaWSN4wh25tjafjc7FLLsFQDlptWyuxokD3E+Me3
 k4yyCWByoQqWa5RbCIw2zSDBiKFEahBuLqpONojIF3Nze4nrNz2UbTgSVSfdcAZRzSfd
 qEVj1Q80il/cycm/dqxlF3vHPsP993AQ/82u64O3hUAgD0rtE2oKjjgdGVhE2Rxe40at
 3OPhE+iKtDXYma0kHqur6PiYtqB2cCZaPzMk3qpOUfHIIgnTaEywJ3KMeUUW/twCgjzl
 +JPZJg00ke2EZXvzNZque/4cRDP4KYrPICPRItCITqXlsXndYfz4Z0cQf4WOSTTSrlSm
 Bgqg==
X-Gm-Message-State: AOAM532X4LlLI2+FMeufzIAmTY8gi8M0J5o7sbigOmskWf+Rzz7IR9/r
 PSVMANzANzGtnZbKuIlollAMF6z0paFEH7gUzPlmsAusAtLnP5ixIpScCjHlUNPq01Uf/1JlNgL
 F3suTUnLmXaACBJU=
X-Received: by 2002:a5d:4204:: with SMTP id n4mr4302078wrq.247.1592327063283; 
 Tue, 16 Jun 2020 10:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS9QGaf0lfmaFJFVc0walXtSzEUqhno/PbW77+ponsNu9B7/StpxCUegFPjb1FDmSsynP67w==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr4302056wrq.247.1592327063077; 
 Tue, 16 Jun 2020 10:04:23 -0700 (PDT)
Received: from [192.168.1.37] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id z9sm4551270wmi.41.2020.06.16.10.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 10:04:22 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add an entry to review Avocado based
 acceptance tests
To: qemu-devel@nongnu.org
References: <20200605165656.17578-1-philmd@redhat.com>
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
Message-ID: <c102b3ea-17ee-4c82-ec3d-0b8a1f44d437@redhat.com>
Date: Tue, 16 Jun 2020 19:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200605165656.17578-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/20 6:56 PM, Philippe Mathieu-Daudé wrote:
> Add an entry for to allow reviewers to be notified when acceptance /
> integration tests are added or modified.
> The designated reviewers are not maintainers, subsystem maintainers
> are expected to merge their tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e7d9cb0a5..c2ae2bf390 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2923,6 +2923,14 @@ S: Maintained
>  F: tests/tcg/Makefile
>  F: tests/tcg/Makefile.include
>  
> +Acceptance (Integration) Testing with the Avocado framework
> +W: https://trello.com/b/6Qi1pxVn/avocado-qemu
> +R: Cleber Rosa <crosa@redhat.com>
> +R: Philippe Mathieu-Daudé <philmd@redhat.com>
> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> +S: Odd Fixes
> +F: tests/acceptance/

Ping...? Please Nack if you don't want to be included.

> +
>  Documentation
>  -------------
>  Build system architecture
> 


