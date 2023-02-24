Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF836A1849
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTnT-0002Y8-OM; Fri, 24 Feb 2023 03:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pVTnR-0002XG-53; Fri, 24 Feb 2023 03:51:17 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pVTnO-0001fI-5L; Fri, 24 Feb 2023 03:51:16 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230224085103euoutp01f81e566f2227c048b474b26bbe95b730~GtpVA-PtG0644706447euoutp01R;
 Fri, 24 Feb 2023 08:51:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230224085103euoutp01f81e566f2227c048b474b26bbe95b730~GtpVA-PtG0644706447euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1677228663;
 bh=WlVTCJiHDafRiGUCC7wEBE4aiTvu5qiKNYwGMNil5is=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=I+WCeRiZ93Ok2xRTuVeb+RqBEIaNPIk57wuDwAGqpBqkrt2yB6vxb8Vv8r3P2i48b
 /mndmIgXuXBQ1gXVh4WRbHOSFQH/oCvDOkPCa13zQDu8GZS58+A1/OlLH+aUG+MYF0
 3uwUDUtjgpOfOF6bqMiqN5K5OB4CoaIW3bOwiY3k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230224085102eucas1p13488df718e5e250564e5f793d2680223~GtpUmqHCH0521105211eucas1p1r;
 Fri, 24 Feb 2023 08:51:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 1E.3F.13597.67A78F36; Fri, 24
 Feb 2023 08:51:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230224085102eucas1p1d57ca7e6909c74db00799be1cff4d9d6~GtpUDS2lu0520105201eucas1p1p;
 Fri, 24 Feb 2023 08:51:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230224085102eusmtrp1b65a39ab6443aec45d99ce6bdf60d239~GtpUCVG9r2068720687eusmtrp1J;
 Fri, 24 Feb 2023 08:51:02 +0000 (GMT)
X-AuditID: cbfec7f4-207ff7000000351d-58-63f87a76ae9f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 27.A0.00518.67A78F36; Fri, 24
 Feb 2023 08:51:02 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230224085102eusmtip171a061e6184ad2ba433cc5ec1e35054c~GtpTtpzSN1355913559eusmtip1P;
 Fri, 24 Feb 2023 08:51:01 +0000 (GMT)
Received: from localhost (106.210.248.238) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Feb 2023 08:51:01 +0000
Date: Fri, 24 Feb 2023 09:51:00 +0100
From: Joel Granados <j.granados@samsung.com>
To: Jesper Devantier <jwd@defmacro.it>
CC: <qemu-devel@nongnu.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, <qemu-block@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Hanna Reitz
 <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen
 <k.jensen@samsung.com>
