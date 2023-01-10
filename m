Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C5663AB2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:16:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9hk-0001PU-HP; Tue, 10 Jan 2023 03:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pF9hc-0001OP-W9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:09:49 -0500
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pF9ha-0001Tj-J4
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:09:48 -0500
Received: by mail-qv1-xf32.google.com with SMTP id l14so4255661qvw.12
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MkXOSS2Uc9GbZzBorr10V4YZUN0RM+L3dSx93LSbri4=;
 b=A+Hm8NF/jyBecNYFL9UNplHWfApXxoJn/1QF+ahcdOLIJbuMWYAm7Ct7msQawJ1CgT
 HOje2bl8/kxfdfKsxNEDG/Oa7JGugu9dYTGaeUux3YX6bDBx2xElsdtZ7krPr5z2FEWY
 UzNmjFrQ7Ut57UWNb5ZupbrYf/VH3QSdukYK2jFKg6M5IACsNw5cIWMqCLp9IeH9E6cD
 9Kvb3U71P2vBP8uE7QJwl8ia2/LBRM9fNZXjM9HFrWlv81yzOCjYyEMKZ8uc5+xKkGYy
 LXpw6KQddoiUGcRmkS4nbaefQp38DNoxgLJVPU4Elqkp06vKvApzyKukopQAAuc8CryO
 3fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:in-reply-to
 :references:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkXOSS2Uc9GbZzBorr10V4YZUN0RM+L3dSx93LSbri4=;
 b=s6bi4YO4fQrxYlh6Eu6/zBaPeS8LbVAMZFO2q9Xto0lRIUt8tJj4E+mxq3JOqbzuHN
 MHtuuaUViLIvXlKiPze614Ar5sV47JPo2KkOAQDsCDPQ5G54mFFNvxF7G3uFvPIA1Vrk
 UQxYbNu8prqQxLalbyfKEpcUFOzmetlFR6slrY/cj8e6DQN8OTCd0UuBK65pV8+pUVCg
 H1+fYLAF89VVnUkVQI7mGnZvdrsbuSNf+Dtbxkm3sZsKhqZrS3AcH+2Dy/ww2aUYrTjq
 q5YqY7BBfTW45V4/3j1FVCsgaBzWLE/py2KbLmcba+49nQb6q/MMUODN1ZAu3AWBmMrY
 Odng==
X-Gm-Message-State: AFqh2kp1U7TpOqHdcCwWAklPfirP1uQX29Ci0Sxsc7KVMAdpjqCZFUhV
 zfHq/DKE7IJENFt6gxiIHu1khUtnJJnXORMv9S3XLA==
X-Google-Smtp-Source: AMrXdXtJv8qAgG+RhPH90HFZiNU+ExtoM/K5RQtdNdJHzxk7skMcvrWBZiJOF7cLVE0Cba7fyLf7ACTWmG3/TZabcUY=
X-Received: by 2002:a0c:fac8:0:b0:532:f58:9fa6 with SMTP id
 p8-20020a0cfac8000000b005320f589fa6mr1613203qvo.124.1673338182266; Tue, 10
 Jan 2023 00:09:42 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Tue, 10 Jan 2023 00:09:41 -0800
Mime-Version: 1.0
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
 <Y6XPRD4fSucgWZfT@x1n>
 <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
 <Y7RpPwGd0WvrENlz@x1n>
In-Reply-To: <Y7RpPwGd0WvrENlz@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Date: Tue, 10 Jan 2023 00:09:41 -0800
Message-ID: <CALophuvJ2g7D9idGHfQEK3Co7o06ab38ZK3CCGZX0tDdQX_+Tg@mail.gmail.com>
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
To: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, David Gilbert <dgilbert@redhat.com>, 
 "Quintela, Juan" <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="000000000000f18f9c05f1e467d5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: 19
