Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A46F1C8D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:25:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psQtf-0003qm-9J; Fri, 28 Apr 2023 12:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psQtd-0003qb-MJ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psQtb-0000wY-II
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682699070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywDSfssUuWEWUt6xBssgAVWL+/XqGdeUJzjnJM9nmQg=;
 b=d0zSoWWuuip9eipiShnP4Rygh8aTSDzLqnCPsDeFiUIo1hX+HfU39p89R36Axl5vdRtL1i
 zq391vkJZXnCoe8fwhNgU53BwPyAqFxNJoW9V5QAnOogSYD3gRo3ppV3nwBonFdd2zEOyl
 wChTVlfE3x+1COs+CKwhKsVeJYR5LHg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-ADfmT_XdPHG8ojJlbupYyA-1; Fri, 28 Apr 2023 12:24:22 -0400
X-MC-Unique: ADfmT_XdPHG8ojJlbupYyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso36416315e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682699059; x=1685291059;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ywDSfssUuWEWUt6xBssgAVWL+/XqGdeUJzjnJM9nmQg=;
 b=ZpCPUdB+yH8SKqnk8bPHoZHI7bLIMUvMo1nmvdBkg5Txs6MGKCV36Zcpl9ODvpg/Sh
 HupvufsCgW6zHBrJ33d87cDhBTCv4Bb5YLSNJe9qHrJRM6zWtYnc6jah/8p518McT3ie
 VIlsGEdrHaWspXJmzmPDynFUKX6w+wPvPMcWsT6s3j/v5TXTKrHhs0fnK/ky8rElcxhG
 X81tih0Wyly9CsNTZVVz20MLNJq5TUNSn4OzZuLotoL25ZQgXFTUnNS6E9lbz9ZLRulQ
 12BQVGnypuitK5hTrNS6leAvFFWRbURS671CU5I4AHX1QvWZQ/HSwSzN5eVDF9Igy9aZ
 +ZgA==
X-Gm-Message-State: AC+VfDzTM4i6NbKc85Y0sQtHbfG1y1Nkm57P5eUVCq/4+o/M9keooIsT
 74+gePpqlHPk15jUHzSOtm1+qHAV8Q2wrqpUb3lKp0M4qrTwgSiYt/C35I0cLXdYN6iRyfkILxn
 92C1qE4Y9euYjFZA=
X-Received: by 2002:a1c:cc0f:0:b0:3f1:718d:a21c with SMTP id
 h15-20020a1ccc0f000000b003f1718da21cmr4572058wmb.31.1682699059162; 
 Fri, 28 Apr 2023 09:24:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+poK/bNEQD8FazyoYe5nUBoUs5NAdqXMX9cJ50QKTkcXJ2bG8dLc+0krBwnK7T1IFIRu3sw==
X-Received: by 2002:a1c:cc0f:0:b0:3f1:718d:a21c with SMTP id
 h15-20020a1ccc0f000000b003f1718da21cmr4572041wmb.31.1682699058883; 
 Fri, 28 Apr 2023 09:24:18 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003eeb1d6a470sm24742184wmq.13.2023.04.28.09.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:24:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  qemu-devel <qemu-devel@nongnu.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
In-Reply-To: <CABgObfY1ZmfRGjVnsQ6NC7jTe_X+Gx4uxW4R048xxaJ3Vdt+9A@mail.gmail.com>
 (Paolo Bonzini's message of "Fri, 28 Apr 2023 16:26:01 +0200")
References: <20230420202939.1982044-1-clg@kaod.org>
 <87a5ywgkqg.fsf@secure.mitica> <ZEfUq52l/wut8puM@redhat.com>
 <ZEfWAciwsB+t7Crk@redhat.com>
 <CABgObfY1ZmfRGjVnsQ6NC7jTe_X+Gx4uxW4R048xxaJ3Vdt+9A@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 18:24:17 +0200
Message-ID: <87v8hg9dqm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il mar 25 apr 2023, 15:31 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
> scritto:
>
>> > > -    BHListSlice slice;
>> > > +    /*
>> > > +     * gcc13 complains about putting a local variable
>> > > +     * in a global list, so put it on the heap.
>> > > +     */
>> > > +    g_autofree BHListSlice *slice =3D g_new(BHListSlice, 1);
>> > >      BHListSlice *s;
>> > >      int ret =3D 0;
>> > >
>> >
>> > This must be a memory leak since you're adding a g_new but not
>> > adding any g_free
>>
>> Sorry, I'm failing to read properly today. It uses g_autofree
>> so there is no leak.
>>
>
> On the other hand, if the pointer to the heap-allocated BHListSlice
> escaped, this would be a dangling pointer as well=E2=80=94just not the ki=
nd that
> the new GCC warning can report.

I don't agree here.
If with my patch it becomes a dangling pointer because we free it.
With Cedric patch it is a local variable that gets exited out of the
function that created it.

Choose your poison.  One thing is bad and the other is worse.

> So this patch is also doing nothing but shut up the compiler; but it's
> doing so in an underhanded manner and with a runtime cost, and as such it=
's
> worse than Cedric's patch.

Ok.  I don't care (enogouh) about this to continue a discussion.. Can we
get Cedric patch upstream?

Thanks, Juan.


