Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B926AC2C3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBbP-000389-L2; Mon, 06 Mar 2023 09:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZBbN-00037s-KC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZBbM-0000Z8-4c
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678112047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqAMWlnPa7xtaP4Ctr55YPboN8VC7G+VxMdE/xxKNd4=;
 b=YP3BDQmrkzr9l3h6SoqoRau6ErF2PJRUKLAKi1sGY3NFbecP3YHUUyUlDh/xJtTE4AXWYt
 1KBn5Lb/bD4X3Xm5G4EA8s7T9SBZWrPuVP8uVbChAd4aUtvAHYmFs6LilzkAI9oCrCu+DB
 iHjHF89avJokAGM0ESU1tejuofthHyY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-tDVjQcoXPRq5R7kPT-9_zA-1; Mon, 06 Mar 2023 09:14:06 -0500
X-MC-Unique: tDVjQcoXPRq5R7kPT-9_zA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso14146823edt.22
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqAMWlnPa7xtaP4Ctr55YPboN8VC7G+VxMdE/xxKNd4=;
 b=R+7milJJh2jl9s9S3jlow4HY+XeNACPkhn8vbdNamy/UlC2RFazYSs7e52TrznjbKF
 R8OblUvQGc37xN+AleO3eCDsFqkEcYESQvK3KOgsozxfsjQjSCjNkuMyWlxGBCpQ1CMA
 macRLAxPaIEIn/wbBkQDUj0Rt5iEJHn8t5Yw2126M18NmL+/cVMISF5lHqdj2JlenMsG
 JNhda/CjNMPry4JuDWIdkd12yVVl993FUCqhgxZ7WWdcnGco7y68r51V4ljZvXO+a605
 Zl+aIZXe6rGS/iA/jMV6AqIOzdNr+d47lSDuBSVT9uB7kg4grqwp2BWGQZ581kimRAXh
 sIrg==
X-Gm-Message-State: AO0yUKVEpn3MkyW/FCQ6nMqjcZj4YdiB7ON/m04+GbRZuV7/tjXvKzZF
 y2nkmMMtXwuwUj26BKkD2P2QxiqXv5IRyValedkUCIAE2/0ONAsWEz/+amCfJxiu7dEa6lpq4Xp
 Tp/DbfLfUF8rlwpQ=
X-Received: by 2002:aa7:c493:0:b0:4ae:eb0f:892e with SMTP id
 m19-20020aa7c493000000b004aeeb0f892emr8482276edq.20.1678112044932; 
 Mon, 06 Mar 2023 06:14:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+IO/RIWtn2FJbYTf6SryhwCJ4IVHzcKnazQkklGJFWntoc431izeSAGKLNikrvET99H3wKww==
X-Received: by 2002:aa7:c493:0:b0:4ae:eb0f:892e with SMTP id
 m19-20020aa7c493000000b004aeeb0f892emr8482253edq.20.1678112044534; 
 Mon, 06 Mar 2023 06:14:04 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 n6-20020a17090673c600b008c607dd7cefsm4655447ejl.79.2023.03.06.06.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:14:03 -0800 (PST)
Message-ID: <5ef3a5c3-7d68-5b25-1584-622b65aed6e1@redhat.com>
Date: Mon, 6 Mar 2023 15:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] Fix missing memory barriers on ARM
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <84e0bb51-c731-eeaa-f042-d8b54022fc2c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <84e0bb51-c731-eeaa-f042-d8b54022fc2c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 3/6/23 14:35, David Hildenbrand wrote:
>> Note: I have a follow-up set of patches that gets rid completely of
>> atomic_mb_read(); atomic_mb_set() instead can remain and mimic Linux's
>> smp_store_mb() operation.  A glimpse of these changes is already visible
>> in patches 7 and 8.
> 
> That sounds interesting. I was briefly confused about atomic_mb_* ...
> 
> ... do we want to add some Fixes: tags or is it too hard to come up with 
> something reasonable?

The Fixes tag would often point to

     commit a0aa44b488b3601415d55041e4619aef5f3a4ba8
     Author: Alex Bennée <alex.bennee@linaro.org>
     Date:   Thu Jan 28 10:15:17 2016 +0000

     include/qemu/atomic.h: default to __atomic functions
     
     The __atomic primitives have been available since GCC 4.7 and provide
     a richer interface for describing memory ordering requirements. As a
     bonus by using the primitives instead of hand-rolled functions we can
     use tools such as the ThreadSanitizer which need the use of well
     defined APIs for its analysis.
     
     If we have __ATOMIC defines we exclusively use the __atomic primitives
     for all our atomic access. Otherwise we fall back to the mixture of
     __sync and hand-rolled barrier cases.

(for which I would have sworn I was the sole perpetrator, not just the
committer).  But it pre-dates some of the code that is being fixed, so
I am not sure it makes sense to add it.

Paolo


