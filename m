Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8153E41F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:57:08 +0200 (CEST)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAPz-0006dj-EI
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nyALJ-0004Ld-LJ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nyALH-0002IS-1w
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654512733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1vXm+GHpcrgfnCKrCr6cfuVJfhrVn6GXerWTdVx5EE=;
 b=OfPfCRiG3PObLEUKxkXwjHERSDuOvMMOC3AzC2a+fM35w5fxKGw6keeBfxYsRvJD4+5yoS
 iF6z17OpuXHMStW0jZqCYAtG6k1hE4n9KY3g2MMiTKSV4Pp3m4DLQldYa2t+IbSFIXpsib
 3jJ+UfvdVtsJRaTbeZxhFaAWwQraDIE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-n1BFZ1m-Ng6Se6vhRSibwQ-1; Mon, 06 Jun 2022 06:52:12 -0400
X-MC-Unique: n1BFZ1m-Ng6Se6vhRSibwQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 q15-20020a056808200f00b0032e4d7099eeso5664457oiw.15
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 03:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1vXm+GHpcrgfnCKrCr6cfuVJfhrVn6GXerWTdVx5EE=;
 b=ix0Dbhh2+LVZ9DYDGmsRd30shDfWdAcsDTaSmHvA9/5k6NKYq8Otx4OLviR+/2ZBik
 GQASkX+iN10ko/2tA0fu12cJMxcLtCF1LS2oDb5BIQNCE2lRzvsMRyvTotZJoKSzi8Ay
 78dtAL0VJ6Xidz3KebQkJPWEz62aLhuqZil4F87VS2GLV6EC6SZ4DZ6h2xM1dgrPePRW
 O2OfVMrPbTjW+ppwN1TA43mWvt9EqSw0JBANq2gwsTH61GXTPhb6Q6N9i/Dw1Xb/V8No
 Iqrsvi83V9ggeP64Wpg1zCOgAEU/aPB7Pk9AWJvVmpf48GpoQ9jugXUDvE38OOtnvqpL
 /eog==
X-Gm-Message-State: AOAM531Ynex7h3r1MKWyu4t/UghRDNP8uvf3MeyVmPp3/G1pm1npkpnP
 t32RutN41Lb61Ll7aYO941rT/DSlqpi9+7aDB774AGVSAVOcT37buBcrsStGg5AXVdPX1xd+apM
 VgPvt92GWHC6lv1DLQYazygjC2wvMa70=
X-Received: by 2002:a05:6870:a108:b0:f5:f6fd:9940 with SMTP id
 m8-20020a056870a10800b000f5f6fd9940mr13396312oae.251.1654512731641; 
 Mon, 06 Jun 2022 03:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo8iDNid6ucRbA7umbUrKfWZJKTlNDY/mgwiyO2WUaqePpJmAtsFvc069hrA8Mwk4TFd/OP8eWjdG8h5T/WIA=
X-Received: by 2002:a05:6870:a108:b0:f5:f6fd:9940 with SMTP id
 m8-20020a056870a10800b000f5f6fd9940mr13396301oae.251.1654512731401; Mon, 06
 Jun 2022 03:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-3-jusual@redhat.com>
 <20220602170405.29ec7149@redhat.com>
