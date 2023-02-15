Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169969854A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSO7i-0003LU-Qm; Wed, 15 Feb 2023 15:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSO7Z-0003B6-2A
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSO7X-0003g4-Bg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95cSUFM3lFa8eYa3DJlbM/VC6YmY3dqYC487wZv2eYA=;
 b=IrXXJt33yTlEOHVlthhP6Bq56LbEa5mYZ30Lo3mPH12MO4C7YlYdB2Gl5sqD7Kq8ZYOUF3
 5GLqAPec2OGMw5vu+pss1z2V/lS81ZTF9my3y0zOFIuGLZheNIkYd5HH+zLg5UUgHMJX0S
 e2cg0Q2gk9OcCVXI8cKwNpVbe5AdYZ0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-UOwHE73SO761mK_C2R2gog-1; Wed, 15 Feb 2023 15:11:13 -0500
X-MC-Unique: UOwHE73SO761mK_C2R2gog-1
Received: by mail-pj1-f70.google.com with SMTP id
 k2-20020a17090a658200b002311a9f6b3cso1649041pjj.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676491869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95cSUFM3lFa8eYa3DJlbM/VC6YmY3dqYC487wZv2eYA=;
 b=Bp/4vdD0IOCURvSojzP3sms4ftMeE8gqOdIWUc4trZUOSQ04NsMl88PWqmU8Bnq7yp
 +rYo9+8BMGIqIxzsEdg1lda5ve8ZM/SdY9Pro8gnG0Mr5RMW3EltDwWzN2KN7j6zTf/4
 7tG3iOPKTaC6piwfqd4EeRtn0pj08Ccvg/i0g7NQ1Cshsrm0eHuOhaH03NGmrd/WXXoH
 IbSz+llnWQHLZXj81m7fCiA5EOLM6rg4aoNp7pjXjH8At13BWVKF9juOFCcGkoRLnrgK
 Krw1+NKY1NoZ5ajzLivU3NRRU/EEXJhAIlkDDm8hJa7Waz59NNqA2WcE6nOPdQbR3cnt
 9URA==
X-Gm-Message-State: AO0yUKX0gbvSHxz4zHItngorWKWNp/7LyT1U34qmaJJxP/lrLqEwC1KB
 Bp3mYgK1LrDt3Dtj+h7iHPq8NkHTX0UWz2urzzuj20c9FiWxUqXjW44e9XhvO3rIieLHnms7vhm
 rZ6VjZ9+iEYi8SgXaNrZY1lGfoKHyKr8=
X-Received: by 2002:aa7:9d1d:0:b0:5a8:beb3:d561 with SMTP id
 k29-20020aa79d1d000000b005a8beb3d561mr541520pfp.17.1676491869253; 
 Wed, 15 Feb 2023 12:11:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+qMuGJvmAUvkaS308/FirUjRWy7wjEq+fpeRY2LpRvi8pPjm+MjVG0+nXoMJ+CBDxJ0DPO4itLRqw+EDwNKyI=
X-Received: by 2002:aa7:9d1d:0:b0:5a8:beb3:d561 with SMTP id
 k29-20020aa79d1d000000b005a8beb3d561mr541504pfp.17.1676491868948; Wed, 15 Feb
 2023 12:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-4-jsnow@redhat.com>
 <20230210194527.d622oiaitb43utl2@redhat.com>
In-Reply-To: <20230210194527.d622oiaitb43utl2@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Feb 2023 15:10:57 -0500
Message-ID: <CAFn=p-a5SxWuJSDjtr98eQTmb91X5RttrRivNa=6dgMLKjfQ8A@mail.gmail.com>
Subject: Re: [PATCH 3/7] configure: Look for auxiliary Python installations
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Feb 10, 2023 at 2:45 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Thu, Feb 09, 2023 at 10:40:30AM -0500, John Snow wrote:
> > At the moment, we look for just "python3" and "python", which is good
> > enough almost all of the time. But ... if you are on a platform that
> > uses an older Python by default and only offers a newer Python as an
> > option, you'll have to specify --python=/usr/bin/foo every time.
> >
> > We can be kind and instead make a cursory attempt to locate a suitable
> > Python binary ourselves, looking for the remaining well-known binaries.
> >
> > This configure loop will prefer, in order:
> >
> > 1. Whatever is specified in $PYTHON
> > 2. python3
> > 3. python
> > 4. python3.11 down through python3.6
>
> Makes sense.
>
>
> >  python=
> > +first_python=
> >  explicit_python=no
> > -for binary in "${PYTHON-python3}" python
> > +# A bare 'python' is traditionally python 2.x, but some distros
> > +# have it as python 3.x, so check in both places.
> > +for binary in "${PYTHON-python3}" python python3.{11..6}
>
> This does not match your commit message. If $PYTHON is set but fails,
> you never check python3.  Pre-existing, but now that you're calling it
> out as intended, it may be better to write the list prefix as:
>
> for binary in $PYTHON python3 python ...
>
> except that it mishandles $PYTHON containing space, so you want the
> quotes, but you don't want to test an empty binary or waste time
> testing python3 twice, so more precise could be:
>
> for binary in "${PYTHON-python3}" ${PYTHON:+python3} python ...

Yep. I wonder if it's worth helping people work around broken
environment variables at all, but, eh, you already solved the more
difficult case, so I can include it.

(Well, pending other discussions, I s'pose.)

>
> Meanwhioe, your use of {11.6} is a bashism, but configure is /bin/sh.
> It would be nice if you could use $(seq -f python3.%g 11 -1 6), but
> that's probably too specific to GNU Coreutils and won't work on other
> platforms; and open-coding it in a shell loop isn't going to be any
> prettier.  So you'll be safest if you just manually spell it out:
>
> python3.11 python3.10 ...

Oh, icky.  Well, OK. Thanks for pointing it out before it became a
problem somewhere.

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>


