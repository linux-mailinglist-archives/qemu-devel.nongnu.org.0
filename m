Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF328E07D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 14:26:52 +0200 (CEST)
Received: from localhost ([::1]:40632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSfrn-0001nR-8p
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kSfpB-00084s-Gs; Wed, 14 Oct 2020 08:24:09 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kSfp6-0004sP-A2; Wed, 14 Oct 2020 08:24:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1602678211; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=WWDQ65K6J5emj+ZpjH+fbNmzV1QT2aCs1y5CZmso7cQSUHHVw83RiPYo/aMyfNHLm41msTdMonNqNby51mcggQqs+UmIebTSvkwN82by/Lyr1xfNm+FqRcNtw+lihXR9kSaGZJZ2/RhFHqY/OxFT1FF07OhWC88X0MmldCuLfcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1602678211;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=mKD7PnJcGpR99ru7seqPFc3ZnqCdzDXssQKNZh1l+eE=; 
 b=GT7IMvI0DKWRBZx+8XeEqrbW0NkWQZIpSWW+6NEvBr5kWj9eZCE4MKugV9tF+7RzTC/p6W6zfJFPO299brHSi3+t/oWcmQX2xbPjePlSSdcXWYDFsoiD3kGhB2HsJOLdtcow6qpdeHCg+QR3fpxIT+Ca2BNjBOwD0DubYGRyz9s=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602678211; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:Mime-Version:Content-Transfer-Encoding;
 bh=mKD7PnJcGpR99ru7seqPFc3ZnqCdzDXssQKNZh1l+eE=;
 b=VurNh8eEa8JxJCsZHtrxj/bloVo+akN8Pi7mLAWRCcTgXhBXUWlUZId46fBNKgBk
 dJZ7tyXBVS5XJJZvsOqZKR9d9iq8tGLvrYyrmvgBGhJja3Y3AxSzpJr84PaKQC6Ax4w
 BFszyD2M3gYRRGhSMhoQJ1l9JPQtIeTdzmCv+Y+M=
Received: from u60bdefc337955a.ant.amazon.com (54.239.6.188 [54.239.6.188]) by
 mx.zoho.com.cn with SMTPS id 1602678210451930.8982189257435;
 Wed, 14 Oct 2020 20:23:30 +0800 (CST)
Message-ID: <fcfd9c11764d8c8d181eb62da0e307d1143ef1b2.camel@euphon.net>
Subject: Re: [PATCH 3/9] util/vfio-helpers: Trace PCI BAR region info
From: Fam Zheng <fam@euphon.net>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Wed, 14 Oct 2020 13:23:22 +0100
In-Reply-To: <20201014115253.25276-4-philmd@redhat.com>
References: <20201014115253.25276-1-philmd@redhat.com>
 <20201014115253.25276-4-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 08:23:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-10-14 at 13:52 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> For debug purpose, trace BAR regions info.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  util/vfio-helpers.c | 8 ++++++++
>  util/trace-events   | 1 +
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 1d4efafcaa4..cd6287c3a98 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -136,6 +136,7 @@ static inline void
> assert_bar_index_valid(QEMUVFIOState *s, int index)
> =20
>  static int qemu_vfio_pci_init_bar(QEMUVFIOState *s, int index, Error
> **errp)
>  {
> +    g_autofree char *barname =3D NULL;
>      assert_bar_index_valid(s, index);
>      s->bar_region_info[index] =3D (struct vfio_region_info) {
>          .index =3D VFIO_PCI_BAR0_REGION_INDEX + index,
> @@ -145,6 +146,10 @@ static int qemu_vfio_pci_init_bar(QEMUVFIOState
> *s, int index, Error **errp)
>          error_setg_errno(errp, errno, "Failed to get BAR region
> info");
>          return -errno;
>      }
> +    barname =3D g_strdup_printf("bar[%d]", index);

Where is barname freed?

Fam

> +    trace_qemu_vfio_region_info(barname, s-
> >bar_region_info[index].offset,
> +                                s->bar_region_info[index].size,
> +                                s-
> >bar_region_info[index].cap_offset);
> =20
>      return 0;
>  }
> @@ -416,6 +421,9 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s,
> const char *device,
>          ret =3D -errno;
>          goto fail;
>      }
> +    trace_qemu_vfio_region_info("config", s-
> >config_region_info.offset,
> +                                s->config_region_info.size,
> +                                s->config_region_info.cap_offset);
> =20
>      for (i =3D 0; i < ARRAY_SIZE(s->bar_region_info); i++) {
>          ret =3D qemu_vfio_pci_init_bar(s, i, errp);
> diff --git a/util/trace-events b/util/trace-events
> index c048f85f828..4d40c74a21f 100644
> --- a/util/trace-events
> +++ b/util/trace-events
> @@ -87,3 +87,4 @@ qemu_vfio_dma_map(void *s, void *host, size_t size,
> bool temporary, uint64_t *io
>  qemu_vfio_dma_unmap(void *s, void *host) "s %p host %p"
>  qemu_vfio_pci_read_config(void *buf, int ofs, int size, uint64_t
> region_ofs, uint64_t region_size) "read cfg ptr %p ofs 0x%x size %d
> (region ofs 0x%"PRIx64" size %"PRId64")"
>  qemu_vfio_pci_write_config(void *buf, int ofs, int size, uint64_t
> region_ofs, uint64_t region_size) "write cfg ptr %p ofs 0x%x size %d
> (region ofs 0x%"PRIx64" size %"PRId64")"
> +qemu_vfio_region_info(const char *desc, uint64_t offset, uint64_t
> size, uint32_t cap_offset) "region '%s' ofs 0x%"PRIx64" size
> %"PRId64" cap_ofs %"PRId32


