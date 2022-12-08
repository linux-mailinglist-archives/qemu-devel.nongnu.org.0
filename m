Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1EE647762
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 21:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Ngj-00044c-Ct; Thu, 08 Dec 2022 15:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3Ngh-00044R-Fu
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 15:40:11 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3Ngb-0003Ot-Af
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 15:40:11 -0500
Received: by mail-oi1-x22c.google.com with SMTP id t62so2563565oib.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=VmWXs725IXw2Yq7XGwQ6g6Jdg6J8huSfxDhDPRPJVcs=;
 b=CBnR+hO9qVEH6JurTKAIN09mwcuGFSvHQUydiwa4sTM+S0FstPKUoO1bn6tz6FhBrL
 Y+7AaLOC01NSky/0dWkG71kL9rqc9eWYNbLwsEUL+Do4znFd5gA9vHv1QHxYp7B8dO6r
 AGlPMvmkDe69JE1ZJYuAxf14yDecuGsYtPeW8Q1TOZ8xQ4v1wmNgbcsRyKStBGim3+3/
 e2la4n6gYCFlZLJQALdseh2O0THMXgFdEkNEAma39qTchTeg+pUVvIPLFMbRMaAWFN5x
 zUtSEp5scFe64xxUOlfxQy5pAF+zDYL6ZTwoqGwTSSrBaxE7KNzVz7qhqfbAJY0Rr6/3
 9z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmWXs725IXw2Yq7XGwQ6g6Jdg6J8huSfxDhDPRPJVcs=;
 b=CvdPDsD9riJ5OZBxoycJsc7COIf+ndHrb5pjPPpTmz7uYxNGX7Fv3nLgE62mLpkfbW
 NPzZI5QSWC8PLTh3En+AqZ+A2/zePoGpn6Ifsjnp/5tfRrI+qIuT1oDbevkKDTJ5fIzn
 TnrdDbJnuKJqAWLff0R6HnfpNjkdBvoVLalaF4uwmy59frKCxWtkVpvxphVQHzxrLDpj
 Jjd2/nMML8cJtvjnFPSobBRPJGP+k6Hn9XerGwR4gZeDxa1igTkCCSvoiJgJimH7VpDD
 LSJSjWFVSLEbB0tDH1Ae9H9WoexjTeD8v1WxGsQQnoNkBwIMOQcMb9E4fT4PzywAvuNg
 H4mg==
X-Gm-Message-State: ANoB5pmo8VRxS1zMKUv5IiF3n+tmeOegorkCq/hnlqm7Eq+GLXbJpkY+
 Ex4PKtq+XsZ82NmKAIRPSBc=
X-Google-Smtp-Source: AA0mqf43aQCm/oCCTRKlIbLKp5LfDrDZw5CKUOpZ5Hy57wjiuI15d7oeC+UJ34I/JtZ+wTmOEKs3Gw==
X-Received: by 2002:aca:ac44:0:b0:35c:2ddf:59d5 with SMTP id
 v65-20020acaac44000000b0035c2ddf59d5mr8812379oie.215.1670531996957; 
 Thu, 08 Dec 2022 12:39:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a9d4509000000b00661a16f14a1sm11789076ote.15.2022.12.08.12.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:39:56 -0800 (PST)
Date: Thu, 8 Dec 2022 12:39:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <20221208203955.GA1367659@roeck-us.net>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208201353.GA928427@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.229, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
> On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > > 
> > > A cq head doorbell mmio is skipped... And it is not the fault of the
> > > kernel. The kernel is in it's good right to skip the mmio since the cq
> > > eventidx is not properly updated.
> > > 
> > > Adding that and it boots properly on riscv. But I'm perplexed as to why
> > > this didnt show up on our regularly tested platforms.
> > > 
> > > Gonna try to get this in for 7.2!
> > 
> > I see another problem with sparc64.
> > 
> > [    5.261508] could not locate request for tag 0x0
> > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> > 
> > That is seen repeatedly until the request times out. I'll test with
> > your patch to see if it resolves this problem as well, and will bisect
> > otherwise.
> > 
> The second problem is unrelated to the doorbell problem.
> It is first seen in qemu v7.1. I'll try to bisect.
> 

Unfortunately, the problem observed with sparc64 also bisects to this
patch. Making things worse, "hw/nvme: fix missing cq eventidx update"
does not fix it (which is why I initially thought it was unrelated).

I used the following qemu command line.

qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -snapshot \
    -device nvme,serial=foo,drive=d0,bus=pciB \
    -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
    -kernel arch/sparc/boot/image -no-reboot \
    -append "root=/dev/nvme0n1 console=ttyS0" \
    -nographic -monitor none

Guenter

