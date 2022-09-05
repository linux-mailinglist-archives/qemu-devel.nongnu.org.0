Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA745ACD0D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 09:50:42 +0200 (CEST)
Received: from localhost ([::1]:35728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV6sO-0006gz-4J
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 03:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV6nV-0003yK-0L
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV6nR-0006l7-Gm
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662363928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mRRxMKyBLKZERuQJJeS6RTCFR0LgfkcbBKQBsBS3Vqw=;
 b=K4/lamakSJ8yIBz8inIrCzRFvXNW1nOFIS453xJR/YXnQs9MpoSymChNkVLEnsnKNsUtyM
 1ez+cHeBkfl1DbiMoQMjpZeVmMobfs267GijqLqo0nOP9TZBY24X9sj1FdSPfgstxeanFc
 Yngkycabozwm0DWOuHgCxf5iuhuiyIo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-7IesR9RtMiq4Nrh8cUvARg-1; Mon, 05 Sep 2022 03:45:26 -0400
X-MC-Unique: 7IesR9RtMiq4Nrh8cUvARg-1
Received: by mail-lf1-f71.google.com with SMTP id
 g19-20020a056512119300b00492d83ae1d5so1691467lfr.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 00:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mRRxMKyBLKZERuQJJeS6RTCFR0LgfkcbBKQBsBS3Vqw=;
 b=dXRuz1oG9wWp8JBGpAmgrlFZoI+ujGypNxp2K83vhiAqE30JeskJcVibRQRWjntHNg
 wlPzcCVHN3rlaje5M2w8q7r2Ttl56umT/MG2VEk2qtiwUD7V8vL1k7QRVCI4reWVizQu
 KGEet6umM3g91Q7ctzUynPW1sSYzp/Awnq7mQzfKJt46vDapjp1bUHsHf3CNIudq8c/Q
 /6sGAnjthCqnkjHXun18HDiuyjZmA8HaFEy58pMaS1tfznr0d4sTD6ggtPDvDI9df0rI
 enl6UCkAkWwQitY+5bAddl/JF3bzRms4yQqjyPxJ4B2rtdU29FzBm0N/VAe9igzg5sbG
 nnNg==
X-Gm-Message-State: ACgBeo3ANL8oKdQFYYSDdwJjqYCNfXsE+Mg/SmDhc0ErcUFgqAV908pb
 5opKljXA/WSq1y04giBbmTA0f8z1Tq0WZ1ivGiA0bKsbe2BCSSOmU3wDWrpvqEeC2iJn2t0KOrU
 1D6uDKenmUeZnSStrDiR0EG2Ce5eYK2o=
X-Received: by 2002:a05:6512:2302:b0:492:ce48:1bab with SMTP id
 o2-20020a056512230200b00492ce481babmr14561655lfu.266.1662363925403; 
 Mon, 05 Sep 2022 00:45:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Y51FZr3HRQ89jhLouQRNC38sMzWVPu7eZEtK+45uFzko874iyvbkrIBIC75zQbUZzLdPf31NbGZhXUJcslzw=
X-Received: by 2002:a05:6512:2302:b0:492:ce48:1bab with SMTP id
 o2-20020a056512230200b00492ce481babmr14561649lfu.266.1662363925105; Mon, 05
 Sep 2022 00:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220905000021.157613-1-afaria@redhat.com>
In-Reply-To: <20220905000021.157613-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 5 Sep 2022 09:45:14 +0200
Message-ID: <CABgObfahkrhwwn6+D7uUbqKYPXmA3mQGXHwe6f-TiA+iQoFyAQ@mail.gmail.com>
Subject: Re: [PATCH v2] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003e658b05e7e94388"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003e658b05e7e94388
Content-Type: text/plain; charset="UTF-8"

Thanks, I will queue it.

Paolo

Il lun 5 set 2022, 02:00 Alberto Faria <afaria@redhat.com> ha scritto:

> flatview_(read|write)_continue() must be called with an address in the
> FlatView's address space, but `addr` is relative to the
> MemoryRegionCache.
>
> Convert `addr` from the MemoryRegionCache's address space to the
> FlatView's before passing it to flatview_(read|write)_continue().
>
> This problem was uncovered while attempting to perform unaligned writes,
> which caused flatview_write_continue() to reach the call to
> flatview_translate(), which then translated the erroneous address and
> caused the subsequent write to fail.
>
> Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
> Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  softmmu/physmem.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 50231bab30..bdde4eb927 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3420,6 +3420,14 @@ static inline MemoryRegion
> *address_space_translate_cached(
>      return section.mr;
>  }
>
> +/* Converts `addr` from the address space of `cache` to that of
> `cache->fv`. */
> +static inline hwaddr addr_in_cache_to_in_flat_view(MemoryRegionCache
> *cache,
> +                                                   hwaddr addr)
> +{
> +    hwaddr addr_in_mrs = addr + cache->xlat -
> cache->mrs.offset_within_region;
> +    return addr_in_mrs + cache->mrs.offset_within_address_space;
> +}
> +
>  /* Called from RCU critical section. address_space_read_cached uses this
>   * out of line function when the target is an MMIO or IOMMU region.
>   */
> @@ -3434,8 +3442,9 @@ address_space_read_cached_slow(MemoryRegionCache
> *cache, hwaddr addr,
>      mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
>                                          MEMTXATTRS_UNSPECIFIED);
>      return flatview_read_continue(cache->fv,
> -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> -                                  addr1, l, mr);
> +                                  addr_in_cache_to_in_flat_view(cache,
> addr),
> +                                  MEMTXATTRS_UNSPECIFIED, buf, len,
> addr1, l,
> +                                  mr);
>  }
>
>  /* Called from RCU critical section. address_space_write_cached uses this
> @@ -3452,8 +3461,9 @@ address_space_write_cached_slow(MemoryRegionCache
> *cache, hwaddr addr,
>      mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
>                                          MEMTXATTRS_UNSPECIFIED);
>      return flatview_write_continue(cache->fv,
> -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> -                                   addr1, l, mr);
> +                                   addr_in_cache_to_in_flat_view(cache,
> addr),
> +                                   MEMTXATTRS_UNSPECIFIED, buf, len,
> addr1, l,
> +                                   mr);
>  }
>
>  #define ARG1_DECL                MemoryRegionCache *cache
> --
> 2.37.2
>
>

--0000000000003e658b05e7e94388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I will queue it.<div dir=3D"auto"><br></div><div =
dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Il lun 5 set 2022, 02:00 Alberto Faria &lt;<a href=
=3D"mailto:afaria@redhat.com">afaria@redhat.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">flatview_(read|write)_continue() must be c=
alled with an address in the<br>
FlatView&#39;s address space, but `addr` is relative to the<br>
MemoryRegionCache.<br>
<br>
Convert `addr` from the MemoryRegionCache&#39;s address space to the<br>
FlatView&#39;s before passing it to flatview_(read|write)_continue().<br>
<br>
This problem was uncovered while attempting to perform unaligned writes,<br=
>
which caused flatview_write_continue() to reach the call to<br>
flatview_translate(), which then translated the erroneous address and<br>
caused the subsequent write to fail.<br>
<br>
Fixes: 48564041a7 (&quot;exec: reintroduce MemoryRegion caching&quot;)<br>
Co-Developed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com"=
 target=3D"_blank" rel=3D"noreferrer">stefanha@redhat.com</a>&gt;<br>
Signed-off-by: Alberto Faria &lt;<a href=3D"mailto:afaria@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">afaria@redhat.com</a>&gt;<br>
---<br>
=C2=A0softmmu/physmem.c | 18 ++++++++++++++----<br>
=C2=A01 file changed, 14 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
index 50231bab30..bdde4eb927 100644<br>
--- a/softmmu/physmem.c<br>
+++ b/softmmu/physmem.c<br>
@@ -3420,6 +3420,14 @@ static inline MemoryRegion *address_space_translate_=
cached(<br>
=C2=A0 =C2=A0 =C2=A0return <a href=3D"http://section.mr" rel=3D"noreferrer =
noreferrer" target=3D"_blank">section.mr</a>;<br>
=C2=A0}<br>
<br>
+/* Converts `addr` from the address space of `cache` to that of `cache-&gt=
;fv`. */<br>
+static inline hwaddr addr_in_cache_to_in_flat_view(MemoryRegionCache *cach=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr addr)<br>
+{<br>
+=C2=A0 =C2=A0 hwaddr addr_in_mrs =3D addr + cache-&gt;xlat - cache-&gt;mrs=
.offset_within_region;<br>
+=C2=A0 =C2=A0 return addr_in_mrs + cache-&gt;mrs.offset_within_address_spa=
ce;<br>
+}<br>
+<br>
=C2=A0/* Called from RCU critical section. address_space_read_cached uses t=
his<br>
=C2=A0 * out of line function when the target is an MMIO or IOMMU region.<b=
r>
=C2=A0 */<br>
@@ -3434,8 +3442,9 @@ address_space_read_cached_slow(MemoryRegionCache *cac=
he, hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0mr =3D address_space_translate_cached(cache, addr, &amp=
;addr1, &amp;l, false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ME=
MTXATTRS_UNSPECIFIED);<br>
=C2=A0 =C2=A0 =C2=A0return flatview_read_continue(cache-&gt;fv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr, MEMTXATTRS_UNSPECIFIED,=
 buf, len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr1, l, mr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr_in_cache_to_in_flat_view=
(cache, addr),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MEMTXATTRS_UNSPECIFIED, buf, =
len, addr1, l,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mr);<br>
=C2=A0}<br>
<br>
=C2=A0/* Called from RCU critical section. address_space_write_cached uses =
this<br>
@@ -3452,8 +3461,9 @@ address_space_write_cached_slow(MemoryRegionCache *ca=
che, hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0mr =3D address_space_translate_cached(cache, addr, &amp=
;addr1, &amp;l, true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ME=
MTXATTRS_UNSPECIFIED);<br>
=C2=A0 =C2=A0 =C2=A0return flatview_write_continue(cache-&gt;fv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr, MEMTXATTRS_UNSPEC=
IFIED, buf, len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr1, l, mr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr_in_cache_to_in_fla=
t_view(cache, addr),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEMTXATTRS_UNSPECIFIED,=
 buf, len, addr1, l,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mr);<br>
=C2=A0}<br>
<br>
=C2=A0#define ARG1_DECL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MemoryRegionCache *cache<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div>

--0000000000003e658b05e7e94388--


