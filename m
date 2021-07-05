Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721AB3BC1C5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:44:59 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RiM-0000xE-Hp
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0RhY-0000H9-4J
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0RhR-0005MY-SN
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625503440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kW/BJwZVnf5xtsN+vOu17s0ehe8TNNzqM+CHP2AG6JA=;
 b=KChZtQPB46XLFTUSLET3ULzOyn7nZ2xIMTQk74tNd3bG4d0xabJFqaGzZGs1F4E9EOSMsU
 7YvOY0BidvVfCYgvkf8UL44bTBOb+o27rnfou+XjlhXRmH82mbsy83S3Vcql+p8aiTkNWh
 cIovWuRg6GM6cfFOLYFXYaJkRdlZjYY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-89B7yBUdO1eOEtI12a_Odg-1; Mon, 05 Jul 2021 12:43:59 -0400
X-MC-Unique: 89B7yBUdO1eOEtI12a_Odg-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adff04c0000b029013253c3389dso1961170wro.7
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kW/BJwZVnf5xtsN+vOu17s0ehe8TNNzqM+CHP2AG6JA=;
 b=iXFPRsedFTrZh7J1fRkKUz4xTZgcSVyRSpw0jzgpNywt1EetnZUfgFzIHCPaebf7wH
 aQkLml0eN8EurqhAE6tAAj+CxqSeUSlyalkhHDdFp+/Rqt68Daj3vXzQxU6QbgnpzHm+
 EKUyXo9H3qkErj9O1ihv4w0eruAMack936cdtcevH4g4idAOa3yVFyllD8p/nXszipsb
 iteIjeQpr50YCNgta1m4rMFdTA+oq4jlcnabbxchmx5vtJF+ZnZhtJnCaNatNxZ4oBEt
 dKCggpRpL99/5SN6Mb1SqkviscY8YB/ITLtpzJQhLbDd6RtKX2ihDCj4rvl1ZODubiW9
 7J6A==
X-Gm-Message-State: AOAM532P9A0hHaL1UxnYpuqDThcrfpnkS5V7e8rRGhbG9KE8R5jnNVoB
 RkVLMvbQyOx2LjBrA6ukfl00kzTHJNRnzB00y5L5vowJBaDCw6xj0NoUDd62wiw5cmqrVtMVqkG
 slPf+z1ErERJf/g0=
X-Received: by 2002:a05:600c:49a4:: with SMTP id
 h36mr15561693wmp.122.1625503438056; 
 Mon, 05 Jul 2021 09:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/GJtBEjb0WEUZ1Gm8Yhp+iY09uHLoHN1vIOgboTaemNp9bMjUnM7EX+GGuHZCMLGfAr3qnA==
X-Received: by 2002:a05:600c:49a4:: with SMTP id
 h36mr15561673wmp.122.1625503437841; 
 Mon, 05 Jul 2021 09:43:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s1sm40072wmj.8.2021.07.05.09.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:43:57 -0700 (PDT)
Subject: Re: [PULL 0/2] Libslirp patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
 <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
 <CAJ+F1C+H7aw+_2+FspPv0nLtfbM=anBrhCaBWVYVhP6o8nqSDg@mail.gmail.com>
 <4b3021c2-ac50-d763-4113-10a200bdc9ac@redhat.com>
 <YOMyh9fu5ZEAlGHN@stefanha-x1.localdomain>
 <CAFEAcA9JnYri2TiB-zE1J0w26TQnUzzMe_z2XUD9YxBugJm6tg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b61a958-021d-bf2d-9fbb-09451f5fe22c@redhat.com>
Date: Mon, 5 Jul 2021 18:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9JnYri2TiB-zE1J0w26TQnUzzMe_z2XUD9YxBugJm6tg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/21 18:31, Peter Maydell wrote:
> 8 here means "8 bytes", not "8 bits". And indeed on i386 you can't
> do 8-byte atomics with simple insns.

You can, there's a cmpxchg8b instruction.  The problem is that somehow 
configure's view of this disagrees with what happens during compilation.

If anybody can send a config.log and make V=1 log, I can look at it.

Paolo

> The compiler's answer to this
> is "emit a call to a helper in libatomic, which will emulate an
> atomic access by taking some kind of lock". We don't ever want to
> fall back to "take a lock" because sometimes our accesses to the
> atomic variables are from TCG generated code -- this is why we
> don't link against libatomic. The problem is that we have not
> correctly detected that this compiler can't do inline atomics
> for 64-bit values and avoided using them. But at least we have
> made this a compile failure rather than a silently-wrong-code bug:-)


