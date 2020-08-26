Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDDB252ECB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 14:39:07 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAuhm-0001cs-Qx
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 08:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kAugp-0000kM-P5
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 08:38:07 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kAugn-0006ne-Gi
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 08:38:07 -0400
Received: by mail-ot1-x342.google.com with SMTP id e23so552345otk.7
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iSwZ1GrBESC5BsvhKRzPZ9nPFCxWyheM4CkIPRpnReo=;
 b=QQsJa61K0Oa0tCDAMJQLEaIjMPXyx1dI77YO7E6R9zL3p1OzAd2YVhJEVMD6xRCQIo
 FOjxq6SrzB3H8uSEEBrtwDcwUvDppG5T4OVF+gza9AdNHwnLH13sIHBfigjIe7V1qSIw
 wQw+a6b9kxDR82hrU6U+2EeEeEhiMiAswXHfQwkJxzchswYbRD7pRI59TOpf0kbO12ai
 ORdnf/4+GoeWIumnrxh0NT6XttC9MJ01pXw4P3YOnRG8KkPfg6UheywCsdQFlq8yVzIj
 +UHaMyotB3WQzoQOtpxQpxWhUOY5q34nkVXSjAv0TItkZ0B8fNnLzt6P+zjx7V/F5H92
 +cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iSwZ1GrBESC5BsvhKRzPZ9nPFCxWyheM4CkIPRpnReo=;
 b=Tb/c2rAt8mRhYK4CvEnM6dsJ+DqEzuc94y7ptMIAOsf3NCZBVpnZfVlKBkJx4SKiut
 05W0zAAF0HPIn/6RFuDaVWl9Q2NUdAdDrTf2g4UM49iLIW3m5vHAJBKMFJH3lWkfaLVn
 eRJXNWCDA1tI9n8piRdU+vEnyE+qgNunC6vF91XoFqux02KKqCDBNz/DCj0pRRx6YfuS
 QpQzstYTCdOVF2mmkGhE9/uRV0q3PYNhC05Lx2DsNtSZZQr3lzJiQQ/Ep4DC5KWPytOS
 ZkpbxhoFRuE0lRD8zkro2bxl/ueyEm8khymV8eil73Cz65IuMuQAxXiriXnv5sC2PvVZ
 //UQ==
X-Gm-Message-State: AOAM532En0zeD8Rn9WTI/npBLFSohiilDrGUqSg9bk0o4av/WtcBxJV1
 hWiUcbcaiUXWrQ43gFP+KWHGTCaiO8MoCXAdVZM=
X-Google-Smtp-Source: ABdhPJzK5TGIkcyOpzMsr2l06BsGIojTs88gFUIe7QnG2csG46HqLXUW+ZmX58yz3Bw4f4Poor0kkgtWIWSnWMtIOkE=
X-Received: by 2002:a9d:788:: with SMTP id 8mr3087496oto.181.1598445483685;
 Wed, 26 Aug 2020 05:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200814160241.7915-1-pannengyuan@huawei.com>
 <20200814160241.7915-9-pannengyuan@huawei.com>
In-Reply-To: <20200814160241.7915-9-pannengyuan@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 26 Aug 2020 20:37:27 +0800
Message-ID: <CAKXe6SJfvxo8k+an27YkNP9aA-pQvNJ=CqDgxfw7DyCfE-GRBw@mail.gmail.com>
Subject: Re: [PATCH 08/12] migration/colo: Plug memleaks in
 colo_process_incoming_thread
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pan Nengyuan <pannengyuan@huawei.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:52=E5=86=99=E9=81=93=EF=BC=9A
>
> 'local_err' forgot to free in colo_process_incoming_thread error path.
> Fix that.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> ---
>  migration/colo.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/migration/colo.c b/migration/colo.c
> index ea7d1e9d4e..17b5afc6b5 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -870,6 +870,7 @@ void *colo_process_incoming_thread(void *opaque)
>      replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
> +        error_report_err(local_err);
>          goto out;
>      }
>  #else
> @@ -882,6 +883,7 @@ void *colo_process_incoming_thread(void *opaque)
>      colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
>                        &local_err);
>      if (local_err) {
> +        error_report_err(local_err);
>          goto out;
>      }
>

Could we arrange 'error_report_err' in 'out' label?
Like this:

if (local_err) {
    error_report_err(local_err);
}

Thanks,
Li Qiang



> --
> 2.18.2
>
>

