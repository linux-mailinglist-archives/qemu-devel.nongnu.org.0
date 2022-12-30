Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0B659B94
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 20:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBKpT-0004xQ-6C; Fri, 30 Dec 2022 14:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBKpN-0004x2-NZ
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 14:14:01 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBKpL-0006K2-EH
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 14:14:01 -0500
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 2BUJDYOu1374083
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 30 Dec 2022 11:13:34 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 2BUJDYOu1374083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2022120601; t=1672427615;
 bh=F103lIyQ9HX4e4YADpdbkcMaF5Kx4eLLs91AFAzCwso=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=K8NMsfzGoSb1SBtWMNz3ggVlUOJRELCkRnUKzt6hw56EVmc4jFFV3+KRPutfMwvTk
 SdNMQ3OcZB8rU4Z/qdRN05To4PkZq5gGj4siHqlXnQCAE7gI2si76k9PVt0XRUuzEc
 AYe8HHshNVSquk5Go2lfyG8XSixPYCGjv4/pXvWm1FOU+yiVThTTGejW/+9OxiGFWi
 vCxxi4fWir2OJLP0A3XVM1Lbf4xit5k9XKVmJ5/bJfe57CnCpzuax4dzrhs7JvLZf+
 soJWFlzkEqLz6c320Ylrcq7tfLeDntJnzMd3YvTDwRyK6P/rMC+Omx52vYpzJBxW5r
 lpUhynDeGeSpw==
Date: Fri, 30 Dec 2022 11:13:32 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, bp@alien8.de, philmd@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_qemu=5D_x86=3A_don=27t_let_decomp?=
 =?US-ASCII?Q?ressed_kernel_image_clobber_setup=5Fdata?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y68K4mPuz6edQkCX@zx2c4.com>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com> <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com> <Y68K4mPuz6edQkCX@zx2c4.com>
Message-ID: <6C1D0560-6D77-4733-9B8D-5184935AEC62@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On December 30, 2022 7:59:30 AM PST, "Jason A=2E Donenfeld" <Jason@zx2c4=2E=
com> wrote:
>Hi,
>
>On Wed, Dec 28, 2022 at 11:31:34PM -0800, H=2E Peter Anvin wrote:
>> On December 28, 2022 6:31:07 PM PST, "Jason A=2E Donenfeld" <Jason@zx2c=
4=2Ecom> wrote:
>> >Hi,
>> >
>> >Read this message in a fixed width text editor with a lot of columns=
=2E
>> >
>> >On Wed, Dec 28, 2022 at 03:58:12PM -0800, H=2E Peter Anvin wrote:
>> >> Glad you asked=2E
>> >>=20
>> >> So the kernel load addresses are parameterized in the kernel image
>> >> setup header=2E One of the things that are so parameterized are the =
size
>> >> and possible realignment of the kernel image in memory=2E
>> >>=20
>> >> I'm very confused where you are getting the 64 MB number from=2E The=
re
>> >> should not be any such limitation=2E
>> >
>> >Currently, QEMU appends it to the kernel image, not to the initramfs a=
s
>> >you suggest below=2E So, that winds up looking, currently, like:
>> >
>> >          kernel image            setup_data
>> >   |--------------------------||----------------|
>> >0x100000                  0x100000+l1     0x100000+l1+l2
>> >
>> >The problem is that this decompresses to 0x1000000 (one more zero)=2E =
So
>> >if l1 is > (0x1000000-0x100000), then this winds up looking like:
>> >
>> >          kernel image            setup_data
>> >   |--------------------------||----------------|
>> >0x100000                  0x100000+l1     0x100000+l1+l2
>> >
>> >                                 d e c o m p r e s s e d   k e r n e l
>> >		     |-------------------------------------------------------------|
>> >                0x1000000                                             =
        0x1000000+l3=20
