Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF93DDD84
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:23:23 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAaio-0008C4-8K
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mAahl-0007VB-Gu
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:22:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mAahj-0002iK-QO
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627921335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFGTVN1WzbAePh/PvqpavF9ZDDkCDyS+1J3GjXiznc0=;
 b=NX4BaFC3ywU/jih2kRl3r8b/DZ1o7PVfiFgGPUq4TdN6Z2uluT9TxEI0ejApQyNJBhqJDm
 gjNQzpb98/D+IWnGBxYF2iYGCBsSiwBNHlhgL5TQ31g0yZGfLukFFaIR63L1OgIvVMSi2W
 /Gd2IJONs/mcXOEo20vyylz+nbEQtNA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-iEoey6xhOlaTpCBWSGyVOQ-1; Mon, 02 Aug 2021 12:22:13 -0400
X-MC-Unique: iEoey6xhOlaTpCBWSGyVOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f142-20020a1c1f940000b029025093cddc1eso5233561wmf.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DFGTVN1WzbAePh/PvqpavF9ZDDkCDyS+1J3GjXiznc0=;
 b=rL3i7AO7PgTMVnip5+le15nGv4tBRUDYtgDiU0J3sQ/WigEYbLWvQlc1F7A+KA0XtX
 MytQ5eoDkfrha6DJgSoLKRsKCc5AoBp7RCJqlHGdac3JGJsxFgwLYXN8Y9crivL+h8hS
 PXwZQBo10vXxiQmu0eBdOrjuakk59a8O6thzcFZ2OWWyas5pKZoV0EYxgY/kSydATvnH
 5XPCSuuKtjUdmYeKMuqxCMGWXrMRaTPVW/XzsXeYW2fsCJmMjCjT/z0cZ2IasxkAsbJg
 IAL9dr7TGnGJ/N6tisORAv5u/pReqAIP82uZ2qY4D8AI5kt9Ab6y7dFwy5oK9+FkiVbg
 e1CA==
X-Gm-Message-State: AOAM532OR3Lhh4F/u4CUdc5KaL4mXWGPnB/M8TjObT9MSPYaAowsTFrh
 G61Ax2TAYuyomBvLCFu5Y3djiRwyVPbJD1FpGySSuovmZfu3dqeIHe9kMBvyhu2a8XwAaH6hg64
 ApOuwPCeEApfb+TTaqRuBBAK6WaD9FukVKVsVhodHxCaWXMh9afrjEn/iYy4TgrlZShc=
X-Received: by 2002:adf:f584:: with SMTP id f4mr18426123wro.211.1627921331644; 
 Mon, 02 Aug 2021 09:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDC1wC2GA5TUD3phQrtb6/DMrNXzXY/p0BEHTuEMIkaJFXUiNzwXudleSlo8oV+AgHQW1oUQ==
X-Received: by 2002:adf:f584:: with SMTP id f4mr18426105wro.211.1627921331447; 
 Mon, 02 Aug 2021 09:22:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s9sm11915676wra.80.2021.08.02.09.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 09:22:10 -0700 (PDT)
Subject: Re: [PATCH 0/6] Updates for Coverity modeling file
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <CAFEAcA_0oyeAQZSCscLvL-Au8zx2Z+-k528SfVJDBE_doYWbvg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f600d06c-3898-ab17-c82b-8c41c64d2159@redhat.com>
Date: Mon, 2 Aug 2021 18:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0oyeAQZSCscLvL-Au8zx2Z+-k528SfVJDBE_doYWbvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/21 14:46, Peter Maydell wrote:
>> This series is a sort of FYI; since the only way to debug the model file
>> is to upload it to scan.coverity.com, these changes are all already live.
>> The last will be as of the next build, but was effective last Thursday
>> and worked (I tried disabling it on Friday in something like a bisection,
>> but it failed and I have now reverted to Thursday's model).
> Thanks for digging through all this mess. I take it that the
> Coverity results are now stable and people can now start looking
> through them and triaging again ?

Yes, these patches are the final result of the "investigation".

Paolo


