Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011FB456
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Apr 2019 20:35:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKSAh-000161-4b
	for lists+qemu-devel@lfdr.de; Sat, 27 Apr 2019 14:35:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hKS8c-0000Gu-UD
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 14:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hKS8c-00059a-49
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 14:33:26 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:40776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hKS8b-00057p-UH
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 14:33:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id E42C48EA0;
	Sat, 27 Apr 2019 20:33:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIZfFJaCp4rq; Sat, 27 Apr 2019 20:33:22 +0200 (CEST)
Received: from function (105.251.129.77.rev.sfr.net [77.129.251.105])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 26CB13633;
	Sat, 27 Apr 2019 20:33:22 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hKS8M-0003L8-1N; Sat, 27 Apr 2019 20:33:10 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 20:33:05 +0200
Message-Id: <20190427183307.12796-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.233.100.1
Subject: [Qemu-devel] [PATCHv4 0/2] ui/curses: BSD portability fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, kamil@netbsd.org,
	kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BSD needs a few fixes for wide character manipulations.

Difference with v1:
- Fix unitialized value in error message

Difference with v2:
- Add cchar_t manipulation fix

Difference with v3:
- use mbrtowc/wcrtomb instead of mbtowc/wctomb
- use MB_LEN_MAX instead of MB_CUR_MAX to avoid using a VLA.

Samuel Thibault (2):
  ui/curses: do not assume wchar_t contains unicode
  ui/curses: manipulate cchar_t with standard curses functions

 ui/curses.c | 194 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 126 insertions(+), 68 deletions(-)

--=20
2.20.1


