Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5EE650E91
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HzC-0008BN-7D; Mon, 19 Dec 2022 10:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7HzA-000890-5g
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:23:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7Hz8-0002sq-5b
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671463401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPEendfXEKrGQ06E6Zpg0u/sZiMUgQbq53wQHu9jKtk=;
 b=cL24vTHFeMtkHzleVB6DeyWJ93g6fWjmq20b+xjsSFICvJjicxLz/XjeDX0fMhKMmpaMAp
 rXOXYI32OcH9wa6M1B0aCPzSaEG59nyl1zZS1hO7JtMV5hP1tn7jX35+VgY7Hhn+zS9y+x
 Pa+lp3i3Mm01vVWcUxVqjS65A+jmbeU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-T9VPmU_BOW6Ii2Vr3FaG8A-1; Mon, 19 Dec 2022 10:23:19 -0500
X-MC-Unique: T9VPmU_BOW6Ii2Vr3FaG8A-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so1640350wra.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPEendfXEKrGQ06E6Zpg0u/sZiMUgQbq53wQHu9jKtk=;
 b=060jh4RMw3ZpXm97zWYV6Y11Tb4mUjmFIzLdLM1hfXIExae0OP7FPtpsNMLCnXT6p5
 zbSPt5pk4la2v8ZZJRE/xLlnCA0EHmB5xw/CnZev2y4Bl+kiP8Pk3qAX0mG9StUeiXu8
 FbPPWxdTgernD/uGSwFykQvyFgcDHJNO4Dd2rbDxhoPyd9u2nRs4GF5HuDEAzmIpFNq2
 LKx5o8dnXpDW1KAM/13r+L9MVvu5usQXN6viNcbxyXGzT+LLJ41CLC+vRImmUgSwmGCK
 mJV+OwK6VFONiw+bxmUfn8qSAiKj9tK4LbWKqPyTka8h5I4QzKTIaD0+Mbx0IuRZ584B
 OjJw==
X-Gm-Message-State: ANoB5pkHR6Nl2q+blboH1sJRrhY+wv8oLxthNhVdUg68eD/bwqW+pgR7
 oZLxH+jpNz6/+NBYrM5r0Sa17AQzlSLfcjU8E+0W6MSm+97aTRGCy0rGaIzvV2MdSir+FUBBaIF
 ISOoFznyzdb/45II=
X-Received: by 2002:a5d:5904:0:b0:242:2844:8489 with SMTP id
 v4-20020a5d5904000000b0024228448489mr23860669wrd.8.1671463398452; 
 Mon, 19 Dec 2022 07:23:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7/8DBxOid3/KmER/BhFraXLx3OVmdAN8dRuwYgQO7lHgmAceoyYGXMDJh1R3IKjHTF4gsd6Q==
X-Received: by 2002:a5d:5904:0:b0:242:2844:8489 with SMTP id
 v4-20020a5d5904000000b0024228448489mr23860655wrd.8.1671463398171; 
 Mon, 19 Dec 2022 07:23:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:e900:df20:b417:7171:f748?
 (p200300cbc704e900df20b4177171f748.dip0.t-ipconnect.de.
 [2003:cb:c704:e900:df20:b417:7171:f748])
 by smtp.gmail.com with ESMTPSA id
 w16-20020adfee50000000b002420dba6447sm10203931wro.59.2022.12.19.07.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 07:23:17 -0800 (PST)
Message-ID: <31a929de-5ebc-8f79-0d28-e617d5b334b1@redhat.com>
Date: Mon, 19 Dec 2022 16:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
 <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
 <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
 <536107c6-b142-d5aa-0d94-4277a5c5af15@redhat.com>
 <e264e466-5cff-3b7f-9850-ba203ce02828@redhat.com>
 <302262b2-e928-7013-3f4e-4ab5a9616844@redhat.com>
 <88d57d47-09e5-ebd8-82aa-f289a05e0517@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <88d57d47-09e5-ebd8-82aa-f289a05e0517@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19.12.22 12:10, Michal Prívozník wrote:
> On 12/19/22 10:58, David Hildenbrand wrote:
>>
>> I'll fixup. I just queued the fixed-up patch to
>>
>> https://github.com/davidhildenbrand/qemu.git mem-next
>>
>> Please double-check. Thanks!
>>
> 
> Looks good. Sorry for not doing it properly the first time.

No worries, caught it while testing if the checks (including 
cc.has_function()) work as expected :)

-- 
Thanks,

David / dhildenb


