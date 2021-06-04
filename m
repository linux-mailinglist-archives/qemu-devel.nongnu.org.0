Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DDA39BC26
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:43:04 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpByR-0004f1-JE
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lpBxd-00040A-Kb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:42:13 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lpBxb-0000TO-JR
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:42:13 -0400
Received: by mail-pg1-x533.google.com with SMTP id n12so8152620pgs.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=33SRl1YfQ3+xJsgyy8/JuSOsANsjOYQ1jNGTBbx0TO8=;
 b=a0+pcg0yGu0bTKAP/hxbUMvG9wROMMmGvoVrT6hTKa9SIxgEf6/gG9rRqiHF1xf6oM
 QMa892uYL+3Z/P8uY6ML8dff4sfX09q4PfKk51k9kel+Y8TUoJjvApUTEEwgxi89Arva
 8JgxKv9vLGq3XgDvXDgrCfuY7h5bCTM0pumO/knOWM2e76kkm9ylr1rqSXMAqbiT5u+9
 J+d9iQ7c2O3jmRTpw2qgM4jQ0F2/AbRhpWjpx+96Gh+bzIJTQ6PW3MnQ6JzTBOwblTKn
 bdDhwBLeJtCrHE5EtteSFlqBmlRox4Q0B463IxKrNb8QbOwHbNNbRJabmA9oudseHH8O
 wiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=33SRl1YfQ3+xJsgyy8/JuSOsANsjOYQ1jNGTBbx0TO8=;
 b=seP+p+W3zAVCkRgO8v9pajQqFkdY8nbaJu3xsi0Vh1WKOu/EK5vA5cOAnhL521u4gw
 xjZhCOTBDvwH4eupjV8qVf9znlxpB+sVJ5mBvvxwjKpAJc9WSsusSbh6OEVGQX4qoj7V
 GDeGGo8Y89h2J1HMKPPnPkers1mHrxk9Wa7KCF19UtyGE9G+frRyCfugxUUaoywAA/IB
 Os3Dgx3N1Gjrkl7jku8gWWqiWayho0sXMw58P9PjJ9lQ187MyAqpaf3cS6Art/AYqAfY
 4YuOtuQ8rrjPSKftP3zNgM6KgxmCb7DhCU14AqZ2cHnA+MdjtQSQzzrYzMgzOiZVMKzT
 7rgw==
X-Gm-Message-State: AOAM532l86636cWJdd0nn3gFWHdyEKIRbNaM4kD3WJKQ+l6jcA2zatzT
 PwkPAsDYuoGBL70eHh4hSz71BA==
X-Google-Smtp-Source: ABdhPJx0Kv2e+KDKk+pDpKZwOYovhICtl5q+vZSs3OZ2MFVI0bDcG3TnqcWBtW+rOHHV116jvJEAew==
X-Received: by 2002:a63:1a12:: with SMTP id a18mr5563062pga.117.1622821329036; 
 Fri, 04 Jun 2021 08:42:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c11sm4969577pjr.32.2021.06.04.08.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:42:08 -0700 (PDT)
Date: Fri, 04 Jun 2021 08:42:08 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Jun 2021 08:42:05 PDT (-0700)
Subject: Re: [PATCH] linux-user/elfload: Implement ELF_HWCAP for RISC-V
In-Reply-To: <8644f703-2d57-0698-01e3-bdd006d614ee@linaro.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-1f040769-406a-4741-b919-4aff078d9d5a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: frank.chang@sifive.com, kito.cheng@sifive.com,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 04 Jun 2021 08:30:30 PDT (-0700), richard.henderson@linaro.org wrote:
> On 6/3/21 11:33 PM, Kito Cheng wrote:
>> RISC-V define the hwcap as same as content of misa, but it only take lower
>> 26-bits.
>
> As far as I can see linux only passes IMAFDC, not all 26 bits.

We decided to play it safe here and only pass through ISA string bits 
that we understood well enough that we could commit to keeping stable 
WRT userspace.  As a concrete example: we now have hardware with an 
implemnetation of v-0.7.1, which is an incompatible draft of the V 
extension.  There's some ambiguity as to whether or not that is a RISC-V 
V extension implenetation, so we're just being careful and avoiding 
passing any of thess bits to userspace.

More importantly: this coorelation between letters and extensions 
doesn't really reflect the reality of the ISA any more, as now we have a 
much richer encoding for standard extensions.  The single-letter 
encoding is probably going to fall apart for some of these more 
complicated extensions, so we're not quite sure what we're going to do 
here because a bunch of ABIs were designed with single-letter 
extensibility in mind.

For now I think it's safest to have QEMU be careful here, so we don't 
end up with a proliferation of these mushy ABIs into userspace.  I 
wouldn't be opposed to adding a more explicit "get the ISA string I can 
use in my program" syscall (maybe a prctl?) to Linux, but it'd be best 
if we go hash that out on the mailing lists first.

