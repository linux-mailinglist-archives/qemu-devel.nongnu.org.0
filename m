Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080FD6E8E86
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtr-0006yW-Nj; Thu, 20 Apr 2023 05:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtg-0006mh-SX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:14 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtd-00082S-Sx
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984084; i=lukasstraub2@web.de;
 bh=t+LreNTwhEDOCl9wopvzlvV3nV6+vyqsz+LJ3YLrwmk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=uIkgJeooMPauOrVuUpzt6iC4HOPbarxcCnFnlFZFqUSvQBZ6BuT6+cmHq+HEZDGzI
 T9qbPkf2l4bQ2glKI644D3BNOGqr6UVeT9J03dlwGDMUMmYLRYbEjaudljrRy2z8sf
 4FVTzN4pfRxsfzrmFzUNWe0EvYLRNLIVMqCWLxpqFdPDHjE/BBrdq/LsZqWFZ/NML/
 zlbhnumQa03t6bu/5e2wdptgOImbW9tVN7kkd6Btdq8jnuoT3Jmjjv3WyFOmG+y46n
 /BIF8VcktIDga86e8GGF9Ti0S0l+lgNNMlZ/AvyrKGbIPikaoS5EvG+xji3eGuKWKV
 FiFGnYdCLKZeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1d7s-1qIGOS1LNA-012BxD; Thu, 20
 Apr 2023 11:48:04 +0200
Date: Thu, 20 Apr 2023 11:48:03 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 04/13] ram.c: Reset result after sending queued data
Message-ID: <01e40e659d664ec12470fb6495f00f1ee78d5cb3.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kyBS=5mWfb_ii4L98I+T7_/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:AlsPIqmGfukBd0RPCof/ZnptuG8lsIX9owHKDAK8zXZnbtdpsE8
 +X/DvtxUEIBmpAnxKj1kn2TGJr3mHUmXc8WEvIcezhYW90rsw742Vf+x5SWpTWeWVm5IoM8
 nsype4/MCbKP4Mr5SQnI0bG0QKXzGwdx2c6r0NeM+25k9cjPkqRHOSoMjhajmBeQuVR50iU
 Bsz+Ldk2jDAVhWROdR4Aw==
UI-OutboundReport: notjunk:1;M01:P0:Ketu+ru3RgQ=;GFBfzbgVBkEbRFyNDZQlMvH+dM+
 Byuwhh26zqbtB/AfPeQXy/O6pvI9ixUX0dR5p48JQi4POxrM2gDZKPspUuzVDDUZptmeCaqG0
 uNI/uozfiPTjPgMRxagOJTNJV7ggad9CiNL16Xn6LMFMf/76X5Dt+HfbS5DJs5GmmiD9Zqxw4
 IAIcjoB5ZUEU4LoTRgsW1SpmHhQxHdxg0/ffy2XE3RXbhnyqwJ9OwkhSIHrVXBTjOk6FKUIiM
 9CoILnblMA/Z6kFqmCa0rgO1ObDm0zUVWVXfxH0tzRlNwCucExDCI1Zwbfvw+AKwxlAE0+iLZ
 xkPu08Wc71kmcVpdcfSQKkxNDVt0FFGl1GtZiHkjjBoyiPdh4QCCd8hD3xXKWQDxjEaIQf1c3
 EVqoMsLSPz5vxz1TqunBe9wBRPO0iljyHSwyX9/Cktk40Ro88Gkw1CoHvQu+f8zJicZGXg0J2
 JhHd4y6EPnlgdzFhyJ5h+QOnU6HdLCK3pyudrSCRYq+nWb/0hqgahfbasAykrB7ZOHirXLz3Z
 t3zNbYnKX4wCjNDTmsXsYzZcGUsH7wEjT2Ixq13G+nhiFAfhxq8zq//8TkWOFOYkzU8moO/xm
 R/Wy9XP04mmEYV3xzlcmSBbL9LcFsa+4NcgStPQGGbTZEU3QPIzD0+cBlKNiHflKS0zbJBmk+
 Hu6VeOXNRWWBOmstFVmPQS0yOHak+16eLfb/ljzmk1CrS5V28aqdOy7Rqz48Xc7jZXfbWP4rM
 LyO5Er3Hos+drNR541kXm3VYSenlnDNA1Zcjt3+ZeMDvtFTSmAhte36C1VAmMNkSnXnykoaVo
 LZEzzIaJFknmev/V/fAzNSqBwJV+DjSnUsHgvOqiwodQnbgBtnbB65c6rKEFEi02vbwFQSaOa
 ePUUbwog5Lma+JFKFF5jSL0o5U4XHefoIM5Hpeo3nyFFLIDTXRFWDe7haGDD8/6dHs9zyR0Fu
 iECqjg==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/kyBS=5mWfb_ii4L98I+T7_/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

