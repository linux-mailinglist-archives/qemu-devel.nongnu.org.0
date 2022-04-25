Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7950E133
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:10:55 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niyUO-0001uO-3h
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1niyNC-00045s-5z
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:03:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1niyN5-00073k-0X
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:03:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id j15so7507829wrb.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 06:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LIf9PzTktMxRQqGSfPt7Nt5OV4QuXNlh1ValkjveCxk=;
 b=myZXhvr+D52pwH6NiueV2J443XZ0Qj45yneMdFUT9oAnqDED9CH9PUe6BtcGJvBqLd
 fF1Or3zxA+YzxkGhkCfq8EQ0epaxFCNcpE6lyOZAOLujfQVAQrgvFyoBqdVHynDf1Cf/
 zLJ7E41f2+8OE1rxuVG+ercgO7V6U4fX4fNRays2J+OZf/87toHERm8UZszc2sAiiWn5
 1oM3go/LJRK48uCEMRoqUFSx84h4oyotvVS35M2vDVAV06ztZrEJuQk2tD+bFckrTFcJ
 WjLGWBzXO7NeuqgOGppYzgddvrqWOGt/kW7kcpJEMgiTfS5YPVmUrpMiPaS0cp+RcQws
 oDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LIf9PzTktMxRQqGSfPt7Nt5OV4QuXNlh1ValkjveCxk=;
 b=UwblPbfD/PtyMBetwSUgH6275fJyVqzsaicvM8Wg52iHzikWfPp6fxufibxFPhGAlO
 puE8PubULWijnw05cwLnh8+TtnGIh4uOfCH3EAH6HcU6O7nTUvxZ9vPuXz0d3fEfk7Md
 8c4E/Lpv33whFEyli4dOc4g3K5upKkoicqwqit1/n4Gus0auvKH20Xly4kECAVBEh+q/
 oknvcjZh2p30zsknOSD58NCJYcfwYKHCtSGGXKrw9vgv+qhMYE1tfX4hjDOO6vROqtmX
 7YRVNn7dvuvnsqAwfdC7dlwH24ZxVoeqPgduIA8MN6RYFZtyDLC7etYBGpHBgkAOyqyh
 EyPQ==
X-Gm-Message-State: AOAM5339jJExUFAAKL+/JsO9zVUXzXNK13h6dIPO9S7UBmA2N7E0gdAU
 5R5hrXXHLMxBh6AxH4KrefuwnQ==
X-Google-Smtp-Source: ABdhPJzv2AQolCjuFOl8kZznoyf/XxdDutig2M7iemTBWRCNHtmzW4F2Z7Iv+4et1sQUCHREThR9nA==
X-Received: by 2002:adf:e646:0:b0:20a:c4fa:4991 with SMTP id
 b6-20020adfe646000000b0020ac4fa4991mr13709320wrn.413.1650891794668; 
 Mon, 25 Apr 2022 06:03:14 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 v188-20020a1cacc5000000b0038e9c60f0e7sm8763280wme.28.2022.04.25.06.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:03:14 -0700 (PDT)
Date: Mon, 25 Apr 2022 15:03:11 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmacD3eroYTnjUdx@Red>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
 <YmWgn2OGoZ9Uyirh@Red> <YmZ1pCU+0bP/LFPU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmZ1pCU+0bP/LFPU@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=clabbe@baylibre.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le Mon, Apr 25, 2022 at 11:19:16AM +0100, Daniel P. Berrangé a écrit :
