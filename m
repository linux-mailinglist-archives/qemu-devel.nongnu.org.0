Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB44238D7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 09:28:02 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY1LN-0001AD-HK
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 03:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mY1JH-00087u-7y
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 03:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mY1JE-0006dO-5w
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 03:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633505146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yWJs9AbMHikhLW+bErlBY0viTXTRUDzOyZyuamie+Ns=;
 b=Xd401q04XMrtTpuvvPP/ck3WsbEN/phgYv5zL8u94pas+Vt7VgGS7wqv98kckc0WXTZvT3
 pCQNaosySdRXMUMg1o0yHgqO49E6QFUP/HdYxyqVYvqX2+ZE7JWcqRXifAdl7AHZNwA7vy
 zAaA6szeZ8LxtodEVokecnEVN5HZnl8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-SZym8Vj1PuquywNbyd_ABA-1; Wed, 06 Oct 2021 03:25:42 -0400
X-MC-Unique: SZym8Vj1PuquywNbyd_ABA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1261068wrg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 00:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=sAadFN34IVUwk+R+CU0k4vYjZd0WUaO5GnewcEAYmPo=;
 b=5pK0kgilT3DlPCN/u6vDgOWX6AdeGGTNtxmkTYppVssDH1QaPuuQDwW1tU6JRX37PZ
 453YGoiv94Rro9A9frm1+Q3I7dIRcIYMnTd9og+ExkjKV1oEqR9lot1kYasZGdyCnoC+
 xzJo9UF9SCvSRo1jQvEN3k/gtnq0SmYNgMw8M4113kckFNbQ5rAAWFn92xR/AwU9wZN5
 itrSd+ZXiZo0uBpbo6fQWrmN8FrKUp4iN27CeDyVrX5CWdfWRRaeqCIsuDudZ6ro4FkU
 oNfh3KSaC3gNwJLSh0I1E8ISmgGPNdkMMjZUgpTcixitWfIW1wvcxsOnlH1Tavfkj3vr
 6IQg==
X-Gm-Message-State: AOAM531nSTFUYH6mTNpuii0xgEIU5FPNxoh0YiF3yITJiqF8wiRD8s44
 oIMpLM6e9sDUih0uev6MPxzK5llayLVWoRCRSCw8MIut9xK/JNPpI6NNJ/LY8ulqC+uC72ARr6e
 m6fm8lEynw/MypUE=
X-Received: by 2002:a7b:c314:: with SMTP id k20mr8175522wmj.50.1633505141660; 
 Wed, 06 Oct 2021 00:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi7g4UW1m2q128nDx6pMPvGlznpt4R/W+ujiBRb4SlUnN6qDytKa5DrYZQho2geP5aQPQP6Q==
X-Received: by 2002:a7b:c314:: with SMTP id k20mr8175487wmj.50.1633505141273; 
 Wed, 06 Oct 2021 00:25:41 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o13sm619250wmh.30.2021.10.06.00.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 00:25:40 -0700 (PDT)
To: BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Message-ID: <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
Date: Wed, 6 Oct 2021 09:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------CA77DA10B53657D6D05DCDA7"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------CA77DA10B53657D6D05DCDA7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/10/2021 23.53, BALATON Zoltan wrote:
[...]
> Maybe these 405 boards in QEMU ran with modified firmware where the memory 
> detection was patched out but it seems to detect the RAM so I wonder where 
> it gets that from. Maybe by reading the SDRAM controller DCRs 
> ppc4xx_sdram_init() sets up. Then I'm not sure what it needs the SPD for, I 
> forgot how this worked on sam460ex. Maybe for the speed calibration, so 
> could be it detects ram by reading DCRs then tries to get SPD data and 
> that's where it stops as i2c is not emulated on taihu. This could be 
> confirmed by checking what it pokes with -d guest_errors that shows accesses 
> to missing devices but don't know where 405 has the i2c controller and if 
> it's the same as newer SoCs. If so that could be reused and an i2c bus could 
> be added with the SPD data like in sam460ex to make u-boot happy or you 
> could skip this in u-boot.

