Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9075FEAA6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:40:13 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGEm-0007V1-9c
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojFtX-0007LQ-PI
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:18:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojFtW-0004Ty-6I
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:18:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id r13so6363562wrj.11
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94lxSeJyJYQi3G+rCYa365dF71hqSSsVJElD3gCkHZg=;
 b=qSCdEo1bgRU/V1ScDrImx1ES5Dm0PaAc49j2+ogFCC4xKF9NGgCsTESHSxDioq3bxI
 ZcHJCQ2XwZYm8tXBprSU1QB2w9uLWlTagmxAHjcXdY7zwJkPt2p+9xU7CDiUuE4eT0B1
 hl99GtnfGrauOKahHUK9jteciu6rjALTbZsS9heFaqoSNUuxBuKRmSgnE46TharUWRpd
 USjeQAgCMbyf8XA3WKDZKdJ0cJW/DIG66/HQ4Aj1EWy29AKNQZKnoIU8BZhrn2h6NX/S
 dcqdzS3fyCM7hkv6Z2V0sbaxw73vxx6ahB5/A5gbkmjzeowD4vYp36FEt4vfYpmBF/jG
 rlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=94lxSeJyJYQi3G+rCYa365dF71hqSSsVJElD3gCkHZg=;
 b=25zmbxcLE8bcS6KomC6oFrwAjX18MUOqnnt/IacPrxst3WJ6V42G2qVrmdaQg97mD8
 uaDSMtCnUhu33cOBeK/O8uCYqoMSvgDq0y7a5vADdp3am8Y3ytKmb8Nf15scrNAVUNvF
 n7Wj9zgkfdaiBsbdWz5xgSB9PI9xk/oZY3VTByIYEcV8HZRd06W5h0OzjVoBHnaDnkzH
 KzRxd8ccKoYp2AP4tyTQV6u0VG6Nzjr3a9JhB4YQ3qSeHAkivvyrsYPHbje1hSrkryxG
 WfN53CYfwlT4fCoc8742PGzW1mffgt5Hpo29GqkPEiVsO5smMr7Jesn2gSDDN9XPqAIQ
 plsQ==
X-Gm-Message-State: ACrzQf3zxkICF6yZVKI8SQY21U+EcQSasb778UOEEmK2qrCDPNZz0yhv
 z6opTdDGBtXVsi1WA6jF3vOSFSE1539lLg==
X-Google-Smtp-Source: AMsMyM7rg2Q8U8343DLhRP/RVhQB3xZIbHi7UARlue4HQPlWCXhBHMU7sC/VZsGZ/xpSL83ckop4YA==
X-Received: by 2002:adf:e7c9:0:b0:22e:3524:9b4b with SMTP id
 e9-20020adfe7c9000000b0022e35249b4bmr2398087wrn.520.1665735492224; 
 Fri, 14 Oct 2022 01:18:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfeb01000000b0022cc3e67fc5sm1355861wrn.65.2022.10.14.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:18:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDBFD1FFB7;
 Fri, 14 Oct 2022 09:18:10 +0100 (BST)
References: <20221013131304.623740-1-pbonzini@redhat.com>
 <8735brpilw.fsf@linaro.org>
 <CABgObfZ3GH9-nFL7wZYxFtA0F49OmMPOKb3=qqfNWtXySr7arA@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg: include CONFIG_PLUGIN in config-host.mak
Date: Fri, 14 Oct 2022 09:18:01 +0100
In-reply-to: <CABgObfZ3GH9-nFL7wZYxFtA0F49OmMPOKb3=qqfNWtXySr7arA@mail.gmail.com>
Message-ID: <87tu46om2l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On Thu, Oct 13, 2022 at 10:35 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>>
>>
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> > ---
>> >  configure | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/configure b/configure
>> > index f4ff1cf305..a5af9c524f 100755
>> > --- a/configure
>> > +++ b/configure
>> > @@ -2474,6 +2474,9 @@ echo "HOST_CC=3D$host_cc" >> $config_host_mak
>> >  if test -n "$gdb_bin"; then
>> >      echo "HAVE_GDB_BIN=3D$gdb_bin" >> $config_host_mak
>> >  fi
>> > +if test "$plugins" =3D "yes" ; then
>> > +    echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
>> > +fi
>>
>> Don't we already do that anyway?
>
> No, we don't.  CONFIG_PLUGIN enables "make test-plugins" and "make
> plugins" but not the plugin tests in tests/tcg.

Ahh I see. Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