X-Spam_score: 1.9
X-Spam_bar: +
X-Spam_report: (1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000f18f9c05f1e467d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Peter and Paolo,
I'm sorry I didn't reply to your email in time. I was infected with
COVID-19 two weeks ago, so I couldn't think about the problems discussed
in your email for a long time.=F0=9F=98=B7

On 2023/1/4 =E4=B8=8A=E5=8D=881:43, Peter Xu wrote:
> Hi, Paolo,
>
> On Wed, Dec 28, 2022 at 09:27:50AM +0100, Paolo Bonzini wrote:
>> Il ven 23 dic 2022, 16:54 Peter Xu ha scritto:
>>
>>>> This is not valid because the transaction could happen in *another*
>>> thread.
>>>> In that case memory_region_transaction_depth() will be > 0, but RCU is
>>>> needed.
>>> Do you mean the code is wrong, or the comment? Note that the code has
>>> checked rcu_read_locked() where introduced in patch 1, but maybe
something
>>> else was missed?
>>>
>> The assertion is wrong. It will succeed even if RCU is unlocked in this
>> thread but a transaction is in progress in another thread.
> IIUC this is the case where the context:
>
> (1) doesn't have RCU read lock held, and,
> (2) doesn't have BQL held.
>
> Is it safe at all to reference any flatview in such a context? The thing
> is I think the flatview pointer can be freed anytime if both locks are
not
> taken.
>
>> Perhaps you can check (memory_region_transaction_depth() > 0 &&
>> !qemu_mutex_iothread_locked()) || rcu_read_locked() instead?
> What if one thread calls address_space_to_flatview() with BQL held but
not
> RCU read lock held? I assume it's a legal operation, but it seems to be
> able to trigger the assert already?
>
> Thanks,
>
I'm not sure whether I understand the content of your discussion correctly,
so here I want to explain my understanding firstly.

From my perspective, Paolo thinks that when thread 1 is in a transaction,
thread 2 will trigger the assertion when accessing the flatview without
holding RCU read lock, although sometimes the thread 2's access to flatview
is legal. So Paolo suggests checking (memory_region_transaction_depth() > 0
&& !qemu_mutex_iothread_locked()) || rcu_read_locked() instead.

And Peter thinks that as long as no thread holds the BQL or RCU read lock,
the old flatview can be released (actually executed by the rcu thread with
BQL held). When thread 1 is in a transaction, if thread 2 access the
flatview
with BQL held but not RCU read lock held, it's a legal operation. In this
legal case, it seems that both my code and Paolo's code will trigger
assertion.

I'm not sure if I have a good understanding of your emails? I think
checking(memory_region_transaction_get_depth() =3D=3D 0 || rcu_read_locked(=
) ||
qemu_mutex_iothread_locked()) should cover the case you discussed.

What's your take?

Thanks!

--000000000000f18f9c05f1e467d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi, Peter and Paolo,
<br>I&#39;m sorry I didn&#39;t reply to your email in time. I was infected =
with
<br>COVID-19 two weeks ago, so I couldn&#39;t think about the problems disc=
ussed
<br>in your email for a long time.=F0=9F=98=B7
<br>
<br>On 2023/1/4 =E4=B8=8A=E5=8D=881:43, Peter Xu wrote:
<br>&gt; Hi, Paolo,
<br>&gt;
<br>&gt; On Wed, Dec 28, 2022 at 09:27:50AM +0100, Paolo Bonzini wrote:
<br>&gt;&gt; Il ven 23 dic 2022, 16:54 Peter Xu  ha scritto:
<br>&gt;&gt;
<br>&gt;&gt;&gt;&gt; This is not valid because the transaction could happen=
 in *another*
<br>&gt;&gt;&gt; thread.
<br>&gt;&gt;&gt;&gt; In that case memory_region_transaction_depth() will be=
 &gt; 0, but RCU is
<br>&gt;&gt;&gt;&gt; needed.
<br>&gt;&gt;&gt; Do you mean the code is wrong, or the comment?  Note that =
the code has
<br>&gt;&gt;&gt; checked rcu_read_locked() where introduced in patch 1, but=
 maybe something
<br>&gt;&gt;&gt; else was missed?
<br>&gt;&gt;&gt;
<br>&gt;&gt; The assertion is wrong. It will succeed even if RCU is unlocke=
d in this
<br>&gt;&gt; thread but a transaction is in progress in another thread.
<br>&gt; IIUC this is the case where the context:
<br>&gt;
<br>&gt;    (1) doesn&#39;t have RCU read lock held, and,
<br>&gt;    (2) doesn&#39;t have BQL held.
<br>&gt;
<br>&gt; Is it safe at all to reference any flatview in such a context?  Th=
e thing
<br>&gt; is I think the flatview pointer can be freed anytime if both locks=
 are not
<br>&gt; taken.
<br>&gt;
<br>&gt;&gt; Perhaps you can check (memory_region_transaction_depth() &gt; =
0 &amp;&amp;
<br>&gt;&gt; !qemu_mutex_iothread_locked()) || rcu_read_locked() instead?
<br>&gt; What if one thread calls address_space_to_flatview() with BQL held=
 but not
<br>&gt; RCU read lock held?  I assume it&#39;s a legal operation, but it s=
eems to be
<br>&gt; able to trigger the assert already?
<br>&gt;
<br>&gt; Thanks,
<br>&gt;
<br>I&#39;m not sure whether I understand the content of your discussion co=
rrectly,
<br>so here I want to explain my understanding firstly.
<br>
<br> From my perspective, Paolo thinks that when thread 1 is in a transacti=
on,
<br>thread 2 will trigger the assertion when accessing the flatview without
<br>holding RCU read lock, although sometimes the thread 2&#39;s access to =
flatview
<br>is legal. So Paolo suggests checking (memory_region_transaction_depth()=
 &gt; 0
<br>&amp;&amp; !qemu_mutex_iothread_locked()) || rcu_read_locked() instead.
<br>
<br>And Peter thinks that as long as no thread holds the BQL or RCU read lo=
ck,
<br>the old flatview can be released (actually executed by the rcu thread w=
ith
<br>BQL held). When thread 1 is in a transaction, if thread 2 access the fl=
atview
<br>with BQL held but not RCU read lock held, it&#39;s a legal operation. I=
n this
<br>legal case, it seems that both my code and Paolo&#39;s code will trigge=
r assertion.
<br>
<br>I&#39;m not sure if I have a good understanding of your emails? I think
<br>checking(memory_region_transaction_get_depth() =3D=3D 0 || rcu_read_loc=
ked() ||=20
<br>qemu_mutex_iothread_locked())  should cover the case you discussed.
<br>
<br>What&#39;s your take?
<br>
<br>Thanks!</p>

--000000000000f18f9c05f1e467d5--

