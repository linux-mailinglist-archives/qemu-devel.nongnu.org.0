Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D55FDB35
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:42:22 +0200 (CEST)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyTd-0005YK-C1
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrea@rivosinc.com>)
 id 1oivPY-0004lR-Bk
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:25:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrea@rivosinc.com>)
 id 1oivPU-0006n5-JI
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:25:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w18so2099479wro.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MRGUhw9Z/rclYNgAUGnmhtys4SylygHphWSaYymH1nE=;
 b=m/PpNdCNtFLQiZ3aQsmMytC43YlmkSkVKmzuaPip/LspGBlVVd41Ee/nPlZKD3vNNx
 QzFApRXCXUn5i80syu2XWhzC7dnplgQL9EVgZDR+7OwfZE2dPDk6fAYEbreqEq4RJFZi
 sZpaD8DN93jJY8omx+nOQ0KPzmNxwMcUYtCEhCdy5Ekx1W2Fro2CmL9IhcuWKPjHuEfN
 ryRprYkYM1q3FdyNAI/Bwff8vfo0h+POlnoWWXUmSOy3ZNG84BLr3qPLXlUU7HJgAKf9
 sz2KYEiUPBMev5c3G6XsnERKsslYhq2MPdreu/54qnlqPZpA6gJIlbPEVTXrXMD4dz7b
 2wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRGUhw9Z/rclYNgAUGnmhtys4SylygHphWSaYymH1nE=;
 b=AEJE618qrWt0GeBWkvxP5jGOKBIpHDjyf/+ktIGKIWmL3EORF+Q7JVyFTarGCkGoJ+
 D7QbkjOFEG2rnoeKm79Xm8DYBnP6p+yUDmTwbC2vDP/l8Fu/41bQRhjveOUY+W3m4bTm
 m4ht+upCp4ALbAK56c0TqMIcRhNOfuDLVZDtWRHrnYVm56XQh8+QG04FFvVYwgyXbESW
 FYRQsg/zuH7CLtoHLTUBSa665uXp8UCrrGLANJvM0uLWpMKwEOOTIs6AnT4OPTNDsAXP
 bHWmbWwoYdo/GGgPEzeRMddhCXv0ytlKqklz4iWah5MJNLx/I84kAjKhlmgMl5hKeA1v
 +Slw==
X-Gm-Message-State: ACrzQf21+WLrphcLFogeLDaHuM/p0Wh5ajtVKQlT2Jt6+juARHkCqfU7
 6iNDbaEypIJGMi1m1q1WJuOeWA==
X-Google-Smtp-Source: AMsMyM682ldcEl8+Qspxt36yqLXlqCAqkxbZtO7OHf4VYybBis1hyoaAdIeiVzLKk139SD+g5QWZkg==
X-Received: by 2002:adf:eec9:0:b0:22c:de88:3656 with SMTP id
 a9-20020adfeec9000000b0022cde883656mr20750439wrp.26.1665656749314; 
 Thu, 13 Oct 2022 03:25:49 -0700 (PDT)
Received: from andrea ([77.89.52.45]) by smtp.gmail.com with ESMTPSA id
 l17-20020adffe91000000b0022cd0c8c696sm1650135wrr.103.2022.10.13.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 03:25:48 -0700 (PDT)
Date: Thu, 13 Oct 2022 12:25:43 +0200
From: Andrea Parri <andrea@rivosinc.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Message-ID: <Y0fnp2uEjzF9XDK+@andrea>
References: <YzXvIKVeFcHQ3ZQI@work-vm>
 <mhng-36837e18-1883-443f-85a7-69010d5d38ef@palmer-ri-x1c9>
 <YzqhAdsGwC0so55O@work-vm> <Y0fX/VloiH7Bqewm@andrea>
 <Y0fhi2/hcvb37uiO@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0fhi2/hcvb37uiO@work-vm>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=andrea@rivosinc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Oct 2022 09:17:25 -0400
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

> > AFAICT, Ztso allows the forwarding in question too.  Simulations with
> > the axiomatic formalization confirm such expectation:
> 
> OK that seems to be what it says in:
> https://five-embeddev.com/riscv-isa-manual/latest/ztso.html
>   'In both of these memory models, it is the that allows a hart to
> forward a value from its store buffer to a subsequent (in program order)
> load—that is to say that stores can be forwarded locally before they are
> visible to other harts'

Indeed, thanks for the remark.


> > RISCV intra-processor-forwarding
> > {
> > 0:x5=1; 0:x6=x; 0:x8=y;
> > 1:x5=1; 1:x6=y; 1:x8=x;
> > }
> >  P0          | P1          ;
> >  sw x5,0(x6) | sw x5,0(x6) ;
> >  lw x9,0(x6) | lw x9,0(x6) ;
> >  lw x7,0(x8) | lw x7,0(x8) ;
> > exists
> > (0:x7=0 /\ 1:x7=0 /\ 0:x9=1 /\ 1:x9=1)
> 
> (I'm a bit fuzzy reading this...)
> So is that the interesting case - where x7 is saying neither processor
> saw the other processors write yet, but they did see their own?

Right, it was inspired by the homonymous test in the Intel's specs.

  Andrea

