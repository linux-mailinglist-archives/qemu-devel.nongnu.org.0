Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06755F1FD2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 23:36:41 +0200 (CEST)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oekA4-0008KN-Tb
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 17:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <whitebox@nefkom.net>)
 id 1oek83-0006Cf-9z
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 17:34:36 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:60540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <whitebox@nefkom.net>)
 id 1oek7z-0005dJ-2N
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 17:34:33 -0400
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Mg0jW1rSxz1r4pV;
 Sat,  1 Oct 2022 23:34:23 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
 by mail.m-online.net (Postfix) with ESMTP id 4Mg0jW0d8Bz1qqlR;
 Sat,  1 Oct 2022 23:34:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new,
 port 10024)
 with ESMTP id CfpVeeynmBZD; Sat,  1 Oct 2022 23:34:22 +0200 (CEST)
X-Auth-Info: LEO2IvZ0zjCMUMaBA4SUrgyAgsUYynV5KL2uDaPmES9Y8m6A8OBqOhQV6z08wcA3
Received: from igel.home (dynamic-046-114-032-234.46.114.pool.telefonica.de
 [46.114.32.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat,  1 Oct 2022 23:34:22 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 195912C25F9; Sat,  1 Oct 2022 23:34:21 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
References: <20220802164134.1851910-1-berrange@redhat.com>
X-Yow: ONE:  I will donate my entire ``BABY HUEY'' comic book collection
 to the downtown PLASMA CENTER..
 TWO:  I won't START a BAND called ``KHADAFY & THE HIT SQUAD''..
 THREE:  I won't ever TUMBLE DRY my FOX TERRIER again!!
Date: Sat, 01 Oct 2022 23:34:20 +0200
In-Reply-To: <20220802164134.1851910-1-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 2 Aug 2022 12:41:34
 -0400")
Message-ID: <878rlzkz37.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.18.0.9; envelope-from=whitebox@nefkom.net;
 helo=mail-out.m-online.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Aug 02 2022, Daniel P. Berrangé wrote:

> This patch removes linux/fs.h, meaning we have to define
> various FS_IOC constants that are now unavailable.

This breaks a lot of ioctl emulations, as it lacks their definitions:

#define BLKGETSIZE64                   _IOR(0x12,114,size_t)
#define BLKDISCARD                     _IO(0x12,119)
#define BLKIOMIN                       _IO(0x12,120)
#define BLKIOOPT                       _IO(0x12,121)
#define BLKALIGNOFF                    _IO(0x12,122)
#define BLKPBSZGET                     _IO(0x12,123)
#define BLKDISCARDZEROES               _IO(0x12,124)
#define BLKSECDISCARD                  _IO(0x12,125)
#define BLKROTATIONAL                  _IO(0x12,126)
#define BLKZEROOUT                     _IO(0x12,127)

#define FIBMAP                         _IO(0x00,1)
#define FICLONE                        _IOW(0x94, 9, int)
#define FIGETBSZ                       _IO(0x00,2)

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

