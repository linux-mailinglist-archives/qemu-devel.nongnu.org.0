Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C12FBCCD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:46:40 +0100 (CET)
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1u9P-0007kX-Ty
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1u0C-00009i-PZ; Tue, 19 Jan 2021 11:37:08 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1u0B-0007ew-7t; Tue, 19 Jan 2021 11:37:08 -0500
Received: by mail-ej1-x62e.google.com with SMTP id 6so29404231ejz.5;
 Tue, 19 Jan 2021 08:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UhtHNcErMUku7/zcHa+fQfHdVJYtN0YPU+jqZaPfhXY=;
 b=WWDjWpwNfPa5JBDhgEaW8pZE4ey5KTQttt9eD42IggYXT2Bq8ACVslqlnFY0giWORf
 COFbbpWELuSyGaK7grTwNv17jCsxizzoRa3Bz1ZcOF5U0bnHACX7DLaDj3YGF8htQYEP
 SwMOETyrq7EZsa8+jtkFbil9BmMQj6HkqtD0e3uqi1wop97aRNXwFW5wOJKTayFcV9++
 v88U162mn4LYUp565jDzL/M0zaJjLu9rfLwWWoKgC9k3xgrEtbO3iKG0iTnXiZ2V2kpx
 Djrk9B3+U2uexzqSTg+cLCGwpLI3ycUaVmaSToJ9MgfsK9prg/8ING9kXRNv12UwrAsB
 wZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UhtHNcErMUku7/zcHa+fQfHdVJYtN0YPU+jqZaPfhXY=;
 b=c9zfi43ODkea9NsGSuqfQxPLcoWUTe/qvtzW907K3LmBP6maIJqTPPsz3b/EkFxVS5
 7fO32kuZwrJOr9r/t4nuMMTvh2zUQYC/nl5amgwPlBE40wRb7D4gaAO9gZ9CkZ4aGVSJ
 Fh0mT5K28I3vRKR6Ye2ph7zHlB5V1yQBB48Qm8YWOmwROVgimhH2TBVS3+66556izN5O
 tlDyO7KLFBwAs78n1uKkZCibg5Z/IeCib+iFQlsG6FLKII3mr7jb9rQY9ZA5Lg7m7Z0c
 CZ4MvSzTdOPFUTFRqmtdmbLulbb9lL6pdnT9NzG9kap41FcEMvTqVhl7vc9Dhui2QO2m
 MB/w==
X-Gm-Message-State: AOAM5332M/dXKXnVw5Zjn8g9efhiOB8YxktyvxglWP36wTXgUiCrLadI
 czFaUpVWQiT7t1s7txCOr9M=
X-Google-Smtp-Source: ABdhPJx200oKM1ZyDGZtErLA9KB+OdVoQ/mO+WolkCid49lEXSkbyjfxd0pQwtNL9D06Jam9qoGpLA==
X-Received: by 2002:a17:906:36d4:: with SMTP id
 b20mr3492718ejc.144.1611074225095; 
 Tue, 19 Jan 2021 08:37:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y59sm13043562ede.59.2021.01.19.08.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 08:37:04 -0800 (PST)
Subject: Re: [RFC PATCH v2 01/20] migration/vmstate: Restrict vmstate_dummy to
 user-mode
To: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-2-f4bug@amsat.org>
 <CAFEAcA_358tUe-O9Yb94p=xDXXLTNM8EoQRvwMKEY_bmSTfzJQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <004525a7-e8bb-9316-6ad5-ba5765471639@amsat.org>
Date: Tue, 19 Jan 2021 17:37:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_358tUe-O9Yb94p=xDXXLTNM8EoQRvwMKEY_bmSTfzJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 2:50 PM, Peter Maydell wrote:
> On Sun, 17 Jan 2021 at 19:24, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> 'vmstate_dummy' is special and only used for user-mode. Rename
>> it to something more specific.
>> It was introduced restricted to user-mode in commit c71c3e99b8
>> ("Add a vmstate_dummy struct for CONFIG_USER_ONLY") but this
>> restriction was later removed in commit 6afc14e92ac ("migration:
>> Fix warning caused by missing declaration of vmstate_dummy").
>> Avoid the missing declaration warning by adding a stub for the
>> symbol, and restore the #ifdef'ry.
> 
> So what is the actual use of vmstate_dummy ? I had a grep
> through and as far as I can see the points where vmstate_cpu_common
> is used are all in softmmu-only code.

No clue, maybe simply remnant from unfinished work?

> I tried this patch
> and QEMU seems to compile OK:
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 140fa32a5e3..a827417a4d8 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1131,8 +1131,6 @@ bool target_words_bigendian(void);
> 
>  #ifdef CONFIG_SOFTMMU
>  extern const VMStateDescription vmstate_cpu_common;
> -#else
> -#define vmstate_cpu_common vmstate_dummy
>  #endif
> 
>  #define VMSTATE_CPU() {                                                     \

Great! Maybe even restricting VMSTATE_CPU() to softmmu-only:

-- >8 --
@@ -1131,9 +1131,6 @@ bool target_words_bigendian(void);

 #ifdef CONFIG_SOFTMMU
 extern const VMStateDescription vmstate_cpu_common;
-#else
-#define vmstate_cpu_common vmstate_dummy
-#endif

 #define VMSTATE_CPU() {
     \
     .name = "parent_obj",
     \
@@ -1142,6 +1139,7 @@ extern const VMStateDescription vmstate_cpu_common;
     .flags = VMS_STRUCT,
     \
     .offset = 0,
     \
 }
+#endif

 #endif /* NEED_CPU_H */
---

I'll wait if David/Juan have any comment, else respin based
on your patch.

Thanks,

Phil.

