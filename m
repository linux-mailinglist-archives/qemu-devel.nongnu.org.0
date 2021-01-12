Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B92F3242
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:55:14 +0100 (CET)
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzK8f-0001QT-H9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kzK76-0000YX-2w
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:53:36 -0500
Received: from rev.ng ([5.9.113.41]:47543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kzK74-0008Sw-FX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qJ99KOtn4ebVRr9T4NuPJkP59V5v72M8OMPvAiI9nrk=; b=hzhyQiV+7tGtmgGMPRICXKRlJc
 PPnbm21agEL75nSUx6GIy7or3uRvkYqYbYHnH6WEXt6a2B94H68BdUhFFtpxuakK6CPArlKvtEXAN
 oc26ej9iR5p6raLB6bH368ocI2IrI0oVMnNDVeBnnmtpM/gWChkVDf4R5sdW83IbrJw4=;
Date: Tue, 12 Jan 2021 14:53:19 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v6 34/35] Auto-import Docker support files
Message-ID: <20210112145319.1c9440a9@orange>
In-Reply-To: <874kjmnz71.fsf@linaro.org>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-35-git-send-email-tsimpson@quicinc.com>
 <874kjmnz71.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Alessandro Di Federico <ale@rev.ng>
From: Alessandro Di Federico via <qemu-devel@nongnu.org>

On Tue, 12 Jan 2021 11:58:30 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> > -            for filename in args.extra_files or []:
> > +            extra_files =3D args.extra_files or []
> > +            extra_files +=3D glob(basename + ".*")
> > +            for filename in extra_files: =20
>=20
> Hmm not so sure about this magic. What's wrong with the existing
> --extra-files mechanism?=20

I'd be OK with using that, but how can I automate it?

It is my understanding that `--extra-files` is only set by through the
EXTRA_FILES environment variable. Therefore the user should do
something like this:

    make check-tcg \
        DOCKER_IMAGE=3Ddebian-hexagon-cross \
        DOCKER_CROSS_CC_GUEST=3Dhexagon-unknown-linux-musl-clang \
        EXTRA_FILES=3D"..."

Or am I missing some part of how this works?

--=20
Alessandro Di Federico
rev.ng

