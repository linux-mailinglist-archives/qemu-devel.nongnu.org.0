Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEA4A3EEA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:56:15 +0100 (CET)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESTu-0002eL-HM
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nESNH-00007P-Bu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:49:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nESNE-0001a5-Iu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643618959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxeEEBVpClAgqper1SAtipewcog+c+OrmUdij0FHFB8=;
 b=RWMVRvYfaXtAvHDjUcFkzJBR4geNpUlHIIkMiyhpnCHgSiMfHPiLZnTdMbCIGziwBtGrEy
 bvX8coJIXTtGPYEwIsVhbObUeZjfASUyfy6eAfS1h7bgnKI8Nef4nkCsONIQYEgnoEOOLd
 qlBCymjEbz99YfucARfH9raaOC8Oqx0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-5fm22NsvNnaayTjKyOAqzA-1; Mon, 31 Jan 2022 03:49:18 -0500
X-MC-Unique: 5fm22NsvNnaayTjKyOAqzA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so6595183edb.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pxeEEBVpClAgqper1SAtipewcog+c+OrmUdij0FHFB8=;
 b=cZLj3bqVvEccw0VUf1botuWtksoQwDw+BLgh2dFfaJBVNGvWSfX0hkZ34u4Cw4uTGc
 UrZLa+4OMoRbgai2qhHsFJz7qhSF7lbGAkE/CyMJ4g1JeYYpOpYCrb+SQGd2yNsY+Sgt
 LobBp+Q4xxkA8s65x44pmp/4N4mYaFceqdoCpP81dRf3kcvQ6PjrCo1cT2zG5QYdkN8B
 IgtAGQYb8210S/cK0Vh9PgpHUy2XAmCzdWp3rvTSNpwAeFAG/onqVrFS9Y0VOqLuJ9R9
 2heX+tkGr7w0FB6x07XnvTxdORr5f1gH1GtO8wUNbqMLEEJ5HF3meb0VALlgmrdJddot
 /Fhg==
X-Gm-Message-State: AOAM5323Q0pnjzopMYA/ap1pahvYuVw468yPyuFghnWMteSNXQd+IWIP
 RSjRSYoIquodnLhL+lhk9CNSUm/+AkqVGmdZ5cYG3jtLAtgCJKlh/C7kM2RBX4JVyf6/4DAYhtC
 pWefh6U/BTzLrEiA=
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr20002491edb.24.1643618957353; 
 Mon, 31 Jan 2022 00:49:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/xSgwxgpKjwb8XmVV6wgeG783+C2A1EcDpx/k5bkh9Ai7AripornEMMeNko5oJchdJTAIWg==
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr20002454edb.24.1643618957017; 
 Mon, 31 Jan 2022 00:49:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b6sm2679364ejb.80.2022.01.31.00.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:49:16 -0800 (PST)
Message-ID: <d3c4a2d2-afbc-b8c8-4851-05d270bb1ebb@redhat.com>
Date: Mon, 31 Jan 2022 09:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 29/33] job.h: assertions in the callers of JobDriver
 funcion pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-30-eesposit@redhat.com>
 <daa2d5d6-8f57-672a-2ce8-41e8d163d821@redhat.com>
 <dfd3932e-ced4-c2db-441f-df7bb991415b@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <dfd3932e-ced4-c2db-441f-df7bb991415b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.01.22 16:19, Emanuele Giuseppe Esposito wrote:
>
> On 26/01/2022 15:13, Hanna Reitz wrote:
>> On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>    job.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>> Just curious, why did you remove the assertion in job_co_entry()?
>> (Looking at it again, it might have been nicer to swap it with the
>> assertion below it, so that `job != NULL` is asserted first, but other
>> than that...)
>>
> I think it's useless, job_co_entry runs in a coroutine in
> job->aio_context created and entered in job_start (its only caller), so
> there is no way that we are in a different aiocontext.

Well, that is what assertions are for.  You don’t put them there to 
catch errors, you put them there to show that there’s some sort of 
contract the caller definitely fulfills, so that after the assertion you 
know this contract is fulfilled without having to read and verify what 
the caller does.

And perhaps also to prevent regressions when the caller code changes.

> Same as assert(job), I don't think the opaque pointer can ever be NULL.

Good, because if it could, that shouldn’t be an assertion. O:)

> Thank you,
> Emanuele
>
>> (And since I’m already replying to this patch, might as well point out
>> s/funcion/function/ in the subject)
>>
>> Hanna
>>