FWIW, I've just tried the latter (skipping the sdram init in u-boot), and 
indeed, I can get to the u-boot prompt now. Binary can be found here:

  http://people.redhat.com/~thuth/data/u-boot-taihu-skip-sdram.bin

Christophe, maybe that's already enough for you to boot a Linux kernel with 
the "taihu" board? (or do you need the ref405ep board instead?)

I've also attached the patch with my modifications to u-boot.

To build the u-boot firmware:

  git clone git://git.denx.de/u-boot.git
  cd u-boot
  git checkout 123b6cd7a4f75536734a7bff97db6eebce614bd1~1
  patch -p1 -i .../u-boot-taihu.patch
  make taihu_defconfig CROSS_COMPILE=powerpc-...
  make CROSS_COMPILE=powerpc-...

... if the linker complains at the end, remove some features from the 
".config" file, like CONFIG_CMD_NFS, and run make again.

  Thomas

--------------CA77DA10B53657D6D05DCDA7
Content-Type: text/x-patch; charset=UTF-8;
 name="u-boot-taihu.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="u-boot-taihu.patch"

diff --git a/arch/powerpc/cpu/ppc4xx/sdram.c b/arch/powerpc/cpu/ppc4xx/sdra=
m.c
index d4ef36d39f..729f69f5c2 100644
--- a/arch/powerpc/cpu/ppc4xx/sdram.c
+++ b/arch/powerpc/cpu/ppc4xx/sdram.c
@@ -172,14 +172,13 @@ phys_size_t initdram(int board_type)
 =09=09/*
 =09=09 * Disable memory controller.
 =09=09 */
-=09=09mtsdram(SDRAM0_CFG, 0x00000000);
-
+//=09=09mtsdram(SDRAM0_CFG, 0x00000000);
 =09=09/*
 =09=09 * Set MB0CF for bank 0.
 =09=09 */
-=09=09mtsdram(SDRAM0_B0CR, mb0cf[i].reg);
-=09=09mtsdram(SDRAM0_TR, sdtr1);
-=09=09mtsdram(SDRAM0_RTR, compute_rtr(speed, mb0cf[i].rows, 64));
+//=09=09mtsdram(SDRAM0_B0CR, mb0cf[i].reg);
+//=09=09mtsdram(SDRAM0_TR, sdtr1);
+//=09=09mtsdram(SDRAM0_RTR, compute_rtr(speed, mb0cf[i].rows, 64));
=20
 =09=09udelay(200);
=20
@@ -199,7 +198,7 @@ phys_size_t initdram(int board_type)
 =09=09=09 * OK, size detected.  Enable second bank if
 =09=09=09 * defined (assumes same type as bank 0)
 =09=09=09 */
-#ifdef CONFIG_SDRAM_BANK1
+#if 0 //def CONFIG_SDRAM_BANK1
 =09=09=09mtsdram(SDRAM0_CFG, 0x00000000);
 =09=09=09mtsdram(SDRAM0_B1CR, mb0cf[i].size | mb0cf[i].reg);
 =09=09=09mtsdram(SDRAM0_CFG, 0x80800000);
@@ -230,7 +229,7 @@ phys_size_t initdram(int board_type)
 =09=09}
 =09}
=20
-=09return 0;
+=09return 128*1024*1024; /* Hack */
 }
=20
 #else /* CONFIG_440 */
diff --git a/arch/powerpc/cpu/ppc4xx/u-boot.lds b/arch/powerpc/cpu/ppc4xx/u=
-boot.lds
index 198050853a..55dd4e1300 100644
--- a/arch/powerpc/cpu/ppc4xx/u-boot.lds
+++ b/arch/powerpc/cpu/ppc4xx/u-boot.lds
@@ -46,7 +46,6 @@ SECTIONS
     _GOT2_TABLE_ =3D .;
     KEEP(*(.got2))
     KEEP(*(.got))
-    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
     _FIXUP_TABLE_ =3D .;
     KEEP(*(.fixup))
   }
diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/b=
itops.h
index a6bcf3c3fe..4aba02a031 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -7,12 +7,14 @@
=20
 #include <asm/byteorder.h>
=20
+/*
 extern void set_bit(int nr, volatile void *addr);
 extern void clear_bit(int nr, volatile void *addr);
 extern void change_bit(int nr, volatile void *addr);
 extern int test_and_set_bit(int nr, volatile void *addr);
 extern int test_and_clear_bit(int nr, volatile void *addr);
 extern int test_and_change_bit(int nr, volatile void *addr);
+*/
=20
 /*
  * Arguably these bit operations don't imply any memory barrier or
@@ -34,7 +36,7 @@ extern int test_and_change_bit(int nr, volatile void *add=
r);
  * These used to be if'd out here because using : "cc" as a constraint
  * resulted in errors from egcs.  Things may be OK with gcc-2.95.
  */
-extern __inline__ void set_bit(int nr, volatile void * addr)
+static __inline__ void set_bit(int nr, volatile void * addr)
 {
 =09unsigned long old;
 =09unsigned long mask =3D 1 << (nr & 0x1f);
@@ -51,7 +53,7 @@ extern __inline__ void set_bit(int nr, volatile void * ad=
dr)
 =09: "cc" );
 }
=20
-extern __inline__ void clear_bit(int nr, volatile void *addr)
+static __inline__ void clear_bit(int nr, volatile void *addr)
 {
 =09unsigned long old;
 =09unsigned long mask =3D 1 << (nr & 0x1f);
@@ -68,7 +70,7 @@ extern __inline__ void clear_bit(int nr, volatile void *a=
ddr)
 =09: "cc");
 }
=20
-extern __inline__ void change_bit(int nr, volatile void *addr)
+static __inline__ void change_bit(int nr, volatile void *addr)
 {
 =09unsigned long old;
 =09unsigned long mask =3D 1 << (nr & 0x1f);
@@ -85,7 +87,7 @@ extern __inline__ void change_bit(int nr, volatile void *=
addr)
 =09: "cc");
 }
=20
-extern __inline__ int test_and_set_bit(int nr, volatile void *addr)
+static __inline__  int test_and_set_bit(int nr, volatile void *addr)
 {
 =09unsigned int old, t;
 =09unsigned int mask =3D 1 << (nr & 0x1f);
@@ -104,7 +106,7 @@ extern __inline__ int test_and_set_bit(int nr, volatile=
 void *addr)
 =09return (old & mask) !=3D 0;
 }
=20
-extern __inline__ int test_and_clear_bit(int nr, volatile void *addr)
+static __inline__  int test_and_clear_bit(int nr, volatile void *addr)
 {
 =09unsigned int old, t;
 =09unsigned int mask =3D 1 << (nr & 0x1f);
@@ -123,7 +125,7 @@ extern __inline__ int test_and_clear_bit(int nr, volati=
le void *addr)
 =09return (old & mask) !=3D 0;
 }
=20
-extern __inline__ int test_and_change_bit(int nr, volatile void *addr)
+static __inline__  int test_and_change_bit(int nr, volatile void *addr)
 {
 =09unsigned int old, t;
 =09unsigned int mask =3D 1 << (nr & 0x1f);
@@ -143,7 +145,7 @@ extern __inline__ int test_and_change_bit(int nr, volat=
ile void *addr)
 }
 #endif /* __INLINE_BITOPS */