Subject: Re: [PATCH v3 3/5] hw/nvme: add basic endurance group support
Message-ID: <20230224085100.734khgmgqi5gfguz@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="eeouhgv7q2dyrfaw"
Content-Disposition: inline
In-Reply-To: <20230220115926.54623-4-jwd@defmacro.it>
X-Originating-IP: [106.210.248.238]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djPc7plVT+SDRacNrW4sv88o8WDu/2M
 FvsPfmO1eHj8AKPFpEPXGC2WXEy1WLNC2GLWu3Y2i+O9O1gsXk/6z+rA5TFl2jV2jx/n2tk8
 zu04z+6xaVUnm8eda3vYPJ5c28zk8X7fVbYA9igum5TUnMyy1CJ9uwSujJ7dF9gKFgdXPL/4
 kbmB8YR9FyMnh4SAicSfaQ/Yuhi5OIQEVjBKvJ68gh3C+cIo8e7QIijnM6NEz9kDLDAtbw/2
 sUAkljNKLGxYyQJX9XHde1aQKiGBrYwSB17YgtgsAqoSfddB5nJysAnoSJx/c4cZxBYRUJM4
 8m4jWDOzwDMmiXPrX4CtEBZwk7h+6y9TFyMHB6+AucTmq2UgYV4BQYmTM5+AlTALVEjs+PQe
 rIRZQFpi+T8OkDCngKnEyX/9LCBhCQFlidNPPSFurpU4teUWE8gmCYH9nBJPj65lhEi4SFzr
 ugT1mLDEq+Nb2CFsGYnTk3ug4tkSO6fsYoawCyRmnZzKBjHfWqLvTA5E2FGi62YD1Fo+iRtv
 BSGO5JOYtG06M0SYV6KjTQiiWk1iR9NWxgmMyrOQvDULyVuzEN6CCOtILNj9iQ1DWFti2cLX
 zBC2rcS6de9ZFjCyr2IUTy0tzk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMeqf/Hf+yg3H5q496
 hxiZOBgPMaoANT/asPoCoxRLXn5eqpII71Sm78lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEebVt
 TyYLCaQnlqRmp6YWpBbBZJk4OKUamErfS36duSNFUG9rB5MpZ73VveU3mSLvVHLO/fDg+809
 m8P0ErSa+wPEQ496TlN70OE6v4ZFW4rHtXZa0fuGWDWpl5v6XuuUzNU/dun/wsUxpzY4apb0
 ij7Ni8v0PJLycC3vhJwkQ/O7/mfslDnb2GPbdwccm3dB9eaF58uy9C5mvDg+7+ntQjamqKeP
 53xWEfJgz2l2OOhoHiuVnPrKwWDFltd/r63at/5V+1dRjkvTUnauczYJufJHuzF4S+C1BZZL
 hGKSDW3P5uj6aXVcmqTVq1c2/ae3Bud5zpVuoo2M87idQ3et31p/TMX0x4WbHVrpNck/Fv4J
 9AhReHzUeuFZ73v5lhIMGYdqlgSyKLEUZyQaajEXFScCAPcLTX31AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Xd2yqh/JBs+eCVhc2X+e0eLB3X5G
 i/0Hv7FaPDx+gNFi0qFrjBZLLqZarFkhbDHrXTubxfHeHSwWryf9Z3Xg8pgy7Rq7x49z7Wwe
 53acZ/fYtKqTzePOtT1sHk+ubWbyeL/vKlsAe5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
 pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexpvrX9gLFgZXfJi1nbWB8Zh9FyMnh4SAicTbg30s
 XYxcHEICSxklThx7yAKRkJH4dOUjO4QtLPHnWhcbRNFHRoknHxczQzhbGSXuvZoAVsUioCrR
 d30FmM0moCNx/s0dZhBbREBN4si7jWArmAWeMUmcW/8CbIWwgJvE9Vt/mboYOTh4BcwlNl8t
 AwkLCcRL7Ol6xwpi8woISpyc+QSsnFmgTGL7rvksIOXMAtISy/9xgIQ5BUwlTv7rBwtLCChL
 nH7qCXFzrcTnv88YJzAKz0IyaBaSQbMQBkGEtSRu/HvJhCGsLbFs4WtmCNtWYt269ywLGNlX
 MYqklhbnpucWG+kVJ+YWl+al6yXn525iBMb/tmM/t+xgXPnqo94hRiYOxkOMKkCdjzasvsAo
 xZKXn5eqJMI7lel7shBvSmJlVWpRfnxRaU5q8SFGU2AYTmSWEk3OByamvJJ4QzMDU0MTM0sD
 U0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGpjmKn3Ynr5UzdpzE8+BDuYNTryeffPGO
 4LjkdUeuPfozYYL9PJFSdu4XPCXT3/x7oeRissPGePqPu2s/bVp8vWyj6trahhPckk13DDcq
 f20P2nj34LPT09RFOJt2Bt/rflLc//KH2cXnDopR55Y8XGrqb+HdWlWuE7x8VuLDylKxKge5
 i0luYt/jr0wNW/yCZ8WV2tP7fs4w+2V09dcUydTCzXK7dPr35gmYzD5xanPvbF4P5hsJE/PW
 nJDlN9n92qfO4OQqC/6/W5+q71/tJVvKzS705+MW1ndV6mUywtMaFvHKLnNva9+qkPd0Scv8
 qRUeqy16fKJ3yVvaP7zpwRY6Le5Wy5V/PxWLi3y72ZVYijMSDbWYi4oTAUuOLvuUAwAA
