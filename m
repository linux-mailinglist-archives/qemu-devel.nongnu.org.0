Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2035F1F07
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 21:43:22 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeiOP-0007U0-2W
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 15:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rep.dot.nop@gmail.com>)
 id 1oeiDd-00041u-Bb
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:32:13 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rep.dot.nop@gmail.com>)
 id 1oeiDb-0006cD-IM
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:32:13 -0400
Received: by mail-ej1-x636.google.com with SMTP id hy2so15166686ejc.8
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=J2rjqDa6jSpTxg2nz+lgFOvoPSmTr65s6Dj4MQ4jSLU=;
 b=YR510hGG9zqoqGTSthSAgHrz6KMAMH/4/M9qEkVmt/t4xM+4WCLIfugo9RTXtA9k9K
 Y1bIa0de4ALNkYcOOsZWbI62IKndmhGT2kmWg5o061+93zLCfbCKDxryyp8SrVYh8Lf/
 q6retirh8tngYGmAOzqq6fYPbyrkuj/mGuOQffQxKH8NW0oIfwGlri5aI/ouhJgQszi4
 oizNdax3MzV9FG2XkzcVStuRgd/6Q1lV0e3NsUSMxlXcMCr2+CXfs3v8ibKbYsXyjnlC
 CFAn14hlFzKcZih1p8bEHjCELsuuXratxvTK+I1JuSzkIOGtXWqw1zTfjR2znA0cgV0o
 /hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J2rjqDa6jSpTxg2nz+lgFOvoPSmTr65s6Dj4MQ4jSLU=;
 b=Ed6Rz257e7TG837NKAjbGgc2r/3f335IU3wdGhD82xTCmimPkeUKY7jYrzcdhrxnrY
 S2e27Nh2wWvoJMWs8G1yatRU7mpuTBYX/mN6aJ8TkXz3D9yMQ3TamxtQQvuWZTE2B/PO
 0VyJAJssgUIg9rCOdV2XXOpgxQxaIRBj05kN3rsmblxC4cUh/afkeIJSlb7TcM8eY1fK
 /V4Oi6t1TtLURfsNTHgJXoF+puahqx8Fyo/hSmC+P2RQqb1139RIx/eu7NACGVnEjV/D
 qrh5Jwa/XMkp+f724PRQ4NVUmSIcyjgRsQBLmDtOIbGz0aUyhmtnsx6fsKZI6Qv6decj
 X8kA==
X-Gm-Message-State: ACrzQf0oCQtluNePiDAmkEVcKXLAjLq7QTtLhEIeYwppnEfZBrIdm0C+
 u4iTo4SyZblLjx1H/oeu4mI=
X-Google-Smtp-Source: AMsMyM4dpeOIDkbtxuSsywsx/CUsGdipCgRWijIiPauFUYx1e+HHXg9E877rKQrUrigP2XJTQCJZzA==
X-Received: by 2002:a17:906:5d10:b0:784:b6c5:78d0 with SMTP id
 g16-20020a1709065d1000b00784b6c578d0mr10499569ejt.348.1664652729378; 
 Sat, 01 Oct 2022 12:32:09 -0700 (PDT)
Received: from nbbrfq ([2001:871:227:1d92:3b3f:9f87:ac65:9ebc])
 by smtp.gmail.com with ESMTPSA id
 pk5-20020a170906d7a500b0077016f4c6d4sm3115626ejb.55.2022.10.01.12.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 12:32:09 -0700 (PDT)
Date: Sat, 1 Oct 2022 21:32:04 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: rep.dot.nop@gmail.com, f4bug@amsat.org, aurelien@aurel32.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH qemu] mips/malta: pass RNG seed to to kernel via env var
Message-ID: <20221001213204.3362db80@nbbrfq>
In-Reply-To: <YziPyCqwl5KIE2cf@zx2c4.com>
References: <20220930140520.576374-1-Jason@zx2c4.com>
 <YziPyCqwl5KIE2cf@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=rep.dot.nop@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 01 Oct 2022 15:41:40 -0400
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

On Sat, 1 Oct 2022 21:06:48 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Fri, Sep 30, 2022 at 04:05:20PM +0200, Jason A. Donenfeld wrote:
> > With the kernel patch linked below, Linux ingests a RNG seed
> > passed from the hypervisor. So, pass this for the Malta platform, and
> > reinitialize it on reboot too, so that it's always fresh.
> > 
> > Link: https://lore.kernel.org/linux-mips/20220930140138.575751-1-Jason@zx2c4.com/  
> 
> The kernel side of this has now landed, so we can move ahead on the QEMU
> side:
> https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=056a68cea01edfa78b3474af1bfa39cc6bcc7bee
> 

s/a RNG/an RNG/

What about rngseed=""?
len=min(4711,0)
hex2bin(..0) will return false so ok.
rndseed="0" is problably fine, but is it worthy and desired? 00, 0x0.
Other than that, sounds plausible. IMHO.
thanks,

