Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F7346160
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:22:33 +0100 (CET)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhvU-0000rk-Fy
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhp0-000243-KK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:15:52 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhoy-0000Xa-4L
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:15:50 -0400
Received: by mail-ej1-x62a.google.com with SMTP id w3so27363793ejc.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tXRiyp7GxFP599AbUxl5Pk54yoqmRlmBnb8SZDGMCbg=;
 b=NRyqN9pTdQGaaoDhGt7otDotnwPCypxGqkV1UvZKJ7vOisjznc/QuBOdnIOXimgCxb
 4VD/fAUaNRbSpLVFBvRBtkcd0YO0frYlfqb73IlBwbSAsClkiiMuw2cuDA/aW4P0SaXO
 gbib3UjCD3WQvjPlPrYUVT5R1Xz9eRnSiIoxfw0q6ZYMJxnE9o9ix0LwOr90ock5d+Aj
 wBuRnQEf6/iL3BkmE1fjiEKFASZ6JXQ8WulAK+DsSZsaUonDQllIGKDN+l3qwsCieUst
 JZmD/T46q71/M6el7ovBPbYcU4OjBsZnh+6V/pGvb5H1XqiyX23NHrGNIRYnT6dpW9Cp
 K7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tXRiyp7GxFP599AbUxl5Pk54yoqmRlmBnb8SZDGMCbg=;
 b=phJJ3+lIf3R3H6+lSfijZrjyPW/OIJzVXcqeMXlqlaKtGojeLoFvOF3a033xmFh6X3
 b/Kx4MyLp2eaLV4noRp3R9/Y33famVkFGWm/3mLG50Slow/N8jqVbX1uPUfDVQ/enm3a
 bn1aLl9Op0ArkIERnYDmGtNFcTu+YRLkwbBHUhnc5HzT/d4G5U3Uf0vlR5guBjnySmPX
 qH/lqmkxuMKZICxjc0YkSEQGDhzYBX8wZDDlU+q4RiVJ5Sv6nUhWUWsxxdfkLZZ1Dhx1
 1OKhI1hJPib2StI656pjTyhUdDJ1hBe3de/SGUKQ9jtPRw0qHmr4gwk8yMpG2enuv98c
 3lxw==
X-Gm-Message-State: AOAM5307WdR7dwTxeX86w6/vmKIsRZHxulpSL5wyokuAOPWq/r1J031Q
 SURkGpjlhokdhOWgDEoXjVs=
X-Google-Smtp-Source: ABdhPJy+9kWepds2gVPjkJ0/4xh3XZnLDHQaNTeh/hUrwJ6CV9j9cSPvI/+jwlacNv3UewB+VyF6MA==
X-Received: by 2002:a17:906:845b:: with SMTP id
 e27mr5007015ejy.487.1616508946629; 
 Tue, 23 Mar 2021 07:15:46 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id bj7sm11644104ejb.28.2021.03.23.07.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:15:45 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:15:44 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 8/8] virtiofsd/fuse_virtio.c: Changed allocations of
 locals to GLib
Message-ID: <YFn4EP0GiQTqPDu9@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-9-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zw3eDJESFuLLr2kL"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-9-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zw3eDJESFuLLr2kL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:27PM +0200, Mahmoud Mandour wrote:
> @@ -588,7 +587,7 @@ out:
>      }
> =20
>      pthread_mutex_destroy(&req->ch.lock);
> -    free(fbuf.mem);
> +    g_free(fbuf.mem);
>      free(req);

       ^--- was FVRequest allocation changed in a previous patch?
            Maybe an earlier patch forgot to use g_free() here.

Aside from this:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zw3eDJESFuLLr2kL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ+BAACgkQnKSrs4Gr
c8gGsgf+LUQEW9chpsH+ueoZNP/3BQy3TIS1+JgsRSPB8m38tXaDIO2iSd13PcvJ
YdxnhYrU332FFWFGzbgi1B+pAQBhxjIAEjgn3qbWMxlv+gz471m3OLGs5j3Gis3W
+iEFAjPxZ9fW8WykrH8w2DQVyVN1fRwNgmJ9K6kdoSxdUe020ZhjiAdSI/foJmEZ
PNvI23SPPjwsB7uREk2jUL2R4hFfHCbQDop9FlsoO7mcw1+kEEugHL64kYFRNArt
iQX90Fv90HFXyj4/zSDtcyForz9RLSZzvFpYOXiLNMqACUWYFdfWe8fyuFqDk9sw
bmCy/zSgIGZkKTcBc7/y47z63VElTA==
=Bw5S
-----END PGP SIGNATURE-----

--zw3eDJESFuLLr2kL--

