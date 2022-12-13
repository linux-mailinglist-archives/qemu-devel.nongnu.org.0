Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A388B64B510
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:22:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54II-0004CN-T3; Tue, 13 Dec 2022 07:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p54Hr-0004BK-Rq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:21:38 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p54Hl-0001Rt-20
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:21:29 -0500
Received: by mail-qt1-x831.google.com with SMTP id fu10so11632660qtb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:references:from
 :user-agent:in-reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=OECgLK2fDRqtBdc4RLXQ8q6wchI96hrArWUYGSqz1yI=;
 b=cTfJd748/+TpDB1DM7kfbT5588Q2eVNclwMzTe7fJUlYdgijtzBeh2uGKa54DWx/5k
 t5T+G+N0yge7mesLs5QbLaY6AUaEbODBD+XfE9Wm744SLku0dzURXPf5lDEI9OSnNlVg
 dkg4QfRfpmVKprka3elJDEpiy+OyhDERKCtJ4mvga0tC2OlulYCNwMe/hx2qcCcCNBEx
 MPwYi/G1pLu8TTO7yYfwpIJXt6i8gm6HpHnU2MLpnIot4Hs3ZKE/Qd0sUnweA3CtpfqP
 ieYBltK3roZ3d3FxfzM1b+8/gUfMg+fnZh+MV+qQ1i3CwGW9Gi7xD5gm4SGFOVwggISg
 9yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:references:from
 :user-agent:in-reply-to:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OECgLK2fDRqtBdc4RLXQ8q6wchI96hrArWUYGSqz1yI=;
 b=JEpc0LC+inQo7Yad6PhkftK6eihzmpO4heqxfhYEN7s/5/n/h8yQxLDrbO9ziBEHtB
 JiHaGlCAu07hmlPI+9S13zLw6ELYCQy5HGHXxVXHxJtjyDtArCEYIuF0v3yEsP3Gawxk
 zmkS2x0QPUbMmlsm2Q9mNZure+TYORS1frpywrGjdDoMXgOLvGdTfniHUu3ZXKsUpYxG
 iCNogzLU6TIsp402IZnw+TfD4/Fl+mWwfDjqCB6pqqX/Oz86o7sQmBXeRFNSezIjQrCH
 xbZxDHhpaNWtouC7AUjnK9IwEGrOOxx5cR8151Knfeqa6EycnUWZrMt7xm1Ru67CnOkx
 Q4eQ==
X-Gm-Message-State: ANoB5pnUDfyGLiligSaTiUaibPcwTgJv8oWEf+Yk7Hrc2SAqDtyAweJ3
 KP5YHvGKrvBXYlXZxbh2kOrFLp0BXRCL0FPxwfHltA==
X-Google-Smtp-Source: AA0mqf5XjDAj4ZHMurn4e0lH+yqkkdrYqofmPZfo33Gh+rCFUodGauD55LKl9t0K2g1Z10aMlSDEHrDtY6OYUb4nM+k=
X-Received: by 2002:ac8:5313:0:b0:3a8:23ab:2211 with SMTP id
 t19-20020ac85313000000b003a823ab2211mr127371qtn.65.1670934080903; Tue, 13 Dec
 2022 04:21:20 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Tue, 13 Dec 2022 04:21:20 -0800
In-Reply-To: <Y5eNvj7XFc88edIi@x1n>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
From: Chuang Xu <xuchuangxclwt@bytedance.com>
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
 <Y5eNvj7XFc88edIi@x1n>
Mime-Version: 1.0
Date: Tue, 13 Dec 2022 04:21:20 -0800
Message-ID: <CALophuuXLGMwzwJWTVsE+z5B16cDD7c6mNmxzpcbMg-dZW-Y5g@mail.gmail.com>
Subject: Re: [RFC v2 0/3] migration: reduce time of loading non-iterable
 vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>, david@redhat.com, 
 philmd@linaro.org, mst@redhat.com
Content-Type: multipart/alternative; boundary="00000000000055f90305efb4a8be"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999,
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

--00000000000055f90305efb4a8be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/13 =E4=B8=8A=E5=8D=884:23, Peter Xu wrote:

On Tue, Dec 13, 2022 at 12:49:39AM +0800, Chuang Xu wrote:

Hi!

Chuang,


In this version:

- rebase to latest upstream.
- add sanity check to address_space_to_flatview().
- postpone the init of the vring cache until migration's loading completes.

Since there'll be other changes besides migration, please consider also
copy the relevant maintainers too on either memory and virtio in your next
post:

$ ./scripts/get_maintainer.pl -f softmmu/memory.c -f hw/virtio/virtio.c
Paolo Bonzini <pbonzini@redhat.com> <pbonzini@redhat.com> (supporter:Memory=
 API)
Peter Xu <peterx@redhat.com> <peterx@redhat.com> (supporter:Memory API)
David Hildenbrand <david@redhat.com> <david@redhat.com> (supporter:Memory A=
PI)
"Philippe Mathieu-Daud=C3=A9" <philmd@linaro.org> <philmd@linaro.org>
(reviewer:Memory API)
"Michael S. Tsirkin" <mst@redhat.com> <mst@redhat.com>
(supporter:virtio)qemu-devel@nongnu.org (open list:All patches CC
here)



Sorry I forgot to update the cc list..

Thanks for your reminder!

--00000000000055f90305efb4a8be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-562a0c0f08af1=
0d853a4e027f1715992">On 2022/12/13 =E4=B8=8A=E5=8D=884:23, Peter Xu wrote:<=
br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y5eNvj7XFc88edIi@x1n">
      <pre class=3D"moz-quote-pre">On Tue, Dec 13, 2022 at 12:49:39AM +0800=
, Chuang Xu wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">Hi!
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">Chuang,

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">In this version:

- rebase to latest upstream.
- add sanity check to address_space_to_flatview().
- postpone the init of the vring cache until migration&#39;s loading comple=
tes.=20
</pre>
      </blockquote>
      <pre><span>Since there&#39;ll be other changes besides migration, ple=
ase consider also
copy the relevant maintainers too on either memory and virtio in your next
post:

$ ./scripts/<a href=3D"get_maintainer.pl" target=3D"_blank">get_maintainer.=
pl</a> -f softmmu/memory.c -f hw/virtio/virtio.c
Paolo Bonzini </span><a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:pbon=
zini@redhat.com">&lt;pbonzini@redhat.com&gt;</a> (supporter:Memory API)
Peter Xu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peterx@redhat.co=
m">&lt;peterx@redhat.com&gt;</a> (supporter:Memory API)
David Hildenbrand <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:david@r=
edhat.com">&lt;david@redhat.com&gt;</a> (supporter:Memory API)
&quot;Philippe Mathieu-Daud=C3=A9&quot; <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a> (reviewer:M=
emory API)
&quot;Michael S. Tsirkin&quot; <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:mst@redhat.com">&lt;mst@redhat.com&gt;</a> (supporter:virtio)
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:qemu-devel@nongnu.org"=
>qemu-devel@nongnu.org</a> (open list:All patches CC here)


</pre>
    </blockquote>
    <pre>Sorry I forgot to update the cc list..</pre>
    <pre>Thanks for your reminder!</pre>
 =20
</body></html>

--00000000000055f90305efb4a8be--

