Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD866BC982
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjCH-0007DF-SP; Thu, 16 Mar 2023 04:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pcjC4-0007CC-HY
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:42:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pcjC2-0000IK-Ld
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:42:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id ek18so4489533edb.6
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112; t=1678956157;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6UE0pxjYqpGo8+rx+bk5TnMdUSYKQpgaPq5XHSzEIw=;
 b=eRJzPjH3vDOqfv/mbMGw5yMgdfDUBo1yLM68q6tNCt0dTGTDV5ieMFfWiGmRyjG2GM
 e9h5qMQ8clPU6TueL5+yjOHvGMkNdqYhRZ2O0NcXTzl7IGEidh8od3w4uUZhwqbkl0JM
 PDnB5t46/0n2CzvC8alxPwU2lWolGZ+cnysgbHd1GdkbLhPbQEbJ9PrqleSlwC+3+Bzi
 SagXGKSq8j/VcWNv4ZvWTRtpxfsnRJArVF22MiCQya/E1di1m8UR6gHud8A6qz1DG7kQ
 mkc6cU0hwrfPRue2qo4G89BmLJgQgfu4bnEhUBLmir9Iwobvui61xPHPOGnvvdVvmfs0
 lbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956157;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6UE0pxjYqpGo8+rx+bk5TnMdUSYKQpgaPq5XHSzEIw=;
 b=os7VFz0aYgOmPTocvr8AXhAJ3B0smpqCBWG2QBylhYewJIHJ6w40ZwyC4hgCvdaOWK
 1RZcVDPUPwtxu2OKvV1ED7PIAM5yjIznljS1S2JNFoZ1/VKYHu+5KM3jloNYK4GesuUk
 /gh4EiPJCa1Pk4v16L23fN8obOCcCH+ejTvcX/lz7hrecZIzW0xjzkPCAivCUOJVxO1v
 C9VMphQG+mzZr9doo0oTcZJaSa8pYdF6uhxIscGjARlffaB953NK1n0oGgUf4FnhYOrd
 ++j69OR7EDI/iVESPS9fksHxrg0+2CPTm68OsH16QKeJLATJ+6NmzeV9IUfzesqScUF4
 mmjg==
X-Gm-Message-State: AO0yUKVuL3pPPa5QEhHISJiysdT7F5biIkwOMiVFvrH6fWXzgXhCKE9z
 12MKQRwMf1RiWELzflxJdPZmBg==
X-Google-Smtp-Source: AK7set/Vy1UIFnJ7e0olf0CqDksyDZM1slftO/B39f19rxC5Gvl7xh6nG2wlZ7wOKlDQ6yo1TG9Q4A==
X-Received: by 2002:a17:907:d08b:b0:92e:41ee:7564 with SMTP id
 vc11-20020a170907d08b00b0092e41ee7564mr7764751ejc.65.1678956157038; 
 Thu, 16 Mar 2023 01:42:37 -0700 (PDT)
Received: from smtpclient.apple ([188.25.247.154])
 by smtp.gmail.com with ESMTPSA id
 hx3-20020a170906846300b0092a3b199db8sm3545889ejc.186.2023.03.16.01.42.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:42:36 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: dropping 32-bit host support
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <5fbcb311-228f-2590-e5c5-21e7f043c1cf@redhat.com>
Date: Thu, 16 Mar 2023 10:42:35 +0200
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Randrianasulu <randrianasulu@gmail.com>, qemu-discuss@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <379B4C23-61C2-4AA3-A851-EEFC98A9AFF6@livius.net>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <3DD8295F-4BE0-4262-8C68-4A85A56D63C7@livius.net>
 <35022ff8-bf4b-1f52-73f9-db25c776cec1@linaro.org>
 <5C828A13-12A1-42D5-9DC1-9DB232294798@livius.net>
 <F852C238-77B8-4E24-9494-8D060EB78F9F@livius.net>
 <5fbcb311-228f-2590-e5c5-21e7f043c1cf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ilg@livius.net; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



> On 16 Mar 2023, at 10:36, Thomas Huth <thuth@redhat.com> wrote:
>=20
> ... It will take another year (or maybe more) until the deprecation =
will turn into a real unsupported state. I assume by that point in time, =
more and more RPi users will have switched to a 64-bit OS instead.

There is an easy and accurate way to know this, if by that time =
Raspberry no longer recommends the 32-bit OS, it is time to switch to =
64-bit.


Regards,

Liviu