In-Reply-To: <20220602170405.29ec7149@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Mon, 6 Jun 2022 12:52:00 +0200
Message-ID: <CAMDeoFXP=wtarQdjFs3i_aDVgKGegAa=ho09v_DWG9xnLcOSNg@mail.gmail.com>
Subject: Re: [PATCH 2/5] bios-tables-test: teach test to use smbios 3.0 tables
To: Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 2, 2022 at 5:04 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 27 May 2022 18:56:48 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
>
> > Introduce the 64-bit entry point. Since we no longer have a total
> > number of structures, stop checking for the new ones at the EOF
> > structure (type 127).
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 101 ++++++++++++++++++++++++---------
> >  1 file changed, 75 insertions(+), 26 deletions(-)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index a4a46e97f0..0ba9d749a5 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -75,6 +75,14 @@
> >  #define OEM_TEST_ARGS      "-machine x-oem-id=" OEM_ID ",x-oem-table-id=" \
> >                             OEM_TABLE_ID
> >
> > +#define SMBIOS_VER21 0
> > +#define SMBIOS_VER30 1
> > +
> > +typedef struct {
> > +    struct smbios_21_entry_point ep21;
> > +    struct smbios_30_entry_point ep30;
> > +} smbios_entry_point;
> > +
> >  typedef struct {
> >      bool tcg_only;
> >      const char *machine;
> > @@ -88,8 +96,8 @@ typedef struct {
> >      uint64_t rsdp_addr;
> >      uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> >      GArray *tables;
> > -    uint32_t smbios_ep_addr;
> > -    struct smbios_21_entry_point smbios_ep_table;
> > +    uint64_t smbios_ep_addr[2];
> > +    smbios_entry_point smbios_ep_table;
> >      uint16_t smbios_cpu_max_speed;
> >      uint16_t smbios_cpu_curr_speed;
> >      uint8_t *required_struct_types;
> > @@ -533,10 +541,10 @@ static void test_acpi_asl(test_data *data)
> >      free_test_data(&exp_data);
> >  }
> >
> > -static bool smbios_ep_table_ok(test_data *data)
> > +static bool smbios_ep2_table_ok(test_data *data)
> >  {
> > -    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
> > -    uint32_t addr = data->smbios_ep_addr;
> > +    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table.ep21;
> > +    uint32_t addr = data->smbios_ep_addr[SMBIOS_VER21];
> >
> >      qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
> >      if (memcmp(ep_table->anchor_string, "_SM_", 4)) {
> > @@ -559,29 +567,59 @@ static bool smbios_ep_table_ok(test_data *data)
> >      return true;
> >  }
> >
> > -static void test_smbios_entry_point(test_data *data)
> > +static bool smbios_ep3_table_ok(test_data *data)
> > +{
> > +    struct smbios_30_entry_point *ep_table = &data->smbios_ep_table.ep30;
> > +    uint64_t addr = data->smbios_ep_addr[SMBIOS_VER30];
> > +
> > +    qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
> > +    if (memcmp(ep_table->anchor_string, "_SM3_", 5)) {
> > +        return false;
> > +    }
> > +
> > +    if (acpi_calc_checksum((uint8_t *)ep_table, sizeof *ep_table)) {
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static int test_smbios_entry_point(test_data *data)
> >  {
> >      uint32_t off;
> > +    bool found_ep2 = false, found_ep3 = false;
> >
> >      /* find smbios entry point structure */
> >      for (off = 0xf0000; off < 0x100000; off += 0x10) {
> > -        uint8_t sig[] = "_SM_";
> > +        uint8_t sig[] = "_SM3_";
>
> well I'd just add a separate sig3

Ok

> >          int i;
> >
> >          for (i = 0; i < sizeof sig - 1; ++i) {
> >              sig[i] = qtest_readb(data->qts, off + i);
> >          }
> >
> > -        if (!memcmp(sig, "_SM_", sizeof sig)) {
> > +        if (!found_ep2 && !memcmp(sig, "_SM_", sizeof sig - 2)) {
>
> keep original v2 code and just add similar chunk for v3,
> drop found_foo locals,
> that should make it easier to read/follow
> (i.e. less conditions to think about and no magic fiddling with the length of signature)

The idea was to reuse existing code, but since it doesn't improve
things much, it makes sense to repeat it.

> >              /* signature match, but is this a valid entry point? */
> > -            data->smbios_ep_addr = off;
> > -            if (smbios_ep_table_ok(data)) {
> > -                break;
> > +            data->smbios_ep_addr[SMBIOS_VER21] = off;
> > +            if (smbios_ep2_table_ok(data)) {
> > +                found_ep2 = true;
> > +            }
> > +        } else if (!found_ep3 && !memcmp(sig, "_SM3_", sizeof sig - 1)) {
> > +            data->smbios_ep_addr[SMBIOS_VER30] = off;
> > +            if (smbios_ep3_table_ok(data)) {
> > +                found_ep3 = true;
> >              }
> >          }
> > +
> > +        if (found_ep2 || found_ep3) {
> > +            break;
> > +        }
> >      }
> >
> > -    g_assert_cmphex(off, <, 0x100000);
> > +    g_assert_cmphex(data->smbios_ep_addr[SMBIOS_VER21], <, 0x100000);
> > +    g_assert_cmphex(data->smbios_ep_addr[SMBIOS_VER30], <, 0x100000);
> > +
> > +    return found_ep3 ? SMBIOS_VER30 : SMBIOS_VER21;
>
> and use content of data->smbios_ep_addr[] to return found version

You mean check if it's initialized?

> >  }
> >
> >  static inline bool smbios_single_instance(uint8_t type)
> > @@ -625,16 +663,23 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> >      return true;
> >  }
> >
> > -static void test_smbios_structs(test_data *data)
> > +static void test_smbios_structs(test_data *data, int ver)
> >  {
> >      DECLARE_BITMAP(struct_bitmap, SMBIOS_MAX_TYPE+1) = { 0 };
> > -    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
> > -    uint32_t addr = le32_to_cpu(ep_table->structure_table_address);
> > -    int i, len, max_len = 0;
> > +
> > +    smbios_entry_point *ep_table = &data->smbios_ep_table;
> > +    int i = 0, len, max_len = 0;
> >      uint8_t type, prv, crt;
> > +    uint64_t addr;
> > +
> > +    if (ver == SMBIOS_VER21) {
> > +        addr = le32_to_cpu(ep_table->ep21.structure_table_address);
> > +    } else {
> > +        addr = le64_to_cpu(ep_table->ep30.structure_table_address);
> > +    }
> >
> >      /* walk the smbios tables */
> > -    for (i = 0; i < le16_to_cpu(ep_table->number_of_structures); i++) {
> > +    do {
> >
> >          /* grab type and formatted area length from struct header */
> >          type = qtest_readb(data->qts, addr);
> > @@ -660,19 +705,23 @@ static void test_smbios_structs(test_data *data)
> >          }
> >
> >          /* keep track of max. struct size */
> > -        if (max_len < len) {
> > +        if (ver == SMBIOS_VER21 && max_len < len) {
> >              max_len = len;
> > -            g_assert_cmpuint(max_len, <=, ep_table->max_structure_size);
> > +            g_assert_cmpuint(max_len, <=, ep_table->ep21.max_structure_size);
> >          }
> >
> >          /* start of next structure */
> >          addr += len;
> > -    }
> >
> > -    /* total table length and max struct size must match entry point values */
> > -    g_assert_cmpuint(le16_to_cpu(ep_table->structure_table_length), ==,
> > -                     addr - le32_to_cpu(ep_table->structure_table_address));
> > -    g_assert_cmpuint(le16_to_cpu(ep_table->max_structure_size), ==, max_len);
> > +    } while (ver == SMBIOS_VER21 ?
> > +                (++i < le16_to_cpu(ep_table->ep21.number_of_structures)) : (type != 127));
> > +
> > +    if (ver == SMBIOS_VER21) {
> > +        /* total table length and max struct size must match entry point values */
> > +        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.structure_table_length), ==,
> > +                         addr - le32_to_cpu(ep_table->ep21.structure_table_address));
> > +        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.max_structure_size), ==, max_len);
> > +    }
> >
> >      /* required struct types must all be present */
> >      for (i = 0; i < data->required_struct_types_len; i++) {
> > @@ -756,8 +805,8 @@ static void test_acpi_one(const char *params, test_data *data)
> >       * https://bugs.launchpad.net/qemu/+bug/1821884
> >       */
> >      if (!use_uefi) {
> > -        test_smbios_entry_point(data);
> > -        test_smbios_structs(data);
> > +        int ver = test_smbios_entry_point(data);
> > +        test_smbios_structs(data, ver);
> >      }
> >
> >      qtest_quit(data->qts);
>


