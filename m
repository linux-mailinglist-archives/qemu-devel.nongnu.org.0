Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E594AE325
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:55:23 +0100 (CET)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYSI-0002rX-AA
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:55:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1nHXz3-0006S2-Ex; Tue, 08 Feb 2022 16:25:11 -0500
Received: from rn-mailsvcp-ppex-lapp45.rno.apple.com ([17.179.253.49]:37630
 helo=rn-mailsvcp-ppex-lapp45.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1nHXyz-0001wX-H2; Tue, 08 Feb 2022 16:25:07 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp45.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp45.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 218L9wAH016254; Tue, 8 Feb 2022 13:25:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=1HnOBy94IwfqYl7pjVzCXTYCgP2pb4mwnRuajn3eLmY=;
 b=kaug1jdvypli4w3uZnFAErACjD9pQUfrG4KCAbgDLSQkDu0gf8dW8/3ylIAsF+xRa6sd
 ACxlnl7R44vi8C94aGba+7yWR5N9FHof4uJUX69u1Le8xhdXFg63t3wbcP0PcMf7TmN9
 TD98HDQ+L2w5IFiTzPR4bswKhrK7vwUyPhza5bJj+UcOdp6ETvkJbfL8KStJ6KmiDQBF
 jPIywwiIQ+smw8FIj7owxbargvdTv62kTJYGCajHu/I019OZQ9gDIac6IXPgAvZEVXyj
 Q2pzy728qU7Yc+zLjRcZXceTfeoAy3SPK3BTUL95cZAI7FxMr7pLRxtFAyNjJ2Z7mbC9 FQ== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by rn-mailsvcp-ppex-lapp45.rno.apple.com with ESMTP id 3e1rdw2vcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 08 Feb 2022 13:25:04 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7000NRS8TRSD70@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Tue, 08 Feb 2022 13:25:03 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7000H008RSOL00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 08 Feb 2022 13:25:03 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 16f626147f7367ea3787748dc0255bf0
X-Va-E-CD: f4eddad3b57a264b2be953ea0d8040c0
X-Va-R-CD: 737e400e4e3995eefa44c59dd587b24b
X-Va-CD: 0
X-Va-ID: ba671030-a90e-4382-b7fb-62ccdcc471b3
X-V-A: 
X-V-T-CD: 16f626147f7367ea3787748dc0255bf0
X-V-E-CD: f4eddad3b57a264b2be953ea0d8040c0
X-V-R-CD: 737e400e4e3995eefa44c59dd587b24b
X-V-CD: 0
X-V-ID: ea2ed6b3-f2c3-4bd1-b480-4e15ec413d55
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-08_06:2022-02-07,
 2022-02-08 signatures=0
Received: from smtpclient.apple ([17.149.229.60])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R70002M78T1QD10@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 08 Feb 2022 13:25:02 -0800 (PST)
Content-type: text/plain; charset=utf-8
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] hvf: Use standard CR0 and CR4 register definitions
From: Cameron Esfahani <dirty@apple.com>
In-reply-to: <a2e059da-4c3a-66b7-6ce6-2b2fed0f980a@redhat.com>
Date: Tue, 08 Feb 2022 13:25:02 -0800
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Content-transfer-encoding: quoted-printable
Message-id: <8413E8AB-3EB1-42D4-A02C-EC5CADE13D51@apple.com>
References: <20211029013315.79207-1-dirty@apple.com>
 <a2e059da-4c3a-66b7-6ce6-2b2fed0f980a@redhat.com>
To: QEMU Trivial <qemu-trivial@nongnu.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-08_06:2022-02-07,
 2022-02-08 signatures=0
Received-SPF: pass client-ip=17.179.253.49; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp45.apple.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping

Cameron

> On Oct 28, 2021, at 11:09 PM, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> On 10/29/21 03:33, Cameron Esfahani wrote:
>> No need to have our own definitions of these registers.
>>=20
>> Signed-off-by: Cameron Esfahani <dirty@apple.com>
>> ---
>> target/i386/hvf/vmx.h      | 17 +++++++++--------
>> target/i386/hvf/x86.c      |  6 +++---
>> target/i386/hvf/x86.h      | 34 ----------------------------------
>> target/i386/hvf/x86_mmu.c  |  2 +-
>> target/i386/hvf/x86_task.c |  3 ++-
>> 5 files changed, 15 insertions(+), 47 deletions(-)
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
>=20


