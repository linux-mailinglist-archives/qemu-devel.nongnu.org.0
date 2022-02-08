Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90014ADAA3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:01:29 +0100 (CET)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHR3e-00083W-8J
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:01:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nHPjI-0007Lf-Tk
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nHPjF-0003k9-E6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644323755;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfchrOBdOaAFOXpxGDR5awmfJvFmHxgfwX/9MMrB3ww=;
 b=QV5lL8oU41o5/D4VqVOtOzLyc7BIcxceMtaTZeuZTWHoby8e4BAr0bpQW9YtMeR3S1X+uU
 GaYBcooV953sI5Hj3ljJVBM0GrJh4V2EPB0RjtewthKKIZEAFXWTp16LJqTwI04mASDubz
 WSKaa39h8C7SHALasBdDGwS9Xq0Y4zc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-XukxrFYEPzeyNN1nSvFbnA-1; Tue, 08 Feb 2022 07:35:53 -0500
X-MC-Unique: XukxrFYEPzeyNN1nSvFbnA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r16-20020a05600c2c5000b0037bb20c50b8so481671wmg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 04:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PfchrOBdOaAFOXpxGDR5awmfJvFmHxgfwX/9MMrB3ww=;
 b=oySc/m4lueflAxdSGggBdWYD3UOtT8Cf+WciDSZCnueZ+MZ8swz8C9/9SM3w3b66v2
 0/MRfOaMyA3tHe17Xx2bxM6kwbFjvsvinfSxm16Up+xQjQebEaAqYpMbqgjB6V0EoIOk
 YdjXQAx6hArfzhQSeNtUqClPkwcnQ10CZoq+jUUPMbT52i0DN+tqvxPDL38lLGM1pMpl
 u7hD4Lz7xxc9FA13lqVeA86YVWeOgb1RwcmSP595VYEsWhdVUU9KttJmYU4wyHNmgnmy
 aeoCCzJDZKfwGOsQ8py1OTdDg7K9NLgZ9xQcKdT7UxSM5WWKoihDVaAB+wFpKIP6u2mn
 3tYA==
X-Gm-Message-State: AOAM533Yqjym/QEUbo0lTGy9YYnu4qGoDvzIw0Jy81g2rs5sfjC0nWW3
 GkfGTvRxYDG5lpVYvlPz+AN5x2PL65p+DieeydLZS3YxYEMxvtlHMghtlYuLiKCy/GXZVJ5euIb
 6YrEahGjS0mI79ZM=
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr3580882wrs.517.1644323750872; 
 Tue, 08 Feb 2022 04:35:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyb9xJBoe2s3wtDEC02Ph3qL2ZN4H0FJCW2lZwE8ULMchOEUs48Z6A6gAQGeTkNz1oXBsMCwA==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr3580853wrs.517.1644323750620; 
 Tue, 08 Feb 2022 04:35:50 -0800 (PST)
Received: from localhost ([94.248.65.38])
 by smtp.gmail.com with ESMTPSA id m14sm15735907wrp.4.2022.02.08.04.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:35:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: "Startup" meeting (was Re: Meeting today?)
In-Reply-To: <38067656-7C95-4CA2-8860-1E5E37CDCDA9@greensocs.com> (Mark
 Burton's message of "Tue, 8 Feb 2022 12:52:08 +0100")
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
 <YeWjtxEcbb6jcbi8@redhat.com>
 <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com>
 <87h79sw64t.fsf@secure.mitica>
 <b3d70518-256d-2bd0-5979-ff96a1154fd1@amsat.org>
 <874k5srsiz.fsf@secure.mitica>
 <38067656-7C95-4CA2-8860-1E5E37CDCDA9@greensocs.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 08 Feb 2022 13:35:49 +0100
Message-ID: <87k0e57cyi.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Hedde <damien.hedde@greensocs.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Burton <mark.burton@greensocs.com> wrote:
> Hi Juan, is there a meeting today? I think the plan was to talk about =E2=
=80=99startup=E2=80=99 itself ?
> Cheers
> Mark.

Hi Mark

Yeap.  I asked for it on last meeting.  The call for topics is on the
list (not that anyone else has answered)

Later, Juan.



>
>> On 25 Jan 2022, at 11:58, Juan Quintela <quintela@redhat.com> wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>>> On 1/25/22 09:50, Juan Quintela wrote:
>>>> Mark Burton <mark.burton@greensocs.com> wrote:
>>>>> All, I believe we will have a followup meeting this coming Tuesday
>>>>> 25th January, at 15:00 (presumably using the same link:
>>>>> https://redhat.bluejeans.com/5402697718).
>>>>>=20
>>>>> We (GreenSocs/Xilinx) would like to quickly show what now =E2=80=98wo=
rks=E2=80=99, and to give an update on the patches.
>>>>=20
>>>> I send the call for agenda already.
>>>>=20
>>>> We are having the meeting.
>>>=20
>>> Do we need to stick to bluejeans, or can we switch to something more
>>> generic to easily record the call, and be able to start when Juan is
>>> not available?
>>=20
>> Hi
>>=20
>> Anyone from inside Red Hat can start the call.  So I think that starting
>> the call shouldn't be a problem.
>>=20
>> If I remember correctly, one of the reasons for using bluejeans was that
>> in the past we used to be around 40 people on the call, and that was not
>> easy to setup.  Perhaps today it is different.
>>=20
>> About recording, I will ask everybody if they agree on the call and we
>> can record it.  On the past we _didn't_ want recordings, but I can't
>> remember the reason.
>>=20
>> Later, Juan.
>>=20


