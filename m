Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52733688106
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:05:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNb7v-0007T8-F5; Thu, 02 Feb 2023 10:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pNb7r-0007Sp-SW
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:03:48 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pNb7p-0003JM-Mq
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:03:47 -0500
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 312F3XS42031669
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 2 Feb 2023 07:03:34 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 312F3XS42031669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2023010601; t=1675350214;
 bh=0GzyF9FL7rb/8CvnvMq5ICc1vfwMwI8SvxFJFzBWx4Q=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=eGdyLDe741qTtk/J9wLDJeSLTOqOjTLOo4TPEFpY+SCxGhaVbS8Db2WiiPOslYfDp
 UUKWnTjsqJsAdu5F2gLS6RPcr2eN616NJdhuvWq/3+1y9/csAfatrQ5/JpBkEDnMp6
 aak/IWXtVjDSb0FqijulhPkUY2LSP7cE/nsNSJMEhBzTasM3xLCyirCRHy6l06GgsT
 B1V4+NcoDMNge/megMAT2eEOo6QBYV6LaQkusT6CduxBfislGss0PMpJi2mPyL6Tu7
 BIvtVodbF0kut/h+qG4iNI6kJ48zeeThELQUeX380ESeIING2PSt8Rvt6jOx2ZR98Q
 IQUIYSLW9Jryg==
Date: Thu, 02 Feb 2023 07:03:31 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: jejb@linux.ibm.com, James Bottomley <jejb@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86=3A_fix_q35_kernel_mea?=
 =?US-ASCII?Q?surements_broken_due_to_rng_seeding?=
User-Agent: K-9 Mail for Android
In-Reply-To: <d2e01e48fa215684447d17d21d48fa681ab7f7d3.camel@linux.ibm.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
 <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
 <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
 <d2e01e48fa215684447d17d21d48fa681ab7f7d3.camel@linux.ibm.com>
Message-ID: <4396778A-6520-4FB5-9227-1E8850753036@zytor.com>
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

