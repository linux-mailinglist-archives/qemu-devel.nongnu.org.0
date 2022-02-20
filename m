Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7A4BCEA6
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 14:32:37 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLmKI-0001ja-LS
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 08:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nLmFI-0000Ni-SZ
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 08:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nLmFD-0002Kc-St
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 08:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645363638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdL9xR+Bzt/OU8HiwAueUN2/jiArWHEp+TZGaxHaEJY=;
 b=J8HYlfSej77xNHmBq/grNafyiu7NQefkekazxNcqp9866qo9b24I52hYfPHfPtS3SxS+Al
 Ni1o4fZk7Zie0oBCYeBIUzS4etOOcMIRNbM0fPG859eGorerN5YXsCHvIwZZX4vPxUNWh+
 5HXn5e0zbMqS6sCAXg6thWTC7Q4g0DU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-8MDKzPEBPfe2Zrp2CNDWjg-1; Sun, 20 Feb 2022 08:27:15 -0500
X-MC-Unique: 8MDKzPEBPfe2Zrp2CNDWjg-1
Received: by mail-ed1-f71.google.com with SMTP id
 j9-20020a056402238900b004128085d906so7719665eda.19
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 05:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=EdL9xR+Bzt/OU8HiwAueUN2/jiArWHEp+TZGaxHaEJY=;
 b=1muyrArYCt87+MtDYJLW26qtK4jumw1cISgkL20u+QDtk2WxRijmHbSD4eY+lBDPBm
 GKNjLG9j8bWYj6Bf72LOZKFPXlYGEL81m8sEpLocLPLPJyDb2j0fj64puFNVseU8m67x
 nL66mjPjxFYy/fgFV+aOvgO2GvqUZTDAUhGYKZtAq7nuNpeSOpzIkjSWaT6G7assvFjW
 cUX6igIe901Nwl2XSgx3iEomzdPVMIoB5CD8lLqtYg2DCKik4lz/ByvyKKjzMOEZ/c56
 1jIPCj8w7tAQG9c1g/9k7TE7CNuxMcGYJksZthmJGLjdvMPi5HWOGULfU1HfCX8100NT
 NXwQ==
X-Gm-Message-State: AOAM5333Vc1yMuGAXabPNAgt4rO7MbfKfE7ZUd1WAGSVnD5Bz6HLDWld
 WYFV7RjhL49bKEYHS+YZFA1TxR3NypgZ+/wkGKPCqJ+kpaUYZs5p2X3lste6bIMXZ9wlp9StVrL
 mHDsedrU46dfjAc4=
X-Received: by 2002:a17:906:b04:b0:6bd:bf71:ed08 with SMTP id
 u4-20020a1709060b0400b006bdbf71ed08mr12928517ejg.585.1645363634572; 
 Sun, 20 Feb 2022 05:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWcv8DWe5xnaLWIiam4U8ZmJ1aBhSRo4xc7/SndRf2A/kLZS6Dq/moCYhRuZsMOldtufbKLA==
X-Received: by 2002:a17:906:b04:b0:6bd:bf71:ed08 with SMTP id
 u4-20020a1709060b0400b006bdbf71ed08mr12928499ejg.585.1645363634294; 
 Sun, 20 Feb 2022 05:27:14 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id eg42sm5389708edb.79.2022.02.20.05.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 05:27:13 -0800 (PST)
Message-ID: <2c539a17-2bd4-e08b-657e-23fc226c236f@redhat.com>
Date: Sun, 20 Feb 2022 14:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
From: Paolo Bonzini <pbonzini@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
 <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
In-Reply-To: <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/20/22 09:27, Paolo Bonzini wrote:
> On 2/18/22 15:49, Jag Raman wrote:
>>
>> Concerning the generated files, I see the following in 
>> CMakeMesonToolchainFile.cmake:
>> Without patch: set(CMAKE_C_COMPILER 
>> "/opt/rh/devtoolset-9/root/usr/bin/cc" "-m64" "-mcx16”)
>> With patch: set(CMAKE_C_COMPILER "cc" "-m64" "-mcx16")
> 
> I don't understand why it works at all with the latter, but the right 
> solution
> could be
> 
> set(CMAKE_C_COMPILER "/opt/rh/devtoolset-9/root/usr/bin/cc")
> set(CMAKE_C_COMPILER_ARG1 "-m64")
> set(CMAKE_C_COMPILER_ARG2 "-mcx16")

Anyhow it seems to be a cmake bug, because what QEMU/Meson are doing is 
exactly what is in the manual at 
https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER.html#variable:CMAKE_%3CLANG%3E_COMPILER:

   Note: Options that are required to make the compiler work correctly
   can be included as items in a list; they can not be changed.

   #set within user supplied toolchain file
   set(CMAKE_C_COMPILER /full/path/to/qcc --arg1 --arg2)

Paolo


