Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529EE5E6683
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:11:46 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNrd-0007Bk-DQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obMg6-0001pv-CG; Thu, 22 Sep 2022 09:55:49 -0400
Received: from [200.168.210.66] (port=55804 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obMg3-0008Vq-Gj; Thu, 22 Sep 2022 09:55:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 22 Sep 2022 10:55:25 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9B35580012C;
 Thu, 22 Sep 2022 10:55:25 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 4/4] tests/docker: run script use realpath instead of
 readlink
Date: Thu, 22 Sep 2022 10:55:16 -0300
Message-Id: <20220922135516.33627-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922135516.33627-1-lucas.araujo@eldorado.org.br>
References: <20220922135516.33627-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Sep 2022 13:55:25.0853 (UTC)
 FILETIME=[F7606CD0:01D8CE8A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

The alpine docker image only comes with busybox, which doesn't have the
'-e' option on its readlink, so change it to 'realpath' to avoid that
problem.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 tests/docker/run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/run b/tests/docker/run
index 421393046b..9eb96129da 100755
--- a/tests/docker/run
+++ b/tests/docker/run
@@ -15,7 +15,7 @@ if test -n "$V"; then
     set -x
 fi
 
-BASE="$(dirname $(readlink -e $0))"
+BASE="$(dirname $(realpath $0))"
 
 # Prepare the environment
 export PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
-- 
2.25.1