>> >
>> >The decompressed kernel seemingly overwriting the compressed kernel
>> >image isn't a problem, because that gets relocated to a higher address
>> >early on in the boot process=2E setup_data, however, stays in the same
>> >place, since those links are self referential and nothing fixes them u=
p=2E
>> >So the decompressed kernel clobbers it=2E
>> >
>> >The solution in this commit adds a bunch of padding between the kernel
>> >image and setup_data to avoid this=2E That looks like this:
>> >
>> >          kernel image                            padding             =
                  setup_data
>> >   |--------------------------||--------------------------------------=
-------------||----------------|
>> >0x100000                  0x100000+l1                                 =
        0x1000000+l3      0x1000000+l3+l2
>> >
>> >                                 d e c o m p r e s s e d   k e r n e l
>> >		     |-------------------------------------------------------------|
>> >                0x1000000                                             =
        0x1000000+l3=20
>> >
>> >This way, the decompressed kernel doesn't clobber setup_data=2E
>> >
>> >The problem is that if 0x1000000+l3-0x100000 is around 62 megabytes,
>> >then the bootloader crashes when trying to dereference setup_data's
>> >->len param at the end of initialize_identity_maps() in ident_map_64=
=2Ec=2E
>> >I don't know why it does this=2E If I could remove the 62 megabyte
>> >restriction, then I could keep with this technique and all would be
>> >well=2E
>> >
>> >> In general, setup_data should be able to go anywhere the initrd can
>> >> go, and so is subject to the same address cap (896 MB for old kernel=
s,
>> >> 4 GB on newer ones; this address too is enumerated in the header=2E)
>> >
>> >It would be theoretically possible to attach it to the initrd image
>> >instead of to the kernel image=2E As a last resort, I guess I can look
>> >into doing that=2E However, that's going to require some serious rewor=
k
>> >and plumbing of a lot of different components=2E So if I can make it w=
ork
>> >as is, that'd be ideal=2E However, I need to figure out this weird 62 =
meg
>> >limitation=2E
>> >
>> >Any ideas on that?
>> >
>> >Jason
>>=20
>> As far as a crash=2E=2E=2E that sounds like a big and a pretty serious =
one at that=2E
>>=20
>> Could you let me know what kernel you are using and how *exactly* you a=
re booting it?
>
>I'll attach a =2Econfig file=2E Apply the patch at the top of this thread=
 to
>qemu, except make one modification:
>
>diff --git a/hw/i386/x86=2Ec b/hw/i386/x86=2Ec
>index 628fd2b2e9=2E=2Ea61ee23e13 100644
>--- a/hw/i386/x86=2Ec
>+++ b/hw/i386/x86=2Ec
>@@ -1097,7 +1097,7 @@ void x86_load_linux(X86MachineState *x86ms,
>=20
>             /* The early stage can't address past around 64 MB from the =
original
>              * mapping, so just give up in that case=2E */
>-            if (padded_size < 62 * 1024 * 1024)
>+            if (true || padded_size < 62 * 1024 * 1024)
>                 kernel_size =3D padded_size;
>             else {
>                 fprintf(stderr, "qemu: Kernel image too large to hold se=
tup_data\n");
>
>Then build qemu=2E Run it with `-kernel bzImage`, based on the kernel
>built with the =2Econfig I attached=2E
>
>You'll see that the CPU triple faults when hitting this line:
>
>        sd =3D (struct setup_data *)boot_params->hdr=2Esetup_data;
>        while (sd) {
>                unsigned long sd_addr =3D (unsigned long)sd;
>
>                kernel_add_identity_map(sd_addr, sd_addr + sizeof(*sd) + =
sd->len);  <----
>                sd =3D (struct setup_data *)sd->next;
>        }
>
>, because it dereferences *sd=2E This does not happen if the decompressed
>size of the kernel is < 62 megs=2E
>
>So that's the "big and pretty serious" bug that might be worthy of
>investigation=2E
>
>Jason

No kidding=2E Dereferencing data *before you map it* is generally frowned =
upon=2E

This needs to be split into to making calls=2E

*Facepalm*

