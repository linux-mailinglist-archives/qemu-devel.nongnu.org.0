Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A07A4C3418
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:55:12 +0100 (CET)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIKd-0005iJ-G4
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNIIA-00035h-13
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:52:38 -0500
Received: from [2a00:1450:4864:20::636] (port=42688
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNII8-0003bV-4q
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:52:37 -0500
Received: by mail-ej1-x636.google.com with SMTP id hw13so5971574ejc.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 09:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zPndQMxyoAt+S5bcmFnd0knyrIPwgQKwrOBDFXWSZp0=;
 b=obVGKaK8K/zmN+7lDqB5Q7MTOiRxU8mP+WPXchpJhY2QgPRj7sSn3GnBVIa2Ifc6lH
 dHyNCAVJ9U1benkZbgUPArL7+LdmA+Ml1WQfLCLCjQrJ9pYhDu5zZ4KB9j1Jo1vJO0r9
 q3GRuSdA29DCBnAhjtmwTzDuJvb5V9fHUKluQ3dgSmZ+4O7IzueEj39KXKmAZA7nAK/Q
 L9YQEfq9MbyD1l9keSv19Uo64W5ORN2fXdRCRLDeYmi1/tRzeT0mmotPVixQ8DAT8dy2
 jPHKINx5KeGZ4zO2VBrA/oC7SEOK321B/X1T6yk8HGgPTUhDoaMRSnfgH+8HdaL/bKo+
 C6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zPndQMxyoAt+S5bcmFnd0knyrIPwgQKwrOBDFXWSZp0=;
 b=E/KsT5i3B6PWIq6TloZlYXOzUXujrArCgBhm7JGnHZIjGRSQ8Y6+HN+RQUejI9jY9x
 KbJ9vE88fPVzPnHOju0RvY/CFWGnoVrToHUt26lKZLHZD02FJSBZCd9Nte4Ww3q/XBAU
 E4wIJeRIqCSNxjH2GnX6XIi5rYxkhHY8SvHybRiLBH0EC+hGjSN7fZK9tFG8v9Zz5LOn
 s3DsNjSi8N06L1I0zx1i1/Jzk3+/m4MyO5K5cdcg1zxgR101fctsjCpTXYnEAO6FniIP
 /71NDF7gun+wopMVhhg+Sby8GhrQhU7+VSCdHiCPO9x3Kx2Sou2cTN8SsZqZXf7aRtLe
 W9mA==
X-Gm-Message-State: AOAM532MOBRYlntagguS4SpwxwJAcaHjZljPYmBwZGs2SKnDcxN/uniU
 zueR3w9z/DyLec9G1YfYWu4=
X-Google-Smtp-Source: ABdhPJyigKePvjC9dtGSha92ITMYtrKrW2crQhvHPI/TLAoJ5Q9g8Op0tDQ/6MndHS+V5T3SPQSF8A==
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id
 v5-20020a170906b00500b006b48861597bmr3202718ejy.238.1645725154595; 
 Thu, 24 Feb 2022 09:52:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 ci16sm1683126ejb.128.2022.02.24.09.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 09:52:33 -0800 (PST)
Message-ID: <e5e88bcb-6573-709f-5c17-229cde3a0a5f@redhat.com>
Date: Thu, 24 Feb 2022 18:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Content-Language: en-US
To: Jag Raman <jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
 <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
 <FB3E0606-9B09-44B2-BAE0-771BB8E3B3AA@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <FB3E0606-9B09-44B2-BAE0-771BB8E3B3AA@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 20:05, Jag Raman wrote:
>> -            defaults[prefix + 'COMPILER'] = exe_list
>> +            defaults[f'{prefix}COMPILER'] = [exe_list[0]]
>> +            for i in range(1, len(exe_list)):
>> +                defaults[f'{prefix}COMPILER_ARG{i}'] = [exe_list[i]]
>> +
>>              if comp_obj.get_id() == 'clang-cl':
>>                  defaults['CMAKE_LINKER'] = comp_obj.get_linker_exelist()
> This fix works at my end.

Would you please check that -m64 and -mcx16 are passed indeed to the 
compiler?

Paolo

