Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB167274289
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 14:59:29 +0200 (CEST)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKhtI-0004B7-Kr
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kKhri-0003Ui-BC
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 08:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kKhrg-0003rX-PU
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 08:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600779467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9e9gdM/RO5QT1g5sd0Ddv5I5Tn3yh1MJdEU6PbBxM1c=;
 b=g04ZQtdTriqU1bUV+25lWrB1aMP2MPczLZ0zQ3JyocpWf7RfekKyQp53K43Cl1YSk2odQd
 DTTtaeCiRzt+59vgc/cDZ6vsx9vSZIDfVulXNRAtIp0wxd5gcbHB5ZSTM0ehXWVuSE+6K3
 I9PLJXzOb9fLnWTKqJiKupn3RQZfA+E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-qqHeXhPvP0qjnAQjFLl5Xg-1; Tue, 22 Sep 2020 08:57:46 -0400
X-MC-Unique: qqHeXhPvP0qjnAQjFLl5Xg-1
Received: by mail-wr1-f71.google.com with SMTP id b7so7383641wrn.6
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 05:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9e9gdM/RO5QT1g5sd0Ddv5I5Tn3yh1MJdEU6PbBxM1c=;
 b=QSSfz67cp4c51dWZjp6ose5WHn62ARJeAk856ao9T8W4YUYB86F9Qw7xKZRzmAooaf
 OuUW/PpY3OpoY/mE3knVW9Fz3qEW3Q01KswoNxuJiECEqSoYTU2eAFkEMFaOEvpyo6tH
 MikuX2RA0O9f/fl6PkJ3anfcLKB0KuQ6TLP9Xya+vG8I3kig+dKRex6/fjvZEvGdtmBi
 QGOyL5h7UTrPxKVcq+yxJM70ox7ZFlCrJMddjGiIQJttAzihoscn+nUmSWtG4zaSSNEt
 1UyWy5KXlY9s/w1MSW7sEP8ViQ4c0kKNPARCGj7XD7oTWMPFFmVEhuf9D5kJ8uQjIIfu
 FrJg==
X-Gm-Message-State: AOAM533GeHGcNFJ3B5cScNq6d3RUS08tYnQmhaC80gH4b/NkYxDMb4c4
 JHyWbXzRzzxV8YaT+8cj6VSP3zjXklPmoFKTl9ze0XCb+7eJqkxI7wgzEsi2W7UM3GKpVnUIRPj
 eWQi8EOee0oaWZM8=
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr5570011wru.363.1600779465204; 
 Tue, 22 Sep 2020 05:57:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzKuG/s3RbqbQrgltjSO9dPki83m22RDRQuOJT4gXHoU3PSVAQcspx0u55hlxmwzm9aB8QOA==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr5569975wru.363.1600779465024; 
 Tue, 22 Sep 2020 05:57:45 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id d5sm28432771wrb.28.2020.09.22.05.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 05:57:44 -0700 (PDT)
Subject: Re: [PATCH v5 01/15] replay: don't record interrupt poll
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <160077693745.10249.9707329107813662236.stgit@pasha-ThinkPad-X280>
 <160077694335.10249.16333420401245362506.stgit@pasha-ThinkPad-X280>
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
Message-ID: <2dfbeaf2-9d4e-ffdf-4206-8d408f35dc29@redhat.com>
Date: Tue, 22 Sep 2020 14:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <160077694335.10249.16333420401245362506.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, ehabkost@redhat.com,
 mtosatti@redhat.com, armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/20 2:15 PM, Pavel Dovgalyuk wrote:
> Interrupt poll is not a real interrupt event. It is needed only for
> thread safety. This interrupt is used for i386 and converted
> to hardware interrupt by cpu_handle_interrupt function.
> Therefore it is not needed to be recorded, because hardware
> interrupt will be recorded after converting.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


