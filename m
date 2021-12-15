Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CB475749
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:03:47 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS4Y-0005Ex-Cd
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:03:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxRc6-0006Fg-NI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:34:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxRc5-0007WV-7F
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHXUH5uX7d0MRVNpu4ixAnYsq2CRVPPUNMrZJvjKaIY=;
 b=LhMw0GdQ5WvqRhieiP6SjUSiiI9azXGatMxp/HT3vB3aLsNLAFkY5YRl4yLVV2UcDKmrQ/
 QwiSKaFqj5CiMR91D6uzJOVC4/eqCHt4NwmQqLg0mW9pZovV5kyJbU/zutja0skYydt0Oo
 tnZCUU6bSj5Gv0a8PqnyvHycw/ji6ok=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-mGLSnjFQPBeDkhyETwzqGQ-1; Wed, 15 Dec 2021 05:34:19 -0500
X-MC-Unique: mGLSnjFQPBeDkhyETwzqGQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 v22-20020a50a456000000b003e7cbfe3dfeso19750045edb.11
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dHXUH5uX7d0MRVNpu4ixAnYsq2CRVPPUNMrZJvjKaIY=;
 b=6jIAifMovkIhTN5DzeBGeVzMjpNxPglDhudDgxUflNDDltgYShpc0e8plc9JyzMSti
 3Zf78uGqTO2uuMdCekd2VQJL2xZvD73a4DQJcwrTD0GMglA/LVQj6s2g54q5mYwkxaWT
 Vl4shY9+SYSE/IpQX75yNvlMWQ3Vism292V6ET3A/aM4djYJK5xwj8r7VoygxNjqbdRG
 zQklpGi72zuQUQeByV1Sx/wyBS1qplHcFbCRhM/37aCxOL6LloHtgFmA2czVU/4AheXW
 K8P5Kl349QcIEPrPsrbc6YWLuW4FyCWsWanaa17OfmqG+pYwIcC+JL3TOX81l8ioda8i
 pdRQ==
X-Gm-Message-State: AOAM532djh8haFOxWwEb3jUnDReZLk9C9WOczaIXWbvJNYje36ipFu1Y
 dhM7ijsh1cuxqrHvN77028DF58zCdKBuIMei7yqeHfJSEtW3tjnepz6hVx6O0M6nNU4U7wzcZdx
 bw38ONA1xLFx9wf0=
X-Received: by 2002:a50:ee96:: with SMTP id f22mr13891555edr.77.1639564458430; 
 Wed, 15 Dec 2021 02:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgNi8Z8n2NN/9DhE8UoY507pSC1ZWGUh6YfRT3hLy0scLQlJlrIWbPfnA2iyRh64s9nJFlaw==
X-Received: by 2002:a50:ee96:: with SMTP id f22mr13891533edr.77.1639564458158; 
 Wed, 15 Dec 2021 02:34:18 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id o22sm790173edw.50.2021.12.15.02.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:34:17 -0800 (PST)
Message-ID: <21b31176-33b3-f6a1-023d-1609a3c8f4b7@redhat.com>
Date: Wed, 15 Dec 2021 11:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/4] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
To: Kevin Wolf <kwolf@redhat.com>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-4-eesposit@redhat.com> <YbirseSGF6nFiGlp@redhat.com>
 <316d9685-e94f-ac75-5c80-535329a06916@redhat.com>
 <Ybm8sLl+Jp7TZ8Vp@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ybm8sLl+Jp7TZ8Vp@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/12/2021 11:00, Kevin Wolf wrote:
> Am 15.12.2021 um 10:19 hat Emanuele Giuseppe Esposito geschrieben:
>>
>>
>> On 14/12/2021 15:35, Kevin Wolf wrote:
>>> Am 30.11.2021 um 10:46 hat Emanuele Giuseppe Esposito geschrieben:
>>>> drive_add is only used in softmmu/vl.c, so it can be a static
>>>> function there, and drive_def is only a particular use case of
>>>> qemu_opts_parse_noisily, so it can be inlined.
>>>>
>>>> Also remove drive_mark_claimed_by_board, as it is only defined
>>>> but not implemented (nor used) anywhere.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> I don't think moving drive_add() actually improves anything. Yes, you
>>> can make it static, but in order to do that you had to introduce
>>> block_if_name() as a new public function and you're moving an obviously
>>> block related function to common code in vl.c.
>>>
>>> So this part doesn't look like a net win to me. The rest of the series
>>> looks good to me.
>>>
>>
>> So are we going to drop patch 2 and 3? For me it is fine either way, and I
>> saw Stefan added r-b to all patches.
>>
>> If we are, Kevin are you going to apply only patch 1 and 4, or do you want
>> me to send v3?
> 
> This patch does a bit more than just moving drive_add(). It also inlines
> drive_def() and deletes drive_mark_claimed_by_board(), which are both
> things that make sense to me. So this suggests a v3.
> 
> But if you think I should just apply patches 1 and 4, I'm happy to do
> that, too.

You're right, I forgot about that. I will send v3, thanks.

Emanuele


