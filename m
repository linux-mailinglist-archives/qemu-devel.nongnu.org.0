Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC204348BE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:14:29 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8c7-0001Oc-MZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1md8Zv-0008QX-Lt
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:12:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1md8Zt-0000wn-Bn
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634724728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm87A2KM+JzbCLWA5Ua3+fWWo418Dk4cB4BdfOpYIck=;
 b=QGxl+AOTRGaw9H6nU94j2l0x7j426t2Wk5k2RegbeQkiifO2A/efzxB+8UvUWJmJ9+44ma
 uJQ9MdhjxydCRiPZ8dCBM45Z/aYofQoNzLu6AclHAc/+KbJHAWkTcyvNeQ77YarTSRwnzJ
 WhxkeRCjS0g2onGorbr2Yv/ZIBPou18=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-GbQTJ3aQOEGumlBfwYVnKg-1; Wed, 20 Oct 2021 06:12:06 -0400
X-MC-Unique: GbQTJ3aQOEGumlBfwYVnKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 q203-20020a1ca7d4000000b0030dcdcd37c5so10952wme.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pm87A2KM+JzbCLWA5Ua3+fWWo418Dk4cB4BdfOpYIck=;
 b=J+CqbR1042+RTolAZAsFKBDLUFwG+jGiHsn2YoMuVadocS5i8MmhVvmcIl8groDGrz
 egVKe78gLKEx0tErI2BBKScEqGkjnmns+cRlnTWyZqtWoelbfdm0Dj+OxHkGYOxx1cDC
 DBClYavzedIzClZe4fIQcx9lpVz7K5kokVRdLgpeHnCyFMDuQMdVUFYNOjULrCYOl8Zs
 RclNxEBU3zHCmyNanNVYdpBkweDKkKmWTsTNUHDuJwgFByxLJ8rILt7XItN+e/hQyJtD
 sEYfGepzUAG55wCxKzhyi2gnUbDEFJmqR7ciTdt8urUdHZ0a3H1VddyWEr+BXjnXxpJg
 9GlA==
X-Gm-Message-State: AOAM532IQ9lmIHDl2xaLgkF4aqXdt+7Ofr8uQbHv0USiu+q+kWph2jIK
 pXrDxIrSWBoOeCYzVnZqE2Ugr+kjCvfXrCjMu/kXb2SWykbEx8WWRTqc9T1mq1Hy4O47PptapoF
 w9j2wLAL1KvAJdqw=
X-Received: by 2002:a5d:4ec9:: with SMTP id s9mr36287225wrv.225.1634724725772; 
 Wed, 20 Oct 2021 03:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw4rQtL0bOk4kklc3veGP3EnKwHmgDnU7JIhIcfvWB4KymcmzwDpyYX2+2tNYw7dUTsfYoMg==
X-Received: by 2002:a5d:4ec9:: with SMTP id s9mr36287182wrv.225.1634724725533; 
 Wed, 20 Oct 2021 03:12:05 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id l2sm1569020wrw.42.2021.10.20.03.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:12:05 -0700 (PDT)
Message-ID: <054c5b53-84ab-370f-8806-5f54265e8d3e@redhat.com>
Date: Wed, 20 Oct 2021 12:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: CLI: Using -bios AND -kernel
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John / Paolo / Markus,

On 10/19/21 12:07, BALATON Zoltan wrote:
> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>> Le 19/10/2021 à 11:39, Thomas Huth a écrit :
>>> On 19/10/2021 11.31, Christophe Leroy wrote:
[...]
>> I use the following command, but it does nothing, it stays in uboot
>> prompt as when I don't get a kernel argument
>>
>>     ~/qemu/build/qemu-system-ppc -M taihu -bios
>> ~/Téléchargements/u-boot.bin -serial null -serial mon:stdio -kernel
>> arch/powerpc/boot/uImage
> 
> I'm not sure using -bios and -kernel together makes sense, it probably
> starts u-boot in this case and you have to load and start the kernel
> from u-boot as you'd notmally do on a real machine. Alternatively you
> could use -kernel instead of -bios which then loads a kernel and starts
> it directly but not sure if it needs a firmware to work.
> 
> Ot I could be completely wrong as I don't know this machine and haven't
> tried it.

Usually -bios overwrites -kernel/-append cmdline options.
Having them accepted together is probably a configuration mistake,
and we should reject that (generically).

You guys have been working on the CLI recently, is there an easy
way to not allow such combination?

Thanks,

Phil.