> On Sun, Apr 24, 2022 at 09:10:23PM +0200, LABBE Corentin wrote:
> > Le Thu, Apr 21, 2022 at 01:38:00PM +0100, Peter Maydell a écrit :
> > > On Sun, 10 Apr 2022 at 20:12, Corentin Labbe <clabbe@baylibre.com> wrote:
> > > >
> > > > From: Corentin LABBE <clabbe@baylibre.com>
> > > >
> > > > The Allwinner A10 has a cryptographic offloader device which
> > > > could be easily emulated.
> > > > The emulated device is tested with Linux only as any of BSD does not
> > > > support it.
> > > >
> > > > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> > > 
> > > Hi; thanks for this patch, and sorry it's taken me a while to get
> > > to reviewing it.
> > > 
> > > (Daniel, I cc'd you since this device model is making use of crypto
> > > related APIs.)
> > > 
> > > Firstly, a note on patch structure. This is quite a large patch,
> > > and I think it would be useful to split it at least into two parts:
> > >  (1) add the new device model
> > >  (2) change the allwinner SoC to create that new device
> > 
> > Hello
> > 
> > I will do it for next iteration
> > 
> > > 
> > > > diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> > > > index 344ff8cef9..7836643ba4 100644
> > > > --- a/docs/system/arm/cubieboard.rst
> > > > +++ b/docs/system/arm/cubieboard.rst
> > > > @@ -14,3 +14,4 @@ Emulated devices:
> > > >  - SDHCI
> > > >  - USB controller
> > > >  - SATA controller
> > > > +- crypto
> > > > diff --git a/docs/system/devices/allwinner-sun4i-ss.rst b/docs/system/devices/allwinner-sun4i-ss.rst
> > > > new file mode 100644
> > > > index 0000000000..6e7d2142b5
> > > > --- /dev/null
> > > > +++ b/docs/system/devices/allwinner-sun4i-ss.rst
> > > > @@ -0,0 +1,31 @@
> > > > +Allwinner sun4i-ss
> > > > +==================
> > > 
> > > If you create a new rst file in docs, you need to put it into the
> > > manual by adding it to some table of contents. Otherwise sphinx
> > > will complain when you build the documentation, and users won't be
> > > able to find it. (If you pass 'configure' the --enable-docs option
> > > that will check that you have everything installed to be able to
> > > build the docs.)
> > > 
> > > There are two options here: you can have this document, and
> > > add it to the toctree in docs/system/device-emulation.rst, and
> > > make the "crypto" bullet point in cubieboard.rst be a hyperlink to
> > > the device-emulation.rst file. Or you can compress the information
> > > down and put it into orangepi.rst.
> > > 
> > > > +The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
> > > > +present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
> > > > +In qemu only A10 via the cubieboard machine is supported.
> > > > +
> > > > +The emulated hardware is capable of handling the following algorithms:
> > > > +- SHA1 and MD5 hash algorithms
> > > > +- AES/DES/DES3 in CBC/ECB
> > > > +- PRNG
> > > > +
> > > > +The emulated hardware does not handle yet:
> > > > +- CTS for AES
> > > > +- CTR for AES/DES/DES3
> > > > +- IRQ and DMA mode
> > > > +Anyway the Linux driver also does not handle them yet.
> > > > +
> > > > +The emulation needs a real crypto backend, for the moment only gnutls/nettle is supported.
> > > > +So the device emulation needs qemu to be compiled with optionnal gnutls.
> > > 
> > > > diff --git a/hw/Kconfig b/hw/Kconfig
> > > > index ad20cce0a9..43bd7fc14d 100644
> > > > --- a/hw/Kconfig
> > > > +++ b/hw/Kconfig
> > > > @@ -6,6 +6,7 @@ source audio/Kconfig
> > > >  source block/Kconfig
> > > >  source char/Kconfig
> > > >  source core/Kconfig
> > > > +source crypto/Kconfig
> > > >  source display/Kconfig
> > > >  source dma/Kconfig
> > > >  source gpio/Kconfig
> > > 
> > > I don't think we really need a new subdirectory of hw/
> > > for a single device. If you can find two other devices that
> > > already exist in QEMU that would also belong in hw/crypto/
> > > then we can create it. Otherwise just put this device in
> > > hw/misc.
> > 
> > I plan to add at least one other hw/crypto device (allwinner H3 sun8i-ce).
> > I have another one already ready (rockchip rk3288) but I delay it since there are no related SoC in qemu yet.
> > 
> > > 
> > > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > > index 97f3b38019..fd8232b1d4 100644
> > > > --- a/hw/arm/Kconfig
> > > > +++ b/hw/arm/Kconfig
> > > > @@ -317,6 +317,7 @@ config ALLWINNER_A10
> > > >      select AHCI
> > > >      select ALLWINNER_A10_PIT
> > > >      select ALLWINNER_A10_PIC
> > > > +    select ALLWINNER_CRYPTO_SUN4I_SS
> > > >      select ALLWINNER_EMAC
> > > >      select SERIAL
> > > >      select UNIMP
> > > > diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> > > > index 05e84728cb..e9104ee028 100644
> > > > --- a/hw/arm/allwinner-a10.c
> > > > +++ b/hw/arm/allwinner-a10.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include "hw/misc/unimp.h"
> > > >  #include "sysemu/sysemu.h"
> > > >  #include "hw/boards.h"
> > > > +#include "hw/crypto/allwinner-sun4i-ss.h"
> > > >  #include "hw/usb/hcd-ohci.h"
> > > >
> > > >  #define AW_A10_MMC0_BASE        0x01c0f000
> > > > @@ -32,6 +33,7 @@
> > > >  #define AW_A10_EMAC_BASE        0x01c0b000
> > > >  #define AW_A10_EHCI_BASE        0x01c14000
> > > >  #define AW_A10_OHCI_BASE        0x01c14400
> > > > +#define AW_A10_CRYPTO_BASE      0x01c15000
> > > >  #define AW_A10_SATA_BASE        0x01c18000
> > > >  #define AW_A10_RTC_BASE         0x01c20d00
> > > >
> > > > @@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
> > > >
> > > >      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
> > > >
> > > > +#if defined CONFIG_NETTLE
> > > > +    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
> > > > +#endif
> > > 
> > > Don't put this kind of ifdef into device/SoC code, please.
> > > The device emulation needs to work regardless of what
> > > the specific crypto backends that got compiled into QEMU are.
> > > 
> > > > +#include <nettle/aes.h>
> > > > +#include <nettle/cbc.h>
> > > > +#include <nettle/des.h>
> > > > +#include <nettle/md5.h>
> > > > +#include <nettle/sha1.h>
> > > 
> > > Similarly, don't directly include nettle headers. The device needs
> > > to use the backend-agnostic headers from include/crypto. To the
> > > extent that they aren't sufficient to implement this device we
> > > can look at enhancing them.
> > 
> > Problem is that current qemu crypto backends do not have necessary
> > functions needed by this driver, I need to do basic MD5 transform
> > with custom IV.
> > I will check if it can be added in qemu crypto API.
> 
> If you don't want to/can't extend the crypto API, then at least
> use the crypto API for all the pieces where it is possible to do
> so. That way, we can clearly see where the gaps remain for this
> device.
> 

