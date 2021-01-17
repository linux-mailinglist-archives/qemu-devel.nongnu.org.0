Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404302F9268
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 14:08:28 +0100 (CET)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l17n8-0004fp-Ns
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 08:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l17gQ-0003FS-LY; Sun, 17 Jan 2021 08:01:32 -0500
Received: from smtpout2.vodafonemail.de ([145.253.239.133]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l17gC-0004oJ-PE; Sun, 17 Jan 2021 08:01:30 -0500
Received: from smtp.vodafone.de (unknown [10.2.0.34])
 by smtpout2.vodafonemail.de (Postfix) with ESMTP id 43623124D20;
 Sun, 17 Jan 2021 14:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
 s=vfde-smtpout-mb-15sep; t=1610888452;
 bh=dAC9St0GiraEredLuGklJ2yPc7IG16AZTRz5O5sR7fY=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=LZ8GprD0AsPHO0ZbRoelt9oYfCPfqRT6Yew3FTaPqr1xwbMjFr9+llgemJMN69d+c
 LYF6t9xhKmOA+Plg9Lji2deKd8HHDttNwKiwc+gp/TjymVq7eLvwLEiniBImrcttaH
 X513GV/ZBFgcxOUXRzxGk17ZcsuayZaq4m8INHZ0=
Received: from macbook-pro.kuh-wiese.my-router.de
 (dslb-002-206-141-230.002.206.pools.vodafone-ip.de [2.206.141.230])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id BC9FD141777;
 Sun, 17 Jan 2021 13:00:51 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
From: Stefan <stefan-guix@vodafonemail.de>
In-Reply-To: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
Date: Sun, 17 Jan 2021 14:00:49 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <551517CC-E3DB-4B33-9064-DAC7D2BCF600@vodafonemail.de>
References: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
To: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
X-Mailer: Apple Mail (2.3124)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 310
X-purgate-ID: 155817::1610888451-00003440-1F98B3C6/0/0
Received-SPF: pass client-ip=145.253.239.133;
 envelope-from=stefan-guix@vodafonemail.de; helo=smtpout2.vodafonemail.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

=
http://patchwork.ozlabs.org/project/qemu-devel/patch/60AA0765-53DD-43D1-A3=
D2-75F1778526F6@vodafonemail.de/


Hi!

I=E2=80=99d like to remind you to this trivial patch to get ioclt(=E2=80=A6=
, SIOCGIFCONF, =E2=80=A6) working properly on 64 bit target =
architectures.


Bye

Stefan=

