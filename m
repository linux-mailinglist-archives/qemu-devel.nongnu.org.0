Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D074862D5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:20:23 +0100 (CET)
Received: from localhost ([::1]:39580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Psc-0005OO-Vn
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:20:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1n5Pqg-0002yH-EO
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:18:22 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1n5Pqe-0007nm-Dz
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:18:22 -0500
Received: by mail-wr1-f42.google.com with SMTP id i22so3739132wrb.13
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 02:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kjlg8vOz4YBxvAulN8cp+hioY3CF79TsMDMAIGQyl0k=;
 b=n6VeTvqdvjKl5MVdYsLwiNKyJLJ2FdsiuMrmB+jHGC44vxgpoZU+vyWH27R5q3CPHg
 /kmKf0C1ZMvuP21bRqQlniKHm5niJKdGmwj5QQnlu/T+rcyX8lkD7f5LfdGbnWqLr3G8
 +xLjoBDkuBwKFPR7/Bf5K2/rNLPNFLngnMSph/IXYT6GCOgktHlm9VdlgnJ5wpxdwwzO
 dS9uOUehoVOrXECpodYqoPu71/BjcNCPkxh+inJjwNIQivjQsUQ8uJDpU2edmBMirjDr
 WifP+uGMKRqxcqJhGSxA7h/KF3gveExFGwG9HbHsMd89z38iZvUTxvk1s3EIw3JJMX8V
 Vf9w==
X-Gm-Message-State: AOAM533ITsvsJczprDhdXrH53ldW50+sStKwAvlGZ+DyLH5YnVtkWb+V
 OPHqux4GkdcFLcjcoe5kaWY=
X-Google-Smtp-Source: ABdhPJymIAmZ9cUkD2VmZ2hGLS8QPmpvfFJTzOIxr/ZHP34eo3ZQ6A+8khDC1USKLmkBM2ATAqbGTQ==
X-Received: by 2002:a5d:40d0:: with SMTP id b16mr46753846wrq.709.1641464298287; 
 Thu, 06 Jan 2022 02:18:18 -0800 (PST)
Received: from localhost (tmo-098-68.customers.d1-online.com. [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id
 u14sm1601582wrf.39.2022.01.06.02.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 02:18:17 -0800 (PST)
Date: Thu, 6 Jan 2022 11:18:11 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Volker =?UTF-8?B?UsO8bWVsaW4=?= <volker.ruemelin@t-online.de>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 01/15] audio: replace open-coded buffer arithmetic
Message-ID: <20220106111718.0ec25383@tuxfamily.org>
In-Reply-To: <20220106092332.7223-1-volker.ruemelin@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <20220106092332.7223-1-volker.ruemelin@t-online.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.42; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Thu,  6 Jan 2022 10:23:18 +0100
schrieb Volker R=C3=BCmelin <volker.ruemelin@t-online.de>:

> From: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>=20
> Replace open-coded buffer arithmetic with the available function
> audio_ring_dist(). Because the name audio_ring_dist implies it
> calculates the distance between two points, define the alias
> function name audio_ring_posb. That's the position in backward
> direction of a given point at a given distance.
>=20
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  audio/audio.c     | 25 +++++++------------------
>  audio/audio_int.h |  2 ++
>  audio/coreaudio.c | 10 ++++------
>  audio/sdlaudio.c  | 11 +++++------
>  4 files changed, 18 insertions(+), 30 deletions(-)
[...]
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 428a091d05..928d8e107e 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -266,6 +266,8 @@ static inline size_t audio_ring_dist(size_t dst,
> size_t src, size_t len) return (dst >=3D src) ? (dst - src) : (len -
> src + dst); }
> =20
> +#define audio_ring_posb(pos, dist, len) audio_ring_dist(pos, dist,
> len)

I think this will be quite incomprehensible for people reading the
source code later (without seeing your commit message above). Thus I'd
prefer to directly use audio_ring_dist() everywhere instead. But in
case you insist on this macro, please add at least a comment in front
of it for explanation.

 Thomas

