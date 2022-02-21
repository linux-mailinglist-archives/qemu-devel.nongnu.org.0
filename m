Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A74BD6C1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 08:15:22 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM2um-0004so-Mv
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 02:15:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nM2rr-0003H6-B7
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:12:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nM2rp-00077x-Bs
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645427536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZC5SfL83wXeYpTuy5adQCnP0atXaPGvbUoFVXmslJag=;
 b=Vrv8WakE5fg6yuIjfKCAnlEvgcwpUEOsPwilAQjfAvkJpavJmPPtKlyLlkx6wayG4yHacb
 sPYGM3wXwNg9Q7bRUltbF6jvDD0itttaKUhL4lLNmIWw7RNdMg2kpbwt/Ow4xsqvlsj2kd
 /EC4FzBAbAPo7C125DwyzLfYMIWjNEI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-HTf4fex4Of2VCkocBsNE3A-1; Mon, 21 Feb 2022 02:12:12 -0500
X-MC-Unique: HTf4fex4Of2VCkocBsNE3A-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn20-20020a1709070d1400b006cf1fcb4c8dso4283559ejc.12
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 23:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZC5SfL83wXeYpTuy5adQCnP0atXaPGvbUoFVXmslJag=;
 b=rV7fAbJ+9L+1ZPcIJBiTtP2sl/altITQYJAws/p4TzGHrohA1qIEsUGPtjJ412cYMI
 9+Rx/nRpGXiAflVlIEny/yKQEtGYsx0XTdxx9wBqP4srs50sywqDeKtaHWyOA3X0Inlh
 INLBvsznC7zafOm/wmxZvuK01UsOvDjoeVGnR70HLKg2DOeFwYttsKIi5iCJJ5YHo/1E
 L2MagkvithVnnmoHEAxH9pSESwuLkLEyr1pEQSFQlc0Fkw7RE3t+B61sqCUKZme5fwM5
 /87oU+xdLybYVaaxVQlsxhYYj0DAFOuaL/qrS70K7dpyAj7RmeyTlSa7vk3q8uyqoDbQ
 AQHw==
X-Gm-Message-State: AOAM530tV6P2okqkT08gN3PaOfMom8oQg7XEQkIaCaM9FS8Q1BIahtQ8
 ANvzRnaHWHwy2OhimN3Ddo5JZ772o7PxTTWDoRbeL1QlHlk8w0uzWJMP8o2O5IBtZYG2iDBApZ3
 +Qean9WUF3gLaSJ8=
X-Received: by 2002:a17:907:7618:b0:6cf:5756:26c4 with SMTP id
 jx24-20020a170907761800b006cf575626c4mr14613431ejc.492.1645427530968; 
 Sun, 20 Feb 2022 23:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqfDLKL6IfjZBNkQiESZqqpKUKurovVhU99D+m8RlMV1OVXdRfTNfgC8elydExSP07u6Hgeg==
X-Received: by 2002:a17:907:7618:b0:6cf:5756:26c4 with SMTP id
 jx24-20020a170907761800b006cf575626c4mr14613425ejc.492.1645427530779; 
 Sun, 20 Feb 2022 23:12:10 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id ci16sm4851238ejb.128.2022.02.20.23.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:12:10 -0800 (PST)
Date: Mon, 21 Feb 2022 08:12:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 2/3] hw/smbios: fix table memory corruption with
 large memory vms
Message-ID: <20220221081209.4e12db9a@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2202171900100.294420@anisinha-lenovo>
References: <20220214141237.47946-1-ani@anisinha.ca>
 <20220214141237.47946-3-ani@anisinha.ca>
 <20220217095430.38d2b6b7@redhat.com>
 <alpine.DEB.2.22.394.2202171900100.294420@anisinha-lenovo>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 19:02:05 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Thu, 17 Feb 2022, Igor Mammedov wrote:
>=20
> > On Mon, 14 Feb 2022 19:42:35 +0530 =20
>=20
> > >
> > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2023977 =20
> > s/buglink/Resolves/
> > =20
>=20
> OK I am curious about this one.
>=20
> Per https://www.qemu.org/docs/master/devel/submitting-a-patch.html ,
>=20
> If your patch fixes a bug in the gitlab bug tracker, please add a line
> with =E2=80=9CResolves: <URL-of-the-bug>=E2=80=9D to the commit message, =
too. Gitlab can
> close bugs automatically once commits with the =E2=80=9CResolved:=E2=80=
=9D keyword get
> merged into the master branch of the project. And if your patch addresses
> a bug in another public bug tracker, you can also use a line with
> =E2=80=9CBuglink: <URL-of-the-bug>=E2=80=9D for reference here, too.
>=20
> So I considered redhar BZ as a public bug tracker as well. Does the BZ
> also automatically close bugs when we use "Resolves:"? Should we update
> the instructions here?

I might have been wrong suggesting "Resolves" tag, it will/should not affec=
t bugzilla.
Looking at history, shows a zoo of used tags in bugzilla case,
so I'd guess Buglink is fine as any other.


