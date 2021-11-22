Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C745963F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 21:48:09 +0100 (CET)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpGER-0008Jb-Vz
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 15:48:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpGCv-0007Qf-TG
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 15:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpGCr-0000F3-TB
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 15:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637613989;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3W+AwtR3FDj8lNUStc9QYpxEsslpZdlkvWuQwCPtt1A=;
 b=K/QXDnjME/6JFs+tUY505e7M1XBBJJaO1U2hyixm+FJGmL7kFP6cMPifEk2AD/dBF5KLss
 ZnRzcdRcLzoXGoyPh7DvDsQ/BT+lvNkAF1WJSqnByPD9Htk0zw6iFoBWFoqgUrgqErhUor
 kBkEO8Y7YSFkiP00TvR54GbNvKvctF0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-wSW4NxM5PxmtlAlz_a9AAg-1; Mon, 22 Nov 2021 15:46:26 -0500
X-MC-Unique: wSW4NxM5PxmtlAlz_a9AAg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a2-20020a5d4d42000000b0017b3bcf41b9so3347044wru.23
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 12:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3W+AwtR3FDj8lNUStc9QYpxEsslpZdlkvWuQwCPtt1A=;
 b=ykFKt+kJyVsdzkoS9Tdpkh/Kpd693INEajt1biIR2EEyC7MScTyEWm4e+5WVvUr0tu
 FLyAxmXUU0TqNsGDPOeOHbo16rrAM2Enq2FFFe1FBh7ZgS1GfgW1ThUPi2cydVBHpGE7
 drOXquGuUCviIwBETFID4THre/t3pmJ3sscmfmDZXuM43p8Tmyi1hvUzJICGsJML58Ak
 DvIqfTuDKRuDDvEv4B7BR0xZ3mg0RPQEipoP6mThz3qq7vKqg5pKe7VZlRQ5+2urc1N8
 sbywX/cFr8vMCbI4rAjNjvwyA52VpX1F7pl3KI55REMgr4d9ONXWta763Tz5BR2aCnC3
 CfeQ==
X-Gm-Message-State: AOAM532iiY+HdcRBUoevpXUa6ajUwbo5CS1mgPkCpZxDR6IBci+dqtIA
 Swi/0keQ5voqfR5IlpfpLHqWIe+L0a2JOKOPpnCoyp1XRcd6BVaJibhSeZzmKe9TdFmo02NKLMR
 u/Wl3XSkcBcsYA20=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr26919wru.89.1637613984944;
 Mon, 22 Nov 2021 12:46:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxDGJ4DiNBeYKcQZvLrKHbcbHwS2ZRwiHs5PA0M1ygJQZ2Z7YqssEnxRtPVn1gy2O3HCgBVg==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr26861wru.89.1637613984576;
 Mon, 22 Nov 2021 12:46:24 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r15sm21677478wmh.13.2021.11.22.12.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 12:46:23 -0800 (PST)
Subject: Re: [PATCH for-6.2] hw/intc/arm_gicv3_its: Revert version increments
 in vmstate_its
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211122171020.1195483-1-eric.auger@redhat.com>
 <CAFEAcA-g9yjdO24cs+FSD0tp-Sw=RMe5_v0aVyFfWbY8zZp=Sw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <dfe31c68-4e91-a18e-c691-fa8c5e39074d@redhat.com>
Date: Mon, 22 Nov 2021 21:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-g9yjdO24cs+FSD0tp-Sw=RMe5_v0aVyFfWbY8zZp=Sw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: drjones@redhat.com, shashi.mallela@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 11/22/21 7:04 PM, Peter Maydell wrote:
> On Mon, 22 Nov 2021 at 17:10, Eric Auger <eric.auger@redhat.com> wrote:
>> Commit 18f6290a6a ("hw/intc: GICv3 ITS initial framework")
>> incremented version_id and minimum_version_id fields of
>> VMStateDescription vmstate_its. This breaks the migration between
>> 6.2 and 6.1 with the following message:
>>
>> qemu-system-aarch64: savevm: unsupported version 1 for 'arm_gicv3_its' v0
>> qemu-system-aarch64: load of migration failed: Invalid argument
>>
>> Revert that change.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/intc/arm_gicv3_its_common.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
>> index 7d7f3882e76..90b85f1e25c 100644
>> --- a/hw/intc/arm_gicv3_its_common.c
>> +++ b/hw/intc/arm_gicv3_its_common.c
>> @@ -50,8 +50,6 @@ static int gicv3_its_post_load(void *opaque, int version_id)
>>
>>  static const VMStateDescription vmstate_its = {
>>      .name = "arm_gicv3_its",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>>      .pre_save = gicv3_its_pre_save,
>>      .post_load = gicv3_its_post_load,
>>      .priority = MIG_PRI_GICV3_ITS,
> Oops, I didn't notice that the version bump lines were still
> in the patchset I applied :-(

No problem. I did not notice either ;-)

Thanks!

Eric
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> -- PMM
>