And take the param->mutex lock for the whole section to ensure
thread-safety.
Now, it is explicitly clear if there is no queued data to send.
Before, this was handled by param->file stream being empty and thus
qemu_put_qemu_file() not sending anything.

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 820b4ebaeb..5ca0f115cf 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1519,6 +1519,13 @@ update_compress_thread_counts(const CompressParam *p=
aram, int bytes_xmit)

 static bool save_page_use_compression(RAMState *rs);

+static inline void compress_reset_result(CompressParam *param)
+{
+    param->result =3D RES_NONE;
+    param->block =3D NULL;
+    param->offset =3D 0;
+}
+
 static void flush_compressed_data(RAMState *rs)
 {
     MigrationState *ms =3D migrate_get_current();
@@ -1540,13 +1547,16 @@ static void flush_compressed_data(RAMState *rs)
     for (idx =3D 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len =3D qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].fi=
le);
+            CompressParam *param =3D &comp_param[idx];
+            len =3D qemu_put_qemu_file(ms->to_dst_file, param->file);
+            compress_reset_result(param);
+
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
              * i.e, the thread should be waiting for a request at this poi=
nt.
              */
-            update_compress_thread_counts(&comp_param[idx], len);
+            update_compress_thread_counts(param, len);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
     }
@@ -1571,15 +1581,17 @@ static int compress_page_with_multi_thread(RAMBlock=
 *block, ram_addr_t offset)
 retry:
     for (idx =3D 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
-            comp_param[idx].done =3D false;
-            bytes_xmit =3D qemu_put_qemu_file(ms->to_dst_file,
-                                            comp_param[idx].file);
-            qemu_mutex_lock(&comp_param[idx].mutex);
-            set_compress_params(&comp_param[idx], block, offset);
-            qemu_cond_signal(&comp_param[idx].cond);
-            qemu_mutex_unlock(&comp_param[idx].mutex);
+            CompressParam *param =3D &comp_param[idx];
+            qemu_mutex_lock(&param->mutex);
+            param->done =3D false;
+            bytes_xmit =3D qemu_put_qemu_file(ms->to_dst_file, param->file=
);
+            compress_reset_result(param);
+            set_compress_params(param, block, offset);
+
+            update_compress_thread_counts(param, bytes_xmit);
+            qemu_cond_signal(&param->cond);
+            qemu_mutex_unlock(&param->mutex);
             pages =3D 1;
-            update_compress_thread_counts(&comp_param[idx], bytes_xmit);
             break;
         }
     }
--
2.40.0


--Sig_/kyBS=5mWfb_ii4L98I+T7_/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBClMACgkQNasLKJxd
slgBpA/+OgeaPmPVXas+NfbEXADUppcJHhp6vTW2Y72prv6MNTCOwAWCqfRfi/rQ
2Sh3unQI4Agi9/XSyWg7oD2RNsSYlGJB7N5dVh4B2BUVyrFoZGe2JcATv6xe79Ew
jqu3KG0a1LzLlOWWITchgILmcBp5QxOUo+3HecZ2lhIo1yCdeajoZBW/fHq9P+p7
SM4QmdKMJBEPL/5QdzG/QOhOeUNgEsKHCxLgsVjErwDAN8aytCsBI2qa6TiaC4Qb
toWssViDt7knujnx5ZF6F8NwBEl8EFzOxhnS6su98REeaQ/0ibIkBCMwceQ3NSRL
h4S7FSP1tr8YWq9pDutH9sPXYfUC9Lk9C9Jr7iEqFQewXtRmSB0T0fnedgGn6lm/
gqIX6RcfFJQ1ye+CL2MMWw/akpH6OiU2MTXysBKEllWpY1qYsnP3z6Nt4CD8hqjQ
JMthSscKrNthZabiUwT1nz7jD0OzQuuL/BhNApYPNiamvtbv7rb8Vbq7sPPuyA9+
Es1vIHDnTxR/6+GM2mtPjnH3dwm66noOiYgcs3DXCTp4iEEsP+n435nPNVv1Ggp7
uh5GVMx8DKTeKQcsNPFCV6ps1/PCD5NH9NUCb1kUkgJ0Vm3Z+5z5nuPlkca/sX2J
IqlH5VMEt+UhXNLuSg3OAfyJhHuxzmZ0WBuGPO/oDHfO4eJIQu8=
=2UQN
-----END PGP SIGNATURE-----

--Sig_/kyBS=5mWfb_ii4L98I+T7_/--

