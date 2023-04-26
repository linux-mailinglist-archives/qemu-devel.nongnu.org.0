Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A55D6EF3FF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:07:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prduk-0002hr-6D; Wed, 26 Apr 2023 08:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prduO-0002ey-7o
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prduH-000479-CJ
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682510754;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNmyoVXVsxvoKW1+fTKiUbDa4iQGSofgQy43+6FSckc=;
 b=bhm1DjyyRXwr5AUDBAFoAZg6C2riXpHnxx+Ua23zCGvYRH6+Qi1vVo5OySmctgMs1JN2oG
 Gr+p14/ODfXpIoVAXlRH53Y2FvFEbSbfkIRZVRDK4DKTdEhMf6Qiwsy1FYNOfuTMlxlN3P
 SHKWfEMG7iXyAVcegjCAFmO0uIJSpTc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-eUKWzzRKO8ib0ca0SxLeNA-1; Wed, 26 Apr 2023 08:05:52 -0400
X-MC-Unique: eUKWzzRKO8ib0ca0SxLeNA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so2573289f8f.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 05:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682510751; x=1685102751;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oNmyoVXVsxvoKW1+fTKiUbDa4iQGSofgQy43+6FSckc=;
 b=Uf8oZzuVki7P19aQ6UFI4dBOFrDugb0DxqO6Aoi/iHa6de0MhzTj016fxDs0X5cqHz
 Rs6TRRI05oPpoQUgsIdNsygsxGdZclXcEe+5hi/g8gD6dGkMbXQPV5IQ7qewWrR/iwA6
 GxqslBK9hVNCpEZs4AiXM9a77e1xsvXDww4O5m1Frrve10+AeM+KHWLnHqQvwv9qyCM1
 9ltec4LCc1JJ9CcG1TRwVbKKyEDSiSuJi1pa242X2gzrp73VuCiMFmfAyKrkMMdtmDjC
 0+pL2FqOCs+K6GkoqqihYL18mUvKgoRfm0ay54YFkO3vPXPBB3hNH4A9Ye4R4YUwtwmH
 koDA==
X-Gm-Message-State: AAQBX9dqjZebMyQEtENFXXmX3fLx3hJmSzc5oUlc9Ct3RXiXqHwS24t9
 T6Kjmjwux726TPvk8r/o86DiAp5NikHJRlIxYVEPiA2XGf6dajvxBQqDdx0Ogsv1ktVoXEaVIih
 0uymHg5kwWuDOCmE=
X-Received: by 2002:adf:e752:0:b0:2f9:129e:bff2 with SMTP id
 c18-20020adfe752000000b002f9129ebff2mr13848276wrn.24.1682510751564; 
 Wed, 26 Apr 2023 05:05:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7RHWFnT3wvmF0FueF9fQMH0J/Upk7+YUkzbfGpC91W4ePrNrxbchDUZTVo57RrPPVAuGq5w==
X-Received: by 2002:adf:e752:0:b0:2f9:129e:bff2 with SMTP id
 c18-20020adfe752000000b002f9129ebff2mr13848258wrn.24.1682510751276; 
 Wed, 26 Apr 2023 05:05:51 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 bg39-20020a05600c3ca700b003f09c34fa4csm21514772wmb.40.2023.04.26.05.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 05:05:50 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  berrange@redhat.com,  peterx@redhat.com,
 dgilbert@redhat.com,  lsoaresp@redhat.com
Subject: Re: [PATCH] multifd: Avoid busy-wait in multifd_send_pages()
In-Reply-To: <82cfd4b3-fbea-b147-e84a-d8d160088c14@nutanix.com> (manish
 mishra's message of "Wed, 26 Apr 2023 16:56:58 +0530")
References: <20230425160555.67373-1-manish.mishra@nutanix.com>
 <87v8hjey3b.fsf@secure.mitica>
 <b87ce3c6-6426-eab1-95ef-d02eb83ab9ff@nutanix.com>
 <87pm7qgazb.fsf@secure.mitica>
 <82cfd4b3-fbea-b147-e84a-d8d160088c14@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 14:05:49 +0200
Message-ID: <87leieg86a.fsf@secure.mitica>
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

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> On 26/04/23 4:35 pm, Juan Quintela wrote:
>> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>>> On 26/04/23 3:58 pm, Juan Quintela wrote:

>> Before:
>>
>> while (true) {
>>      ....
>>      sem_post(channels_ready)
>> }
>>
>> And you want to add to the initialization a counter equal to the number
>> of channels.
>>
>> Now:
>>
>> while (true) {
>>      sem_post(channels_ready)
>>      ....
>> }
>>
>> It is semantically the same, but when we setup it ready it means that
>> when we set it to 1, we now that the channel and thread are ready for
>> action.
>>
>>> May be we can do one thing let the sem_post in while loop at same
>>> position itself. But we can do another post just before start
>> I can see how this can make any difference.
>>
>>
>>> of this while loop, as that will be called only once it should do work
>>> of initialising count equal to multiFD channels?
>> Yeap.  But I can see what difference do we have here.
>>
>> Later, Juan.
>>
>
> Thanks Juan,
> Just confirming if i misunderstood something :)
>
> I meant your approach makes sense, i was just suggesting a small change. =
To do something like this.
>
> qemu_sem_init(&multifd_send_state->channels_ready, 0);
>
> static void *multifd_send_thread(void *opaque) {
> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>
> =C2=A0=C2=A0=C2=A0=C2=A0 sem_post(channels_ready); // Post once at start =
of thread and let one in loop as it is.
>
> =C2=A0=C2=A0=C2=A0=C2=A0 while (true) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sem_post(channels_ready)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> }
>
>
> Something like below has issue that we are marking channel_ready even
> before channel is actually ready,

I think it is exactly the same.

> i meant if network is slow it may
> take some time to update pending_job and hence we can busy loop in
> send_multifd_page().

No difference from send_multifd_page() point of view.
Notice that I mank that the channel is ready before I do any work.

send_multifd_page() does a sem_wait() before doing anything related to
this channel, so I can't see how it can be a differnce.

> static void *multifd_send_thread(void *opaque) {
> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>
> =C2=A0=C2=A0=C2=A0=C2=A0 while (true) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sem_post(channels_ready);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> }
>
>
> Not sure if we are already in agreement :) just confirming.

> =C2=A0=C2=A0=C2=A0=C2=A0 sem_post(channels_ready); // Post once at start =
of thread and let one in loop as it is.
> =C2=A0=C2=A0=C2=A0=C2=A0 while (true) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sem_post(channels_ready)
> =C2=A0=C2=A0=C2=A0=C2=A0 }

and

> =C2=A0=C2=A0=C2=A0=C2=A0 while (true) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sem_post(channels_ready)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0 }

When "..." is exactly the same don't make any difference, the only
difference is that in one case we "write" to semposts, and in the other
we write just one.

Or I am missing something.

Later, Juan.