Hello

Cipher operations are converted to the qemu API without problem, qemu API permits to even made it simplier. (same code path for des/3des/aes).

But for hashs, only nettle has the needed function in its API. (I checked gcrypt, gnutls and glib).
I have added hashcompress in crypto API but not sure if it is worth it if only nettle support it.
Note that nettle export compress functions in its header only for sha1 and md5, but I will send a fix to nettle to include others shaXXX (which will be needed for crypto/sun8i-ce).

Regards

diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
index 1ca1a41062..b9342b4fe1 100644
--- a/crypto/hash-nettle.c
+++ b/crypto/hash-nettle.c
@@ -26,10 +26,22 @@
 #include <nettle/sha.h>
 #include <nettle/ripemd160.h>
 
+#ifndef nettle_sha256_compress
+#define nettle_sha256_compress _nettle_sha256_compress
+void _nettle_sha256_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
+#endif
+
+#ifndef nettle_sha512_compress
+#define nettle_sha512_compress _nettle_sha512_compress
+void _nettle_sha512_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
+#endif
+
 typedef void (*qcrypto_nettle_init)(void *ctx);
 typedef void (*qcrypto_nettle_write)(void *ctx,
                                      size_t len,
                                      const uint8_t *buf);
+typedef void (*qcrypto_nettle_compress)(uint32_t *state,
+                                     const uint8_t *buf);
 typedef void (*qcrypto_nettle_result)(void *ctx,
                                       size_t len,
                                       uint8_t *buf);
