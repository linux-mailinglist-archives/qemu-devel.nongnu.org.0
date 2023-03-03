Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCD6A9155
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 07:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzNG-0007rJ-8N; Fri, 03 Mar 2023 01:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+ce2d36ceab3eb098c1c7+7131+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXzND-0007ni-Jg; Fri, 03 Mar 2023 01:58:35 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+ce2d36ceab3eb098c1c7+7131+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXzNB-0004zZ-A1; Fri, 03 Mar 2023 01:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=jqVzAe7nIgD4YrTuDbwzjggJTjdxR6/YQwJajt/O82k=; b=N1+zLqup5uhnsb2R2Qz+bA9zW8
 gVkFS6WC9ATZJr560tdxyWUqG3+h12EP0q2lrjzuHKkFpxYRzwh6CMTiJVK/9wO8G3e94nXRU2Iv/
 pW7grlFCdf0LkRTpld+mncnjjqkBPtGnYM970QWSJj4IpDr4OuDHe9HBM7BESVZNE258WcTu7X1fd
 6Wst7r7fLbqnyJdnyahgZnngdUKgmGRXHwve4mWSgdQ/K2cVM0NOZmlu7fwx/o9WwlFOCA4cwySai
 yoJxEc2dvp82gcG/GVUY3dBq4Y7GuXZmtY+IMckBJpGy1gnZgCSYKYmuPtMaX0otmMKrLpVCztNlM
 gjFgLTHg==;
Received: from [172.31.31.185] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXzMy-00Fb7n-1F; Fri, 03 Mar 2023 06:58:21 +0000
Date: Fri, 03 Mar 2023 06:58:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
CC: John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_00/18=5D_hw/ide=3A_Untangl?=
 =?US-ASCII?Q?e_ISA/PCI_abuses_of_ide=5Finit=5Fioport=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
Message-ID: <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+ce2d36ceab3eb098c1c7+7131+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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



On 2 March 2023 22:40:40 GMT, "Philippe Mathieu-Daud=C3=A9" <philmd@linaro=
=2Eorg> wrote:
>Since v2: rebased
>
>I'm posting this series as it to not block Bernhard's PIIX
>cleanup work=2E I don't have code change planned, but eventually
>reword / improve commit descriptions=2E
>
>Tested commit after commit to be sure it is bisectable=2E Sadly
>this was before Zoltan & Thomas report a problem with commit
>bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder")=2E

However much I stare at the partial revert which fixes it, I just cannot b=
elieve that the change could make any difference at all=2E There's got to b=
e something weird going on there=2E

I was going to ask if the level mode for the PIT made any difference, but =
this is the output IRQ from the PIT to the CPU itself so I don't see how it=
 would=2E

Would like to see a report with tracing from pic_update_irq, the CPU inter=
rupt "handler" and the intermediate IRQ handler=2E With the intermediate pr=
esent and without it=2E To compare the two=2E 

