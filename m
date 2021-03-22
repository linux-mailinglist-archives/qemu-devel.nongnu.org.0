Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F057344030
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:54:01 +0100 (CET)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJ8C-0001Sw-Ip
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOJ6y-0000pt-MB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOJ6x-0003yX-6r
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616413962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvKZCTQ9iZG7mTzYZ8ESbjIA0odafiji0yVLbt2HKzc=;
 b=LDQlTxILAjwBn7JPb9sIzqoo3EMz5uUkIh6yzwTcudgRv4bbnnMltWqjmGbqRIrq8lZsVI
 GJsqXhI5IGaHjUJp2iMm3ke3cJkUCyncMIlB5zQJ8ijoKHdOJPQLOIh7y34QoWRVnekG1h
 kDc7eB2tQltJ/OA3GHH4j0+ngxYk8ik=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-5UjjVfp1MSiPL_E9nJze6g-1; Mon, 22 Mar 2021 07:52:40 -0400
X-MC-Unique: 5UjjVfp1MSiPL_E9nJze6g-1
Received: by mail-wr1-f70.google.com with SMTP id p15so25663179wre.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kvKZCTQ9iZG7mTzYZ8ESbjIA0odafiji0yVLbt2HKzc=;
 b=HGgdQvlrp690k/SXnlRIdPQMnjm+SA8/kTkt43qyVHXwuCvS5KPM1QJMlRTUQICK6L
 UDSM/Bz0ySBq/Q1EqeYWr1L1t2Kq36HAp3jWY9KeaLmnOpmEv44swLzJnXyMtTc3GQTq
 1wFV04Zz9aHfrDwXS9867UZpyOxh742bhzbq2VBjkBglSJT7yODU3FaJMMh7OyIWVLma
 BK+EtjlAFc7GrsHIG2dtIxHeKUFUHid7R2QXixPR6aa18hp+Dtvvg6G4mHn/f8hnal1w
 0EyClPl6n4mjuPEsI/JhbHZqXPOeDxrLrICFf+3w0nqlFqdeIrpf5E+qYy0aUO4AaYgE
 /rSQ==
X-Gm-Message-State: AOAM533i+JOZ1oDPlpxbYF2jNECW9lpQatwWlH6UGKailg7v3CcIw0ST
 U+N+hbunP3OtdFNkrFr579Ug8aILowSny7bLKadHNxEbTH4iVDPTL9uaDcTlEW45WMYAT7bxuJQ
 vZRko439zty3PtwcB6CzRjuVQgp0MSoBrch4fKTJje+vg32EF8ZmpoZmKYg3k9REJ1Ho=
X-Received: by 2002:a1c:e341:: with SMTP id a62mr16091230wmh.152.1616413959291; 
 Mon, 22 Mar 2021 04:52:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn7xIiSOEkR1RRBce4JkjHDtnoLSEjWHeFuht2rul0O1cQEh0DMeG6x9Z+DV2ZG2GQ7JwvOQ==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr16091209wmh.152.1616413959045; 
 Mon, 22 Mar 2021 04:52:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h62sm18268959wmf.37.2021.03.22.04.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 04:52:38 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
To: Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
 <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
 <20210319182022.veha5gbcg3p4idgk@steredhat>
 <CAGxU2F7hNoJeDpsCtU0ypKd=3+3mrxcc3QU6Yx9SK9e_7y6Khw@mail.gmail.com>
 <CAGxU2F5x_TNQZJ3f+baam3pHzzP+0k57FFNB5ms-qt3B25gSVQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c7f0fb65-5d9b-9b38-8348-30eaa5ff5594@redhat.com>
Date: Mon, 22 Mar 2021 12:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAGxU2F5x_TNQZJ3f+baam3pHzzP+0k57FFNB5ms-qt3B25gSVQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 11:59, Stefano Garzarella wrote:
> 
> If I build with gcc 10.2.1 20210313 (Alpine 10.2.1_pre2) uint64_t and
> UINT64_C(1) have a size of 4 bytes, while UINT64_C(0x2052545020445352)
> has a size of 8 bytes:
> 
>     warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     74 |     char (*__size1)[sizeof(uint64_t)] = 1;
>        |                                         ^
>     warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     75 |     char (*__size2)[sizeof(UINT64_C(1))] = 1;
>        |                                            ^
>     warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     76 |     char (*__size3)[sizeof(UINT64_C(0x2052545020445352))] = 1;

Looks like long is 4 bytes long with -m16 and -m32, but 8 bytes with 
-m64.  The large constant is extended to long long because it's the only 
way to fit it.

Paolo