=20
-extern __inline__ int test_bit(int nr, __const__ volatile void *addr)
+static __inline__  int test_bit(int nr, __const__ volatile void *addr)
 {
 =09__const__ unsigned int *p =3D (__const__ unsigned int *) addr;
=20
@@ -152,7 +154,7 @@ extern __inline__ int test_bit(int nr, __const__ volati=
le void *addr)
=20
 /* Return the bit position of the most significant 1 bit in a word */
 /* - the result is undefined when x =3D=3D 0 */
-extern __inline__ int __ilog2(unsigned int x)
+static __inline__  int __ilog2(unsigned int x)
 {
 =09int lz;
=20
@@ -160,7 +162,7 @@ extern __inline__ int __ilog2(unsigned int x)
 =09return 31 - lz;
 }
=20
-extern __inline__ int ffz(unsigned int x)
+static __inline__  int ffz(unsigned int x)
 {
 =09if ((x =3D ~x) =3D=3D 0)
 =09=09return 32;
@@ -226,7 +228,7 @@ static inline int ffs64(u64 x)
  * the libc and compiler builtin ffs routines, therefore
  * differs in spirit from the above ffz (man ffs).
  */
-extern __inline__ int ffs(int x)
+static __inline__  int ffs(int x)
 {
 =09return __ilog2(x & -x) + 1;
 }
@@ -250,7 +252,7 @@ extern __inline__ int ffs(int x)
 #define find_first_zero_bit(addr, size) \
 =09find_next_zero_bit((addr), (size), 0)
=20
-extern __inline__ unsigned long find_next_zero_bit(void * addr,
+static __inline__  unsigned long find_next_zero_bit(void * addr,
 =09unsigned long size, unsigned long offset)
 {
 =09unsigned int * p =3D ((unsigned int *) addr) + (offset >> 5);
@@ -298,7 +300,7 @@ found_middle:
 #define ext2_clear_bit(nr, addr)=09test_and_clear_bit((nr) ^ 0x18, addr)
=20
 #else
-extern __inline__ int ext2_set_bit(int nr, void * addr)
+static __inline__  int ext2_set_bit(int nr, void * addr)
 {
 =09int=09=09mask;
 =09unsigned char=09*ADDR =3D (unsigned char *) addr;
@@ -311,7 +313,7 @@ extern __inline__ int ext2_set_bit(int nr, void * addr)
 =09return oldbit;
 }
=20
-extern __inline__ int ext2_clear_bit(int nr, void * addr)
+static __inline__  int ext2_clear_bit(int nr, void * addr)
 {
 =09int=09=09mask;
 =09unsigned char=09*ADDR =3D (unsigned char *) addr;
@@ -325,7 +327,7 @@ extern __inline__ int ext2_clear_bit(int nr, void * add=
r)
 }
 #endif=09/* __KERNEL__ */
=20
-extern __inline__ int ext2_test_bit(int nr, __const__ void * addr)
+static __inline__  int ext2_test_bit(int nr, __const__ void * addr)
 {
 =09__const__ unsigned char=09*ADDR =3D (__const__ unsigned char *) addr;
=20
diff --git a/arch/powerpc/include/asm/byteorder.h b/arch/powerpc/include/as=
m/byteorder.h
index 3f5bcf63a1..5f57a08d39 100644
--- a/arch/powerpc/include/asm/byteorder.h
+++ b/arch/powerpc/include/asm/byteorder.h
@@ -5,7 +5,7 @@
=20
 #ifdef __GNUC__
=20
-extern __inline__ unsigned ld_le16(const volatile unsigned short *addr)
+static __inline__  unsigned ld_le16(const volatile unsigned short *addr)
 {
 =09unsigned val;
=20
@@ -13,12 +13,12 @@ extern __inline__ unsigned ld_le16(const volatile unsig=
ned short *addr)
 =09return val;
 }
=20
-extern __inline__ void st_le16(volatile unsigned short *addr, const unsign=
ed val)
+static __inline__  void st_le16(volatile unsigned short *addr, const unsig=
ned val)
 {
 =09__asm__ __volatile__ ("sthbrx %1,0,%2" : "=3Dm" (*addr) : "r" (val), "r=
" (addr));
 }
=20
-extern __inline__ unsigned ld_le32(const volatile unsigned *addr)
+static __inline__  unsigned ld_le32(const volatile unsigned *addr)
 {
 =09unsigned val;
=20
@@ -26,7 +26,7 @@ extern __inline__ unsigned ld_le32(const volatile unsigne=
d *addr)
 =09return val;
 }
=20
-extern __inline__ void st_le32(volatile unsigned *addr, const unsigned val=
)
+static __inline__  void st_le32(volatile unsigned *addr, const unsigned va=
l)
 {
 =09__asm__ __volatile__ ("stwbrx %1,0,%2" : "=3Dm" (*addr) : "r" (val), "r=
" (addr));
 }
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index a5257e9b62..a54fc468d5 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -163,7 +163,7 @@ static inline void __raw_writel(unsigned int v, volatil=
e void __iomem *addr)
  * is actually performed (i.e. the data has come back) before we start
  * executing any following instructions.
  */
-extern inline u8 in_8(const volatile unsigned char __iomem *addr)
+static inline u8 in_8(const volatile unsigned char __iomem *addr)
 {
 =09u8 ret;
=20
@@ -174,7 +174,7 @@ extern inline u8 in_8(const volatile unsigned char __io=
mem *addr)
 =09return ret;
 }
=20
-extern inline void out_8(volatile unsigned char __iomem *addr, u8 val)
+static inline void out_8(volatile unsigned char __iomem *addr, u8 val)
 {
 =09__asm__ __volatile__("sync;\n"
 =09=09=09     "stb%U0%X0 %1,%0;\n"
@@ -182,7 +182,7 @@ extern inline void out_8(volatile unsigned char __iomem=
 *addr, u8 val)
 =09=09=09     : "r" (val));
 }
=20
-extern inline u16 in_le16(const volatile unsigned short __iomem *addr)
+static inline u16 in_le16(const volatile unsigned short __iomem *addr)
 {
 =09u16 ret;
=20
@@ -193,7 +193,7 @@ extern inline u16 in_le16(const volatile unsigned short=
 __iomem *addr)
 =09return ret;
 }
=20
-extern inline u16 in_be16(const volatile unsigned short __iomem *addr)
+static inline u16 in_be16(const volatile unsigned short __iomem *addr)
 {
 =09u16 ret;
=20
@@ -203,18 +203,18 @@ extern inline u16 in_be16(const volatile unsigned sho=
rt __iomem *addr)
 =09return ret;
 }
=20
-extern inline void out_le16(volatile unsigned short __iomem *addr, u16 val=
)
+static inline void out_le16(volatile unsigned short __iomem *addr, u16 val=
)
 {
 =09__asm__ __volatile__("sync; sthbrx %1,0,%2" : "=3Dm" (*addr) :
 =09=09=09      "r" (val), "r" (addr));
 }
=20
-extern inline void out_be16(volatile unsigned short __iomem *addr, u16 val=
)
+static inline void out_be16(volatile unsigned short __iomem *addr, u16 val=
)
 {
 =09__asm__ __volatile__("sync; sth%U0%X0 %1,%0" : "=3Dm" (*addr) : "r" (va=
l));
 }
=20
-extern inline u32 in_le32(const volatile unsigned __iomem *addr)
+static inline u32 in_le32(const volatile unsigned __iomem *addr)
 {
 =09u32 ret;
=20
@@ -225,7 +225,7 @@ extern inline u32 in_le32(const volatile unsigned __iom=
em *addr)
 =09return ret;
 }
=20
-extern inline u32 in_be32(const volatile unsigned __iomem *addr)
+static inline u32 in_be32(const volatile unsigned __iomem *addr)
 {
 =09u32 ret;
=20
@@ -235,13 +235,13 @@ extern inline u32 in_be32(const volatile unsigned __i=
omem *addr)
 =09return ret;
 }
=20
-extern inline void out_le32(volatile unsigned __iomem *addr, u32 val)
+static inline void out_le32(volatile unsigned __iomem *addr, u32 val)
 {
 =09__asm__ __volatile__("sync; stwbrx %1,0,%2" : "=3Dm" (*addr) :
 =09=09=09     "r" (val), "r" (addr));
 }
=20
-extern inline void out_be32(volatile unsigned __iomem *addr, u32 val)
+static inline void out_be32(volatile unsigned __iomem *addr, u32 val)
 {
 =09__asm__ __volatile__("sync; stw%U0%X0 %1,%0" : "=3Dm" (*addr) : "r" (va=
l));
 }

--------------CA77DA10B53657D6D05DCDA7--


