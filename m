Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4AE2688A1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 11:39:10 +0200 (CEST)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHkx3-0005Qo-Od
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 05:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHkvD-0003Ul-6e
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 05:37:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHkvB-0002vC-Et
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 05:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600076232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=e+LceTluk9JR3JdXIQD5mYK3KfB+wrhz6ZU0SgmnCrU=;
 b=jL6KB30IxIR1YNFgEjUfSatL3xnGp7bzev41lL16PEydBkGDQhcC6kVap2Vug4ob5Zziou
 x2JmAAVgBtVkK7T/9pqTM7MFu692GjRD0XfW0+df2EtBY4feJcpb2g9yScS+hd0ZU9GljD
 xLV/Nfhv55tn/S90UCQufwstjXjm5rc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-FiLi-LVVM_WW-15HJHjPRA-1; Mon, 14 Sep 2020 05:37:10 -0400
X-MC-Unique: FiLi-LVVM_WW-15HJHjPRA-1
Received: by mail-wr1-f69.google.com with SMTP id f18so6672593wrv.19
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 02:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e+LceTluk9JR3JdXIQD5mYK3KfB+wrhz6ZU0SgmnCrU=;
 b=JSAq/COAYAUWz6fhN1KV7xRxtFPynWmuqfxRngywvYQgN3eYEzfYSSgehEOk2BLtPC
 NhFm5JKWIb27JvKDdsrPsVsSvJswA/8lJp2B0XcSpdLueSIoHLT+IvNYdkhjSij3ECVN
 Tj9pKjqDGHb2goB+EP0UdP3Sd/VUnoWZzNK5G6jNnr8MstQmccbiNzhRxSWTEmoxnUU6
 ZQtV6LBc4K2rO7nOtFDKuarEC0CeMYF2saWLCcNBCeZC7taDUXFyKSwDMMMy9vT78RVw
 H38b4QntP6QFGtCmczmcO42BtmtlniB8k22nE5z2+iIeNsSu1+cUADKkneHbWqDVGwVO
 Pu4w==
X-Gm-Message-State: AOAM533rU39hFSD8OzGHE9QAlv/zAWsb0QHLMMc7wDtbLEZTid6UUDD/
 sAic3lBoSNIzD7xpOfSabpVkt659yh3XRDqTz9uknwdBToDo+2KqY0fOKENaeCVDbb1Zu+RgOYd
 NzQKNG6io0g02KXA=
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr14801626wrp.310.1600076229780; 
 Mon, 14 Sep 2020 02:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuICA+v3+pYlJ3G13o969Iihi4eN2ZUzLtMZTHQjC/e7b4qYfsWMA6G/TpCzKaSDEwD+Fgug==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr14801606wrp.310.1600076229599; 
 Mon, 14 Sep 2020 02:37:09 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id m2sm11004723wrq.25.2020.09.14.02.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 02:37:09 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] qapi: Restrict LostTickPolicy enum to machine code
To: Markus Armbruster <armbru@redhat.com>
References: <20200913195348.1064154-1-philmd@redhat.com>
 <20200913195348.1064154-2-philmd@redhat.com>
 <871rj4u3ct.fsf@dusky.pond.sub.org>
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
Message-ID: <d80894ba-9958-48e6-33cc-6356474fc2b7@redhat.com>
Date: Mon, 14 Sep 2020 11:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <871rj4u3ct.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Laurent + qemu-block@

On 9/14/20 11:14 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Unlike the other patches that move code out of misc.json, this one
> doesn't say "allows pulling less declarations/definitions to user-mode."
> Intentional?

TBH I don't remember as this is 6months old.

IIUC the "tick lost" feature is only meaningful when running
virtualized with a RTC profile, so this is pointless for
user-mode binaries and tools.


