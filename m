Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3647D302640
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:24:58 +0100 (CET)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42nY-00051W-QK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1l42lu-0004Rh-LI
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1l42lq-0000Mk-KJ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611584588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U1o+oT8RJDswMfyeJwZBvSXnQmZeyPPxqGUnMuLaY18=;
 b=IjZrXnqCIOkHoaHEByHQfOd+e9IhfE/fP8U9D6Xpg+7PUJdCKCQTbXeT73Zz+HaiRgyMNO
 K/QCgXV/FixMX7oMNe+JNl+waN3LREtBLVgpTYRl0l84Hw88TESK4GJkOc+zg/OB9x1Csf
 S59rKt+rErpWzdizCq6S+D38J+dJZSk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-gsZ-ghZoN9msxnx7Cnnvhw-1; Mon, 25 Jan 2021 09:23:07 -0500
X-MC-Unique: gsZ-ghZoN9msxnx7Cnnvhw-1
Received: by mail-ed1-f72.google.com with SMTP id n8so7480469edo.19
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U1o+oT8RJDswMfyeJwZBvSXnQmZeyPPxqGUnMuLaY18=;
 b=tYJVKkixN786JLCzdBMi13rns2bdPAcpDrLZo1hHlwDseQANWWxkQDzg0I9/uz5j2B
 v12Ey3JhgxngvD8cWzVz6mZdqHqtNXkyfi8OWHdhmjNNo+WoLqc9xgIhqUgVh2d9aca0
 VEzINIXnh9b90eCKnDgb7z1bfSQTLBeh+jNKcRq2c1vt+psSm1hPzyI32ZImSLS0HyTm
 x/ZRC7CIHiy1cGjBe9LK5dUVHzGuQsRS9KEy2hPt1uggNxp6CnE3karLxohY8VykLQP3
 3Pxs/ca8i6fmFOoNXin07JNTwlyhQRbyJFeoAvlx4C40xeJte+7ypJLyL756VXryltvE
 XoRQ==
X-Gm-Message-State: AOAM532GZYf3sQYIfL54EaTYHMJdfz6/5QOSCTwUQbj7G/dxtHaRh7k1
 NQ7oXrbbKk8edr27NiqjkExkwO3HP3hiFlY7oaOOV7H1NDyuEN74g0+Z5emlh891APuSbgDRQ6N
 xY5gw5LngfuF5eLX6UIaHYt6XTUxfAKU=
X-Received: by 2002:a05:6402:184b:: with SMTP id
 v11mr663417edy.47.1611584585271; 
 Mon, 25 Jan 2021 06:23:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsmtF+aLzl1d6sdNaoWaxCl0Gq1Bi/+6/d4x2E80f9vwDtB1rX1TJHJAr7rLZ1teWfSA7EfRTArXX4c/CLHz8=
X-Received: by 2002:a05:6402:184b:: with SMTP id
 v11mr663405edy.47.1611584585107; 
 Mon, 25 Jan 2021 06:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20201224175441.67538-1-mcascell@redhat.com>
In-Reply-To: <20201224175441.67538-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 25 Jan 2021 15:22:54 +0100
Message-ID: <CAA8xKjWf8HBj6qgZ8iJTW0hbU8D6QKcycxT-hBo8=HG3TD36NQ@mail.gmail.com>
Subject: Re: [PATCH] hw/scsi/megasas: check for NULL frame in
 megasas_command_cancelled()
To: QEMU Developers <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, hare@suse.com, cwmyung@snu.ac.kr,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Any updates on this little patch? Please find below a reproducer for
this bug (thanks Alexander):
https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg02567.html

Thank you,

On Thu, Dec 24, 2020 at 6:55 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> Ensure that 'cmd->frame' is not NULL before accessing the 'header' field.
> This check prevents a potential NULL pointer dereference issue.
>
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1910346
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> ---
>  hw/scsi/megasas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 1a5fc5857d..77510e120c 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1893,7 +1893,7 @@ static void megasas_command_cancelled(SCSIRequest *req)
>  {
>      MegasasCmd *cmd = req->hba_private;
>
> -    if (!cmd) {
> +    if (!cmd || !cmd->frame) {
>          return;
>      }
>      cmd->frame->header.cmd_status = MFI_STAT_SCSI_IO_FAILED;
> --
> 2.29.2
>


-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


