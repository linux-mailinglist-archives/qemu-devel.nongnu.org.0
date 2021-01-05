Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7BE2EB383
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:32:31 +0100 (CET)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kws4D-0000Zg-KV
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matevz.langus@borea.si>)
 id 1kws1k-0007yG-CH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:29:56 -0500
Received: from ris.borea.si ([193.77.156.21]:53960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matevz.langus@borea.si>)
 id 1kws1h-0001JU-Rq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:29:56 -0500
Received: from ris.borea.si (ris.borea.si [127.0.0.1])
 by ris.borea.si (Postfix) with ESMTP id 4D9Mr80ylGzV2
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 19:24:24 +0000 (UTC)
Authentication-Results: ris.borea.si (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=borea.si
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=borea.si; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:to; s=dkim; t=1609874663; x=
 1612466664; bh=XABEDaMpXYz6jG32cKVeGq9281G+TskJMLkDe5KanVE=; b=s
 y6JRVtNRg81Boi5mUrzknoIjFRbwW1MMRqYXlcO3XbbmBZLornkctJqe0JjpuDzz
 jsLH/wUgKba9JUKRckpxHmXDcBL6TrHuOAAKH+J2hqdXhUolorf7zK6tEUn4lQEP
 zW2vMdv3QJ7oTDS0cNYp83tXBvo4c//kz6qjAP4uoY=
X-Virus-Scanned: Debian amavisd-new at ris.borea.si
Received: from ris.borea.si ([127.0.0.1])
 by ris.borea.si (ris.borea.si [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8XgFtziKiTpS for <qemu-devel@nongnu.org>;
 Tue,  5 Jan 2021 19:24:23 +0000 (UTC)
Received: from Matevz-Languss-MacBookPro-3.local (_gateway [192.168.234.249])
 by ris.borea.si (Postfix) with ESMTPSA id 4D9Mr75NWKzKq;
 Tue,  5 Jan 2021 19:24:23 +0000 (UTC)
To: laurent@vivier.eu
From: Matevz Langus <matevz.langus@borea.si>
Subject: [PATCH] linux-user: Add ETHTOOL ioctl
Message-ID: <9272ff58-82a7-d687-8a33-05796c643b5b@borea.si>
Date: Tue, 5 Jan 2021 20:24:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:52.0)
 Gecko/20100101 PostboxApp/7.0.43
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=193.77.156.21;
 envelope-from=matevz.langus@borea.si; helo=ris.borea.si
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handling of ETHTOOL ioctl was not implemented.

Signed-off-by: Matevz Langus <matevz.langus@borea.si>
---
 =C2=A0linux-user/ioctls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
 =C2=A0linux-user/syscall_defs.h | 1 +
 =C2=A02 files changed, 2 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 661b5daa9f..3e5c220199 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -362,6 +362,7 @@
 =C2=A0=C2=A0 IOCTL(SIOCSIFHWADDR, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockadd=
r_ifreq)))
 =C2=A0=C2=A0 IOCTL(SIOCGIFTXQLEN, IOC_W | IOC_R,=20
MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
 =C2=A0=C2=A0 IOCTL(SIOCSIFTXQLEN, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockadd=
r_ifreq)))
+=C2=A0 IOCTL(SIOCETHTOOL, IOC_R | IOC_W, MK_PTR(MK_STRUCT(STRUCT_ptr_ifr=
eq)))
 =C2=A0=C2=A0 IOCTL(SIOCGIFMETRIC, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT=
_int_ifreq)))
 =C2=A0=C2=A0 IOCTL(SIOCSIFMETRIC, IOC_W, MK_PTR(MK_STRUCT(STRUCT_int_ifr=
eq)))
 =C2=A0=C2=A0 IOCTL(SIOCGIFMTU, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_in=
t_ifreq)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a00bfc2647..d9301fecc9 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -903,6 +903,7 @@ struct target_rtc_pll_info {

 =C2=A0#define TARGET_SIOCGIFTXQLEN=C2=A0=C2=A0 0x8942=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Get the tx queue=20
length=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
 =C2=A0#define TARGET_SIOCSIFTXQLEN=C2=A0=C2=A0 0x8943=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set the tx queue=20
length=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
+#define TARGET_SIOCETHTOOL=C2=A0=C2=A0=C2=A0=C2=A0 0x8946=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Ethtool=20
interface=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 */

 =C2=A0/* ARP cache control calls. */
 =C2=A0#define TARGET_OLD_SIOCDARP=C2=A0=C2=A0=C2=A0 0x8950=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* old delete ARP table=20
entry=C2=A0=C2=A0 */
--=20
2.24.3 (Apple Git-128)

