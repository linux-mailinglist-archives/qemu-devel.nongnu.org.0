Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B93F618DE3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 03:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqm4G-0006kq-40; Thu, 03 Nov 2022 22:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqly9-0003WK-Th
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 21:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqly8-00019A-0r
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 21:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667527082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zvnx8umCVpFt1A+qE7bPEwZPEgfBDeoctVvmQ/jGdb4=;
 b=dWcbNyrgZPFqRqTnwSVe6Lx5sGcM2vt/cFFH6C1lIi3ADGyDLtAGdAphh5tGmKWxLlvsbz
 A4GfPmr1UwrUM4SQZI5ZlKtBhNM48w0AqhaGYiHXpJ0hhx9LpYPjSIKBch0NGiIiWG7a0h
 wsRKyQMOip3eu79Nc70OwWJkYw1jBNU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-no_qINLUPkWh7QPO2mUg0Q-1; Thu, 03 Nov 2022 21:58:01 -0400
X-MC-Unique: no_qINLUPkWh7QPO2mUg0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 f20-20020a0564021e9400b00461ea0ce17cso2509710edf.16
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 18:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zvnx8umCVpFt1A+qE7bPEwZPEgfBDeoctVvmQ/jGdb4=;
 b=UoM4zxHQSdk3F0zzTDGgFjSXI8rec0huU+spRvl+pGjx712EauEcQXpQDqIm8fQQGl
 nqKwwffPcz6PBDqxx8NsTI7/Rf1YNF0QFS5oIm0lrL3ADA8w4hk1NTL8vkET8RP9vH/y
 SibuYXR/tTa73ofTVfxBrdEpYWsEkUIgoZ+XbCmNLiOspBiWO2ZCIEM4gvWKeWiIhDUp
 nFskL+R6WoNaRu7s+YJduG4gQCWW6XFC2Ib2rpV1z7gkQbN3l1L6pkleh2lD2NF0yscZ
 ifYQsVmZ9ba50z4+u6HUsy8UmfevUhWXP7shZb0QFuZMmiobww8TyvM4ve5T6y+sRNl9
 Un9g==
X-Gm-Message-State: ACrzQf09AueR/fnONisZZujcXaW0NFHwG9Z7qgBKGXD2r85n6c7RQEi8
 Q3hd2dzp5t5hZ1MKceqTT8tMz4Zyhom0ThvQSpr+P+2iK/4V74sUJGjkYfEe74fOMIshuwt23eF
 fNn7a6CKETYDozxxXyGrw14i6kwRYGhA=
X-Received: by 2002:a17:907:1c10:b0:791:a716:5089 with SMTP id
 nc16-20020a1709071c1000b00791a7165089mr32015164ejc.672.1667527080008; 
 Thu, 03 Nov 2022 18:58:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bQm6X1D3J3dYHe6sJbEzrjHCQFzMphkphIhih/OuErK/94suImPgUekxhcBeTj580NmkpiPkDMUFMRtGSWXI=
X-Received: by 2002:a17:907:1c10:b0:791:a716:5089 with SMTP id
 nc16-20020a1709071c1000b00791a7165089mr32015145ejc.672.1667527079769; Thu, 03
 Nov 2022 18:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221103104716.179635-1-zhenyzha@redhat.com>
 <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
In-Reply-To: <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Fri, 4 Nov 2022 09:57:23 +0800
Message-ID: <CAJFLiBJSYLm11xUfWPFTOi9xMPk6WYE+G+v3-mhWzV=xp-YHAQ@mail.gmail.com>
Subject: Re: [PATCH] qom.json: default the prealloc-threads to smp-cpus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, shan.gavin@gmail.com, liuyd.fnst@fujitsu.com, 
 eric.auger@redhat.com, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Philippe

I checked out this modified patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg888815.html
It should have been merged in 7.1



On Thu, Nov 3, 2022 at 7:00 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 3/11/22 11:47, Zhenyu Zhang wrote:
> > Since the amount of prealloc-threads to smp-cpus is
> > defaulted in hostmem, so sync this information.
> >
> > Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> > ---
> >   qapi/qom.json | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 87fcad2423..ac4cd213a7 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -576,7 +576,7 @@
> >   #
> >   # @prealloc: if true, preallocate memory (default: false)
> >   #
> > -# @prealloc-threads: number of CPU threads to use for prealloc (defaul=
t: 1)
> > +# @prealloc-threads: number of CPU threads to use for prealloc (defaul=
t: smp-cpus) (since 7.1)
>
> The property is present since 5.0. Shouldn't this be "(default:
> smp-cpus) (since 5.0)"?
>
> >   #
> >   # @prealloc-context: thread context to use for creation of preallocat=
ion threads
> >   #                    (default: none) (since 7.2)
>


