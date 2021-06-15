Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA93A775F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 08:50:07 +0200 (CEST)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt2td-0003Wi-Bu
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 02:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2s5-00022D-Db
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:48:25 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2s3-0002Fp-LA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:48:25 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mi2eP-1lOfzh41FB-00e600; Tue, 15 Jun 2021 08:48:21 +0200
Subject: Re: [RFC PATCH] linux-user/sparc: Implement v8plus signals
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210526011340.440284-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a8938653-3f26-ba97-3672-ff10e56a9a60@vivier.eu>
Date: Tue, 15 Jun 2021 08:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210526011340.440284-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LTkiQ8eO5YyHRBIJ+0jlogCxB9JPKKNKJacoNS+HV1IYwVdV5ed
 B/ijkEAMlw7ZjGM+i3OMFWAs+4HDY3Kt4yK8ottxYUYa4GS+M5X/RFIFNFvzHgiHaWBGKzu
 lb2D/y2U65SKiRJKqIXl31ydAEmVqLgJhg+2VtuIlDMSaCZVvdSD6SkFlLgqi2USANt/rPh
 6nlmzyceqLNRGmhChO8Bw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/XMCSpOBG70=:a9CLQWo/RDjqqw/fulpyqb
 WrrpfBM/hmpe6lJYwL4oRTRwgjkiDP1gQDC42kNVuNEizP1mZo6a91ZXBwjrG8awxS/lYPMcM
 FFGijyyqicEx+hUHsuSPYYrc51DxTm4tvPpzlIP1AFc+mY+dkFRr62FjwZVYvRjOKnnAlX6Sp
 J39b0mZ1QfTFVfsd+RFc1CfMaeaIichHWQFCzvmPMCHafmqhrPEaLgxuTLPk+fS0zAgLcuu8L
 fpCK1mZZ891IcbnSOMPjV+YIfT2liqL8ivjAOYciopNUSHJqxRXguiQz5JOLBxT1QD3txOYl3
 dSTYK2Ji+KyfvTUPRqzKm1Ab/6buu8Tp2s5V/GpOt1bHQCQAxrPR3nE3j4i3QNoam7rJ3aR+c
 rmeBFibe2H+zzUvC+/l2Yav1LpM3gyX4C1joobeI38FORDA06XVe8E2ixSifmI+lJqoG//u0Y
 DVACnS7vT6b8LtKdhsP67lWHN7lvc4f/pEjBX3aB4UzmqE48Qqiq7bAnWbx79/mQOmavGjxg8
 o6c0Ng/7TXpwVxxmxhHJNc=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/05/2021 à 03:13, Richard Henderson a écrit :
> Sparc v8plus is a sparc64 running a 32-bit ABI.
> The significant difference vs sparc32 is that all 64 bits of
> the %g and %o registers, plus %xcc, are saved across interrupts,
> context switches, and signals.
> 
> There's a special marker in the saved %psr value that's used to
> indicate that %xcc and the high bits are present in the frame.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> I have been unable to find an extant v8plus distribution with
> which to test this beyond compilation.  Thus the RFC.  I know
> debian used to have one, but they have moved to pure sparc64 now.
> 
> Thoughts?

In my test, I use debian wheezy, and it seems to be sparc32plus v8+:

$ file chroot/sparc/wheezy/bin/ls
chroot/sparc/wheezy/bin/ls: ELF 32-bit MSB executable, SPARC32PLUS, V8+ Required, total store
ordering, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux
2.6.26, BuildID[sha1]=3fdfb5b9f829824f6110b7a2d91efd9947614263, stripped

I get wheezy from http://archive.debian.org/debian

If you want I can make a try with your patch.

Thanks,
Laurent

