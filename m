Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603E6BC848
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcidv-00056b-QV; Thu, 16 Mar 2023 04:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pcidt-00056G-Tb
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:07:21 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pcids-0006Qs-4z
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:07:21 -0400
Received: by mail-ed1-x531.google.com with SMTP id w9so4223483edc.3
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 01:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112; t=1678954038;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZsP7c/7zw81JnGSElC+4YClPkUxzvgRrxlfodjNkdqE=;
 b=dcRpVMoK7svptwOIZBCXHToW+GaVnQxYb8pAc1aoKUZVXJTBP+oykr9Yx/u3ZHMnkK
 uR1XToFurCk/QAJyi5uVN+0qXXKnopbX/kHIZ/c/9f6O6gpnIhv7wuJZ1fob0/yk4r8J
 Mor3rTHm0umzyW2xpkwWp5IDMU0cMj9+ZtlANKchZcilmPJuR4H2+Sj5XO5MnOdX4A4d
 Bt4np7tBpG6f4TxtnIiba/He1gEyEGsZDbE9vfCQQCIxSxN0317homEOX6+CSGPgw4KO
 RV6d0bjdLkLXd9unS0QQu9YndRrNs8usCC8rjVU75rOFXj/UY4PJ59A8sqVoNApwFK+5
 r1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954038;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZsP7c/7zw81JnGSElC+4YClPkUxzvgRrxlfodjNkdqE=;
 b=QcPya61x6vxMWc1lAg4cmnBnb8hzJJzq/y/9aq1J9nOUeXEOGzU4Gti9OB/dT3/GvL
 L8wjkr9wr6oWQQS0Q7DHarKPBwtkxfz05Xvmb7sjMu6V/5eYHQo5f1WGAFSYFhxxbI87
 oJpKr0QsQR0BSS7ME973yN9F2KL4RjNNQeXss+cmUuQgmr82xpEXLTawfbluW/ipGSjY
 JiiThyUhkbql2rQ1HV0Co9I4QCie+hgNjMTiCKK+m00Iiub07rD6IjKUXA8Y4V17csuP
 Up9ZucG/13gBoFxF+eLZeqBuSqXE6K8GH0aKqnx8hvaXo3u77gWOAn/6ndIdLwdCh/Sd
 j4Eg==
X-Gm-Message-State: AO0yUKWtMg2hFInctwNfThLGyKsA3MReGNaUmtDYmdqpDqrOr+86n9fw
 W8qatVlke3RhX6q1MDt67OuVZg==
X-Google-Smtp-Source: AK7set93sbOQ3ULv1uTFcAbIPYB0nEkNlKZjCNVOYqhUzl5UXr/k1zM9vTBn+UJrGlmQ2NkQcO7Pyw==
X-Received: by 2002:a17:907:7249:b0:92b:eefb:b966 with SMTP id
 ds9-20020a170907724900b0092beefbb966mr11830888ejc.0.1678954038335; 
 Thu, 16 Mar 2023 01:07:18 -0700 (PDT)
Received: from smtpclient.apple ([188.25.247.154])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a170906259600b008f883765c9asm3507945ejb.136.2023.03.16.01.07.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:07:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: dropping 32-bit host support
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <5C828A13-12A1-42D5-9DC1-9DB232294798@livius.net>
Date: Thu, 16 Mar 2023 10:07:16 +0200
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>, qemu-discuss@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F852C238-77B8-4E24-9494-8D060EB78F9F@livius.net>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <3DD8295F-4BE0-4262-8C68-4A85A56D63C7@livius.net>
 <35022ff8-bf4b-1f52-73f9-db25c776cec1@linaro.org>
 <5C828A13-12A1-42D5-9DC1-9DB232294798@livius.net>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ilg@livius.net; helo=mail-ed1-x531.google.com
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



> On 16 Mar 2023, at 09:57, Liviu Ionescu <ilg@livius.net> wrote:
>=20
> I'm not targeting RPi2; there are a lot of RPi4 with less than 8GB RAM =
(most of them, actually), and even more RPi3, with even less RAM), and =
people prefer to continue using the 32-bit OS on them, which works quite =
fine;

Like it or not, as long as Raspberry does not explicitly deprecate the =
32-bit OS, people will continue to use it, and for good reasons.

As of now, it is even 'Our recommended operating system for most =
users.':

- https://www.raspberrypi.com/software/operating-systems/


Regards,

Liviu


