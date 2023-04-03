Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263886D3D2C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:15:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjDSI-0003cf-85; Mon, 03 Apr 2023 02:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjDSB-0003av-32
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:14:07 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjDS8-0007TO-HG
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:14:06 -0400
Received: from [172.16.75.132] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5C10520033;
 Mon,  3 Apr 2023 14:13:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1680502437;
 bh=SNgifGz+HEOSAGQ8/C9Uts/OkYGw7whqSLVBfhASENM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=StG8NkKf1MA1R3ucyrgF8tGe1VRlpsB8Lv5Sfcs+yUjeKFprT+ENTHiH7w0+85Kxi
 dkGKy8HQbXetsZ9ax89Z73KyHvVjOBsUpn+eSkF+Zfp+11vev2tGhnoZV8FNIqlhxA
 Th9Y/rE8x+1BCCi3pLVFSPWil27OgbXKbPREjoLXfPmjAk7CcB0A2Q/hI0gveKWbYR
 0ZEUc1fHvgonEyE4kHJPxfb8LzUR1cgKgdBLA8ETcMJpc4vgp9ctZw6+1WYnnlnnmS
 LAsQ5rhj/VDd5TsIOF3/0p+DzbdLgWwR6IsLMiZ55m0zK9eQTI5TY8BHlNifeG7Qza
 7eBrqiD2XacMw==
Message-ID: <3bc0910f6b8078b07f43b3dd6d04686c25829ec1.camel@codeconstruct.com.au>
Subject: Re: [PATCH 14/16] hw/i3c: remote_i3c: Add model
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joe Komlodi <komlodi@google.com>, qemu-devel@nongnu.org
Cc: venture@google.com, peter.maydell@linaro.org
Date: Mon, 03 Apr 2023 14:13:45 +0800
In-Reply-To: <20230331010131.1412571-15-komlodi@google.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230331010131.1412571-15-komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Joe,

> Adds a model to communicate to remote I3C devices over chardev. This
> allows QEMU to communicate to I3C targets that exist outside of QEMU.

Nice!

I've been wanting something similar for a while, both for i2c and i3c
busses, to the point of having a similar concept partly implemented.

A couple of design decisions though:

1) Is this something that qemu upstream would accept? Do we need a
formal description of the guest-to-host interface somewhere? Or is there
a more standard way of exposing busses like this?

2) My approach was at the bus level rather than the device level: the
protocol is bidirectional to allow the model to either participate as a
i3c controller or a target. There's quite a bit of mis-fit when applying
that to the qemu device structure though, so your approach is a lot
cleaner.

I'll have a go at adapting my client to your protocol, and see how the
device interface goes.

Assuming we do adopt your approach though, I think the protocol
description needs some work. There seems to be other messages not listed
in your protocol comments, and the direction of some seems to be
reversed. I'm happy to contribute to that documentation if you like.

Cheers,


Jeremy

