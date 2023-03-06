Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27FE6ABBAA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:19:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7uq-0001qG-Fd; Mon, 06 Mar 2023 05:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ7uo-0001q4-7n
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:17:58 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ7um-0002ri-Gt
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:17:57 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i10so9695997plr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678097875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01v1k6X+RW1kiu7bg/77FBtj70UuzkF352GwDMIN58o=;
 b=enO8zLPB/Ft8rq7mSxjL9vhjw96F37gGwfhCh4Apienmx2ImasOrv48o2iyOc2PUGZ
 YbiW6SyKyMWHpVSAkuT6porlHjefAUvUU8zMyMq1aiHeAc3zO5tgnBNJQIXIo0wf/5Yk
 rPImCyNk7Q7udeHWTyoFbLbxhlnOY97k7Vfzockg0e2NMvLWXni4qsddGcGnAicCONzB
 hTWPs0UpDtKEWlIhkfFfpv06uGDxQ0qurcfMmjhgM16/pGnROBF7ZkuTrJSJsLk+TGku
 jDfNhTmVWoBCYa1OWR4H4MjG407uitzxzUODRezg0mxVNfW/HRAt8IjEODelitvlF16Y
 lBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678097875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01v1k6X+RW1kiu7bg/77FBtj70UuzkF352GwDMIN58o=;
 b=Mzh0c7Pg2hqO61CgzLlrezrGMLI6qcxa4Bx6K9W/HSq2Swqws5NWTLQBRgCIeA+6Ie
 ZrkWObF1gbeXkANoeWn5S8KmXuXIXCmij5ijsTVbPREhLP3d3zG8fiF3GQ1KC8lwQ0U3
 p/q94cPDtq24oJGjiVC00UH1MNC2dMLJEQmJ9pUEyH19BP4q6bIlJBWiYcoxvWblY1cM
 w1pHXnIrM88TVqFJbGkXxHnlMfxOEE6tNVgxWx+Mj5Q7kyef3dDJheNMZl7BAEKb24J6
 y9GcpEDUUH5FwhU/fjf/ra48ftjccBRqdN0VFH6UIshv/CCc/py5+3umaH2TCuKNhngZ
 ryzA==
X-Gm-Message-State: AO0yUKXJDUrBct4/WaSPfQ4s1ih/X/7EwcrdLSobzYV5FJcdpDZiX5UN
 QCPaKKR8gA2BM36h3gd0W5nUwqNbwNAvWV5DTC6xKQ==
X-Google-Smtp-Source: AK7set9nvTr9rWkp8Eg1W870DKzDBaBZjRmCbAoX7uuZNp79iCXSghg1Hfz7FtgIoCLfS9eP1kWFfM4pREJWZ4ibBFU=
X-Received: by 2002:a17:90a:7783:b0:237:9029:c29b with SMTP id
 v3-20020a17090a778300b002379029c29bmr3852889pjk.0.1678097874813; Mon, 06 Mar
 2023 02:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
In-Reply-To: <ZAW7DcpRDcGF2VQx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 10:17:43 +0000
Message-ID: <CAFEAcA8aKCw28yO6OMDiYm94PTJcmY7MCj_qdFhUCppwpOD4+g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Mon, 6 Mar 2023 at 10:06, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Mar 02, 2023 at 05:18:44PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Meson "wrap" is a mechanism to build dependencies that doesn't rely on =
git
> > submodules and integrate external dependencies as subproject()s.
> >
> > This offers developpers a simpler way to build QEMU with missing system
> > dependencies (ex, libslirp in my case), but also simplify the fallback =
build
> > definition of dtc/libfdt.
>
> Do we actually need this facility though ? We've already determined
> that every platform we need has libslirp now, and IIUC Thomas determined
> recently that dtc is also available everywhere we need it to be.
>
> So why would we want to continue to special case these two libraries,
> out of all the many many many other libraries we also have deps on.

Also, it looks like the wrap mechanism is still basically "we have
a file that indicates what the external git URL of the dependency
is and specifies a commit hash to use", it's just changing the
mechanism we use to get the source from git submodules to this
new thing. Maybe the new thing really is better -- certainly
git submodules are absolutely awful -- but we should have one
mechanism, not two.

thanks
-- PMM

