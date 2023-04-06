Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8926D9467
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:49:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkNAX-0005xR-HL; Thu, 06 Apr 2023 06:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkNAH-0005wp-U7
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:48:26 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkNAG-0000iW-D5
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:48:25 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i6so45685984ybu.8
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680778094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/MyGbSwhN3mrfjsmupalTmMkEZRioTZMnIBK1SNS0eM=;
 b=WlBJxsuQPEM4JHr47/QsHQMgMQgfwaZJABsxtd6pPyjHwv5ecJApqAwHkh6GI+CJzQ
 UdvowOcrjmZECFTkePtA9nLmCpwHfh6db+vdOwpUnoT2Vxi89EW3gKOn+erZrGG84tFo
 +4y4rr9KXcxwa7ac/xLxICJnhkp33rEo0E2rJJ7FUIcrL325YZDLMCCLpoI+a7WoOqdy
 Ga19JbZybzaG0UBi0BFGPw3B7epbswO4pO7nklYxVRRAZmf+ebV+JwJ96hH0qsyBoTBX
 oVKbRtn3laLPcpbZwP2mfc22FhPK8vjbdZ4WoA0Hd+dlztXCHsm2/DQceiPqNEMwfJ9+
 g4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680778094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/MyGbSwhN3mrfjsmupalTmMkEZRioTZMnIBK1SNS0eM=;
 b=bSSCuiuHEWIj+SApSu315Uk9vX78kzNBIi5oHdAUtBzdZkNw8votezqlyax2qu8iK8
 zD51uVpC8AWQOECfvMQEsfW0lbLVGdfvL5PcPU7I3QSbcsL++W54uTVQ34EqcTb4/Irm
 fyMiCqt8PQQBfE2Q0A4ixAnVdveZaGAH9xY+wDZOj+DbW02b07V1ZWoSIZVT0XThgaAE
 TJ7koyS99y03Go8eaZnsQ5yJP7qEJMKnGB5EFiz/5lvxY9tnPyeCZ8kVqUBvTUQ62ypg
 WBsa3AFwyIvHgs41ps7QjF+nxhg0rAUVirzzUCiY+iCFuqPaLbsohtYGhkZJTBqykshN
 7c5Q==
X-Gm-Message-State: AAQBX9dBmQPIxc/ArbrIpisJyOFpD8zLgJJnvS40wP377CqplDrB570a
 XjGAhhIA0ZzXEPWp2CcHOZGN/pMWTafII7L4Zrs=
X-Google-Smtp-Source: AKy350a7WaYq/lDmUw3hmuNwU1Hgdxbu0V455pEWP6JnSDd8F4bKDXZG3NdUc1t2S4aKwP7tZr6x5456pGta2UdOXDw=
X-Received: by 2002:a25:da03:0:b0:b8b:fe5f:2eaa with SMTP id
 n3-20020a25da03000000b00b8bfe5f2eaamr344247ybf.2.1680778094558; Thu, 06 Apr
 2023 03:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230406100830.240914-1-pbonzini@redhat.com>
In-Reply-To: <20230406100830.240914-1-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 6 Apr 2023 06:48:03 -0400
Message-ID: <CAJSP0QUwYMJY1tbrt-nyyHqOzh0RWVjhz_VvgZsPf8kWDT3FbA@mail.gmail.com>
Subject: Re: [PATCH for-8.1] block/nfs: do not use qatomic_mb_set
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 6 Apr 2023 at 06:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

