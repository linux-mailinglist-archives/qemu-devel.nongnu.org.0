Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624896AD2E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKOD-0001Im-4A; Mon, 06 Mar 2023 18:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZKOB-0001Id-50
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZKO9-0006iL-6C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678145823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsqsK6bjdvJknSRA5xyMBGxB6+yUwOmdGvgwj33omG8=;
 b=hh80foX0++59+yJMbI9WnUokQtb5MaBocICbAhtTCgeT8141czcrh63Mj6y2r/1A+M7sCk
 y5DY9rdyKrS13V8RkmmkbveTj41impp8o4x+nemzwEkh0zS2MqR5mymGigx/8OROJ6baD/
 /qRXQTuGmHwXDxxK4vBKMuX82ORXaY8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-LKgPmd0ZPZqY7FPuWAjOCg-1; Mon, 06 Mar 2023 18:37:02 -0500
X-MC-Unique: LKgPmd0ZPZqY7FPuWAjOCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w11-20020a05640234cb00b004b3247589b3so16370092edc.23
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 15:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678145821;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsqsK6bjdvJknSRA5xyMBGxB6+yUwOmdGvgwj33omG8=;
 b=Mc2+UMTYZcbjn21trAJqVd6u57H5CffNlb/Jb29Utj3VAm2d5K90xVCfspTyPhjYGh
 cjec5u4dsJSlTp0JIAVTyop+RJSd3RUtDlhho1yftiqbYpewdLhH/tDZ3fOgCx/2j678
 j9bkIeHnh6z1W8BB/zE03m0AF9dPpe1wXkl7Yt3nUI6ze3KDbG5MK9Ujv31r/4o05lK1
 ylMy8beN27I2MlLcsZCzNpCbjV2DsADL+CFxcanTbHZZKmSEwPPVDowNQPe18SYQFifg
 /MQqCNtCSLH7YAEq6b6LI46VHwzgfT0N7gVsglXYFLB6rTYeobm8h8Hu7XZtklbtBYon
 smpg==
X-Gm-Message-State: AO0yUKXv43eRDCOPzogSKfCa/AkPqcU1DD3h1jS8ql7FzGIUdVeoXVxr
 Rc0/rYadQPfCmmYWsJkazo/0+2lkPF7vWLnScBPj12ZODZRn/zm/XRN3wiYUGcTadRRbUU1zAvp
 1IJqtJohZjulCSRs=
X-Received: by 2002:a17:907:320a:b0:87a:ee05:f7b with SMTP id
 xg10-20020a170907320a00b0087aee050f7bmr15455329ejb.24.1678145820972; 
 Mon, 06 Mar 2023 15:37:00 -0800 (PST)
X-Google-Smtp-Source: AK7set85iLtDr1CBEk38/tTSQZ+w4k/l+mKlr8ssJetcowZluGfMmolOipFk7HPmUwpTRvt+BvYGgg==
X-Received: by 2002:a17:907:320a:b0:87a:ee05:f7b with SMTP id
 xg10-20020a170907320a00b0087aee050f7bmr15455314ejb.24.1678145820638; 
 Mon, 06 Mar 2023 15:37:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 uo17-20020a170907cc1100b008b17ed98d05sm5160005ejc.120.2023.03.06.15.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:36:59 -0800 (PST)
Message-ID: <e101b894-c722-8def-f591-20fada45795c@redhat.com>
Date: Tue, 7 Mar 2023 00:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
 <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 3/6/23 23:56, Paolo Bonzini wrote:
> On 2/21/23 13:55, BALATON Zoltan wrote:
>>
>> To get that menu with Shut Down, first Quit the installer then again 
>> right click or click on background first to get the menu of the 
>> Ambient desktop. I also see an error from the firmware at the beginning:
>> Initializing KBD...00000012    FAILED.
>> when it's broken and it says Done without the hex number when it 
>> works. (Two other FAILED messages about clock chip is normal as we 
>> don't emulate that but all others should be green.)
> 
> Ok, I've reproduced it.  The mouse is a bit flaky but using the keyboard 
> for everything except right clicking works better.

Now the OS doesn't boot anymore, it doesn't get to the point where it 
initializes the VGA.  I got some quick logs with .impl.min_access_size 
to 1, to understand what the firmware (but not the OS) does.  With this 
at least I could confirm that your patch is wrong:

cnt 1 1 write 80
evt 3 1 write 1         // enable timer
evt 0 2 read
evt 0 2 write 1         // just writes again the same value
evt 1 1 write
evt 1 1 write 0

Since you have both 1-size and 2-size writes, and the 2-byte 
reads/writes are done with byte swapping instructions lhbrx and sthbrx, 
your patch would cause 0x100 to be read and written on the third and 
fourth lines.

Likewise, any 4-byte read of the timer port would be byte swapped.

The solution is a patch similar to mine, applied to both evt and cnt; 
while perhaps tmr can be left as is and only accept 4-byte reads, I 
don't know.  I'll try to come up with something that can be tested at 
least with the firmware.

Paolo


