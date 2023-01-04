Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE465CDBA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 08:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCyMw-0008Ki-GG; Wed, 04 Jan 2023 02:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pCyMt-0008KL-V0
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:39:23 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pCyMr-0001Qr-Nm
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:39:23 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id t13so17172844qvp.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 23:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:in-reply-to
 :mime-version:references:from:to:cc:subject:date:message-id:reply-to;
 bh=AGG2LTkcxh8t9gKxWSL7rhrLQ/kC7j/kutwI0rdhpFo=;
 b=500z4wsLZP/PpQZbjZvWQWhVkKg3JdmYUWbWqNuy8KQHBfKRsmFNN7u044VPvwgZex
 K4Ova92djTE32c+tQcdFp/g2cxwNaDIL2dHlufJJFWvzrp0R7nYR4NvTdByj8sveXBMj
 KN1AbCe7bNu+YYi6XlWUegrgL+nuw2QNx/ec4yDlec9Nvzm0Gt0LuFmXwD86vhw6uI/f
 uHiu0bzQrpD78Gd6N6v1itYheNoJjITQwSCSWB8izJ38gSqgfPT6ER5fepLV9Dcfk5q7
 RC+2TUjtaxRwka6y099diJwr50JGmOUhCaBBe2rSh79vgkx66NDTQiiKs/FLkaoF8PMD
 TMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:in-reply-to
 :mime-version:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGG2LTkcxh8t9gKxWSL7rhrLQ/kC7j/kutwI0rdhpFo=;
 b=OtUtJo7ybUYRgiRvF01dfT+cVNvyHsgOvMI0NgcjKnXpXE2HvI25oDsKuJ1nfxhJuD
 TAD8FJBNG+uPH34iDce0szbdsheFTG66wB5qmQmdwR0rrQaTABkBL2irSvmsJR9q3Q+M
 P4cpPdLOBW3a21yCXNhuuuT/O0OLtMdtGbIJPeHztRDNVPWgSbqCU8uh7xAJ+xLL+9ey
 6B22x1aJf5LNYxj3vX8ZXfsYoAcijGD7HOwkf/DKAeE4BJzjkGQIJf2utqYMv2uRAU70
 TMEm2OH5WY/r4Os0oxmH8uT3vxfVEBeaOUjstKIkxceV1fXGHqXpR9Sy0nnJFClWsNO5
 ZUnA==
X-Gm-Message-State: AFqh2krBL2TYVcWchguOR3Hatho5ncdCMcoc8xfVbj7TXk3MKZS0I3hP
 W4B3LdvaR4MTe9IjF3i+Ij3/AwY/YfKRMREuv18mhA==
X-Google-Smtp-Source: AMrXdXv/dj25nMv6MehiXNj+dkyFwhZ+xBPArlo9ukXWfDq8aQ3Or9/BXXLBZI8jWQa8h5rScncGWe/PjHZgJZTI650=
X-Received: by 2002:a0c:ec44:0:b0:531:d9b0:c8ab with SMTP id
 n4-20020a0cec44000000b00531d9b0c8abmr253977qvq.124.1672817958042; Tue, 03 Jan
 2023 23:39:18 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Wed, 4 Jan 2023 01:39:17 -0600
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <4db15db9-2f00-c71e-c5e1-e41c81090ee2@linaro.org>
Mime-Version: 1.0
In-Reply-To: <4db15db9-2f00-c71e-c5e1-e41c81090ee2@linaro.org>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Date: Wed, 4 Jan 2023 01:39:17 -0600
Message-ID: <CALophuvab5qa-7nNhz449rowBufsfrAVXqjnRGCn7AZsDAEsrg@mail.gmail.com>
Subject: Re: [External] Re: [RFC v4 2/3] memory: add depth assert in
 address_space_to_flatview
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="00000000000029de9005f16b4895"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000029de9005f16b4895
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/28 =E4=B8=8B=E5=8D=886:50, Philippe Mathieu-Daud=C3=A9 wrote:

On 23/12/22 15:23, Chuang Xu wrote:

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com>
---
  include/exec/memory.h | 9 +++++++++
  softmmu/memory.c      | 5 +++++
  2 files changed, 14 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..66c43b4862 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
      MemoryRegion *root;
  };
  +int memory_region_transaction_get_depth(void);


Do we want to expose this; isn't the depth internal?

If we need to expose something, can we restrict it to

  bool memory_region_in_transaction(void) or
  bool memory_region_transaction_in_progress(void)?

Yes, we'd better not expose the value of an internal
variable. I'll make changes in v5.

Thanks!

--00000000000029de9005f16b4895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-5d83dae8f6706=
0203c539762d53a392d">On 2022/12/28 =E4=B8=8B=E5=8D=886:50, Philippe
      Mathieu-Daud=C3=A9 wrote:<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:4db15db9-2f00-c71e-c5e1-e41c81090=
ee2@linaro.org">On
      23/12/22 15:23, Chuang Xu wrote:
      <br>
      <blockquote type=3D"cite" style=3D"color:#007cff">Before using any
        flatview, sanity check we&#39;re not during a memory
        <br>
        region transaction or the map can be invalid.
        <br>
        <br>
        Signed-off-by: Chuang Xu <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a=
>
        <br>
        ---
        <br>
        =C2=A0 include/exec/memory.h | 9 +++++++++
        <br>
        =C2=A0 softmmu/memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
        <br>
        =C2=A0 2 files changed, 14 insertions(+)
        <br>
        <br>
        diff --git a/include/exec/memory.h b/include/exec/memory.h
        <br>
        index 91f8a2395a..66c43b4862 100644
        <br>
        --- a/include/exec/memory.h
        <br>
        +++ b/include/exec/memory.h
        <br>
        @@ -1069,8 +1069,17 @@ struct FlatView {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion *root;
        <br>
        =C2=A0 };
        <br>
        =C2=A0 +int memory_region_transaction_get_depth(void);
        <br>
      </blockquote>
      <br>
      Do we want to expose this; isn&#39;t the depth internal?
      <br>
      <br>
      If we need to expose something, can we restrict it to
      <br>
      <br>
      =C2=A0 bool memory_region_in_transaction(void) or
      <br>
      =C2=A0 bool memory_region_transaction_in_progress(void)?
    </blockquote>
    <pre>Yes, we&#39;d better not expose the value of an internal=20
variable. I&#39;ll make changes in v5.

Thanks!
</pre>
 =20
</body></html>

--00000000000029de9005f16b4895--