On February 2, 2023 6:38:12 AM PST, James Bottomley <jejb@linux=2Eibm=2Ecom=
> wrote:
>On Wed, 2023-02-01 at 15:48 -0500, Jason A=2E Donenfeld wrote:
>[=2E=2E=2E]
>> But it sounds like you might now have a concrete suggestion on
>> something even better=2E I'm CCing hpa, as this is his wheelhouse, and
>> maybe you two can divise the next step while I'm away=2E Maybe the pad9
>> thing you mentioned is the super nice solution we've been searching
>> for this whole time=2E When I'm home in 10 days and have internet
>> again, I'll take a look at where thing's are out and try to figure
>> out how I can be productive again with it=2E
>
>OK, so just FYI HPA, this is the patch I'm thinking of sending to
>linux-kernel to reserve space in struct boot_params for this=2E  If you
>could take a look and advise on the location before I send the final
>patch, I'd be grateful=2E  I took space in _pad9 because that's the
>standard method (add on to end), but it does strike me we could also
>use all of _pad8 for the (the addition is only 48 bytes) or even _pad3
>+ hd0_info + hd1_info=2E
>
>James
>
>---
>
>diff --git a/arch/x86/boot/header=2ES b/arch/x86/boot/header=2ES
>index 9338c68e7413=2E=2E0120ab77dac9 100644
>--- a/arch/x86/boot/header=2ES
>+++ b/arch/x86/boot/header=2ES
>@@ -308,7 +308,7 @@ _start:
> 	# Part 2 of the header, from the old setup=2ES
>=20
> 		=2Eascii	"HdrS"		# header signature
>-		=2Eword	0x020f		# header version number (>=3D 0x0105)
>+		=2Eword	0x0210		# header version number (>=3D 0x0105)
> 					# or else old loadlin-1=2E5 will fail)
> 		=2Eglobl realmode_swtch
> realmode_swtch:	=2Eword	0, 0		# default_switch, SETUPSEG
>diff --git a/arch/x86/include/uapi/asm/bootparam=2Eh b/arch/x86/include/u=
api/asm/bootparam=2Eh
>index 01d19fc22346=2E=2Ec614ff0755f2 100644
>--- a/arch/x86/include/uapi/asm/bootparam=2Eh
>+++ b/arch/x86/include/uapi/asm/bootparam=2Eh
>@@ -181,6 +181,19 @@ struct ima_setup_data {
> 	__u64 size;
> } __attribute__((packed));
>=20
>+/*
>+ * Define a boot_param area for the RNG seed which can be used via the
>+ * setup_data mechanism (so must have a setup_data header) but which
>+ * is embedded in boot_params because qemu has been unable to find
>+ * a safe data space for it=2E  The value RNG_SEED_LENGTH must not
>+ * change (pad length dependent on it) and must match the value in QEMU
>+ */
>+#define RNG_SEED_LENGTH	32
>+struct random_seed_data {
>+	struct	setup_data s;
>+	__u8	data[RNG_SEED_LENGTH];
>+} __attribute__((packed));
>+
> /* The so-called "zeropage" */
> struct boot_params {
> 	struct screen_info screen_info;			/* 0x000 */
>@@ -228,7 +241,8 @@ struct boot_params {
> 	struct boot_e820_entry e820_table[E820_MAX_ENTRIES_ZEROPAGE]; /* 0x2d0 =
*/
> 	__u8  _pad8[48];				/* 0xcd0 */
> 	struct edd_info eddbuf[EDDMAXNR];		/* 0xd00 */
>-	__u8  _pad9[276];				/* 0xeec */
>+	struct random_seed_data random_seed;		/* 0xeec */
>+	__u8  _pad9[228];				/* 0xf1c */
> } __attribute__((packed));
>=20
> /**
>diff --git a/arch/x86/kernel/kexec-bzimage64=2Ec b/arch/x86/kernel/kexec-=
bzimage64=2Ec
>index 6b58610a1552=2E=2Efb719682579d 100644
>--- a/arch/x86/kernel/kexec-bzimage64=2Ec
>+++ b/arch/x86/kernel/kexec-bzimage64=2Ec
>@@ -110,13 +110,10 @@ static int setup_e820_entries(struct boot_params *p=
arams)
> 	return 0;
> }
>=20
>-enum { RNG_SEED_LENGTH =3D 32 };
>-
> static void
>-setup_rng_seed(struct boot_params *params, unsigned long params_load_add=
r,
>-	       unsigned int rng_seed_setup_data_offset)
>+setup_rng_seed(struct boot_params *params, unsigned long params_load_add=
r)
> {
>-	struct setup_data *sd =3D (void *)params + rng_seed_setup_data_offset;
>+	struct setup_data *sd =3D &params->random_seed=2Es;
> 	unsigned long setup_data_phys;
>=20
> 	if (!rng_is_initialized())
>@@ -125,7 +122,8 @@ setup_rng_seed(struct boot_params *params, unsigned l=
ong params_load_addr,
> 	sd->type =3D SETUP_RNG_SEED;
> 	sd->len =3D RNG_SEED_LENGTH;
> 	get_random_bytes(sd->data, RNG_SEED_LENGTH);
>-	setup_data_phys =3D params_load_addr + rng_seed_setup_data_offset;
>+	setup_data_phys =3D params_load_addr + offsetof(struct boot_params,
>+						      random_seed);
> 	sd->next =3D params->hdr=2Esetup_data;
> 	params->hdr=2Esetup_data =3D setup_data_phys;
> }
>@@ -306,7 +304,7 @@ setup_boot_parameters(struct kimage *image, struct bo=
ot_params *params,
> 	}
>=20
> 	/* Setup RNG seed */
>-	setup_rng_seed(params, params_load_addr, setup_data_offset);
>+	setup_rng_seed(params, params_load_addr);
>=20
> 	/* Setup EDD info */
> 	memcpy(params->eddbuf, boot_params=2Eeddbuf,
>

NAK=2E We need to fix the actual problem of the kernel stomping on memory =
it shouldn't, not paper around it=2E


