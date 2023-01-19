Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F36735B4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISIw-0001O5-4h; Thu, 19 Jan 2023 05:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pISIt-0001MZ-V1
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:37:56 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pISIs-0003fx-5X
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:37:55 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 207so1141285pfv.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ub49zk7ZF+rbPiYvH79nqwlF4uAqb7Qt1R8/Q6+FaCA=;
 b=wGss6cCsaHIzyb5ZyGh7aLsixZs2Id6wyMQD9IR/ROo872tTJYxhJRSusVAnZ341tM
 /uZOn9NKCUfI1rFjjFQxgdbavaS0dBU4aZYHMGwZ6uJYEHO+tUPpFGAXQkat+uPgcY+y
 hmyw2Ilqv+z8lUgRthWSml+PQmp0ACy+G12K+Jd/SjUgTCkMTYSU1WIrKiKdLmkoX81O
 Iqv0aAoAc1M9SqS7PYoDRCJxHxziPT6gKXRfYEd46ikj/1R9VuXWeYj48v3R2mK4Zao/
 mf8+XbqOV239n9MJeZy1hQa04cyeKCbeNNQiGNmZdwq9HmhQIS5I0XCiY/5eqid9OmVh
 HUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ub49zk7ZF+rbPiYvH79nqwlF4uAqb7Qt1R8/Q6+FaCA=;
 b=vZjEdh4Mp+VKZeJ3muV4HVnX+a5DOJomaJW5sfAb8yM7ZBSqAPOzMGRccdXZyt30tB
 tcZ4LYwmuH6xAll7AhaBhoU19+a5izWtEEObGomHJ5ByH01lEeCXvu5Wb+dFlSeLx77Y
 1Gukfyzqi/sv1vdki1zb85/xi8NaiVPpRyUyL2qk+jfhez2lECUPiCDDtogmfMWZeFbI
 29doUyNdJ0D8UKFHnk9VSnBIZGLyPD8XVgWgRdJgnQ2EFJ2fo8VdQglw11APFe4Esj1d
 3yOAcYmErILO5zIg64CPdKLggEyXY9QQbrue/PzEMAO5Q4y6/t6pCcbTClefTM8WtoHH
 kjSw==
X-Gm-Message-State: AFqh2kpSVG6Ajby62Gc/CEwhfqZZrlKXkF4a3lC3KBMMWG7QysiPiuJg
 /9+CKCpu1aO21s+DUoSt6I94IIJRBLW3gRSH0RQbhg==
X-Google-Smtp-Source: AMrXdXuWLHT9XQrhHkfaekv20LvGitTbx0K+fQugFjterumxVvoJQSDXAF6pjoPr9+O3dDGusKmR0ZaodfeFW6Gdi+c=
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr1023406pfb.26.1674124672628; Thu, 19
 Jan 2023 02:37:52 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
 <Y8kXhd2EcRU2QxVC@redhat.com>
 <77e378b5-09a1-c80f-e2c0-c010f26b2a44@weilnetz.de>
In-Reply-To: <77e378b5-09a1-c80f-e2c0-c010f26b2a44@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 10:37:41 +0000
Message-ID: <CAFEAcA9s+m7BtCECV9jL2yxgpXZKP6DFrqpo_U-+dAM=B3LbeA@mail.gmail.com>
Subject: Re: Announcement of aborting HAXM maintenance
To: Stefan Weil <stefan.weil@weilnetz.de>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Wang, Wenchao" <wenchao.wang@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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

On Thu, 19 Jan 2023 at 10:34, Stefan Weil via <qemu-devel@nongnu.org> wrote=
:
>
> Am 19.01.23 um 11:12 schrieb Daniel P. Berrang=C3=A9:
> > On Thu, Jan 19, 2023 at 03:56:04AM +0000, Wang, Wenchao wrote:
> >> Hi, Philippe,
> >>
> >> Intel decided to abort the development of HAXM and the maintenance
> >> of its QEMU part. Should we submit a patch to mark the Guest CPU
> >> Cores (HAXM) status as Orphan and remove the maintainers from the
> >> corresponding list? Meanwhile, should the code enabling HAX in QEMU
> >> once committed by the community be retained?
> >
> > If you no longer intend to work on QEMU bits related to HAXM, then
> > yes, you should send a patch for the MAINTAINERS file to remove you
> > name and mark it as "Orphan" status.
> >
> > We would not normally delete code from QEMU, merely because it has
> > been orphaned. If it is still known to work then we would retain
> > it indefinitely, unless some compelling reason arises to drop it.
> > This gives time for any potential users to adjust their plans,
> > and/or opportunity for other interested people to take over the
> > maintenance role.
>
> HAXM will not only be no longer maintained in QEMU, but also the
> necessary framework for macOS and Windows will be retired. See
> https://github.com/intel/haxm#status on their GitHub page. As stated
> there, macOS provides HVF which can be used instead of HAXM, and Windows
> users can use WHPX. Both HVF and WHPX are supported by QEMU. As far as I
> know HAXM could only provide a limited RAM size (2 GiB?). Maybe it still
> has more deficits. And unmaintained HAXM drivers for macOS and Windows
> might be a security risk, too. It is also not clear whether the last
> downloads of those drivers will be available in the future.
>
> Therefore I'd prefer to remove the whole HAXM code in QEMU soon, even in
> a minor update for this special case.

This sounds like an argument for putting it through our usual
deprecate-and-drop lifecycle.

thanks
-- PMM

