Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279564026A4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:59:45 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXtI-0002KZ-9C
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXsT-0001Yo-DM
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXsG-0007xi-Ga
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631008719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJ+NbzsRWaau0KWoNeRxDBEILuWRL+lcPmQQTX++0Lc=;
 b=iVpq1dwr4euh80+wR6/4oWmi7VRCpCE/w8WHEXjNqTCIpkLQzU5zatC4+G/S3WehW6lZ46
 EFv3AnAviaa8PY+fuV8A3Y8R07BJxU+VP6IdFhN6aKJ0Grjo62wN9IzF0xRUcUsyTN0yK5
 JCsmTfW+6dgJusTthY2iWZQK5WkiIyQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-oNoqVeV3Om-aeWhpxQgeVg-1; Tue, 07 Sep 2021 05:58:38 -0400
X-MC-Unique: oNoqVeV3Om-aeWhpxQgeVg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1931935wrn.19
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FJ+NbzsRWaau0KWoNeRxDBEILuWRL+lcPmQQTX++0Lc=;
 b=Fx8Ya7VWob60iOfG9IhMhylI98e+nfCTycx2S+QjjjUagQ2WRZvs8ch9x7pwE782FV
 ZYNuFLLvLVF4+zpa3Qp+HISaN1oEXma27y54HoHJvfykjquigQbD92buMHoWHmD/AIhR
 dmqFnpInEnOxQBnGByKDcrFpigiSMecoiXfnZWIzf1/B7FOvBLh7A7y+gnm4BelOhNmv
 IFsMYXNdxai8o7/T1z5j4A40zth3pFqtGZhO7/0pRLNNIzHH2tI8ZDWW0ALrgkxO67uy
 5ZlM0+OkRa5ZzaIang3aKQ0vOj2sknaoAgMGiKlcbNc2maQYJyxD3blzfkxOvOifq/ak
 oy2g==
X-Gm-Message-State: AOAM530IuuyvE+iggz7puX2K8EtG7pvb+aPsjJgT35YoocE1DoAcjkVV
 uuRa8wasJ28NTx7N0fILuS48LhIBXr4xIt4XkxVRYsCHnGMXPXsRMcUDueJTbjyjilSuQkpw++x
 SAJy4OC8IX5WydTE=
X-Received: by 2002:a1c:f314:: with SMTP id q20mr2978442wmq.154.1631008716662; 
 Tue, 07 Sep 2021 02:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbrKzt+0vdfWS44nrI2RjfXdKoxtZKcG05wwfyy2X2pP2H1aCPlcEP0Zl6bdOc1xGWjff4ZA==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr2978426wmq.154.1631008716439; 
 Tue, 07 Sep 2021 02:58:36 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id t7sm11551684wrq.90.2021.09.07.02.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 02:58:36 -0700 (PDT)
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: qemu-block@nongnu.org
References: <20210819101200.64235-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <089b83f0-6511-f4b1-5d1e-ccaa70ac236c@redhat.com>
Date: Tue, 7 Sep 2021 11:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819101200.64235-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping – any thoughts on this?

Hanna

On 19.08.21 12:12, Hanna Reitz wrote:
> We cannot write to images opened with O_DIRECT unless we allow them to
> be resized so they are aligned to the sector size: Since 9c60a5d1978,
> bdrv_node_refresh_perm() ensures that for nodes whose length is not
> aligned to the request alignment and where someone has taken a WRITE
> permission, the RESIZE permission is taken, too).
>
> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
> blk_new_open() to take the RESIZE permission) when using cache=none for
> the target, so that when writing to it, it can be aligned to the target
> sector size.
>
> Without this patch, an error is returned:
>
> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
> permission without 'resize': Image size is not a multiple of request
> alignment
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> As I have written in the BZ linked above, I am not sure what behavior we
> want.  It can be argued that the current behavior is perfectly OK
> because we want the target to have the same size as the source, so if
> this cannot be done, we should just print the above error (which I think
> explains the problem well enough that users can figure out they need to
> resize the source image).
>
> OTOH, it is difficult for me to imagine a case where the user would
> prefer the above error to just having qemu-img align the target image's
> length.
> ---
>   qemu-img.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/qemu-img.c b/qemu-img.c
> index 908fd0cce5..d4b29bf73e 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
>           goto out;
>       }
>   
> +    if (flags & BDRV_O_NOCACHE) {
> +        /*
> +         * If we open the target with O_DIRECT, it may be necessary to
> +         * extend its size to align to the physical sector size.
> +         */
> +        flags |= BDRV_O_RESIZE;
> +    }
> +
>       if (skip_create) {
>           s.target = img_open(tgt_image_opts, out_filename, out_fmt,
>                               flags, writethrough, s.quiet, false);


