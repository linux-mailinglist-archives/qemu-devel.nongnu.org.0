Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9284DC9D8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:27:11 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs1u-0007Zb-Rp
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:27:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUrzf-00060w-Ht
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUrzb-0002Mh-SL
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647530687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5MX9OWuCHaQXKs3vD2jcWvWZgSMMWbrvyrUOuS9FMU=;
 b=cioOMwjUl6ZMQpAHE1gC055lSgPrGLye2TrhRJJY3KPjid9dLSGJacjGPBfRxjDChG5raW
 2DfgmN1CtFQnnJ60EQYENAxyBTiEwOV3J7I9A8lCK1aTQCXM5goZRCLTr7CvyeNCoek4za
 0PZDfaYAEhHfJ4k4ubsGksh4CN4EKfg=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-bZVvgO3HOXqphu0Rhei8nA-1; Thu, 17 Mar 2022 11:24:45 -0400
X-MC-Unique: bZVvgO3HOXqphu0Rhei8nA-1
Received: by mail-ua1-f70.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so2594344uaa.1
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C5MX9OWuCHaQXKs3vD2jcWvWZgSMMWbrvyrUOuS9FMU=;
 b=p4BW3od96u6hfcrOZkoqdt9zKcH7PlvynkyaS2Fcztg37gxKe3v0tW2Gek7IG7MLe9
 I3raosNehXNXA26/6eCWGXyZ2IC9zF6hkhjJzHA7DMN/n3zDwax7b10YmCbkod1ZnBWH
 jX2AA5TzoGfUVEWslsFOHqxZYi4NNcQxuSlOyraUKCsw4DoU6uq/rWYxgIYy710ceuAV
 EaSbVBJiw0Wn1VZ4YFoP5IAHtxPupg9IGhJkHI5P1OU32DOqOz15DWqvwikhKaVAC5q+
 IsHWbhzt7gXpsJi2GceAAqDNgakhAxKsec2zl7X3sewmSHx7q64L7IqIRF+aI2Ei7aPG
 sYtA==
X-Gm-Message-State: AOAM530AjqNegJfcOnD8c2e3iv2ghJvDuoBSsetNAWmUKIhBMFzA9RbR
 s/pewj/3VnAhMbkF+xoa6MhctJikF7Y72gIGJKYEAjJZf5wlt/5pq/KLJyfpa28EpiL6bPiBSNu
 YE5IaA0NJ8EcmucrMCvsI/yNWrp1M7/4=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1786201vsx.61.1647530685314; 
 Thu, 17 Mar 2022 08:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNudevpAkUMdl8P0gsP69N+QfkBa5byZaH+p35SPRD5lecm59jK2In2AGvBqj/Flx3BKY9+3yxe7FlhBXRKFU=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1786188vsx.61.1647530685111; Thu, 17
 Mar 2022 08:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-5-jsnow@redhat.com>
 <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
In-Reply-To: <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 11:24:34 -0400
Message-ID: <CAFn=p-ZKxZCPSk=jtX76ePntA5Ao1M5q3AsX=P_dKtVpdFrtAg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] iotests: make qemu_img raise on non-zero rc by
 default
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 6:25 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 08.03.22 02:57, John Snow wrote:

> > +    if check and subp.returncode or (subp.returncode < 0):
>
> I wouldn=E2=80=99t expect these parentheses here in any other language, a=
re they
> required in Python?
>

It's not required, I just find it easier to read this way.

> > +        raise VerboseProcessError(
> > +            subp.returncode, full_args,
> > +            output=3Dsubp.stdout,
> > +            stderr=3Dsubp.stderr,
> > +        )
>
> I trust these parameters are correct, because it really sometimes seems
> like Python doc doesn=E2=80=99t want to tell me about the arguments that
> constructors take.  (The only thing I found out is that `stdout` works
> as an alias for `output`, so passing `output` here and reading
> `self.stdout` in `VerboseProcesError` should(tm) be fine.)
>

>>> import subprocess
>>> help(subprocess.CalledProcessError)

 |  __init__(self, returncode, cmd, output=3DNone, stderr=3DNone)
 |      Initialize self.  See help(type(self)) for accurate signature.

It should be fine :tm:

--js


