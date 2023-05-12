Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D94700775
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:09:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxRZE-0004bm-Jk; Fri, 12 May 2023 08:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pxRZC-0004bL-7z; Fri, 12 May 2023 08:08:10 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pxRZA-0004bD-A3; Fri, 12 May 2023 08:08:09 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pxRZ6-001wbv-N2; Fri, 12 May 2023 14:08:04 +0200
Received: from p5b13afa1.dip0.t-ipconnect.de ([91.19.175.161]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pxRZ6-0011sW-F3; Fri, 12 May 2023 14:08:04 +0200
Message-ID: <e1685783222965dc89a4b13d25a9bdbc7a9166f7.camel@physik.fu-berlin.de>
Subject: Re: [PULL 1/6] linux-user/sparc: Don't use 16-bit UIDs on SPARC V9
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  qemu-block@nongnu.org, Gregor Riepl
 <onitake@gmail.com>, Zach van Rijn <me@zv.io>,  Richard Henderson
 <richard.henderson@linaro.org>
Date: Fri, 12 May 2023 14:08:03 +0200
In-Reply-To: <f1df90aa-8c5a-4b37-59c2-d62e3912cef6@vivier.eu>
References: <20230330131856.94210-1-philmd@linaro.org>
 <20230330131856.94210-2-philmd@linaro.org>
 <f1df90aa-8c5a-4b37-59c2-d62e3912cef6@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.175.161
X-ZEDAT-Hint: PO
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Laurent!

On Fri, 2023-05-12 at 13:13 +0200, Laurent Vivier wrote:
> This patch breaks something with LTP (20230127) test fchown05_16 on sid/s=
parc64:
>=20
> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
> fchown05.c:44: TPASS: fchown(3, 700, 701), change owner/group ids passed
> fchown05.c:44: TPASS: fchown(3, 702, -1), change owner id only passed
> fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 702 701
> fchown05.c:44: TPASS: fchown(3, 703, 701), change owner id only passed
> fchown05.c:44: TPASS: fchown(3, -1, 704), change group id only passed
> fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 703 704
> fchown05.c:44: TPASS: fchown(3, 703, 705), change group id only passed
> fchown05.c:44: TPASS: fchown(3, -1, -1), no change passed
> fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 703 705
>=20
> expected result;
>=20
> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
> fchown05.c:44: TPASS: fchown(3, 700, 701), change owner/group ids passed
> fchown05.c:44: TPASS: fchown(3, 702, -1), change owner id only passed
> fchown05.c:44: TPASS: fchown(3, 703, 701), change owner id only passed
> fchown05.c:44: TPASS: fchown(3, -1, 704), change group id only passed
> fchown05.c:44: TPASS: fchown(3, 703, 705), change group id only passed
> fchown05.c:44: TPASS: fchown(3, -1, -1), no change passed

Where do these tests reside? I'm not sure I know what LTP is. In any case,
the patch should be correct as QEMU needs to differentiate between 32-bit
and 64-bit SPARC.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