X-CMS-MailID: 20230224085102eucas1p1d57ca7e6909c74db00799be1cff4d9d6
X-Msg-Generator: CA
X-RootMTR: 20230224085102eucas1p1d57ca7e6909c74db00799be1cff4d9d6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230224085102eucas1p1d57ca7e6909c74db00799be1cff4d9d6
References: <20230220115926.54623-1-jwd@defmacro.it>
 <20230220115926.54623-4-jwd@defmacro.it>
 <CGME20230224085102eucas1p1d57ca7e6909c74db00799be1cff4d9d6@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--eeouhgv7q2dyrfaw
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 12:59:24PM +0100, Jesper Devantier wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Add the mandatory Endurance Group identify data structures and log
> pages.
>=20
> For now, all namespaces in a subsystem belongs to a single Endurance
> Group.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c       | 48 +++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/ns.c         |  3 +++
>  hw/nvme/nvme.h       |  4 ++++
>  include/block/nvme.h | 42 +++++++++++++++++++++++++++++++-------
>  4 files changed, 89 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 99b92ff20b..729ed9adc5 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4454,6 +4454,44 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8=
_t rae, uint32_t buf_len,
>      return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
>  }
> =20
> +static uint16_t nvme_endgrp_info(NvmeCtrl *n,  uint8_t rae, uint32_t buf=
_len,
> +                                 uint64_t off, NvmeRequest *req)
> +{
> +    uint32_t dw11 =3D le32_to_cpu(req->cmd.cdw11);
> +    uint16_t endgrpid =3D (dw11 >> 16) & 0xffff;
> +    struct nvme_stats stats =3D {};
> +    NvmeEndGrpLog info =3D {};
> +    int i;
> +
> +    if (!n->subsys || endgrpid !=3D 0x1) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    if (off >=3D sizeof(info)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> +        NvmeNamespace *ns =3D nvme_subsys_ns(n->subsys, i);
> +        if (!ns) {
> +            continue;
> +        }
> +
> +        nvme_set_blk_stats(ns, &stats);
> +    }
> +
> +    info.data_units_read[0] =3D cpu_to_le64(stats.units_read / 100000000=
0);
> +    info.data_units_written[0] =3D cpu_to_le64(stats.units_written / 100=
0000000);
> +    info.media_units_written[0] =3D cpu_to_le64(stats.units_written / 10=
00000000);

This division is a bit strange for me. Maybe I'm missing something:

NVMe spec states this about Data Units {Written,Read}: "... Contains the
number of 512 byte data units the host has .... This value is reported
in thousands (i.e., a value of 1 corresponds to 1,000 units of 512 bytes
read) and is rounded up (e.g., one indicates that the number of 512 byte
data units {read,written} is from 1 to 1,000..."

1. The way I understand this text from the spec is that if 512 were
   written, then the data_units_written should contain 1; but as I see
   it now, it will contain 0. Am I missing something?

2. And where is the 512 units represented? I was expecting a bit shift by
   9.

3. And where is it rounding up to thousands?

Shouldn't it be like this:

 +    info.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_read=
 >> BDRV_SECTOR_BITS, 1000));
 +    info.data_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_w=
ritten >> BDRV_SECTOR_BITS, 1000));
 +    info.media_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_=
written >> BDRV_SECTOR_BITS, 1000));


> +    info.host_read_commands[0] =3D cpu_to_le64(stats.read_commands);
> +    info.host_write_commands[0] =3D cpu_to_le64(stats.write_commands);
> +
> +    buf_len =3D MIN(sizeof(info) - off, buf_len);
> +
> +    return nvme_c2h(n, (uint8_t *)&info + off, buf_len, req);
> +}
> +
> +
>  static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t=
 off,
