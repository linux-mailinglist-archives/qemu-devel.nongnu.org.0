Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3484F68E390
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWjP-0002iw-Qg; Tue, 07 Feb 2023 17:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPWjO-0002ii-7o; Tue, 07 Feb 2023 17:46:30 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPWjM-0001tq-4T; Tue, 07 Feb 2023 17:46:29 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dr8so46658210ejc.12;
 Tue, 07 Feb 2023 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+st8T/BF6T1vEgVee7KrmZBpJsZ3rPFpsi8sH95cAb0=;
 b=M/pIqa2MieRzE4mMB4kqF29AOdPSi3dp7JBXNoAOPCXQkgftRvzrwppqiDzyOyR2o+
 WvD8iZ2ASQifdWz/+ITUgA8kK3lfgZuHhMzPa/MKNrvjg4IvWRNhTkrCqusxSw4DypON
 l9catCEBqFaoXTVuya0moFq4jPiHcQxL3xuQOheUWSPYzV7MxGZlwg1Uhwn2fTWW8Gci
 7Oe5GqMKyz4AMfmy+3eqxFWi41Vrm7i4GipzGZ7Lvat7BDr37aoqus8B/0BlsNTDIL3U
 hVO7xOrQpxkXOvxzK+oLIBlP9JJ5GhoGG3vLPLnsKb/XWVRem5wY9mxMjNG1nue6A3bO
 yLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+st8T/BF6T1vEgVee7KrmZBpJsZ3rPFpsi8sH95cAb0=;
 b=wvatGoGrmpkvlFUw+pwaYqmecxR/I6lw6TwQG58vc9X8cAOjTamHlsu/GUwyMxFw+1
 KJ9efzK5qXadsg7OMYvx/i9VMUzaSGk7x26I91NxVThfntqHlVjkKNR0UbD0o6xmf1O/
 iEqdK7AYteZwGbL8GDSbj36okDSI9Gt3QOxcXjcA5hlnhzzU1MAfh8BkauWh+Nh0gT1r
 x0aXQvUowxn3kfXqsoVxAyrLvIgegDtvu/3jhJSYkEj/7PUaaqopYGMTJyN8kGnthnTE
 Fyh61wyxOWCozkZSFFBKtctSRjJhGw96fKEs/2GZOzDSsYbX8zOAUrWZSpSdYgl0gdZO
 1K3g==
X-Gm-Message-State: AO0yUKVk0s6aJ+hPmmvJdBXU7+DbVx+Mo7z2P8g1+4FmUOol1B9GCEhw
 iujg+Ox/hq7fp/vz+aDEboA=
X-Google-Smtp-Source: AK7set/osjsX04Orc3jTk3ZAjCaHqoESAlO+Ea94/ODvgppVrBP+mpbdm5QtOJZK3S5l3gJVgLN7vA==
X-Received: by 2002:a17:906:a194:b0:877:a7ec:5ff with SMTP id
 s20-20020a170906a19400b00877a7ec05ffmr5218658ejy.10.1675809986043; 
 Tue, 07 Feb 2023 14:46:26 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-074-246.89.14.pool.telefonica.de.
 [89.14.74.246]) by smtp.gmail.com with ESMTPSA id
 a26-20020a17090640da00b0087851a76573sm7470185ejk.74.2023.02.07.14.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 14:46:25 -0800 (PST)
Date: Tue, 07 Feb 2023 22:46:19 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_9/9=5D_target/i386/tcg/sysemu/?=
 =?US-ASCII?Q?tcg-cpu=3A_Avoid_own_opinion_about_smram_size?=
In-Reply-To: <4aaafceb-848a-c4eb-2a06-0ad37899deb1@linaro.org>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-10-shentey@gmail.com>
 <4aaafceb-848a-c4eb-2a06-0ad37899deb1@linaro.org>
Message-ID: <76428AAD-5BA6-444F-B58D-8F3CA290E189@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 5=2E Februar 2023 11:26:10 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 4/2/23 16:10, Bernhard Beschow wrote:
>> When setting up the CPU's smram memory region alias, the code currently
>> assumes that the smram size is 4 GiB=2E While this is true, it repeats =
a
>> decision made elsewhere which seems redundant and prone to
>> inconsistencies=2E Avoid this by reusing whatever size the smram region
>> was set to=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   target/i386/tcg/sysemu/tcg-cpu=2Ec | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/target/i386/tcg/sysemu/tcg-cpu=2Ec b/target/i386/tcg/sysem=
u/tcg-cpu=2Ec
>> index c223c0fe9b=2E=2E8f5ce6093c 100644
>> --- a/target/i386/tcg/sysemu/tcg-cpu=2Ec
>> +++ b/target/i386/tcg/sysemu/tcg-cpu=2Ec
>> @@ -22,7 +22,6 @@
>>   #include "tcg/helper-tcg=2Eh"
>>     #include "sysemu/sysemu=2Eh"
>> -#include "qemu/units=2Eh"
>>   #include "exec/address-spaces=2Eh"
>>     #include "tcg/tcg-cpu=2Eh"
>> @@ -36,7 +35,7 @@ static void tcg_cpu_machine_done(Notifier *n, void *u=
nused)
>>       if (smram) {
>>           cpu->smram =3D g_new(MemoryRegion, 1);
>>           memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
>> -                                 smram, 0, 4 * GiB);
>> +                                 smram, 0, memory_region_size(smram));
>
>Or define SMRAM_REGION_SIZE and use it?

This could still lead to inconsistencies if the size was changed in one pl=
ace only, no?

>
>(subject header can be shortened to "target/i386:")=2E

Okay=2E

