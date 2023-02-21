Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16C69DB70
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNNC-0000eg-A4; Tue, 21 Feb 2023 02:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pUNN4-0000eL-01
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pUNN2-0008Rl-L1
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676965647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fuD8/xq36ag32hDnyZCOwXOKrfRUTMciikBU2TwVq+o=;
 b=ZJE4i1paTO7QayW2D5J6t/k6WtHj9KUMrsefgP8TZbwgCDhttrvt2/6weNRKGisMBrTdv3
 Uu5xmSu8pXRE8j6wzz8tENHEcfk87HTLFZul3yk7HlP1jgWgdB/oOIp8tpNTP3jcqZzyxb
 wUP8WS/eo3jiWY2G9CaVFYP6lreeDuM=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-oaBffKBbO06wTAAisoC51w-1; Tue, 21 Feb 2023 02:47:26 -0500
X-MC-Unique: oaBffKBbO06wTAAisoC51w-1
Received: by mail-vs1-f72.google.com with SMTP id
 a14-20020a056102094e00b00411d9dbb998so490612vsi.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fuD8/xq36ag32hDnyZCOwXOKrfRUTMciikBU2TwVq+o=;
 b=4dg/0Fj4KPtoTNM/4EsGkiIUoTVz9TQaudW+5e3lZLWXU75tS5cdYwV/u/G5aoyUck
 cpojwQETyZj7hrmvGh+m3nCAOlk4wwn16T6mXM2l+q5VT+9hAPeGRec+T7Sd3TSCiETb
 TxaTwWMVWC9dslbvpId2rRtDGwJkZ7lp6zGHFX+s8Bq0x0Kqx3WZck5O2TYQr5P+ubHS
 wqFGs6x3Uu+Ogzs0QUQqm7KSKvUaZduBVP2CMQKW+3Qgi9V4Kj9B/tJeEjsM6XSHZiuk
 8cok77FEwxYkqXD7hav7wwtiJ2SEbYOeq/RXa/uq//Yf4eO0/ojLTpdVAUC2oGbchWue
 x27A==
X-Gm-Message-State: AO0yUKXwIlFf5nmN59HY9UdiDfsy21fJNEK/DOBS9cZ1ohkAA798pNUX
 qXowg8Fh8Hdr+f9jSJ+dd5A7gUp0wlx7tg5VRm/D9loDL427IvAzhF1hSBl2LM7dNtu9wG8xoud
 3ddlnGYwwNm6Uw3BxuEtD6gnDA7lkROQ=
X-Received: by 2002:a67:f408:0:b0:416:f6b4:ff4e with SMTP id
 p8-20020a67f408000000b00416f6b4ff4emr460368vsn.37.1676965646095; 
 Mon, 20 Feb 2023 23:47:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/vdGe2GJ1VYPxqhBiQc+9LXkd6ZZcJshaTi3ey7jw3iSeGv00cfra6C+DS/dCQQFqFX2JsPabP1m84TlYMdiY=
X-Received: by 2002:a67:f408:0:b0:416:f6b4:ff4e with SMTP id
 p8-20020a67f408000000b00416f6b4ff4emr460365vsn.37.1676965645919; Mon, 20 Feb
 2023 23:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20230220174142.240393-1-kkostiuk@redhat.com>
 <20230220174142.240393-2-kkostiuk@redhat.com>
In-Reply-To: <20230220174142.240393-2-kkostiuk@redhat.com>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Tue, 21 Feb 2023 09:47:14 +0200
Message-ID: <CAGoVJZw4BW=MceTtPD4RKJ3-FjXiNfyqfe+4NrebWuu3B+pSkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga/win32: Remove change action from MSI installer
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Yan Vugenfirer <yvugenfi@redhat.com>

On Mon, Feb 20, 2023 at 7:41 PM Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> resolves: rhbz#2167436
> fixes: CVE-2023-0664
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>  qga/installer/qemu-ga.wxs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 51340f7ecc..feb629ec47 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -31,6 +31,7 @@
>        />
>      <Media Id="1" Cabinet="qemu_ga.$(var.QEMU_GA_VERSION).cab" EmbedCab="yes" />
>      <Property Id="WHSLogo">1</Property>
> +    <Property Id="ARPNOMODIFY" Value="yes" Secure="yes" />
>      <MajorUpgrade
>        DowngradeErrorMessage="Error: A newer version of QEMU guest agent is already installed."
>        />
> --
> 2.25.1
>


