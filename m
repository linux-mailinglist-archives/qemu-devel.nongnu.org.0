Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3B528D62
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 20:47:04 +0200 (CEST)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqfkF-0005T5-Bi
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 14:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nqfhx-0004e2-SJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 14:44:41 -0400
Received: from sysprogs.com ([45.79.83.98]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nqfhv-00020v-Df
 for qemu-devel@nongnu.org; Mon, 16 May 2022 14:44:40 -0400
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id B8F9B11A1FB;
 Mon, 16 May 2022 18:44:36 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>,
	<qemu-devel@nongnu.org>
References: <004101d86732$0d33bd70$279b3850$@sysprogs.com>
 <e1229b1f-d94e-6529-311e-30999741fadc@redhat.com>
In-Reply-To: <e1229b1f-d94e-6529-311e-30999741fadc@redhat.com>
Subject: RE: [PATCH] whpx: Added support for saving/restoring VM state
Date: Mon, 16 May 2022 11:44:34 -0700
Message-ID: <021801d86954$fe4cb940$fae62bc0$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGju1X+FE0XGWjqIp7RwfyaKhTT0QIlouyPrXn+xXA=
Content-Language: en-us
Received-SPF: pass client-ip=45.79.83.98; envelope-from=ivan@sysprogs.com;
 helo=sysprogs.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

Hi Paolo,

>What are the differences?  Is it using the XSAVEC/XSAVES ("compacted") =
format?

I am not very familiar with the format internals, so I briefly checked =
whether I could reuse the general logic from the HVF port. Here's what I =
got on a booted Linux VM:

WHvGetVirtualProcessorXsaveState() returned this block (844 bytes):

7f 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
a0 1f 00 00 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 58 65 c8 34 7f 00 00 =
04 7f 65 c8 34 7f 00 00 44 e1 68 c8 34 7f 00 00 f8 35 65 c8 34 7f 00 00 =
ec 4f 65 c8 34 7f 00 00 5c 4f 6a c8 34 7f 00 00 d0 7d 65 c8 34 7f 00 00 =
3c 6a 67 c8 34 7f 00 00 64 90 67 c8 34 7f 00 00 9c 0c 78 c8 34 7f 00 00 =
3c 6a 67 c8 34 7f 00 00 40 60 65 c8 34 7f 00 00 5c 4f 6a c8 34 7f 00 00 =
d0 7d 65 c8 34 7f 00 00 f8 35 65 c8 34 7f 00 00 ec 4f 65 c8 34 7f 00 00 =
70 3d 66 cb 34 7f 00 00 00 00 00 00 00 00 00 00 69 00 65 00 6f 00 20 00 =
00 00 00 00 00 00 00 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 =
ff 00 00 00 ff ff 00 00 00 00 00 00 00 00 ff ff 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 02 00 00 00 0c 00 00 00 05 00 00 00 22 00 00 00 =
05 00 00 00 10 00 00 00 05 00 00 00 22 00 00 00 10 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00 07 00 00 00 00 00 00 80 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Passing it to x86_cpu_xrstor_all_areas()/x86_cpu_xsave_all_areas() =
changed the following values:

0x0000001C: ff ff -> 00 00
0x00000208: 07 -> 00
0x0000020F: 80 -> 00

Trying to pass the updated block to WHvSetVirtualProcessorXsaveState() =
just made it reject the entire block with error c0350005 (generic =
"invalid parameter").

I haven't looked too deep into it, since just saving the state "as is" =
is sufficient to get the snapshots working. If there is something =
obvious I missed, I can give it another brief try.

Best,
Ivan


