Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C56F0D76
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:49:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8YJ-0000kc-35; Thu, 27 Apr 2023 16:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps8YH-0000k7-2z
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps8YF-0000SS-HB
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682628554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkE++VkS1g9+07kdZWVSrLoAMUhgkLQS/v/lFWKvB6c=;
 b=fEaanPZG/LkY+cFB+oF5LJNWf3HtYPIUbDGJnUBnH3M/khODpfBe6DbhiXwxynZKNRehKY
 w6tuHzuORz4B4YusqaZfyTi6XI93k6AWHlYCoftEBsC3QDAIC6xMs+Q+Rs6MbQE0EY+6to
 pAWwGBP5CAqKFTcwMrMVtVhAFaUIkx4=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-I0ox2CfvMaqqHWjI1cCdIQ-1; Thu, 27 Apr 2023 16:49:12 -0400
X-MC-Unique: I0ox2CfvMaqqHWjI1cCdIQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-4403bf0d4dfso2197278e0c.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 13:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682628552; x=1685220552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nkE++VkS1g9+07kdZWVSrLoAMUhgkLQS/v/lFWKvB6c=;
 b=GNtjySOeZyQCVx5lKip/lToV9YoPdo6y7G+v9QUQQIKDTpFck5Ej8ikST3ECsyuA1g
 fUL9A4WXTLKjXbQ41QnBZClnZaINS/qICW1vZwEXEDLZCqJQ+vZrZYJ5RMRdHp+hy3eA
 26qevyNFd4TEbCMs+STeMD2Mhdv6ayWnCmo2meETEWng1ELnRXUAy6FMLPUq3yQrlspU
 zz4qIdd6dW/QU9CrsFm3JwMJgxN4pdO/b9o6QtsP53qEyHjshc1QP1mHnnyCXnDEUdhh
 ge4UFfKH+RBshjPyIRFeWVytuWBVenAoXeSp3z5ABAK3tw/WvENZQ3MXor2YTpY4qn9j
 P8ng==
X-Gm-Message-State: AC+VfDzrOZOrnGeOliVmsYuJREb4tRR70fo/t+2R19kKMe/eikctAY5T
 JwyCrV1LPsoav0HNHt8dm13DVZVaSYAh5gfHU0/GFg5mgxWM3DoOETW4LJwfTMWaPvAEsxR7QF3
 7hxKjo4qtNbq/nztWbSIlkZfGNBa/Yc4=
X-Received: by 2002:a1f:5f51:0:b0:440:65a5:332a with SMTP id
 t78-20020a1f5f51000000b0044065a5332amr1249630vkb.5.1682628552065; 
 Thu, 27 Apr 2023 13:49:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jaGDdmC08q3hLdl22aV2QCUNPF1nb+S8EZ4MFyBqblhCU1cwePf1pB9Oq0kcw685ldZG8cdHfxoVNEj/K9ms=
X-Received: by 2002:a1f:5f51:0:b0:440:65a5:332a with SMTP id
 t78-20020a1f5f51000000b0044065a5332amr1249626vkb.5.1682628551804; Thu, 27 Apr
 2023 13:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-4-kwolf@redhat.com>
 <CABgObfbOD+cpEdP0JE6Os1-vYvrp1zMvCFOST0YrBw3H0s9noQ@mail.gmail.com>
 <ZEqqLnWqFi4WH1yq@redhat.com>
In-Reply-To: <ZEqqLnWqFi4WH1yq@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Apr 2023 22:49:00 +0200
Message-ID: <CABgObfb1CuAEe53SiMbjSDZNvA+Hp4DB_HFZb-dxHg94vdJNDQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
To: Kevin Wolf <kwolf@redhat.com>
Cc: "open list:Block layer core" <qemu-block@nongnu.org>, "Hajnoczi,
 Stefan" <stefanha@redhat.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001ea47505fa577dc4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000001ea47505fa577dc4
Content-Type: text/plain; charset="UTF-8"

Il gio 27 apr 2023, 19:00 Kevin Wolf <kwolf@redhat.com> ha scritto:

> By the way, and slightly unrelated, can vrc somehow help with finding
> places that call coroutine wrappers without holding the AioContext lock?
> (This results in an abort() when AIO_WAIT_WHILE() tries to unlock the
> AioContext.) This is one of the classes of bugs we're seeing in 8.0.
>

Seems more like a task for TSA.

Even though C TSA doesn't let you check that the *right* AioContext lock is
taken, it can check statically that *one* such lock is taken, and in
general I would guess it's rare for the wrong AioContext to be locked.

Paolo


> Kevin
>
>

--0000000000001ea47505fa577dc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 27 apr 2023, 19:00 Kevin Wolf &lt;<a href=3D"ma=
ilto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">By the way, and slightly unrelated, can vrc someho=
w help with finding<br>
places that call coroutine wrappers without holding the AioContext lock?<br=
>
(This results in an abort() when AIO_WAIT_WHILE() tries to unlock the<br>
AioContext.) This is one of the classes of bugs we&#39;re seeing in 8.0.<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">See=
ms more like a task for TSA.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Even though C TSA doesn&#39;t let you check that the *right* AioContex=
t lock is taken, it can check statically that *one* such lock is taken, and=
 in general I would guess it&#39;s rare for the wrong AioContext to be lock=
ed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Kevin<br>
<br>
</blockquote></div></div></div>

--0000000000001ea47505fa577dc4--


