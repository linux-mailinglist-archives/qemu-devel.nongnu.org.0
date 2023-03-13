Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284E6B7EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:04:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbla4-0004rM-7V; Mon, 13 Mar 2023 13:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pblZz-0004lG-RV
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:03:24 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pblZy-0001xr-9T
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:03:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id d13so2684978pjh.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 10:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678727000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9A4VG1yBsYex5nOTA4gFK3TUgwE2wOw9iF2IMNEylVY=;
 b=JHZBBW6DDm+xsN/yzcjHr1we4dIeB9+QjNbJAf+NyWRw2hzNzdlzHR6MWC89l+3UVl
 rrOaE/rv8E0mWez6QqRWd78HYdXIxngzqZlWrs2Cl1dIb5rq1jpgrNXtYT3tEWcQAZEf
 3MNeXzxc1ARpZU3FNJXW5DFnA5UNON8zbQA77VIEckR5tN65/7dZ0AtB6zn/VAC7nnFV
 XgpJhDfGGPPcui1h1rxTvn4Ryauc2ggt7OXQ8v8/Kv7O/riv3jnS2+Z1SjAXPXAT1Dvs
 nbxjdEBPyT3iOtng9o0lRutC3V51NAHk9iRa++ze2Z2AZrgtpl7iLLhyhk1gD7ZJPhhh
 LZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678727000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9A4VG1yBsYex5nOTA4gFK3TUgwE2wOw9iF2IMNEylVY=;
 b=ELrsAJQTLM52FcmbHsxq984Uad9RG0glrCwJY2spHHaXv5/2KuxgS4EgxIXPtaXJgi
 z2LVCuAcuQshTGtck9Z1d4vbOwewGoG9IQvTBHAgVy2kyg6fzNH5iTsWHiov3mD0OmuY
 EX/JXb7NZ0CHt4oqtuxoHuIk7aaHDBsuY5wEhB/iwqoZKaec+CktTJJ7UYvihDhx+OmQ
 B3q3RIXwqvCVmkruGg/txx7mqE/8YfncYKifSjJjLc99soBKG2Kv04LrrsZ1hVSCO/Go
 FpjmqtUqkSYYOlmGmYZ4e2CYmHPIAZcS9o+fLgXkNhG8ZVBoqqnQ1qew6txQYWWYOECf
 TwDw==
X-Gm-Message-State: AO0yUKVSnehu52KYm160yK15VskJIzA+fSeSXMOaYkz6AgCiOy5EBhFV
 0bMAiI6+EIBWK8TYx4HzyZXmJkZxjaDmrtd9Oz4ePQ==
X-Google-Smtp-Source: AK7set+/DX2wljqRUN7vSYNOtpgXecZrTGpExHPS/JDlLBLjyUy4riZFdDctw/rkb/angUHA0q7G+nWYJ8x6dl1cO5s=
X-Received: by 2002:a17:90a:dd86:b0:233:be3d:8a42 with SMTP id
 l6-20020a17090add8600b00233be3d8a42mr12520900pjv.0.1678727000188; Mon, 13 Mar
 2023 10:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
 <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
In-Reply-To: <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 17:03:08 +0000
Message-ID: <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 13 Mar 2023 at 17:00, Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/03/2023 11.31, Alex Benn=C3=A9e wrote:
> > The kerneldoc processor complains about the mismatched variable name.
> > Fix it.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   include/exec/memory.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 6fa0b071f0..15ade918ba 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier=
 *notifier,
> >    *
> >    * @notifier: the notifier to be notified
> >    */
> > -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> > +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier)=
;
>
> I also keep running into this problem ... I wonder whether we should run
> sphinx with "-W" to turn warnings into errors when configure has been run
> with --enable-werror ...?

We certainly try to do that: docs/meson.build says:

  # If we're making warnings fatal, apply this to Sphinx runs as well
  if get_option('werror')
    SPHINX_ARGS +=3D [ '-W' ]
  endif

Has that broken ?

-- PMM

