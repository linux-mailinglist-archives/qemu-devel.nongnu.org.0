Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB314CE200
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 03:05:18 +0100 (CET)
Received: from localhost ([::1]:43312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQJnJ-0001zj-B3
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 21:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQJll-0001Al-IE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 21:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQJli-0000U3-GH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 21:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646445814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mzCPwUrrT8RRfIVF+qMxQdmfL8uKP2G4T/pVbazC7+g=;
 b=h8b6S/8cDuRRg/Q9aKv3fnC8YBHj+jEdKFLAlkggdw/h0SGLRLlm0PCvaLP4PqrlW9Lxir
 AcnL2VH1lkjCtagSAr5M3YK0kY5R8KP4Zp7srvhRmT7GFoicDAuQO3T62PP3AwGM8E+CWV
 PaIt5oEv2+ynIFScuVAxW/RG6yEH4MI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-_nsjRm8sMPemChCFd_eqXg-1; Fri, 04 Mar 2022 21:03:33 -0500
X-MC-Unique: _nsjRm8sMPemChCFd_eqXg-1
Received: by mail-vs1-f69.google.com with SMTP id
 v11-20020a056102302b00b0031b7d1906a3so1218791vsa.22
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 18:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzCPwUrrT8RRfIVF+qMxQdmfL8uKP2G4T/pVbazC7+g=;
 b=7nyhGGd708jli9/SBoTZuSCr6N++cFB1nchk2uuTRC0/4kWMAEfkLSxiK766k3qT3F
 ismbIHoXpQg4ECEQa7l5OWo1YiLFWc6LLyiM+lwIDJJ4zpW+kNtt+rz4ocM4QCFKLF92
 +vdWY7RiW/QFqg8RUTAxf3/rfsEXMwOCfrzgSc1IdmX3cThPVCSPkw81ibjf2VhcooWy
 gKQqFUD/w9DXfiHyiGYSOvZaozUveIc1H2ARG15DZbd8ini4tNyCd4y1bn7SZYDOU8pO
 G1J3HrUpEaqjNrglQp8BD+w5sXW5CWVDN7xnEwc5G2uBmglm6gH78SDtWnIQAIk7D/hz
 rMqw==
X-Gm-Message-State: AOAM531iM1a/D6ygYFPoGNkefo0YbIO3idDnii4Ka1otJry5XtXX/Qk1
 XwJhVq4DCvHAWmIIkw2UndlNIDsEFarXSog9qeoj8kATmKUI1DDn9wYxI1kokvOlu5XfmRiUayR
 0yoA/5D4xV1mfkiZEq2ZquOsaIGyLUpY=
X-Received: by 2002:ab0:2809:0:b0:341:f4aa:829d with SMTP id
 w9-20020ab02809000000b00341f4aa829dmr537426uap.42.1646445812751; 
 Fri, 04 Mar 2022 18:03:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2iTG0kIoiz4NqksG8+w60VMClpa4AXienfV83m0ME2pGxCWuyyFNmGswY9xKS4EMVQRvNaxJ9vDBpy+gFE18=
X-Received: by 2002:ab0:2809:0:b0:341:f4aa:829d with SMTP id
 w9-20020ab02809000000b00341f4aa829dmr537402uap.42.1646445811061; Fri, 04 Mar
 2022 18:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20220304194746.486226-1-jsnow@redhat.com>
 <20220304194746.486226-4-jsnow@redhat.com>
 <20220304202326.cj265z3pxrm45c34@redhat.com>
In-Reply-To: <20220304202326.cj265z3pxrm45c34@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Mar 2022 21:03:20 -0500
Message-ID: <CAFn=p-Y4tgUn1aEwCckC6=D9JS4g45LJ6Le8LP0vtpJJ8p0oDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] iotests: Remove explicit checks for qemu_img() == 0
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 3:23 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Mar 04, 2022 at 02:47:44PM -0500, John Snow wrote:
> > qemu_img() returning zero ought to be the rule, not the
> > exception. Remove all explicit checks against the condition in
> > preparation for making non-zero returns an Exception.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
>
> > +++ b/tests/qemu-iotests/310
>
> > @@ -105,8 +105,8 @@ with iotests.FilePath('base.img') as base_img_path, \
> >      log('')
> >
> >      # Detach backing to check that we can read the data from the top level now
> > -    assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
> > -                    top_img_path) == 0
> > +    qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
> > +             top_img_path)
>
> You collapsed other wrapped lines into one where they fit, why not
> this one?  But it's not essential.
>

jsnow is non-deterministic.

(I can smoosh this in, or kwolf/hreitz can smoosh it in. Probably not
worth a respin, tho.)

> Reviewed-by: Eric Blake <eblake@redhat.com>

--js