>                                   NvmeRequest *req)
>  {
> @@ -4626,6 +4664,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeReque=
st *req)
>          return nvme_changed_nslist(n, rae, len, off, req);
>      case NVME_LOG_CMD_EFFECTS:
>          return nvme_cmd_effects(n, csi, len, off, req);
> +    case NVME_LOG_ENDGRP:
> +        return nvme_endgrp_info(n, rae, len, off, req);
>      default:
>          trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
>          return NVME_INVALID_FIELD | NVME_DNR;
> @@ -7382,6 +7422,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
>      uint8_t *pci_conf =3D pci_dev->config;
>      uint64_t cap =3D ldq_le_p(&n->bar.cap);
>      NvmeSecCtrlEntry *sctrl =3D nvme_sctrl(n);
> +    uint32_t ctratt;
> =20
>      id->vid =3D cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
>      id->ssvid =3D cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VEND=
OR_ID));
> @@ -7392,7 +7433,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
>      id->cntlid =3D cpu_to_le16(n->cntlid);
> =20
>      id->oaes =3D cpu_to_le32(NVME_OAES_NS_ATTR);
> -    id->ctratt |=3D cpu_to_le32(NVME_CTRATT_ELBAS);
> +    ctratt =3D NVME_CTRATT_ELBAS;
> =20
>      id->rab =3D 6;
> =20
> @@ -7459,8 +7500,13 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice =
*pci_dev)
> =20
>      if (n->subsys) {
>          id->cmic |=3D NVME_CMIC_MULTI_CTRL;
> +        ctratt |=3D NVME_CTRATT_ENDGRPS;
> +
> +        id->endgidmax =3D cpu_to_le16(0x1);
>      }
> =20
> +    id->ctratt =3D cpu_to_le32(ctratt);
> +
>      NVME_CAP_SET_MQES(cap, 0x7ff);
>      NVME_CAP_SET_CQR(cap, 1);
>      NVME_CAP_SET_TO(cap, 0xf);
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 8ebab4fbce..23872a174c 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -592,6 +592,8 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>      if (subsys) {
>          subsys->namespaces[nsid] =3D ns;
> =20
> +        ns->id_ns.endgid =3D cpu_to_le16(0x1);
> +
>          if (ns->params.detached) {
>              return;
>          }
> @@ -607,6 +609,7 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
> =20
>              return;
>          }
> +
>      }
> =20
>      nvme_attach_ns(n, ns);
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 5d221073ac..a88e0dea5c 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -45,6 +45,10 @@ typedef struct NvmeBus {
>      OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
>  #define SUBSYS_SLOT_RSVD (void *)0xFFFF
> =20
> +typedef struct NvmeEnduranceGroup {
> +    uint8_t event_conf;
> +} NvmeEnduranceGroup;
> +
>  typedef struct NvmeSubsystem {
>      DeviceState parent_obj;
>      NvmeBus     bus;
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 8027b7126b..4abc1bbfa5 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -58,6 +58,24 @@ enum NvmeBarRegs {
>      NVME_REG_PMRMSCU =3D offsetof(NvmeBar, pmrmscu),
>  };
> =20
> +typedef struct QEMU_PACKED NvmeEndGrpLog {
> +    uint8_t  critical_warning;
> +    uint8_t  rsvd[2];
> +    uint8_t  avail_spare;
> +    uint8_t  avail_spare_thres;
> +    uint8_t  percet_used;
> +    uint8_t  rsvd1[26];
> +    uint64_t end_estimate[2];
> +    uint64_t data_units_read[2];
> +    uint64_t data_units_written[2];
> +    uint64_t media_units_written[2];
> +    uint64_t host_read_commands[2];
> +    uint64_t host_write_commands[2];
> +    uint64_t media_integrity_errors[2];
> +    uint64_t no_err_info_log_entries[2];
> +    uint8_t rsvd2[352];
> +} NvmeEndGrpLog;
> +
>  enum NvmeCapShift {
>      CAP_MQES_SHIFT     =3D 0,
>      CAP_CQR_SHIFT      =3D 16,
> @@ -1005,11 +1023,12 @@ enum {
>  };
> =20
>  enum NvmeLogIdentifier {
> -    NVME_LOG_ERROR_INFO     =3D 0x01,
> -    NVME_LOG_SMART_INFO     =3D 0x02,
> -    NVME_LOG_FW_SLOT_INFO   =3D 0x03,
> -    NVME_LOG_CHANGED_NSLIST =3D 0x04,
> -    NVME_LOG_CMD_EFFECTS    =3D 0x05,
> +    NVME_LOG_ERROR_INFO                 =3D 0x01,
> +    NVME_LOG_SMART_INFO                 =3D 0x02,
> +    NVME_LOG_FW_SLOT_INFO               =3D 0x03,
> +    NVME_LOG_CHANGED_NSLIST             =3D 0x04,
> +    NVME_LOG_CMD_EFFECTS                =3D 0x05,
> +    NVME_LOG_ENDGRP                     =3D 0x09,
>  };
> =20
>  typedef struct QEMU_PACKED NvmePSD {
> @@ -1091,7 +1110,10 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
>      uint16_t    mntmt;
>      uint16_t    mxtmt;
>      uint32_t    sanicap;
> -    uint8_t     rsvd332[180];
> +    uint8_t     rsvd332[6];
> +    uint16_t    nsetidmax;
> +    uint16_t    endgidmax;
> +    uint8_t     rsvd342[170];
>      uint8_t     sqes;
>      uint8_t     cqes;
>      uint16_t    maxcmd;
> @@ -1134,6 +1156,7 @@ enum NvmeIdCtrlOaes {
>  };
> =20
>  enum NvmeIdCtrlCtratt {
> +    NVME_CTRATT_ENDGRPS =3D 1 <<  4,
>      NVME_CTRATT_ELBAS   =3D 1 << 15,
>  };
> =20
> @@ -1227,6 +1250,7 @@ enum NvmeNsAttachmentOperation {
>  #define NVME_AEC_SMART(aec)         (aec & 0xff)
>  #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
>  #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
> +#define NVME_AEC_ENDGRP_NOTICE(aec) ((aec >> 14) & 0x1)
> =20
>  #define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
>  #define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
> @@ -1338,7 +1362,10 @@ typedef struct QEMU_PACKED NvmeIdNs {
>      uint16_t    mssrl;
>      uint32_t    mcl;
>      uint8_t     msrc;
> -    uint8_t     rsvd81[23];
> +    uint8_t     rsvd81[18];
> +    uint8_t     nsattr;
> +    uint16_t    nvmsetid;
> +    uint16_t    endgid;
>      uint8_t     nguid[16];
>      uint64_t    eui64;
>      NvmeLBAF    lbaf[NVME_MAX_NLBAF];
> @@ -1655,5 +1682,6 @@ static inline void _nvme_check_size(void)
>      QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) !=3D 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) !=3D 32);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) !=3D 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeEndGrpLog) !=3D 512);
>  }
>  #endif
> --=20
> 2.39.2
>=20
>=20

