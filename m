Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56B3128ED
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:28:43 +0100 (CET)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wI6-0006en-FK
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1l8wFy-0005p9-2O
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:26:30 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:40994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1l8wFw-0001p3-5P
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:26:29 -0500
Received: by mail-oi1-x22f.google.com with SMTP id v193so8698996oie.8
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z8TnCfwWB/Pn8o25/tZeClrimo0fAJ4HqfwCy/f3Ohs=;
 b=Hf2BpnKYRi/QcjJh+45ADuhIe+rcNeFNYazvHsJGhaC7T38NSdtz1umLQzEq0tvruZ
 ir9ZA0Kql2MUgC8pAtMkO6vJmW+vC98ihhjgGlji45eArBBVdV+QaKSSNO7CI0V6VGDT
 hI94XOmThBLtWa/xQV/fVKwTRHfvRgxvgIUOwOix/dU3rCJ4He2aOf1K9gWJSdMGb2Zv
 6bsDNyoJzeIt4bgNvpSFaFVcXUkm+4+G8oMzgokx3t485SsaRfIluY8qZLExbl5LvtbE
 Uhgi/5VvYrnLPx2ddxdDgINImCGX9n12R8nSvvmkVTQiBrkU79PQuwR+hmQ9PsiCnwNR
 yfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z8TnCfwWB/Pn8o25/tZeClrimo0fAJ4HqfwCy/f3Ohs=;
 b=s7ALahfAfddaCAJzbkgM6o5+BLeERHzkWBIXuUDA+IS6szjmxejsntay5K5hh2vQca
 TolCu76P1hENfvHv9Q19eHf0eEEPg8Zb7JDVMw4YSxiacCOmsf8bq893S6G44pmAQUFP
 0nK3UKbs2M6l1grChL8KSR01waxFYkFUlF/ujAiHp3wwMC81EbUonSXoRg7AtzOlz7AN
 6E/bF+i2uLme+06ZxCq/SGb607PBq2DuYU0qCpsxSFRaMg+JXomwPLTSNFY3xEFOjroY
 Wj9n1S+eAKZ7QBv70XDR0EMykyshj6D8Fm9pWVjLQnnguT4raAkxY1hdK/rxKhDqa7UD
 /e5Q==
X-Gm-Message-State: AOAM530s722Kbx4ge/6OolBnviiP+oxfu0DIQ8TsPn0xGqKseVRPsjs3
 DIj2OkEJi2mw+x6dSs0UuXgGbrZgBWzIXuRUub0=
X-Google-Smtp-Source: ABdhPJyr6sCXxNW7RrROqgVO/WlsdTuAatzFC3wjNOatVo4SgdQXYDDhAoNIt/8s3a5vVsEp2J1Cd6rVwHc6/Pp9SVA=
X-Received: by 2002:aca:bf0a:: with SMTP id p10mr6642185oif.97.1612751186435; 
 Sun, 07 Feb 2021 18:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20210202132103.1096654-1-ppandit@redhat.com>
In-Reply-To: <20210202132103.1096654-1-ppandit@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 8 Feb 2021 10:25:50 +0800
Message-ID: <CAKXe6S+keMat80m59NL+Sfdq9idwwjwECVGOrahErEQ7apD-bw@mail.gmail.com>
Subject: Re: [PATCH] scsi: mptsas: dequeue request object in case of an error
 (CVE-2021-3392)
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x22f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>, QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

P J P <ppandit@redhat.com> =E4=BA=8E2021=E5=B9=B42=E6=9C=882=E6=97=A5=E5=91=
=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:23=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
> the Megaraid emulator appends new MPTSASRequest object 'req' to
> the 's->pending' queue. In case of an error, this same object gets
> dequeued in mptsas_free_request() only if SCSIRequest object
> 'req->sreq' is initialised. This may lead to a use-after-free issue.
> Unconditionally dequeue 'req' object from 's->pending' to avoid it.
>
> Fixes: CVE-2021-3392
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914236
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/scsi/mptsas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index f86616544b..adff5b0bf2 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -257,8 +257,8 @@ static void mptsas_free_request(MPTSASRequest *req)
>          req->sreq->hba_private =3D NULL;
>          scsi_req_unref(req->sreq);
>          req->sreq =3D NULL;
> -        QTAILQ_REMOVE(&s->pending, req, next);
>      }
> +    QTAILQ_REMOVE(&s->pending, req, next);
>      qemu_sglist_destroy(&req->qsg);
>      g_free(req);
>  }
> --
> 2.29.2
>
>

