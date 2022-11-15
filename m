Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E86297E4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:01:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouucB-0005zu-Si; Tue, 15 Nov 2022 07:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ouubz-0005xh-JM; Tue, 15 Nov 2022 07:00:21 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ouubh-0001RX-Kt; Tue, 15 Nov 2022 07:00:17 -0500
Received: by mail-ej1-x634.google.com with SMTP id ft34so35370464ejc.12;
 Tue, 15 Nov 2022 04:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YXXH4jAat53xfCfYxLFI7um3ixpxE+03p6jkKw/M/Hw=;
 b=Dt7Gssbg9/adHcHmVLrvxMhTjGDQlt4SfL72itUYqNLjFDHAlcR6XWwOT1DRbSbpVs
 BcqpOZxb4gwoEw+iuS1FmfQop3QlbFHlDDYULOsyfbddrOZIwI5KbRaB41j1PESg2RC6
 Are8i2HIwczrYDjJta2akr1g+ZzoJpSMZF0Uu5GJxiWvHptjjEz6qwNO1GQCSKIz95r3
 RBFSG7co2z5iYtAaK4Mm3dG7gewBQEYXttc0UpAY1mYDRmHATA6T4DdKwZLBq0dUfcl+
 fgAm47GKMtcaZlXGwBe/HelOSJ5PoTve9xJq4JSqgnoWjlrmIz/96OfaQjGIbmIoEPJs
 YY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXXH4jAat53xfCfYxLFI7um3ixpxE+03p6jkKw/M/Hw=;
 b=N0pHCbJKypW3dGlbx12PeTJ98486o1t0lpRWB2ftU1vWz1Y+n64CQYdQ6FQndeWYBB
 +wb3OwiSb1klUSNKzBsaJyUdoG70JwDA7jdD1xPwaBXlIB08kK1ZqhwPthz3D9SixOdZ
 GMhVZ0pXRioc4GDjqvRY412ePJNq0a09B8okqmp6PZBYGHweuQnTtwXU3Df1YSlqAFy8
 7PsRdV8CIGjS61pCcU0wZ54LUirf6B/z1nt6ZQ93Ohv62j1nNqfy3F/F7Nlfa6L3cf6f
 qeUdmjofN5N2d6N4L3PTvcxTFLFhhMuVYuZDiPwq3aCc5+C3kgfBjUtYNdfsjzNvNg4i
 aFYQ==
X-Gm-Message-State: ANoB5pkIvmpjRlQHrGVL6S1f2lQYLO5PR30QYMwGgAKVnOmEV4LFKyb4
 PSkrtq0G2UhgoWtwRt8K0mqTTf3/weevVw8iR7g=
X-Google-Smtp-Source: AA0mqf7rpfdpfUEs4HjhtY2xydNYNA+RqQAJC5xRUdsrhglsZPw6EGWsjYrYGrfrlVMf5dMUzf32JvlZJF8vR4eoxUo=
X-Received: by 2002:a17:906:66da:b0:7a5:f8a5:6f84 with SMTP id
 k26-20020a17090666da00b007a5f8a56f84mr13038933ejp.569.1668513599189; Tue, 15
 Nov 2022 03:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20221026084836.1819572-1-oro@il.ibm.com>
 <CAOi1vP8X6xeuYmPwTS=LivU=XeCM-WDERrCOAySWJauvsOs_iA@mail.gmail.com>
 <MN2PR15MB34884E9308FA492030A81E3A8A029@MN2PR15MB3488.namprd15.prod.outlook.com>
In-Reply-To: <MN2PR15MB34884E9308FA492030A81E3A8A029@MN2PR15MB3488.namprd15.prod.outlook.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 15 Nov 2022 12:59:47 +0100
Message-ID: <CAOi1vP8eddYYCCuJrPOn_10Du9rG1eAiGDLZtdsaaRFepq8dsQ@mail.gmail.com>
Subject: Re: [PATCH v1] block/rbd: Add support for layered encryption
To: Or Ozeri <ORO@il.ibm.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, 
 Danny Harnik <DANNYH@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Nov 13, 2022 at 11:16 AM Or Ozeri <ORO@il.ibm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ilya Dryomov <idryomov@gmail.com>
> > Sent: 11 November 2022 15:01
> > To: Or Ozeri <ORO@il.ibm.com>
> > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org; Danny Harnik
> > <DANNYH@il.ibm.com>
> > Subject: [EXTERNAL] Re: [PATCH v1] block/rbd: Add support for layered
> > encryption
> >
> > I don't understand the need for this char* array.  Is there a problem with
> > putting the blob directly into luks_all_opts->passphrase just like the size is
> > put into luks_all_opts->passphrase_size?
> >
>
> luks_all_opts->passphrase has a const modifier.

Hi Or,

That's really not a reason to make a dynamic memory allocation.  You
can just cast that const away but I suspect that the underlying issue
is that a const is missing somewhere else.  At the end of the day, QEMU
allocates a buffer for the passphrase when it's fetched via the secret
API -- that pointer should assign to const char* just fine.

Thanks,

                Ilya

