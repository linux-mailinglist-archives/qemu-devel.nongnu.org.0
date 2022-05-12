Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CD52533A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:09:31 +0200 (CEST)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCJd-0000tM-Or
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1npCBh-0003eP-9T
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1npCBf-0000i6-4f
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652374874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kf8tS6s78xruG2D5f4I1KBkJ1RGLCA0fYULE9PmMoNg=;
 b=YrDkbF1e1XB+zBLQvx6EE2iyXZ8SkeQ2stkHP+cvTEUznIIA/+twghBqqVRksOMCFXeX2v
 hz1BTorCr6nKZJ02HXhhxefJkdEBUC5my6Sgvvoc8ffZsqTSTIW0uCs4Kkckfo+XJmrZnd
 aiteYd2SDprU/vqDr3FiowakHvi0ZYE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-uckTV9WAOz-i-ESypAFEJA-1; Thu, 12 May 2022 13:01:11 -0400
X-MC-Unique: uckTV9WAOz-i-ESypAFEJA-1
Received: by mail-yb1-f199.google.com with SMTP id
 g26-20020a25b11a000000b0064984a4ffb7so5081787ybj.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kf8tS6s78xruG2D5f4I1KBkJ1RGLCA0fYULE9PmMoNg=;
 b=N6hwYOa6swCzu1tSRJpxrlWeYZ6hDSrAk+IA9xxokgfsRgpZja5BmS/N17Wv3VtCcA
 7tL+cWq/wkJqDCkI1YSPhvpJaHD88Y9OfpyZsbmJhM2x7jyiCbitBpoOMkyPzjOJcNL0
 fc5g5zydNQ/K+vsMhpG1MHyx8UoAem8v0SyiF4cq9Z/x6jHg3WWJbz5KWUK4fO/5fcWH
 3RgfWVrTQqD0TgRiR/ohxTugK+67on2XvGBNMzcFv17K4o+WOtW1NoWqUw2LdB09mTn9
 YBLR5oMO2EQIgSs6iLcXE85nrBm79W7Pu0/ZkMQ4g++LRNHz99Xx2aRdEbNMgKMF6eAD
 7msQ==
X-Gm-Message-State: AOAM531yZpIjz7VnFnWP5tYFjKnYhfg3I0UqrdarTJ0yExCBnRPiIacb
 usR0M0j7Xg3NTyeWTxOG61wLHNZpM1S2OtVID0aVtbiZzjBurhb6Kvp+PD12+JfUvcn8AbX1Uq/
 We1484D/OFWSz+Fd+IWXTFazNuEoeNR4=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr1122931ywn.33.1652374871090; 
 Thu, 12 May 2022 10:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGm1FPrwebN0j9d3G1ItoZK6kKz2pKoY6LDkVpHobdysOdRxHI5LvAFQxkldM87O/qB835/y6l0Kf3T75bNF4=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr1122900ywn.33.1652374870850; Thu, 12 May
 2022 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220512154909.331481-1-kkostiuk@redhat.com>
In-Reply-To: <20220512154909.331481-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 12 May 2022 19:00:58 +0200
Message-ID: <CAMxuvaw-HjLb5cLBR+bzjw9EK38ELs9sX4sgO4s5msPor7kMsA@mail.gmail.com>
Subject: Re: [PATCH] qga-vss: Use a proper function for free memory
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 5:49 PM Konstantin Kostiuk <kkostiuk@redhat.com> wr=
ote:
>
> volume_name_wchar is allocated by 'void* operator new [](long long unsign=
ed int)
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  qga/vss-win32/requester.cpp | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
> index 4513324dd2..b371affeab 100644
> --- a/qga/vss-win32/requester.cpp
> +++ b/qga/vss-win32/requester.cpp
> @@ -354,12 +354,12 @@ void requester_freeze(int *num_vols, void *mountpoi=
nts, ErrorSet *errset)
>              if (FAILED(hr)) {
>                  err_set(errset, hr, "failed to add %S to snapshot set",
>                          volume_name_wchar);
> -                delete volume_name_wchar;
> +                delete[] volume_name_wchar;
>                  goto out;
>              }
>              num_mount_points++;
>
> -            delete volume_name_wchar;
> +            delete[] volume_name_wchar;
>          }
>
>          if (num_mount_points =3D=3D 0) {
> --
> 2.25.1
>


