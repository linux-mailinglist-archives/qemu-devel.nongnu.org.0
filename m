Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB83310CF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:32:50 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGwD-0003LV-Py
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJGu2-0001ps-8a
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJGtz-0001EV-IV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615213830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v//DgpbF1N+L2rH8LCnj1v/PpmggFuJzQgdtHiHS0FM=;
 b=hteSTTYPXP57FEZjMVfaDARaV2Wyr7sHQN5/0NAdqnCZRX1wD/tG4yRMezdt2TRJmkneFv
 +lleoWmu0FuUkpeUtC/eMh4ZYe2SGAN04sc83MmSFVa+2+aonjZvEUgJTcTBNmlao3sw5Y
 8sKLlyQoMvLjBTDh9oxhJtuChrxJOvQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-_PN5EA8kMT6qwyaXFSEWzQ-1; Mon, 08 Mar 2021 09:30:26 -0500
X-MC-Unique: _PN5EA8kMT6qwyaXFSEWzQ-1
Received: by mail-ej1-f70.google.com with SMTP id gn30so4081758ejc.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v//DgpbF1N+L2rH8LCnj1v/PpmggFuJzQgdtHiHS0FM=;
 b=HXLtVunkL3+sLbAlAg81Jv4zaRsnI5s7Yi3R1ozYNvFW6pccSBKQDF8xy6cXE1kqCi
 hsS7s3DJeUa4gFvgPq5u/WRcTrU3KXx28DU+KPV0dDaaNTxxbX4feP+vFoKb/8jDKQoT
 cWCoQlrZ1zvk1ZY2N0ygWYfn5WT/F5Ao0QdUN5AWh/xZmlZA6gUgqqBf5rO5zO5aw4gZ
 Mg+DXfAhuqUZ/+Lq26qiBPplau2BSLB/BnHWRNWNLIIc9bimnEHPHdZQgVJFlSurAgtN
 ut7DgAIQidQ8J8BRL6bohOh/TK9jFCiQYb0JKDtphJermn/fcnuKy3jluihGkaCVyKAE
 l5Dg==
X-Gm-Message-State: AOAM530l3HjFAsZKD611UkdaQ3ozZ7rgsjmiguYZ1g0vCxip5bI6a8ZW
 y7593y4T++Fr+lxksb5X3RdzGhV4bh0HdO89XdW+WlXVNzKkKQIPsOsWmFdJEQSCA7VZvnSURKF
 AMo34O9ZHA7JbqaM=
X-Received: by 2002:a17:906:7cc:: with SMTP id
 m12mr7235763ejc.171.1615213825041; 
 Mon, 08 Mar 2021 06:30:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp74u95LtShT+IhUczN3fA0p3JYtgMJ3MEdA6s31EwO5VEIWWYi87G1J+9xaimhza+C+esnA==
X-Received: by 2002:a17:906:7cc:: with SMTP id
 m12mr7235737ejc.171.1615213824840; 
 Mon, 08 Mar 2021 06:30:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a2sm5988695ejy.108.2021.03.08.06.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:30:24 -0800 (PST)
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <134602378.QJW5UkElOJ@silver>
 <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
 <2083224.5eVbfnxiYP@silver>
 <CAMVc7JVK0FuBuyVvH3ai7V2HxQeiy8dMPHDYB-c7w7ARQL7nMw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2f4c50c9-930f-b820-b507-d9e43da20093@redhat.com>
Date: Mon, 8 Mar 2021 15:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMVc7JVK0FuBuyVvH3ai7V2HxQeiy8dMPHDYB-c7w7ARQL7nMw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 3:17 PM, Akihiko Odaki wrote:
> 2021年3月8日(月) 23:03 Christian Schoenebeck <qemu_oss@crudebyte.com>:
>>
>> BTW, there is __nonnull supported by clang, e.g.:
>>
>> static void foo(void *__nonnull p) {
>>         ...
>> }
>>
>> Maybe as an optionally defined macro (if supported by compiler) this could be
>> a useful tool for such intended nonnull designs, as it immediately emits
>> compiler errors.
>>
>> Best regards,
>> Christian Schoenebeck
>>
>>
> 
> GCC has nonnull attribute and clang accepts it too. However, it
> specifies argument indices, which is harder to understand and to
> maintain.
> __attribute__((nonnull(2)))
> void f(void *k, void *l);

Richard once suggested to add QEMU_NONNULL(), I have been using
it on a series trying to enforce non-null uses of QOM
'struct Object *owner' but it didn't work out because migrations
of MemoryRegion, some have NULL owner in MachineState.

I also discarded it because Daniel said it could have side-effects
https://www.mail-archive.com/qemu-devel@nongnu.org/msg720739.html


