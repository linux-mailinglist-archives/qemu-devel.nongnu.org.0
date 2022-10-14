Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B1C5FF39A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:33:27 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPUr-0007xW-QN
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojPQM-0004AG-Ld
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojPQ2-0006vL-QP
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665772103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OkQTg5RCvUup85pTMLyw1oF4TW19fry6zReoXmrLAdk=;
 b=Oj0Wp0sfn5c/s8JElZmhC+VOb3KzGFLeId3fE5kzaD1j8XXQ+5AyJ5uaFSE5Assa2DZH50
 QPa27wDJPMtPU7YIvYS9fcTku7iaED6SnCIvFKxBm1cBrCyTj1xhTbqYdbrvvE8+MKkPdv
 0I/+hwwtgd8S67N2MLdpJgyqocsB4K0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-bJw0ql5pOIOVZ6ItZNg5ww-1; Fri, 14 Oct 2022 14:28:21 -0400
X-MC-Unique: bJw0ql5pOIOVZ6ItZNg5ww-1
Received: by mail-vs1-f69.google.com with SMTP id
 64-20020a670743000000b003a630e65824so1615831vsh.15
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OkQTg5RCvUup85pTMLyw1oF4TW19fry6zReoXmrLAdk=;
 b=tj6Jly/B6CW6nwjgHkvqv7xDqjI8jWvRcRZF2SO78mKJy+A+IeOXM+mb0o/5TpW9Ow
 YIma+Z59lVdeG6b0CtuSVr7cn9gQY0aCYmlfrJDaxOrtoHhS6mvKYv1CDCDj2EZlzXTQ
 fMX1pAhska7UCFKo8y0UQXlxFOJpb2mlw2gVjhchDKIlkrk7SPzLwFthia5ETbh2hcp8
 jmUiEJ92dU0hwOAXiA88+bl4H+gFdDPdfwLzZx5ItayL7vbDteSSP9gplUaraSGLAEC5
 Cd4E3zzX83yyxzkKEXVO/xqxFLv2F3YuaKY1qPh2WPYtBwnXUpcFMCXWJVxWbwPBc3Ez
 pYig==
X-Gm-Message-State: ACrzQf06E7SBQdQmo0yx7bwmVcZXWHpAe2NT9ziQjNo+qI/pXOQW7MJH
 bjvQE4RyjeZb+LFIA9W4bEiIK7v6A5O2eqvm7SpFkAr5VGgqFrIPYTBDJvqshc+QWuihlONHHXh
 yi++ipKXwKzzx7fHcoJXKRJF0zIIuYnM=
X-Received: by 2002:a9f:204d:0:b0:3e6:41ef:2f2c with SMTP id
 71-20020a9f204d000000b003e641ef2f2cmr3528202uam.57.1665772101004; 
 Fri, 14 Oct 2022 11:28:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6m/IHiVsj6/oualSAEPsY+bU+/mSIoBgoR0PiRB4nluNkt/jA1K0kMhd8IPvCK/SwSjEs3F368tENDgL2WJTE=
X-Received: by 2002:a9f:204d:0:b0:3e6:41ef:2f2c with SMTP id
 71-20020a9f204d000000b003e641ef2f2cmr3528190uam.57.1665772100741; Fri, 14 Oct
 2022 11:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221014060807.660587-1-groug@kaod.org>
 <398b4657-7b21-5e15-1db6-e9225e6f3d4e@redhat.com>
 <20221014180714.6d423f74@bahia>
In-Reply-To: <20221014180714.6d423f74@bahia>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 14 Oct 2022 20:28:09 +0200
Message-ID: <CABgObfbg0H+gToK4=5950DiZUQVYFMdDZMq_BMynnAicMHz4sg@mail.gmail.com>
Subject: Re: [PATCH] util/log: Always send errors to logfile when daemonized
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000577d2505eb02ca4d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000577d2505eb02ca4d
Content-Type: text/plain; charset="UTF-8"

Il ven 14 ott 2022, 18:07 Greg Kurz <groug@kaod.org> ha scritto:

> 2) and 3) can certainly be preparatory work but I think 1)
> should be squashed in my patch. Because of the !per_thread
> check in need_to_open_file, the existing code in
> qemu_set_log_internal() doesn't even open the global file
> and qemu_log_trylock() would always return NULL for the
> main thread.
>

Sounds good, thanks!

Paolo


> Thanks for the quick answer and suggestions !
>
> > Paolo
> >
>
>

--000000000000577d2505eb02ca4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 14 ott 2022, 18:07 Greg Kurz &lt;<a href=3D"mai=
lto:groug@kaod.org">groug@kaod.org</a>&gt; ha scritto:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">2) and 3) can certainly be preparatory work but I think=
 1)<br>
should be squashed in my patch. Because of the !per_thread<br>
check in need_to_open_file, the existing code in<br>
qemu_set_log_internal() doesn&#39;t even open the global file<br>
and qemu_log_trylock() would always return NULL for the<br>
main thread.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Sounds good, thanks!</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks for the quick answer and suggestions !<br>
<br>
&gt; Paolo<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000577d2505eb02ca4d--