@@ -47,18 +59,21 @@ union qcrypto_hash_ctx {
 struct qcrypto_hash_alg {
     qcrypto_nettle_init init;
     qcrypto_nettle_write write;
+    qcrypto_nettle_compress compress;
     qcrypto_nettle_result result;
     size_t len;
 } qcrypto_hash_alg_map[] = {
     [QCRYPTO_HASH_ALG_MD5] = {
         .init = (qcrypto_nettle_init)md5_init,
         .write = (qcrypto_nettle_write)md5_update,
+        .compress = (qcrypto_nettle_compress)nettle_md5_compress,
         .result = (qcrypto_nettle_result)md5_digest,
         .len = MD5_DIGEST_SIZE,
     },
     [QCRYPTO_HASH_ALG_SHA1] = {
         .init = (qcrypto_nettle_init)sha1_init,
         .write = (qcrypto_nettle_write)sha1_update,
+        .compress = (qcrypto_nettle_compress)nettle_sha1_compress,
         .result = (qcrypto_nettle_result)sha1_digest,
         .len = SHA1_DIGEST_SIZE,
     },
@@ -70,6 +85,7 @@ struct qcrypto_hash_alg {
     },
     [QCRYPTO_HASH_ALG_SHA256] = {
         .init = (qcrypto_nettle_init)sha256_init,
+        .compress = (qcrypto_nettle_compress)_nettle_sha256_compress,
         .write = (qcrypto_nettle_write)sha256_update,
         .result = (qcrypto_nettle_result)sha256_digest,
         .len = SHA256_DIGEST_SIZE,
@@ -82,6 +98,7 @@ struct qcrypto_hash_alg {
     },
     [QCRYPTO_HASH_ALG_SHA512] = {
         .init = (qcrypto_nettle_init)sha512_init,
+        .compress = (qcrypto_nettle_compress)_nettle_sha512_compress,
         .write = (qcrypto_nettle_write)sha512_update,
         .result = (qcrypto_nettle_result)sha512_digest,
         .len = SHA512_DIGEST_SIZE,
@@ -156,6 +173,32 @@ qcrypto_nettle_hash_bytesv(QCryptoHashAlgorithm alg,
 }
 
 
+static int
+qcrypto_nettle_compress_bytesv(QCryptoHashAlgorithm alg,
+                           const struct iovec *iov,
+                           size_t niov,
+                           uint32_t *state,
+                           Error **errp)
+{
+    size_t i;
+
+    if (!qcrypto_hash_supports(alg)) {
+        error_setg(errp,
+                   "Unknown hash algorithm %d",
+                   alg);
+        return -1;
+    }
+
+    for (i = 0; i < niov; i++) {
+        uint8_t *data = iov[i].iov_base;
+        qcrypto_hash_alg_map[alg].compress(state, data);
+    }
+
+    return 0;
+}
+
+
 QCryptoHashDriver qcrypto_hash_lib_driver = {
     .hash_bytesv = qcrypto_nettle_hash_bytesv,
+    .compress_bytesv = qcrypto_nettle_compress_bytesv,
 };
diff --git a/crypto/hash.c b/crypto/hash.c
index b0f8228bdc..27f1ce08ee 100644
--- a/crypto/hash.c
+++ b/crypto/hash.c
@@ -142,3 +142,24 @@ int qcrypto_hash_base64(QCryptoHashAlgorithm alg,
 
     return qcrypto_hash_base64v(alg, &iov, 1, base64, errp);
 }
+
+int qcrypto_compress_bytesv(QCryptoHashAlgorithm alg,
+                        const struct iovec *iov,
+                        size_t niov,
+                        uint32_t *state,
+                        Error **errp)
+{
+    return qcrypto_hash_lib_driver.compress_bytesv(alg, iov, niov, state, errp);
+}
+
+int qcrypto_compress_bytes(QCryptoHashAlgorithm alg,
+                       const char *buf,
+                       size_t len,
+                       uint32_t *state,
+                       Error **errp)
+{
+    struct iovec iov = { .iov_base = (char *)buf,
+                         .iov_len = len };
+    return qcrypto_compress_bytesv(alg, &iov, 1, state, errp);
+}
+
diff --git a/crypto/hashpriv.h b/crypto/hashpriv.h
index cee26ccb47..b1d6a3d82f 100644
--- a/crypto/hashpriv.h
+++ b/crypto/hashpriv.h
@@ -24,6 +24,11 @@ struct QCryptoHashDriver {
                        uint8_t **result,
                        size_t *resultlen,
                        Error **errp);
+int qcrypto_compress_bytes(QCryptoHashAlgorithm alg,
+                       const char *buf,
+                       size_t len,
+                       uint32_t *state,
+                       Error **errp)
+{
+    struct iovec iov = { .iov_base = (char *)buf,
+                         .iov_len = len };
+    return qcrypto_compress_bytesv(alg, &iov, 1, state, errp);
+}
+
diff --git a/crypto/hashpriv.h b/crypto/hashpriv.h
index cee26ccb47..b1d6a3d82f 100644
--- a/crypto/hashpriv.h
+++ b/crypto/hashpriv.h
@@ -24,6 +24,11 @@ struct QCryptoHashDriver {
                        uint8_t **result,
                        size_t *resultlen,
                        Error **errp);
+    int (*compress_bytesv)(QCryptoHashAlgorithm alg,
+                       const struct iovec *iov,
+                       size_t niov,
+                       uint32_t *state,
+                       Error **errp);
 };
 
 extern QCryptoHashDriver qcrypto_hash_lib_driver;
diff --git a/include/crypto/hash.h b/include/crypto/hash.h
index 54d87aa2a1..770622919d 100644
--- a/include/crypto/hash.h
+++ b/include/crypto/hash.h
@@ -189,4 +189,15 @@ int qcrypto_hash_base64(QCryptoHashAlgorithm alg,
                         char **base64,
                         Error **errp);
 
+int qcrypto_compress_bytesv(QCryptoHashAlgorithm alg,
+                        const struct iovec *iov,
+                        size_t niov,
+                        uint32_t *state,
+                        Error **errp);
+
+int qcrypto_compress_bytes(QCryptoHashAlgorithm alg,
+                       const char *buf,
+                       size_t len,
+                       uint32_t *state,
+                       Error **errp);
 #endif /* QCRYPTO_HASH_H */


