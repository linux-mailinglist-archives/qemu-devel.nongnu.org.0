Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412A952525E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:21:32 +0200 (CEST)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBZC-0000YH-Pg
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1npBE8-0007el-3R
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1npBE5-0007ba-NY
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652371179;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7JgpV4JymVwV3EaSU+GdS9EfpLe4SulQYBIM64t4ZA=;
 b=P7o386JEp32h9IRf6lMPmF+XOO2GMwSgZB+tfeCx+L06hCQRUqjANuEWKONqUyYUerMnrf
 zMkCysjiLDIJ4C2aFJ/OJOrSkyCAH6Zzug3GhpLO2LiSLOcai5sIXRzl8+akI4hKFm9CdY
 fOLSqSsGIhBQX6hvdbk84K8aL7g3EI0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-HiTeOSmvM6e5gpHx7yriiQ-1; Thu, 12 May 2022 11:59:38 -0400
X-MC-Unique: HiTeOSmvM6e5gpHx7yriiQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 t25-20020a05622a181900b002f3b32a6e30so4124042qtc.11
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U7JgpV4JymVwV3EaSU+GdS9EfpLe4SulQYBIM64t4ZA=;
 b=VcxHd8oTGUvxkAHaA4/a4uHrWfRSUDm7luhjDJrsgK5cjudqYg3SXVTH0gxpPK2wxH
 WOd/AZ4Q6ejhwBbZclePReVsbtUyCf0YM8PMGyZo9XGU2cJsXg/vjmZ6mGzBmHgIzY07
 ufLTajg/TTPHf/9ZU1EG4zp6OcTli0CNnrmLDCIoSYaTXbIE34lTczszMe93TeZvaYb8
 0FirBnFPuF9CXia5/8ONuKsLZvvIoRTT/aZxx+MAsmY8gq7BjgmRocZCOb8Zz+BrHE/E
 mrniXf6cwu0be9f6t5V4pKA3NVUd6iGo8Vt4mtSQUlw4p81xZxd8Iysn4w3gCc2mJeNO
 XIoA==
X-Gm-Message-State: AOAM533RcxcVvlDi7XdWABaFQ9zg2LDJL6IOkmRe7Y7n0fOBL9wR7XhI
 /+V7efRmSqFilhedwTGcglEEoPh1mIJ0AfaiFZWi0dPByL8qH1LuB1bFSOoOQ6PatEoAWi1yzLi
 M5WfrZ88T/sFs5ZY=
X-Received: by 2002:a05:6214:c87:b0:45a:b06d:d8cf with SMTP id
 r7-20020a0562140c8700b0045ab06dd8cfmr617591qvr.3.1652371178196; 
 Thu, 12 May 2022 08:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzliWj1KCANYsm1dcHdtOQOyeaLhU16ADxQajnNHIwatOS9poDyMrFmfyMoLNbsuSKCeMktnw==
X-Received: by 2002:a05:6214:c87:b0:45a:b06d:d8cf with SMTP id
 r7-20020a0562140c8700b0045ab06dd8cfmr617579qvr.3.1652371178002; 
 Thu, 12 May 2022 08:59:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n80-20020a37a453000000b006a034e7b633sm3137156qke.3.2022.05.12.08.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 08:59:37 -0700 (PDT)
Message-ID: <52bdff5a-f33a-c76b-0e04-b20970e3ec1d@redhat.com>
Date: Thu, 12 May 2022 17:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 10/10] test: tpm-tis: Add Sysbus TPM-TIS device test
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20200305165149.618-1-eric.auger@redhat.com>
 <20200305165149.618-11-eric.auger@redhat.com>
 <CAFEAcA8pC4RQ3oVVVzG4NA8fBkhzspxD+DyZB+UCn7u1aPSP5A@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8pC4RQ3oVVVzG4NA8fBkhzspxD+DyZB+UCn7u1aPSP5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 5/12/22 15:08, Peter Maydell wrote:
> On Thu, 5 Mar 2020 at 16:52, Eric Auger <eric.auger@redhat.com> wrote:
>> The tests themselves are the same as the ISA device ones.
>> Only the main() changes as the "tpm-tis-device" device gets
>> instantiated. Also the base address of the device is not
>> 0xFED40000 anymore but matches the base address of the
>> ARM virt platform bus.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Hi Eric; the commit adding this test is from back in 2020, but I've
> just noticed something a bit odd about it:
>
>> +    args = g_strdup_printf(
>> +        "-machine virt,gic-version=max -accel tcg "
>> +        "-chardev socket,id=chr,path=%s "
>> +        "-tpmdev emulator,id=dev,chardev=chr "
>> +        "-device tpm-tis-device,tpmdev=dev",
>> +        test.addr->u.q_unix.path);
> This 'virt' command line doesn't specify a CPU type, so it
> will end up running with a Cortex-A15 (32-bit). Was
> that intended? Also, it will get a GICv3, which is a
> definitely odd combination with an A15, which was a GICv2 CPU...
no it is not intended. I guess it should include "-cpu max" too
as arm-cpu-features.c does?
>
> I noticed this because I have some recent GICv3 patches which
> end up asserting if the GICv3 and a non-GICv3 CPU are used together,
> and this test case triggers them. Since the user can also cause
> an assert with that kind of command line I'm going to rework them
> (either to make the virt board fail cleanly or else to make the
> GICv3 code do something plausible even if the real hardware CPU
> nominally didn't have a GICv3). But maybe we should make this
> test case not use a non-standard combination anyway? (The meson
> conversion seems to have resulted in this test being run under
> qemu-system-arm as well, incidentally, so I guess we would want
> it to specify either 'a 64 bit CPU and GICv3' or 'a 32 bit
> CPU and GICv2' accordingly. Or limit the test to aarch64...)
limiting the test to aarch64 may be enough?

Eric
>
> thanks
> -- PMM
>