--eeouhgv7q2dyrfaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmP4em8ACgkQupfNUreW
QU8INQv/QIQlS2SpJF2OCyN6fbephtwPMOSOwmV6KW3/tvFc/oox3sVxyb8k/VOp
nWzat9kcTUgfFXiF4vqKR95kvvKGej248FQ80PcWBUuijlwhIPlpNjX8iG/sDIQp
oCMnEQymUT39oyW1wpER9DjKFY+ngE7qPgdgQH42gPGYE24EeO/0kBYMaC88Q8tC
ggMlvtDUKc2vIeGO5qOVJXzHgFKY72rXF/tPVjJbfp1ngwgkUKO/N5dWbpnyfJCF
HKNtcMRFmY/ThdidkYKtWtwTVobMfF/UFk5zEo/G1qWows30sGYiFcsE/vySO6ln
c2bLmHUdskl8z5BYbRtMJVtCisOTJy1DDmSo3Cy/dSOu1jRVmwxZ/Al8ADtl9D7a
P84g5y82cXI9UbH2EaXePU4b8a5EzkxROzqhQYGHf0vB0q3jY3+08fk8D8+wFvZT
2llktUDo+rZMYECbsabqoZvdWrbHh+GGyGMoo1/yQZMG8C7MHaRbxNdiPCtZ4nuW
+koNnTpH
=pG1e
-----END PGP SIGNATURE-----

--eeouhgv7q2dyrfaw--

