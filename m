Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7077663A2D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9RE-0005Ry-BQ; Tue, 10 Jan 2023 02:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pF9RC-0005Rp-Ih
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pF9RA-0004b8-NE
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673337166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eA+NbxaxxTuJgeI0fEUgABEmzyKkp4Knp3X5sEVvts=;
 b=fWQhw5Hg3cXfZnsTXB5S50aw1t9KzwLrExd0lJcd6NMSE0mKkja1ot2u74VugYTrrNfrw/
 bSTq1whDJKfkW/tvTjUtKLYUXFTID53jf1jNN/G1hmhTtYN8b9tboHTz3yWZ4SDnDZihDB
 9KiqwIF84tCRBBi6E9VG7dvtpm4UKBU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-mRdnurKMMA-S_8fDp9-2ug-1; Tue, 10 Jan 2023 02:52:45 -0500
X-MC-Unique: mRdnurKMMA-S_8fDp9-2ug-1
Received: by mail-qv1-f71.google.com with SMTP id
 r10-20020ad4522a000000b004d28fcbfe17so6457884qvq.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3eA+NbxaxxTuJgeI0fEUgABEmzyKkp4Knp3X5sEVvts=;
 b=tD3RzEqScYflbuq0L3vbuTDB/a349vB1jBhRKTKc95W21ptuhdW+PM5VhFaWkUtbKc
 HzKLzJC/sjJOJ/Znphs1Avbsng6QnVfFWKh5K4bl75eQcNu2DtFuQdDHNoxmx4ro/13s
 rsrX6kyw4Myb2AxLnuWsg03q3pKl8g3IxIzHSyTYy8DX10Iqs72JUXOd/PRQh4AkvMHd
 T3VwqjyGrdQzAW0vgWg7exbXjcRoQ5xWbO96nZRLWwXyfu9nDueARFAsQ3oHRYZ9WOhs
 Fh7W1QeOpB9WvcOjadywU1rHQIVtjUey+NEZQJ1ZMfCMcbcuglXpcrBIXyefbzjpzkW+
 tcDA==
X-Gm-Message-State: AFqh2kqR7nmHH+sp+mLLFJT8ZGEac7sCMv/1aL0vbbDUso3UxXpFN1x8
 WREfwi+SD7rSTDYSjUyFYjtYiaBw7hII4MMWK4UxBHb5PtxaK2yfWM5qpQUP3R8uawkvzufcOQI
 poK2uCsKy/ydyShc=
X-Received: by 2002:ac8:4717:0:b0:3a6:8da6:65bc with SMTP id
 f23-20020ac84717000000b003a68da665bcmr98554190qtp.13.1673337165286; 
 Mon, 09 Jan 2023 23:52:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvOfEAuR3tkzBCFGJVfn6b905ukqIavqrb0RhozZV6RZ6lfw38FbvnHXCk0Q+ImDLx+BWK5Ig==
X-Received: by 2002:ac8:4717:0:b0:3a6:8da6:65bc with SMTP id
 f23-20020ac84717000000b003a68da665bcmr98554176qtp.13.1673337165034; 
 Mon, 09 Jan 2023 23:52:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05620a440900b006fc6529abaesm6818940qkp.101.2023.01.09.23.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 23:52:44 -0800 (PST)
Message-ID: <5929f780-1c5b-918e-47b9-9424606b7b8c@redhat.com>
Date: Tue, 10 Jan 2023 08:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/6] hw/rtc/mc146818rtc: Add a property for the
 availability of the slew tick policy
Content-Language: en-US
To: B <shentey@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
 <1bd2f34b-2364-1ce7-a3f4-946e76594344@ilande.co.uk>
 <045df8de-c9c4-b68c-29f6-1893724574e4@redhat.com>
 <2B09B877-6814-467D-8102-CF10A3CB9466@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2B09B877-6814-467D-8102-CF10A3CB9466@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09/01/2023 21.53, B wrote:
> 
>>> This made me wonder if a better approach here would be to move the logic that determines if LOST_TICK_POLICY_SLEW is available into the "lost_tick_policy" property setter defined at https://gitlab.com/qemu-project/qemu/-/blob/master/hw/core/qdev-properties-system.c#L558.
>>> If you look at the code directly below the link above you can see how set_blocksize() overrides the .set function for qdev_prop_blocksize to provide additional validation, which is similar to what we are trying to do here.
>>>
>>> I think it may be possible to come up with a similar solution for qdev_prop_losttickpolicy which makes use of the logic you suggested before i.e.
>>>
>>>       MachineState *ms = MACHINE(qdev_get_machine());
>>>
>>>       if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
>>>           ....
>>>       }
>>>
>>> which can then emit a suitable warning or return an error accordingly. A quick glance at hw/core/qdev-properties-system.c suggests there are a number of similar examples showing how this could be done.
>>
>> Thanks, I like that idea! I'll give it a try!
> 
> Does the microvm need consideration as well?

microvm is also derived from TYPE_X86_MACHINE, so I think the check that 
Mark suggested should be fine.

  Thomas


