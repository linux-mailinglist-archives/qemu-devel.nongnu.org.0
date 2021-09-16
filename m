Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117D40E3AB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 19:21:18 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQv4W-0005tj-Le
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 13:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQv2f-00052H-Dj
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 13:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQv2Z-0001qo-8S
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 13:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631812752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vp2d7Rm6eG2E7A/UD+ACpYSg+XdVticDpgAWqAZ+Rz4=;
 b=MILen4kT44VCeDYQXcDC90j06+/hvuLZV67RVveMxnYQ5/P6hGmOk8EqdrMajL9+ZK1zlp
 4VMKauwaWUZ6g+f9nG87n0Mm8n9Apwfs4DxQm+WPg6g5vrO6cnmJzyIVVW4KIf6zhSh8UM
 u7vNQPapjReyCsD3naOdjo6o024AL/s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Eiegvof1OFaHfznXaxd8sg-1; Thu, 16 Sep 2021 13:19:11 -0400
X-MC-Unique: Eiegvof1OFaHfznXaxd8sg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so2228904wrd.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 10:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Vp2d7Rm6eG2E7A/UD+ACpYSg+XdVticDpgAWqAZ+Rz4=;
 b=xlaqvpNcL6X0DDNvMfJan4CD/da8qM8Ge1STkyRKGY/+/U1sKDl3Q01jjYb8nc0Tdo
 Jwh5eqZ9pLcCvqend16ZMD9Z01LGv/oM0xs7vmeYAd9+b2zFB1VS7DrhaXa5VYi4EzTM
 DlXnxCw4pE5cIBRCRfEolDTBb6oEb2gcaem4+jwAm2MJQNQEqnggRszeQ10UAVJUKdDz
 4IIfDaLe/NYgOGanq2xe5fWsMiXgGyiodVIQDk6HmfmlpQ9dLYAyLBtcNb2MmmZ067h/
 Y8xZKqbe8cc+cAdBU+B5XDZHgaKDpMUbKvFQUJia9h3rzQ8EeDq7m+trAOKa7M/ScSOo
 FZtw==
X-Gm-Message-State: AOAM531usJOShaLqA9UE4oeSu/VdXiHhSokR8XTjqaO/wdiCrqa99iHU
 vynKO87F+a0+zLldxYv2cPyJUAjf32Os8ueMU2MGLmRMIbgkXZPFwUo6TpSK2Wma7uwxy48Jgs1
 lnAW75z2QpDslFSI=
X-Received: by 2002:a1c:a713:: with SMTP id q19mr11047552wme.42.1631812750173; 
 Thu, 16 Sep 2021 10:19:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOQc92u41pSvQtucgjwwM7k+Pq23pR+ZkLQ0TZCEEIVXVBFvu5PZON6IIlKaGnSOfJtZt5HQ==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr11047522wme.42.1631812749887; 
 Thu, 16 Sep 2021 10:19:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id x5sm4766362wmk.32.2021.09.16.10.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 10:19:09 -0700 (PDT)
Subject: Re: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210909122402.127977-1-eric.auger@redhat.com>
 <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f6aa5469-3ef4-bda1-51bd-d0eec5bf9fed@redhat.com>
Date: Thu, 16 Sep 2021 19:19:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gavin Shan <gshan@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,
On 9/16/21 3:32 PM, Peter Maydell wrote:
> On Thu, 9 Sept 2021 at 13:24, Eric Auger <eric.auger@redhat.com> wrote:
>> The PL031 currently is not able to report guest RTC change to the QMP
>> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
>> to qapi_event_send_rtc_change() when the Load Register is written. The
>> value that is reported corresponds to the difference between the new
>> RTC value and the RTC value elapsed since the base.
>>
>> For instance adding 20s to the guest RTC value will report 20:
>> {'timestamp': {'seconds': 1631189494, 'microseconds': 16932},
>> 'event': 'RTC_CHANGE', 'data': {'offset': 20}}
>>
>> Adding another extra 20s to the guest RTC value will report 40:
>> {'timestamp': {'seconds': 1631189498, 'microseconds': 9708},
>> 'event': 'RTC_CHANGE', 'data': {'offset': 40}}
>>
>> To compute the offset we need to track the origin tick_offset (the one
>> computed at init time). So we need to migrate that field, which is done
>> in a dedicated subsection. The migration of this subsection is disabled
>> for machine types less or equal than 6.1.
>>
>> After migration, adding an extra 20s on the destination returns 60:
>> {'timestamp': {'seconds': 1631189522, 'microseconds': 13081},
>> 'event': 'RTC_CHANGE', 'data': {'offset': 60}}
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
>> @@ -138,6 +140,7 @@ static void pl031_write(void * opaque, hwaddr offset,
>>      switch (offset) {
>>      case RTC_LR:
>>          s->tick_offset += value - pl031_get_count(s);
>> +        qapi_event_send_rtc_change(s->tick_offset - s->original_tick_offset);
>>          pl031_set_alarm(s);
>>          break;
>>      case RTC_MR:
> None of the other users of qapi_event_send_rtc_change()
> seem to have to track the baseline time like this. Shouldn't
> this be doing something involving using qemu_ref_timedate()
> as the baseline that it uses to figure out the change value ?
> (The other users do this via qemu_timedate_diff() but since we
> start with a value-in-seconds we might want to expose some other
> API in softmmu/rtc.c.)

I struggled understanding the various kinds of clocks modeled in qemu
and the PL031 implementation. Both devices calling
qapi_event_send_rtc_change() seem to store the base rtc in their state
(mc146818rtc.c cmos data or spapr_rtc tas_ld(args, )) and then
effectivelly call qemu_timedate_diff() on this base rtc value. I did not
figure to do the equivalent with the pl031. I will further investigate
how I can mimic their implementation though.

Thanks

Eric

>
> thanks
> -- PMM
>


