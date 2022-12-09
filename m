Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAF6483E1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eSj-0005Ju-FN; Fri, 09 Dec 2022 09:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p3eRZ-00054H-9E
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:34:17 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p3eRO-0005vn-Cp
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:33:39 -0500
Received: by mail-qk1-x732.google.com with SMTP id v8so2324871qkg.12
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:user-agent:references
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiHknEZiv8BIp1D6tjMzt4DxmrLb9IhjMS3TLyxJVXo=;
 b=uiM6SyB9fO5zb2hHDxsj3jXj25yYukUX6S6Urjhlai7Fg3ORhcwVqvbR7c2kfUmhm1
 +906ncaJxNWzbQb96YaE2Mjg2LzvZ+ICOrxadsi3wIobFe2mOayw0pKz/MmV2YCoaY+K
 OElaV06Er2rO3enFz97YswyuargrGD3js35YH2TvKSDN9TxIAGhDP26PjQxNpthvPWeR
 fBptlheMXKnLgs6zArMTtbelGspnCYNchLhJOedZmwndiVygttmUcN344wOS8i5OG5Ta
 f99iQa+cDlx6YpgRTfrwtkV9wJbA87TBewtkeIRbykHfp0EVgrIVgU6CtLi/Dx5yGRr1
 pM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:user-agent:references
 :in-reply-to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OiHknEZiv8BIp1D6tjMzt4DxmrLb9IhjMS3TLyxJVXo=;
 b=uIqvosyV7M7KknO3eAn7vpOA4y+YQxwRQDUqZpej/oc4g6HMbzABmPYQ5bc9ipV04i
 DmtWgXbD5xicphqMeXPdEjRSayRHwGgZEn8mjLGYsNhkK3bamEW0k5qTb/F4emk18iS9
 ijSrJQpoH5PK/3jnJDqYoM/ryDWDX71rFsH+LxkADrd53vHcvPaGllP18uiFOCvtRZ2K
 15f++ss64d9JARU8efIukGaoOzJGmIbPKqLcMHRFmkUbyYALBhCy0+qPjc+zRjt4gAcN
 M4QBiu9sw8tzLHQL07JM8SmwvOXU3mq1o654IxpdZxt2P4Fmdf3f0cxW8VEKabL4FMjB
 H0ZA==
X-Gm-Message-State: ANoB5pmY1S9rzQ8ZZiKkYjfXJ37Ob3rx5X9tO6OSUFu6xxFbnR+cS+Wj
 84fmZONCaVTVTN/QFVN29jeek7DIgwNVaIOSJ2RFKQ==
X-Google-Smtp-Source: AA0mqf6sJzs0HPPGjeOwUXSqUkf01K9P4dqvBFcOV8uOTT10F+NOBJaEcy9sto9VBb1L4a2SxYYv5MzLmcXf8L3VGbg=
X-Received: by 2002:ae9:c202:0:b0:6fc:9712:2121 with SMTP id
 j2-20020ae9c202000000b006fc97122121mr32537637qkg.762.1670596405055; Fri, 09
 Dec 2022 06:33:25 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 9 Dec 2022 06:33:24 -0800
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y5IKOIUYHWbpVABV@x1n>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n> <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n> <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
 <Y44cNenFueVE4RFW@x1n> <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
 <Y5EO8HqNVj/Rq7M5@x1n> <704c1986-e878-8837-a2bb-12f76eeb1ba4@bytedance.com>
 <Y5IKOIUYHWbpVABV@x1n>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Mime-Version: 1.0
Date: Fri, 9 Dec 2022 06:33:24 -0800
Message-ID: <CALophut9M=LcCh_=Nf=2xaKnO4-=r-rCHhkRBt0vAwqEqvoByA@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH] migration: reduce time of loading
 non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000049798f05ef6609f4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.288,
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

--00000000000049798f05ef6609f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Peter!

This email is a supplement to my previous email 7 hours ago.

On 2022/12/9 =E4=B8=8A=E5=8D=8812:00, Peter Xu wrote:

If the assert will work that'll be even better.  I'm actually worried this
can trigger like what you mentioned in the virtio path, I didn't expect it
comes that soon.  So if there's a minimum cases and we can fixup easily
that'll be great.  Hopefully there aren't so much or we'll need to revisit
the whole idea.

Thanks,


Only delaying virtio_init_region_cache() will result in the failure of the
checks and caches following original virtio_init_region_cache().

Here are the patches related to these checks and cache
operation:https://gitlab.com/qemu-project/qemu/-/commit/1abeb5a65d515f8a8a9=
cfc4a82342f731bd9321fhttps://gitlab.com/qemu-project/qemu/-/commit/be1fea9b=
c286f64c6c995bb0d7145a0b738aeddbhttps://gitlab.com/qemu-project/qemu/-/comm=
it/b796fcd1bf2978aed15748db04e054f34789e9ebhttps://gitlab.com/qemu-project/=
qemu/-/commit/bccdef6b1a204db0f41ffb6e24ce373e4d7890d4

I think I should try to postpone these checks and caches too..

Thanks!

--00000000000049798f05ef6609f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <pre>Hi, Peter!

This email is a supplement to my previous email 7 hours ago.
</pre>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-df3d1630faf28=
9c8e6c76d61f4eb8e59">On 2022/12/9 =E4=B8=8A=E5=8D=8812:00, Peter Xu wrote:
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y5IKOIUYHWbpVABV@x1n">
      <pre class=3D"moz-quote-pre">If the assert will work that&#39;ll be e=
ven better.  I&#39;m actually worried this
can trigger like what you mentioned in the virtio path, I didn&#39;t expect=
 it
comes that soon.  So if there&#39;s a minimum cases and we can fixup easily
that&#39;ll be great.  Hopefully there aren&#39;t so much or we&#39;ll need=
 to revisit
the whole idea.

Thanks,

</pre>
    </blockquote>
    <pre>Only delaying virtio_init_region_cache() will result in the failur=
e of the=20
checks and caches following original virtio_init_region_cache().

Here are the patches related to these checks and cache operation:
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/qemu-project/=
qemu/-/commit/1abeb5a65d515f8a8a9cfc4a82342f731bd9321f">https://gitlab.com/=
qemu-project/qemu/-/commit/1abeb5a65d515f8a8a9cfc4a82342f731bd9321f</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/qemu-project/=
qemu/-/commit/be1fea9bc286f64c6c995bb0d7145a0b738aeddb">https://gitlab.com/=
qemu-project/qemu/-/commit/be1fea9bc286f64c6c995bb0d7145a0b738aeddb</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/qemu-project/=
qemu/-/commit/b796fcd1bf2978aed15748db04e054f34789e9eb">https://gitlab.com/=
qemu-project/qemu/-/commit/b796fcd1bf2978aed15748db04e054f34789e9eb</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/qemu-project/=
qemu/-/commit/bccdef6b1a204db0f41ffb6e24ce373e4d7890d4">https://gitlab.com/=
qemu-project/qemu/-/commit/bccdef6b1a204db0f41ffb6e24ce373e4d7890d4</a>

I think I should try to postpone these checks and caches too..

Thanks!
</pre>
 =20
</body></html>

--00000000000049798f05ef6609f4--

