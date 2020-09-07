Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C243A25F685
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 11:33:33 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFDWm-0001XU-Rt
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 05:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFDVc-0000eS-D7
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 05:32:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54644
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFDVa-0004Ol-Nd
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 05:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599471138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dpRQsQnbcFuV3Z6yhtDM0D79Wk7MQ1Z95/+6JYTlyNQ=;
 b=EkOpz1zeFEuVUrdfYDUYAn0FNCjkmCnyP6Gmgzcqy/7Cfvk2GQYTogY9HZtVD+xcnEwGGl
 UQpZGzQ9m2+mIu/orN9KyopKrXj087XHpsakhkYpfFfai+uf9rv0KxBnq9/uKZv+tZy7tS
 In1Dj3qBmXJE3mxJ3lU0eM2DHNM2t2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-iMjmxlkUP8KS-VLotqDjZQ-1; Mon, 07 Sep 2020 05:32:14 -0400
X-MC-Unique: iMjmxlkUP8KS-VLotqDjZQ-1
Received: by mail-wr1-f71.google.com with SMTP id i10so5494946wrq.5
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 02:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpRQsQnbcFuV3Z6yhtDM0D79Wk7MQ1Z95/+6JYTlyNQ=;
 b=R2JEtuEMXd9nzXq7Q4FOV1oFB7o6HA2tQL9klk16ctYBTTxbPDeb41TPOFKtdIj773
 B4YOefP4tSyhMwJ9Rt22ya6vzHmFv1eF0T7kkY2/XGKPwep7vC7hxMyDh3FcB1mUtsy5
 m3wEEGwv33RV1juCqKK4gRf+fVT5cBGRqTQDjT/rd77pNlQ1AFBhofUJVgP1F/+K9Hst
 8hxP59siokCPx6e6nUOcIYfuAVqmqjpB8RVui8KIq7JW9edXb312a7IIzpbjyzGdeTcf
 Dv/Txx3YrO8pvFstcfCwmnlDtCSO9iQIxEFhxOCI+lkLCYOWWuVNsrktSleo6OWc3cwx
 e1Dg==
X-Gm-Message-State: AOAM530w4NMBmhKfkGByPVsn6J+oqLTIyK/tCLVLdg3qmXmiRhwQANfV
 n/1VUX5g108Gt3166UcQshd6431LpV3pX0g5vnuA1DA5YRxbjOm5c0U2c/y9Hp7I6MiS953YPyO
 0ATqsPc5PU8WwrV0=
X-Received: by 2002:adf:ec90:: with SMTP id z16mr19853878wrn.145.1599471132972; 
 Mon, 07 Sep 2020 02:32:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwivfHerPxk6hJ27w1jHGjIt5/av74phSNan7igMgkwQh6LuzFb1IUkG/QCw03aGzL2qSz6g==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr19853859wrn.145.1599471132766; 
 Mon, 07 Sep 2020 02:32:12 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id y2sm23207676wmg.23.2020.09.07.02.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 02:32:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] qga: add command guest-get-disks
To: =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <cover.1599470071.git.tgolembi@redhat.com>
 <d8573ee72572ba586c285472789243b37527e2b9.1599470071.git.tgolembi@redhat.com>
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
Message-ID: <62742498-b3aa-c810-68c8-6a3c616925ca@redhat.com>
Date: Mon, 7 Sep 2020 11:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d8573ee72572ba586c285472789243b37527e2b9.1599470071.git.tgolembi@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.69, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/20 11:14 AM, Tomáš Golembiovský wrote:
> Add API and stubs for new guest-get-disks command.
> 
> The command guest-get-fsinfo can be used to list information about disks
> and partitions but it is limited only to mounted disks with filesystem.
> This new command should allow listing information about disks of the VM
> regardles whether they are mounted or not. This can be usefull for
> management applications for mapping virtualized devices or pass-through
> devices to device names in the guest OS.
> 
> Signed-off-by: Tomáš Golembiovský <tgolembi@redhat.com>
> ---
>  qga/commands-posix.c |  6 ++++++
>  qga/commands-win32.c |  6 ++++++
>  qga/qapi-schema.json | 29 +++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


