Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8669CF39
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:21:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU72C-0004bC-UK; Mon, 20 Feb 2023 09:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pU72A-0004VQ-8j
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pU728-0005CR-3p
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676902846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cewM3LgHbTUTHxElKY6ANVocoZATgF2bCc/Z1lkHEds=;
 b=J8oXf/jJOoAObk/rTy2uhRNZa/9MNo/UOdmz3tHVOuEjHZQxLnkYiSEnSqRrclymyRP8bN
 LT2g1A6cjUgbEU1cgR1PjSTdjh6hiwvrvyV6aDPKoRgrbpZ1fPkRz0hKQe534HwbXlmeVQ
 os0ICHe7xip4jGpjYMzpRMRgSKIQYT4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-OPJWnbptOjqr_Soa_zIZ8Q-1; Mon, 20 Feb 2023 09:20:45 -0500
X-MC-Unique: OPJWnbptOjqr_Soa_zIZ8Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 v12-20020a056402174c00b004acb5c6e52bso1673386edx.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 06:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cewM3LgHbTUTHxElKY6ANVocoZATgF2bCc/Z1lkHEds=;
 b=DIvm0azBrMdr5V1PNvTWVSHE2GOX58vBW5pkdGww3f9rIF4eurBY4Iml8Qu4GX5Me0
 YMOaZ36q//AiMLHZRxJrW3WcIx3m6hL11Kab7Wxo4upFfEvQ5lGD1E1Z7QYfMaU1of7y
 PTaSYZqaA1XC5BDZyOZvsas9fSoCmJLs6FQ+UjMivhJHVACUCy4rT46l1vG8xHkXsDT4
 skWlLayYoZ5+YwHMmIBmW7kaGrgQn/mivH3Z3w7HRfcG4/vGtk1sfSxMFK4pFrO+R7Rg
 HW5HfjUAxHhKuOei20LhnUtzDgw/G7q4LNTfkdek588FyZR+17daOk+yv9vDsQ62pf5G
 njvw==
X-Gm-Message-State: AO0yUKXzk1Se0nYXvVa1QK8mhHGWCi5o4S5RYJ8CQPxfeLmcQ912ceuF
 KpudUQ3Y4eFiFwllocOfJYzFbh1NhNgKR6iqmlGBJ7EvD6MZEJpteHrdUMPrXb8FeyuegXnT6WL
 SapsKvVIyOjeG3gw=
X-Received: by 2002:a17:907:2128:b0:8af:54d0:181d with SMTP id
 qo8-20020a170907212800b008af54d0181dmr8419266ejb.35.1676902844391; 
 Mon, 20 Feb 2023 06:20:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/DG3e0RyFMymNymIv6agSG8ZOC6RSsynJSWJFuPNQsz4iGL/57SpfHhbVn67sMR/crp/fAGQ==
X-Received: by 2002:a17:907:2128:b0:8af:54d0:181d with SMTP id
 qo8-20020a170907212800b008af54d0181dmr8419243ejb.35.1676902844130; 
 Mon, 20 Feb 2023 06:20:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a1709064e0c00b008c405ebc32esm2901568eju.28.2023.02.20.06.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:20:43 -0800 (PST)
Message-ID: <6e1339e1-2ac3-ed93-2e78-c34314646806@redhat.com>
Date: Mon, 20 Feb 2023 15:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] docs: build-platforms: refine requirements on Python
 build dependencies
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230217124150.205012-1-pbonzini@redhat.com>
 <Y++dVjax+6GdtEr1@redhat.com> <87cz67493r.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87cz67493r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/18/23 10:27, Markus Armbruster wrote:
> This one is valid.  Still, it's a "want", not a "must have".  If it was
> a hard "must have", then CentOS 8 support would be in trouble: no mypy
> out of the box, as far as I can tell.

Right, and in fact this is by design: these tools move too fast for a 
version packaged for RHEL8 in 2017 to be useful.

> (A) Commit to keeping mypy happy for all versions of mypy provided by
>      any supported build host
> 
> (B) Pick a single mypy version
> 
>      Developers have to run this mypy version, or else punt to
>      maintainers.  We'll naturally pick a mypy version the maintainers
>      are happy to run, so no need for them to punt to CI.  We can exploit
>      the full typing power of that mypy version.  We don't have to work
>      around issues older versions may have.
> 
>      Developers unable to run this mypy version locally get delayed
>      feedback.  Affects the intersection of "people working on Python
>      code we check with mypy" and "people developing exclusively on older
>      hosts".  If we further intersect with "people doing so on a somewhat
>      regular basis", I posit we get the empty set.
> 
> I think (A) is pretty much all downsides.  I like (B), but could be too
> rigid in practice.

I think (B) is feasible.  Right now those developers can use CI and in 
the future we'll have the ability to automatically set up a virtual 
environment for them.

Paolo


