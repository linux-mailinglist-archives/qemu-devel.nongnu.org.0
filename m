Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB220CFB8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 17:37:23 +0200 (CEST)
Received: from localhost ([::1]:41386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpvqU-00071M-1c
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 11:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jpvmr-0004La-E2
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:33:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24045
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jpvmo-0003Jz-9G
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593444813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgp37D4A22DyyJeJlO5/5oM67EXfEP8dkN1Sqgfe31A=;
 b=GBwpeCEqWSljeSN7TJUImEqPnJjUevCISKhFZDpemWF0Rx2xsM8Mb8jCemImWPf0YRreVP
 T/6nUS1Il6Y/LE6BhN79Sa6XSuggfxyMdRxy94HTv1VgPCRhVXm0WKfAMv3m0YcJXtD8Xu
 W2a/7NLnMDZ8nStxeMUiqFb20bhwbHs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96--LBAIUI9MkqM8YqFpU4mmA-1; Mon, 29 Jun 2020 11:33:31 -0400
X-MC-Unique: -LBAIUI9MkqM8YqFpU4mmA-1
Received: by mail-wr1-f72.google.com with SMTP id o25so16614649wro.16
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 08:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tgp37D4A22DyyJeJlO5/5oM67EXfEP8dkN1Sqgfe31A=;
 b=GkUznDXvBVkUAlYhFKjun2AMrrlc/LxdKOxvqZ2TvIWub7BmhoDLhQDFuMvZJVy7gk
 o48rpAKxMYN6oCnK10z+ZkAYCdhp49q2oWbgFZV6mHgoxapIG/CRDxT6nD9yukbjA/FU
 rPF30sD+B8MhfzVc4I0H+pm4yqQTyTN5O1/sGBYwVyqmxOInYhIeFmLDl6z4vvqtsNEk
 KMLx1TY6kPTkstHcW39C0ORQVzLBKytQGXXRB4c2+E15RO0yACw8qD3+Pgn8bss1Ce/M
 ww2ZhP47EcfnRrSfsiUZO2Yd064IdrUXpwHkczsguFlvBHj6LVpz20Wl0xQxoSncaGeM
 RClw==
X-Gm-Message-State: AOAM530sZUXGsAtZk6RVgqPRa1pUdHuvBYURveoNdJd9PC/x23uZoZxK
 ith8mGwrEKWISzyvBylGienwN14dst13seQOZIAxuMR1LKiS3NjoTzmAlJRInQ9H3l5ldKlK/rR
 LmXcp9COHWuG1fU8=
X-Received: by 2002:a5d:5549:: with SMTP id g9mr18571701wrw.419.1593444810469; 
 Mon, 29 Jun 2020 08:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh+fUE7kLhaCNk3+4XRrf1VAwiRkFzOOLuBs/98SgigCdX3jnzkHcLfOC8Hyg3QITSqWxYmQ==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr18571692wrw.419.1593444810298; 
 Mon, 29 Jun 2020 08:33:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b0e5:c632:a580:8b9a?
 ([2001:b07:6468:f312:b0e5:c632:a580:8b9a])
 by smtp.gmail.com with ESMTPSA id 63sm54672wra.86.2020.06.29.08.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 08:33:29 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] tz-ppc: add dummy read/write methods
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 P J P <ppandit@redhat.com>
References: <20200624185523.762240-1-ppandit@redhat.com>
 <20200624185523.762240-8-ppandit@redhat.com>
 <7ffe6cd9-fc23-3fdf-6c57-7bb0af0dd030@redhat.com>
 <nycvar.YSQ.7.77.849.2006251427210.92950@xnncv>
 <86ed036e-cbf1-834d-59d9-af6db7b750ef@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59de3903-cd09-2ee2-db89-a4afd25c4dc4@redhat.com>
Date: Mon, 29 Jun 2020 17:33:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <86ed036e-cbf1-834d-59d9-af6db7b750ef@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/20 12:21, Philippe Mathieu-Daudé wrote:
>> | >      g_assert_not_reached();
>> | 
>> | This is a shame we now have to fill the read/write handlers for
>> | unreachable code :( 
>> |
>> | > +static uint64_t tz_ppc_dummy_read(void *opaque, hwaddr addr, unsigned size)
>> | 
>> | I'd instead use a clearer:
>> |        g_assert_not_reached();
>> | 
>> | > +static void tz_ppc_dummy_write(void *opaque, hwaddr addr,
>> | 
>> | Ditto:
>> |        g_assert_not_reached();
>>
>> This will likely be called in tz_ppc_dummy_accepts() above. Do we still want 
>> to revise this patch? considering read/write callbacks are unreachable.

What would be called in tz_ppc_dummy_accepts()?

Generally g_assert_not_reached is better (even better than abort :)).

Paolo


