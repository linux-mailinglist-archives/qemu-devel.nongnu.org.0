Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF34BD76B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 09:08:13 +0100 (CET)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM3jw-0006bc-Fp
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 03:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nM3ha-0005Zw-Rt
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 03:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nM3hZ-0003VN-BW
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 03:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645430744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYNUuATpFv1ujOK595zzw6RVCxJQhXE1kXAza6Ggd/o=;
 b=DdycibzV8HlSMAKu+0DG/0QJ/T4MND8w4BJwDYbC6W3Z5dXDZjEPZs2/mNovCy+bWbDC4e
 dEzO2yRHxyG0v1Y1fZjC3Z5zi9efbzmLpFwUHdSZKGNZaHdxESfzWqL53LIBhVI8K/MwW7
 zfUZ0pv55hnauspFzpKI05iYz1fy3OM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-JfV3US12NKWIIehpLVUbNA-1; Mon, 21 Feb 2022 03:05:43 -0500
X-MC-Unique: JfV3US12NKWIIehpLVUbNA-1
Received: by mail-ed1-f70.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso9683898edz.14
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 00:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wYNUuATpFv1ujOK595zzw6RVCxJQhXE1kXAza6Ggd/o=;
 b=aDQ8t30+fCON59QyUXd4a8BdLZeZbQaSA/yOQb0eIafyG100haHlNTEJfk2OyNmOpS
 jTlp8X44k4JycHHas8Fyv8JfH3IhVtd0Nzb0WBeqEtdZ4sRrB2vV5kXkIMiAurpaMptQ
 T39C0b6tg3l5cQkYuOpiSS0q6vnbpLf+w2hvB0qtlbSNc/Xh6GEvIdNM1CQxt8o/Mkoy
 141BED8iTWnP3dEtBHlV+4lunURYqhyoiE5IS799UozhkGo8LrfurfNttRcK++FBB4R7
 l/kIzydAEuc47J2SiITVZZn7DU55mZFaBCRnu/UqVkQqqrH51FswPmrW8WZlQe3sU/Az
 uP7w==
X-Gm-Message-State: AOAM5338LMMWV3qp3DA6drZayL8WdmolJcdOH9NtPuAOaLfp9bCXkeLD
 WvKrwXS0wyFw2v2PO0Kugbfgb+PhCLnFc3yGcwe8SWnX48bOPrsJODbZp6qAPEW5uJHBVNjwOq4
 trhZc02+kNIvorgI=
X-Received: by 2002:aa7:d591:0:b0:411:6c4f:1725 with SMTP id
 r17-20020aa7d591000000b004116c4f1725mr19946705edq.342.1645430742064; 
 Mon, 21 Feb 2022 00:05:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2t1h3BxVTxf94tx9B+SlKD8q88s6KlcuVBbKxv8uJtS5shaxaTRtZl1pOMDNHwhmHScGq+g==
X-Received: by 2002:aa7:d591:0:b0:411:6c4f:1725 with SMTP id
 r17-20020aa7d591000000b004116c4f1725mr19946670edq.342.1645430741746; 
 Mon, 21 Feb 2022 00:05:41 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l2sm8030465eds.28.2022.02.21.00.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 00:05:41 -0800 (PST)
Message-ID: <4bd9e1e4-1397-1125-b998-7e20831dc184@redhat.com>
Date: Mon, 21 Feb 2022 09:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
To: John Snow <jsnow@redhat.com>
References: <20220120142259.120189-1-hreitz@redhat.com>
 <3462d5d7-3032-421f-f2d2-d6564e9927a4@redhat.com>
 <CAFn=p-Ywz_mOMuuSxcJaUocuGSASnC-mDHnBFEK0MR7NpcZa6g@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Ywz_mOMuuSxcJaUocuGSASnC-mDHnBFEK0MR7NpcZa6g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.02.22 22:02, John Snow wrote:
> On Tue, Feb 15, 2022 at 12:14 PM Hanna Reitz <hreitz@redhat.com> wrote:
>> Ping
>>
>> (I can take it too, if you’d like, John, but you’re listed as the only
>> maintainer for hw/ide, so...  Just say the word, though!)
>>
> Sorry, I sent you a mail off-list at the time where I said you were
> free to take it whenever you like. Why'd I send it off-list? I don't
> know....
>
> Please feel free to send this with your next block PR.

Oh, oops.  You’re right.  I seemed to remember you saying something 
along those lines, but when I tried to support my memory with some 
factual email, I didn’t immediately see it, because I sorted that 
off-list mail somewhere else than where I was looking...

Thanks, will do!

Hanna


