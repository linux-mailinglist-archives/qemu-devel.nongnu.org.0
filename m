Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BB12FA7A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 17:31:54 +0100 (CET)
Received: from localhost ([::1]:54148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inPrd-0000Ou-SL
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 11:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1inPq4-0007gx-IN
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 11:30:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1inPq3-0003Vm-E2
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 11:30:16 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56738
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1inPq3-0003Qm-6s
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 11:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578069014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2W1AN9n6QxJJ6/wxGnXx50nUdaqqktkcs54Erhi2Q8=;
 b=D4lnKYeeBNedSG/iV3UwD82hZGxuhDlDdR4mPWyb/91OkWwMGxP+TdDjFQPJMTgEYBR/fJ
 ZrxErUb7lNNpCANe/OUCNH87hneJrxrEbYwDaJ3Mq/IzElSLLuGY7MoyM4dWyXMATVeE2p
 XgC/HvFGBruwiGHVVsAROM4Uytj9E4U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-H1v_WlohMwyM2-SkqXTVpQ-1; Fri, 03 Jan 2020 11:30:11 -0500
Received: by mail-wr1-f71.google.com with SMTP id c6so13913068wrm.18
 for <qemu-devel@nongnu.org>; Fri, 03 Jan 2020 08:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WqbM5qg9L9Z+wxoPE8MCJFCd62aZpFxCiBx9Lj6XbkY=;
 b=GiFZxMCT7nzxLhYgUzc7K98RfqnkZhPcWjSVWizqza6KburgwGs1zlEQqD/d3he5Cl
 5yWfiuBtvBDJGFX4gKoMAo3+SYXLD+rOwAGeVyrCQMRXEq4z9vpwCWvavtj7AUzGUo9w
 qENlXq1kDhTHUeM5Bo7Qi/rufWqVg8fi9d2JcJhtTvVHYdT5Nq27bl9VC++Xsj1N1uPf
 dSeW+Ll9f3VglyupoFfrWTIaJA4J00mArZglWMmtzoVQUR+0NMrqWLd3/+Tsfz4exK8D
 pJfui6D269KeGfhPmL6+GpUTUFPy/d4pWuVg3wMDVb9+UyWYcb4idc9Sd4V6j0WHLS2E
 A88g==
X-Gm-Message-State: APjAAAXUJ3Q9Rb+zKnqkNfmBLPqBhtVVQpZCp9T+4vv6blayKr32D0YI
 iup+AJ9yKFG0LIoSeoFXTtIU2ktfYuj3eNK4Cs4QDYG5SNjrBUUfmALpuesA+c0YcbUTOpiZM9Y
 rRagQId+QKBwNZJo=
X-Received: by 2002:a1c:234b:: with SMTP id j72mr21041955wmj.128.1578069010009; 
 Fri, 03 Jan 2020 08:30:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxr00m23WqM7/4ClYAXB3pleVLBhGG4XfFGKL49xOLvvE27lXCjsS3MPP8e2fgCI89ISiEPgA==
X-Received: by 2002:a1c:234b:: with SMTP id j72mr21041939wmj.128.1578069009824; 
 Fri, 03 Jan 2020 08:30:09 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id f1sm60174263wro.85.2020.01.03.08.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 08:30:09 -0800 (PST)
Subject: Re: [PATCH v6 06/21] module: check module wasn't already initialized
To: "Oleinik, Alexander" <alxndr@bu.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191129213424.6290-1-alxndr@bu.edu>
 <20191129213424.6290-7-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c9611632-280d-f95d-78a3-7faf4702ed12@redhat.com>
Date: Fri, 3 Jan 2020 17:30:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129213424.6290-7-alxndr@bu.edu>
Content-Language: en-US
X-MC-Unique: H1v_WlohMwyM2-SkqXTVpQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/19 10:34 PM, Oleinik, Alexander wrote:
> The virtual-device fuzzer must initialize QOM, prior to running
> vl:qemu_init, so that it can use the qos_graph to identify the arguments
> required to initialize a guest for libqos-assisted fuzzing. This change
> prevents errors when vl:qemu_init tries to (re)initialize the previously
> initialized QOM module.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

> ---
>   util/module.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>=20
> diff --git a/util/module.c b/util/module.c
> index e9fe3e5422..841e490e06 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -30,6 +30,7 @@ typedef struct ModuleEntry
>   typedef QTAILQ_HEAD(, ModuleEntry) ModuleTypeList;
>  =20
>   static ModuleTypeList init_type_list[MODULE_INIT_MAX];
> +static bool modules_init_done[MODULE_INIT_MAX];
>  =20
>   static ModuleTypeList dso_init_list;
>  =20
> @@ -91,11 +92,17 @@ void module_call_init(module_init_type type)
>       ModuleTypeList *l;
>       ModuleEntry *e;
>  =20
> +    if (modules_init_done[type]) {
> +        return;
> +    }
> +
>       l =3D find_type(type);
>  =20
>       QTAILQ_FOREACH(e, l, node) {
>           e->init();
>       }
> +
> +    modules_init_done[type] =3D true;
>   }
>  =20
>   #ifdef CONFIG_MODULES
>=20


