Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AEA6B0A71
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 15:05:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZuOj-00004t-Dr; Wed, 08 Mar 2023 09:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZuOd-0008W5-US
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:04:00 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZuOZ-0005wX-Ss
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:03:59 -0500
Received: by mail-qt1-x836.google.com with SMTP id r5so18132303qtp.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678284226;
 h=cc:to:subject:message-id:date:references:user-agent:from
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=X8tmgqAyy3QIp+LuqC6Z+wTIThXjabBCR2ixC1RO+KY=;
 b=QqfmYIP41Sxqe17Q9KhPg/j42/dYIS6DJaKImD7VyKohKehQM+Gi9lsoIYoBDqHvMY
 d49hBzbLq8dlu1aWCZZK6gYGIuZ1lwUtz3qTIyTLK1mn4TtsONkXf4Z+E1H8iHdFFEdB
 Ty6hIK98hPJEX1BwjzNLQkIo2ylTTIgoExpbFIyLjHwthjXoFO37MX1e7lHUSNiadxWO
 MwKGBvkg6YC+XOrQs8+FT9cV7sb76aq3gdNeqEgytT2F+Q23NTYoI47DItMRjtj8EYVb
 Oef/IseNwjsXLjNpYaVVtEWUYzfExMQWiFU1Kw4kcQ5fmZcpedami5jmjmKO9DPB0LgF
 zVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678284226;
 h=cc:to:subject:message-id:date:references:user-agent:from
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8tmgqAyy3QIp+LuqC6Z+wTIThXjabBCR2ixC1RO+KY=;
 b=LgZVrUuHTQyJocEcb7hMSz2X5UKdreEauJ4zLd/Q2a4nNAk3V4El2BTfFzESW5Usbh
 U0K+pupW9F/5O9ZGHAopItMWXNmEY7LlHce6VNZqHLtNW6/mxNnArU4WnMNi9H2EUlNw
 FatrP0lEzUqgiDQISkKuV0GHhVFiZzYWCb/ORd+/EPh2QWOUs+8okM5MfQhl7wR7ycUW
 BaKBbBBP9XnzFe+K3JZ2/3sDitrHIHSe6TBoK92pNwt0qExlisih7ljFaleKmzyIpdxv
 egAZ2gG0Wp21YycCM0IkOj8XmMUqt5IaJbA0zKNjtxVtmuX+b3mzhssX1oozKhQyUW/R
 b3Aw==
X-Gm-Message-State: AO0yUKW3WDVKicIp0tGjcf+aGrO5OTgYjVMWXvmifI9j0lc95GBmLlFg
 mEJP5IhSIBhiFnjsyyrlSK2R2LkcfJO5WM4lYLexcA==
X-Google-Smtp-Source: AK7set+cap/vuxpLfKn25cmaXnTv+mAkytZx/GZ+2Cl4PzIx72uiG10k2pox2SqCzcTCsQxumz1LTUlpLBuVo1rOgQ0=
X-Received: by 2002:ac8:42d2:0:b0:3bc:f00b:931f with SMTP id
 g18-20020ac842d2000000b003bcf00b931fmr5289225qtm.10.1678284226521; Wed, 08
 Mar 2023 06:03:46 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Wed, 8 Mar 2023 06:03:45 -0800
Mime-Version: 1.0
In-Reply-To: <ZAdupAAJjbSbJiss@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n> <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
 <ZAZRn9eNG1TEoEl1@x1n> <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
 <ZAdupAAJjbSbJiss@x1n>
Date: Wed, 8 Mar 2023 06:03:45 -0800
Message-ID: <CALophus_dTA6U3zGP6u0YnRr65GrhF665mBtX7SkBdLMVJKxBw@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="00000000000027921205f663ff27"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--00000000000027921205f663ff27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Peter,

On 2023/3/8 =E4=B8=8A=E5=8D=881:04, Peter Xu wrote:
> On Tue, Mar 07, 2023 at 09:24:31PM +0800, Chuang Xu wrote:
>>> Why do we need address_space_get_flatview_rcu()? I'm not sure whether
you
>> address_space_cahce_init() uses address_space_get_flatview() to acquire
>> a ref-ed flatview. If we want to use address_space_to_flatview_rcu() and
>> make the flatview ref-ed, maybe we need to add
address_space_get_flatview_rcu()?
>> Or if we use address_space_to_flatview_rcu() directly, then we'll get a
>> unref-ed flatview, I'm not sure wheather it's safe in other cases.. At
least
>> I don't want the assertion to be triggered one day.
> No we can't touch that, afaict. It was a real fix (447b0d0b9e) to a real
> bug.
>
> What I meant is we make address_space_get_flatview() always use
> address_space_to_flatview_rcu().

This time I clearly understand what you mean.=F0=9F=98=81

