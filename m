Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C02C5269
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:53:03 +0100 (CET)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEta-0003Ju-J9
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiErn-0002OO-Ck; Thu, 26 Nov 2020 05:51:11 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiErk-0000a1-Mx; Thu, 26 Nov 2020 05:51:10 -0500
Received: by mail-ot1-x344.google.com with SMTP id y24so1531932otk.3;
 Thu, 26 Nov 2020 02:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1TY+Qge8Djo48EeksxDvFUXVzrcsvXCDsno3d00X+AQ=;
 b=QqF191c2E20T3O/JhM342+00Ym6xULnyIj/UPTMgP+I9RZk5JsZjkcQZL4CTUQkXKI
 X/OGZ1ehnGe/kDevIcGqjCC+bPe1G2UFjgMHu3fmJj0/Hwoj6uw+afeeQFvQZSbxm5as
 t1aVDnpMkIFsrRcuyxIDqZWb8L0oBFhF9rEJuRxgBjNTImLwzgbCCSXQyHyqyhCiC6/U
 MLZznIhSoPAL5+uNWfZm4/3Ddwl+YM5N02HutENDyq9HG72vEJXLq7ALeepgsQMInLud
 HeBCs+jczJH+4i8GtJOuXqcwVUj6FVqx2bKRKj47A+97ZRj9Ly42Vd2478k/GSMHL5zO
 theQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1TY+Qge8Djo48EeksxDvFUXVzrcsvXCDsno3d00X+AQ=;
 b=A0nV5cqjEFg1iRYimLE7nARKzb7we8hrSu1EGnOqmDLsfUjIJDf4UG4wHhE+hK+ALL
 NEj4aIfBpp+Go5YpVDIUbUPhUdNOam9yIybWMnU6y0Wdi+JgY/7T/faZMWctTADEWr6v
 LZxI+OOpIgX6gzH5w9L1S2WkQ0pHtfcMs8CTKyEXtzj2MO95GeE53ynK6afAudA6vq5Y
 wRG3IAYJPig+XiJbq/vPySHxvi9emEHnEmbGOPRGVQHpjlDhIgJzwCakR5OzKPcJYRcm
 0dgo4WuBW6QAkxt/frFMME7UaofmDCdRaYUMFnX2PQyjEe/zda6zD0eewX+sHA/zNRXu
 GbEA==
X-Gm-Message-State: AOAM5323eYkvQ/kalc1bAwvTIShxecMtbEE7lMmniSO5jMpIxpBkl5oe
 06Xu3TpSlBCCJKCLV728anVaSipjPHSSCm60+FU=
X-Google-Smtp-Source: ABdhPJzRoBoy9JQAhTSCn2cHXTcmTFBaMbiKbmthshhtjre1aeUvUHDeWlzE8x+S+nfE2cV0c1Ijh4ZOZ265Yxy/feA=
X-Received: by 2002:a9d:7e96:: with SMTP id m22mr1882268otp.181.1606387865338; 
 Thu, 26 Nov 2020 02:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20201126101624.55714-1-alex.chen@huawei.com>
In-Reply-To: <20201126101624.55714-1-alex.chen@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 26 Nov 2020 18:50:29 +0800
Message-ID: <CAKXe6SLTqMgANNox-Y9=DhZHzRRaqT6taWBu1qenC4hsRe0+Qg@mail.gmail.com>
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x344.google.com
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
Cc: qemu-trivial@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu_oss@crudebyte.com, Greg Kurz <groug@kaod.org>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Chen <alex.chen@huawei.com> =E4=BA=8E2020=E5=B9=B411=E6=9C=8826=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:29=E5=86=99=E9=81=93=EF=BC=9A
>
> Only one of the options -s and -f can be used. When -f is used,
> the fd is created externally and does not need to be closed.
> When -s is used, a new socket fd is created, and this socket fd
> needs to be closed at the end of main().
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  fsdev/virtfs-proxy-helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 15c0e79b06..339d477169 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
>      process_requests(sock);
>  error:
>      g_free(rpath);
> +    if (sock_name) {
> +        close(sock);
> +    }

If 'proxy_socket' failed, you call close(-1).

Maybe following is better?

if (sock >=3D 0) {
    close(sock);
}

Thanks,
Li Qiang

>      g_free(sock_name);
>      do_log(LOG_INFO, "Done\n");
>      closelog();
> --
> 2.19.1
>
>

