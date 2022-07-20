Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325D157BD56
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 20:03:54 +0200 (CEST)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEE36-0000mw-Qt
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 14:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEE17-0007pY-7W
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:01:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEE13-0006Ux-Kh
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658340104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKj+el3PkLZ2667Fp5/jxwr4WgURWLLXcvUKdB8Uj38=;
 b=IT7AMudxlTN03HLvsP6fD/Rpjj6M0rC1pTfa6FDhRsqDc/WH4y05IBX0nb9f5MpyVS5XAi
 jazu39kRzjxK+VptJvc4YmEGqOTpbkbjNwLA8BARGfivWaJaV4jXV2bSsaxulWshclDgPJ
 NxrOJEAjdjndP+MbXSgewK4Wi+YwVuo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-u69Nn_61PJumN5GVgsFX6g-1; Wed, 20 Jul 2022 14:01:37 -0400
X-MC-Unique: u69Nn_61PJumN5GVgsFX6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so1604134wms.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 11:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WKj+el3PkLZ2667Fp5/jxwr4WgURWLLXcvUKdB8Uj38=;
 b=j+yVc6O6FfC/Y9UOZJA0qRYt2UwzaYbU6VurWNWgoyR9U/sXwIY0H3DQlidMm0ScTt
 S+qsFHi04EQ8+SIKM7x3HY82dtmPlNWmI4hXCHyOek07M1AljRpmdHhCIhprbHIO9yFR
 piulekKaFPvoE316vp9EEh2P06rBqLFTr1DJypNbNvoGgp3pKCnNgmJAJFDmFf2NPM6h
 hpIoMBo2kaktO1jbWTNeA5n98YBakF3lVlHEm6HgjHqDQhEQXJtGnJ8WHq8UQV1CJ9Oz
 QPShFKDM8vPsaqe7pAJiIdlq54zmTb9vb55WSMenuwipTyPENI0UiCt6f+qJFS93wAyG
 taOQ==
X-Gm-Message-State: AJIora9qBRliJOm65XWKRJ38tVuWQbuTvf528His3PpiblXBDnpLuelh
 THiKdz/T9p2MO5bRaUUHtaAtmrwg7A7g06h7NoD3j/27C03GS/ov9ynTo63NkgqnGB7BBx2MNXz
 NThaVV8OAQzSX/G0=
X-Received: by 2002:a5d:6d0a:0:b0:21d:6f28:5ead with SMTP id
 e10-20020a5d6d0a000000b0021d6f285eadmr30764875wrq.95.1658340096048; 
 Wed, 20 Jul 2022 11:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTHn4iEoEzKHjHMFLydP2cPji7tSJwZXpNM/LiOOygxGvEgofGAf22Q3aKrCvfPDhoO1e5KA==
X-Received: by 2002:a5d:6d0a:0:b0:21d:6f28:5ead with SMTP id
 e10-20020a5d6d0a000000b0021d6f285eadmr30764844wrq.95.1658340095634; 
 Wed, 20 Jul 2022 11:01:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:e00:8d96:5dba:6bc4:6e89?
 (p200300cbc7060e008d965dba6bc46e89.dip0.t-ipconnect.de.
 [2003:cb:c706:e00:8d96:5dba:6bc4:6e89])
 by smtp.gmail.com with ESMTPSA id
 r28-20020adfa15c000000b0021e4e9f6450sm1550075wrr.84.2022.07.20.11.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 11:01:35 -0700 (PDT)
Message-ID: <832b3571-4ae6-1e53-acf4-e3141b0957d8@redhat.com>
Date: Wed, 20 Jul 2022 20:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <YtaUQkVUPVHt+v0Z@zx2c4.com>
 <20220719114307.102643-1-Jason@zx2c4.com>
 <2b3d579a-295a-cd25-70c3-ecb551e74cf4@redhat.com>
 <Ytft08S2eGaYVwC3@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Ytft08S2eGaYVwC3@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> Again, what about the warning? We don't want to report warnings in the
>> QEMU default.
> 
> The change to cpu_models.c above gets rid of the warning.

Ah, stupid me. I missed that hunk somehow completely.

[...]

>> We have to be careful in 24-bit an 31-bit address mode, we may only
>> update selected parts of the registers.
>>
>> See target/s390x/tcg/mem_helper.c:set_address() as an example on how to
>> modify parts of registers using deposit64().
> 
> That's not pretty, but I think I see how to do it.
> 
> New revision incoming. Thanks for the review!

Thanks Jason!


-- 
Thanks,

David / dhildenb