>
> I think it's safe, if you see the current callers of it (after my patch 1
> fixed version applied):
>
> memory_region_sync_dirty_bitmap[2249] view =3D
address_space_get_flatview(as);
> memory_region_update_coalesced_range[2457] view =3D
address_space_get_flatview(as);
> memory_region_clear_dirty_bitmap[2285] view =3D
address_space_get_flatview(as);
> mtree_info_flatview[3418] view =3D address_space_get_flatview(as);
> address_space_cache_init[3350] cache->fv =3D
address_space_get_flatview(as);
>
> Case 5 is what we're targeting for which I think it's fine. Logically any
> commit() hook should just use address_space_get_flatview_raw() to
reference
> the flatview, but at least address_space_cache_init() is also called in
> non-BQL sections, so _rcu is the only thing we can use here, iiuc..
>
> Case 1-3 is never called during vm load, so I think it's safe.
>
> Case 4 can be accessing stalled flatview but I assume fine since it's
just
> for debugging. E.g. if someone tries "info mtree -f" during vm loading
> after your patch applied, then one can see stalled info. I don't think it
> can even happen because so far "info mtree" should also take BQL.. so
it'll
> be blocked until vm load completes.
>
> The whole thing is still tricky. I didn't yet make my mind through on how

IIUC, Do you mean that different ways to get flatview are tricky?

> to make it very clean, I think it's slightly beyond what this series does
> and I need some more thinkings (or suggestions from others).
>
As you said, it's slightly beyond what this series does. Maybe it would be
better if we discuss it in a new series and keep this series at v6?
what's your take?

Thanks!

--00000000000027921205f663ff27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi, Peter,
<br>
<br>On 2023/3/8 =E4=B8=8A=E5=8D=881:04, Peter Xu wrote:
<br>&gt; On Tue, Mar 07, 2023 at 09:24:31PM +0800, Chuang Xu wrote:
<br>&gt;&gt;&gt; Why do we need address_space_get_flatview_rcu()?  I&#39;m =
not sure whether you
<br>&gt;&gt; address_space_cahce_init() uses address_space_get_flatview() t=
o acquire
<br>&gt;&gt; a ref-ed flatview. If we want to use address_space_to_flatview=
_rcu() and
<br>&gt;&gt; make the flatview ref-ed, maybe we need to add address_space_g=
et_flatview_rcu()?
<br>&gt;&gt; Or if we use address_space_to_flatview_rcu() directly, then we=
&#39;ll get a
<br>&gt;&gt; unref-ed flatview, I&#39;m not sure wheather it&#39;s safe in =
other cases.. At least
<br>&gt;&gt; I don&#39;t want the assertion to be triggered one day.
<br>&gt; No we can&#39;t touch that, afaict.  It was a real fix (447b0d0b9e=
) to a real
<br>&gt; bug.
<br>&gt;
<br>&gt; What I meant is we make address_space_get_flatview() always use
<br>&gt; address_space_to_flatview_rcu().
<br>
<br>This time I clearly understand what you mean.=F0=9F=98=81
<br>
<br>&gt;
<br>&gt; I think it&#39;s safe, if you see the current callers of it (after=
 my patch 1
<br>&gt; fixed version applied):
<br>&gt;
<br>&gt; memory_region_sync_dirty_bitmap[2249] view =3D address_space_get_f=
latview(as);
<br>&gt; memory_region_update_coalesced_range[2457] view =3D address_space_=
get_flatview(as);
<br>&gt; memory_region_clear_dirty_bitmap[2285] view =3D address_space_get_=
flatview(as);
<br>&gt; mtree_info_flatview[3418]      view =3D address_space_get_flatview=
(as);
<br>&gt; address_space_cache_init[3350] cache-&gt;fv =3D address_space_get_=
flatview(as);
<br>&gt;
<br>&gt; Case 5 is what we&#39;re targeting for which I think it&#39;s fine=
. Logically any
<br>&gt; commit() hook should just use address_space_get_flatview_raw() to =
reference
<br>&gt; the flatview, but at least address_space_cache_init() is also call=
ed in
<br>&gt; non-BQL sections, so _rcu is the only thing we can use here, iiuc.=
.
<br>&gt;
<br>&gt; Case 1-3 is never called during vm load, so I think it&#39;s safe.
<br>&gt;
<br>&gt; Case 4 can be accessing stalled flatview but I assume fine since i=
t&#39;s just
<br>&gt; for debugging. E.g. if someone tries &quot;info mtree -f&quot; dur=
ing vm loading
<br>&gt; after your patch applied, then one can see stalled info.  I don&#3=
9;t think it
<br>&gt; can even happen because so far &quot;info mtree&quot; should also =
take BQL.. so it&#39;ll
<br>&gt; be blocked until vm load completes.
<br>&gt;
<br>&gt; The whole thing is still tricky.  I didn&#39;t yet make my mind th=
rough on how
<br>
<br>IIUC, Do you mean that different ways to get flatview are tricky?
<br>
<br>&gt; to make it very clean, I think it&#39;s slightly beyond what this =
series does
<br>&gt; and I need some more thinkings (or suggestions from others).
<br>&gt;
<br>As you said, it&#39;s slightly beyond what this series does. Maybe it w=
ould be
<br>better if we discuss it in a new series and keep this series at v6?
<br>what&#39;s your take?
<br>
<br>Thanks!</p>

--00000000000027921205f663ff27--

