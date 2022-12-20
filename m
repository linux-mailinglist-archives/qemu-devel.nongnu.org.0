Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B94652293
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:29:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dbp-0006XL-8t; Tue, 20 Dec 2022 09:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p7dbn-0006VI-Ac
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:28:43 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p7dbl-0007k5-Oi
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:28:43 -0500
Received: by mail-qv1-xf30.google.com with SMTP id u10so8342741qvp.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:references:mime-version
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dR42mZf2y+Z5D/A7BQqqdSFewCz+8IlHn9s8PXJOSSM=;
 b=T84GgODaU7HAabFmajGqbEFcdjDvj3IVSO+qQWrr4RLlziTI7yWUt0/8vUcPJI+/Hr
 dvAjGyI4lZrpQeNbHYx6rrr6doN0GoyMBHBXTPBmok6X1fnM028aBE+ryYkZ0O+Sxt5N
 M00SXKB+/R8AqzG8ipKXxC8w9j7HDHqthIy+VV9GeXk3W8Oh7NLTXkHJekj/DMFBa0np
 1K+YTEZkJx2OZ6SRwKVVlJ7vCoyOGqVfcGO5dde9Bom13qRcrOHApeBwjcmyNpDS4nJ6
 y/IgXIj8N6lD9eY8CdNJv1TXZe2EED2jWcBRHMoLlmtFWwdLBfWk3kT31xDh8OzifwB5
 E45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:references:mime-version
 :in-reply-to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dR42mZf2y+Z5D/A7BQqqdSFewCz+8IlHn9s8PXJOSSM=;
 b=m5M7yEGKYp9tR+xURR14VhwA7ocSOlgMXzy357xiXROOAzsuqQcmdYEjS3d8u5i5uJ
 YMODLA284w2XO0Kinf89h4u3FUIXz8mwSSVF43Q2USFLu4CEGxT4gf2ZHtbPxiNtfROH
 LguInbbZG+aXs/fgzkzKMo9aY9DG8KEbYz6aQOUn4Ylk90PbunftN2ecd50x8zcoSwiN
 CGaiYWuy53I9rN7dpJGB1eix1LtQGzKHT76r51FRU0LCtMDZy8jIF1acxJFaQL051vRp
 CzKTPYjOY5iHUvQNNT2A+FV3bVtI7izLEridWH9CHTdIkZRBpuIVPojJKZJ6vGKq/YcV
 0jRQ==
X-Gm-Message-State: ANoB5pk7I9WcjFXBfAPATiQ+uNPYqFxMV3Tvet+0nM6EKXq2s8FCeLnf
 H8oa5v7ztGbeCFqqkhzwp4IKHreQk1r+iPC6Y8FqoQ==
X-Google-Smtp-Source: AA0mqf5u76d2CnJ88VBimUZXfdxkzCvMm0h//xZudeFZHbYYLkHu0ov5HTkfftCTnEG0PcyKN/kX14BE+Aef+gnEa5M=
X-Received: by 2002:ad4:442a:0:b0:4c6:e829:19eb with SMTP id
 e10-20020ad4442a000000b004c6e82919ebmr57134440qvt.23.1671546520623; Tue, 20
 Dec 2022 06:28:40 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Tue, 20 Dec 2022 06:28:40 -0800
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <CAFEAcA8bD7SnHTL8r0cwjdUOJ4katcdgSqkLnknp1++JT5CKjg@mail.gmail.com>
Mime-Version: 1.0
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
 <CAFEAcA8bD7SnHTL8r0cwjdUOJ4katcdgSqkLnknp1++JT5CKjg@mail.gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Date: Tue, 20 Dec 2022 06:28:40 -0800
Message-ID: <CALophuuPzKr6qX_TMJLQFRrRmVOHtv=FAnwXFZPFTTn0iuESDw@mail.gmail.com>
Subject: Re: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, f4bug@amsat.org, 
 mst@redhat.com, zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="000000000000967beb05f043404c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-1.161,
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

--000000000000967beb05f043404c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/16 =E4=B8=8A=E5=8D=8812:51, Peter Maydell wrote:

On Tue, 13 Dec 2022 at 13:36, Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com> wrote:

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };

+static unsigned memory_region_transaction_depth;

This looks odd. If you define a static variable in a
header file then each .c file which directly or indirectly
includes the header will get its own private copy of the
variable. This probably isn't what you want...

thanks
-- PMM

Yes, Maybe we should add a function to acquire the value..

I'll add this part to v4. Thanks!

--000000000000967beb05f043404c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-e64bb891027e5=
d7b4f2826a068af7bc6">On 2022/12/16 =E4=B8=8A=E5=8D=8812:51, Peter Maydell
      wrote:<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:CAFEAcA8bD7SnHTL8r0cwjdUOJ4katcdg=
SqkLnknp1++JT5CKjg@mail.gmail.com">
      <pre class=3D"moz-quote-pre">On Tue, 13 Dec 2022 at 13:36, Chuang Xu =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xuchuangxclwt@bytedance.c=
om">&lt;xuchuangxclwt@bytedance.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">Before using any flatview, sanity chec=
k we&#39;re not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };

+static unsigned memory_region_transaction_depth;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">This looks odd. If you define a static v=
ariable in a
header file then each .c file which directly or indirectly
includes the header will get its own private copy of the
variable. This probably isn&#39;t what you want...

thanks
-- PMM
</pre>
    </blockquote>
    <pre>Yes, Maybe we should add a function to acquire the value..

I&#39;ll add this part to v4. Thanks!
</pre>
 =20
</body></html>

--000000000000967beb05f043404c--

