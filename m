Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A382F6F45C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:08:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqf5-00034Z-Un; Tue, 02 May 2023 10:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1ptqf3-000344-Co
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:07:21 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1ptqez-0000MN-4j
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:07:20 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230502140050euoutp01d02f7751425dc6aea2dac8250df517d4~bWF7-JRW-1383813838euoutp01Z
 for <qemu-devel@nongnu.org>; Tue,  2 May 2023 14:00:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230502140050euoutp01d02f7751425dc6aea2dac8250df517d4~bWF7-JRW-1383813838euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683036050;
 bh=CGPR0Tze0F1uX7DmzheU0dPVppTue9JH5SUK9kHeH0c=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=BYSkyA/RoJI/3mXcfoMHmsWZzKsH1pPi/XWD53RJudt+YpzwTpwl5r5MQ9ymjmQ1S
 oySTc8QBk+HKcsDk4QcgWYGzTp1+gtbSqGFoUPEhO+TPLvePy6RPLQuAwig+F0Zz+J
 vkeDJblHe/EmjTXknItuq+7kyCTyS3+140kqKUdM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230502140050eucas1p26558a31599e1e9e8232ab48b6388f797~bWF7p0G2T0354503545eucas1p2D;
 Tue,  2 May 2023 14:00:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3A.BF.37758.29711546; Tue,  2
 May 2023 15:00:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230502140049eucas1p16282e05aa895cfa4fef7974fe2676b5f~bWF7LzxUf2894228942eucas1p1C;
 Tue,  2 May 2023 14:00:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230502140049eusmtrp1ac50b86715ff54ced6282fca87a6a3ab~bWF7LS3603175231752eusmtrp1H;
 Tue,  2 May 2023 14:00:49 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-fd-64511792164d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 83.51.14344.19711546; Tue,  2
 May 2023 15:00:49 +0100 (BST)
Received: from AMDN5139 (unknown [106.210.135.112]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230502140049eusmtip1c588722c6b3f7b3ef10fc14db8ec4f36~bWF6mkP461536315363eusmtip1e;
 Tue,  2 May 2023 14:00:49 +0000 (GMT)
From: "Tomasz Dzieciol/VIM Integration \(NC\) /SRPOL/Engineer/Samsung
 Electronics" <t.dzieciol@partner.samsung.com>
To: "'Sriram Yagnaraman'" <sriram.yagnaraman@est.tech>,
 <qemu-devel@nongnu.org>, <akihiko.odaki@daynix.com>
Cc: <jasowang@redhat.com>, <k.kwiecien@samsung.com>, <m.sochacki@samsung.com>
In-Reply-To: <DBBP189MB14338337B5EE87A7280E553795699@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Subject: RE: [PATCH v3 1/2] igb: RX descriptors handling cleanup
Date: Tue, 2 May 2023 16:00:48 +0200
Message-ID: <000001d97cfe$800e79b0$802b6d10$@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEd3+2yH27pherbGsInQNBOK9ndlAKi6rc9AwLIhmwB9c1WV7CBYM6Q
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djP87qTxANTDJZOErL4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGRv/XmcpuPyLsWLJ57fMDYxnVjF2MXJySAiYSByZcoepi5GLQ0hgBaPE
 xX/foJwvjBKPjswBqxIS+MwoMb0/pIuRA6zj1FZuiJrljBIzLj5jhXBeMEqs7d/HAtLAJlAq
 sbD7IBOILSKQK3HjwBk2kGZmAX+JYwvDQMKcAjESf+/sACsRFnCQ6J75H8xmEVCRePp4GZjN
 K+Ao8WFjIzuELShxcuYTsPHMAtoSyxa+Zob4QEHi59NlrBCr3CT+n25mgqgRkbjxqIUR5DYJ
 gQccEldunIJqcJF4vGIJE4QtLPHq+BZ2CFtG4vTkHhYIu1zi59lt7BDNLYwSe6ZOhiqylri0
 9ScrxDOaEut36UMCxVFi42EuCJNP4sZbQYgT+CQmbZvODBHmlehoE4KYoSPxbdNMtgmMyrOQ
 PDYLyWOzkDwwC2HVAkaWVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIGJ5/S/4193MK54
 9VHvECMTB+MhRgkOZiUR3g+FfilCvCmJlVWpRfnxRaU5qcWHGKU5WJTEebVtTyYLCaQnlqRm
 p6YWpBbBZJk4OKUamKwn3V+pJL2ijyVeevHJEtsbFwUtipwZ/t2Sqrvs/eVF72T1OOdcOc0N
 Fs9mHkrLODE59HvQjR/7iq68ZOjaGMl1fHVBcaCHkKXyQf2CU283OcyLrqn8XCrqdlNA4/bv
 qM7pRYvOTtnFIRsW/s+Rnevo/AeG3jVbUx8+sjNjbBPJrKm/YLFg5SWxiWuy9HVllbN2ZUxg
 1Di7Zvae3xuXFjkanYqzTv44ed/BKL7JQS9T9TbnBMgs/jNJ1PanreXbQNMfu16dCO8Qq+Lg
 DVKe7mstt36nwo0O21qNzCtnj+706/teaJk5MfCfrluk+/bKU1ur+VKfV5Y9eGw90UJh/uZ3
 i39cFJ1w8k3QSj0OISWW4oxEQy3mouJEAHCZWWSrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xu7oTxQNTDH68N7D4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GZse72Mv
 mPGFseLA7eVMDYy9Sxi7GDk4JARMJE5t5e5i5OIQEljKKDF7z2TWLkZOoLiUxL6e/+wQtrDE
 n2tdbBBFzxglZpz/xgaSYBMolth4o40RxBYRyJf4OO8mC4jNLBAosfXudUaIhtlMEr9bHoI1
 cArESPy9s4MJxBYWcJDonvkfzGYRUJF4+ngZmM0r4CjxYWMjO4QtKHFy5hOoodoST28+hbOX
 LXzNDHGdgsTPp8tYIY5wk/h/upkJokZE4sajFsYJjMKzkIyahWTULCSjZiFpWcDIsopRJLW0
 ODc9t9hIrzgxt7g0L10vOT93EyMwErcd+7llB+PKVx/1DjEycTAeYpTgYFYS4f1Q6JcixJuS
 WFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnAVJBXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliS
 mp2aWpBaBNPHxMEp1cBk/5ihcqn8uVUieRG1Oz7yT6ozVlepbNsbprrkmPSCp7tsZsbXPW3f
 OmnzX4X983wutV0LU5t1WHS6r9Orj9NCu6a/kHSYxMC9zFzH9YdAUdPqoNB5m+7c/nrnpqHl
 er524+W5611ObUkO2X5Qt/PwwjUxgjt+SP1evHSjhc+c4LhF8+/It+YJrz8nHqtsUj5Hryll
 Ve9Grqi25Ye1bhkmG9R+8jP74zRLWHrOqZnc70S7kyO3/XLonK5S/sb+mlDCyh1PlVM+7Y22
 c+RvYjC50Gn57vC5yiwhjlMeTrra1wLunjWUib1swlfq8ze90sef49TE+tYk3zOHMvexPhBe
 XL//+dQ42VenGA2PnpNWYinOSDTUYi4qTgQA/SnZWk0DAAA=
X-CMS-MailID: 20230502140049eucas1p16282e05aa895cfa4fef7974fe2676b5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
 <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
 <DBBP189MB14338337B5EE87A7280E553795699@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Not Linux/DPDK/FreeBSD for IGB.

Change here adds additional condition (RXCSUM.IPPCSE set) to enable putting=
 IP ID into descriptor, besides clearing RXCSUM.PCSD (required according to=
 Intel 82576 datasheet) that was not present in the e1000e code.

-----Original Message-----
From: Sriram Yagnaraman <sriram.yagnaraman=40est.tech>=20
Sent: niedziela, 30 kwietnia 2023 13:57
To: Tomasz Dzieciol <t.dzieciol=40partner.samsung.com>; qemu-devel=40nongnu=
.org; akihiko.odaki=40daynix.com
Cc: jasowang=40redhat.com; k.kwiecien=40samsung.com; m.sochacki=40samsung.c=
om
Subject: RE: =5BPATCH v3 1/2=5D igb: RX descriptors handling cleanup



> -----Original Message-----
> From: Tomasz Dzieciol <t.dzieciol=40partner.samsung.com>
> Sent: Thursday, 27 April 2023 12:48
> To: qemu-devel=40nongnu.org; akihiko.odaki=40daynix.com
> Cc: Sriram Yagnaraman <sriram.yagnaraman=40est.tech>;=20
> jasowang=40redhat.com; k.kwiecien=40samsung.com; m.sochacki=40samsung.com
> Subject: =5BPATCH v3 1/2=5D igb: RX descriptors handling cleanup
>=20
> Format of Intel 82576 was changed in comparison to Intel 82574=20
> extended descriptors. This change updates filling of advanced=20
> descriptors fields
> accordingly:
> * remove TCP ACK detection
> * add IPv6 with extensions traffic detection
> * fragment checksum and IP ID is filled only when RXCSUM.IPPCSE is set (i=
n
>   addition to RXCSUM.PCSD bit cleared condition)

Just curious if any device driver still uses IP payload checksum enable (IP=
PCSE)?

>=20
> Refactoring is done in preparation for support of multiple advanced=20
> descriptors RX modes, especially packet-split modes.
>=20
> Signed-off-by: Tomasz Dzieciol <t.dzieciol=40partner.samsung.com>
> ---
>  hw/net/e1000e_core.c     =7C  18 +-
>  hw/net/e1000x_regs.h     =7C   1 +
>  hw/net/igb_core.c        =7C 478 ++++++++++++++++++++++++---------------
>  hw/net/igb_regs.h        =7C  12 +-
>  hw/net/trace-events      =7C   6 +-
>  tests/qtest/libqos/igb.c =7C   3 +
>  6 files changed, 316 insertions(+), 202 deletions(-)
>=20
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c index
> 78373d7db7..0085ad53c2 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> =40=40 -1418,11 +1418,11 =40=40 e1000e_write_hdr_to_rx_buffers(E1000ECore
> *core,  =7D
>=20
>  static void
> -e1000e_write_to_rx_buffers(E1000ECore *core,
> -                           hwaddr ba=5BMAX_PS_BUFFERS=5D,
> -                           e1000e_ba_state *bastate,
> -                           const char *data,
> -                           dma_addr_t data_len)
> +e1000e_write_payload_frag_to_rx_buffers(E1000ECore *core,
> +                                        hwaddr ba=5BMAX_PS_BUFFERS=5D,
> +                                        e1000e_ba_state *bastate,
> +                                        const char *data,
> +                                        dma_addr_t data_len)
>  =7B
>      while (data_len > 0) =7B
>          uint32_t cur_buf_len =3D core->rxbuf_sizes=5Bbastate->cur_idx=5D=
;
> =40=40 -1594,8 +1594,10 =40=40 e1000e_write_packet_to_guest(E1000ECore
> *core, struct NetRxPkt *pkt,
>                  while (copy_size) =7B
>                      iov_copy =3D MIN(copy_size, iov->iov_len -=20
> iov_ofs);
>=20
> -                    e1000e_write_to_rx_buffers(core, ba, &bastate,
> -                                            iov->iov_base + iov_ofs, iov=
_copy);
> +                    e1000e_write_payload_frag_to_rx_buffers(core, ba, &b=
astate,
> +                                                            iov->iov_bas=
e +
> +                                                            iov_ofs,
> +                                                           =20
> + iov_copy);
>=20
>                      copy_size -=3D iov_copy;
>                      iov_ofs +=3D iov_copy; =40=40 -1607,7 +1609,7 =40=40=
=20
> e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>=20
>                  if (desc_offset + desc_size >=3D total_size) =7B
>                      /* Simulate FCS checksum presence in the last descri=
ptor */
> -                    e1000e_write_to_rx_buffers(core, ba, &bastate,
> +                    e1000e_write_payload_frag_to_rx_buffers(core, ba,=20
> + &bastate,
>                            (const char *) &fcs_pad, e1000x_fcs_len(core->=
mac));
>                  =7D
>              =7D
> diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h index
> 13760c66d3..344fd10359 100644
> --- a/hw/net/e1000x_regs.h
> +++ b/hw/net/e1000x_regs.h
> =40=40 -827,6 +827,7 =40=40 union e1000_rx_desc_packet_split =7B
>  /* Receive Checksum Control bits */
>  =23define E1000_RXCSUM_IPOFLD     0x100   /* IP Checksum Offload Enable =
*/
>  =23define E1000_RXCSUM_TUOFLD     0x200   /* TCP/UDP Checksum Offload
> Enable */
> +=23define E1000_RXCSUM_IPPCSE     0x1000  /* IP Payload Checksum enable =
*/
>  =23define E1000_RXCSUM_PCSD       0x2000  /* Packet Checksum Disable */
>=20
>  =23define E1000_RING_DESC_LEN       (16)
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index=20
> 96b7335b31..1cb64402aa 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> =40=40 -267,6 +267,21 =40=40 igb_rx_use_legacy_descriptor(IGBCore *core)
>      return false;
>  =7D
>=20
> +typedef struct E1000E_RingInfo_st =7B
> +    int dbah;
> +    int dbal;
> +    int dlen;
> +    int dh;
> +    int dt;
> +    int idx;
> +=7D E1000E_RingInfo;
> +
> +static uint32_t
> +igb_rx_queue_desctyp_get(IGBCore *core, const E1000E_RingInfo *r) =7B
> +    return core->mac=5BE1000_SRRCTL(r->idx) >> 2=5D &=20
> +E1000_SRRCTL_DESCTYPE_MASK; =7D
> +
>  static inline bool
>  igb_rss_enabled(IGBCore *core)
>  =7B
> =40=40 -694,15 +709,6 =40=40 static uint32_t igb_rx_wb_eic(IGBCore *core,=
 int
> queue_idx)
>      return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;  =7D
>=20
> -typedef struct E1000E_RingInfo_st =7B
> -    int dbah;
> -    int dbal;
> -    int dlen;
> -    int dh;
> -    int dt;
> -    int idx;
> -=7D E1000E_RingInfo;
> -
>  static inline bool
>  igb_ring_empty(IGBCore *core, const E1000E_RingInfo *r)  =7B =40=40 -941=
,6
> +947,14 =40=40 igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r,=20
> +size_t
> total_size)
>                           bufsize;
>  =7D
>=20
> +static uint32_t
> +igb_get_queue_rx_header_buf_size(IGBCore *core, const E1000E_RingInfo
> +*r) =7B
> +    uint32_t srrctl =3D core->mac=5BE1000_SRRCTL(r->idx) >> 2=5D;
> +    return (srrctl & E1000_SRRCTL_BSIZEHDRSIZE_MASK) >>
> +           E1000_SRRCTL_BSIZEHDRSIZE_SHIFT; =7D
> +
>  void
>  igb_start_recv(IGBCore *core)
>  =7B
> =40=40 -1232,7 +1246,7 =40=40 igb_read_adv_rx_descr(IGBCore *core, union=
=20
> e1000_adv_rx_desc *desc,  =7D
>=20
>  static inline void
> -igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
> +igb_read_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
>                    hwaddr *buff_addr)
>  =7B
>      if (igb_rx_use_legacy_descriptor(core)) =7B =40=40 -1281,15 +1295,11=
 =40=40=20
> igb_verify_csum_in_sw(IGBCore *core,  =7D
>=20
>  static void
> -igb_build_rx_metadata(IGBCore *core,
> -                      struct NetRxPkt *pkt,
> -                      bool is_eop,
> -                      const E1000E_RSSInfo *rss_info, uint16_t etqf, boo=
l ts,
> -                      uint16_t *pkt_info, uint16_t *hdr_info,
> -                      uint32_t *rss,
> -                      uint32_t *status_flags,
> -                      uint16_t *ip_id,
> -                      uint16_t *vlan_tag)
> +igb_build_rx_metadata_common(IGBCore *core,
> +                             struct NetRxPkt *pkt,
> +                             bool is_eop,
> +                             uint32_t *status_flags,
> +                             uint16_t *vlan_tag)
>  =7B
>      struct virtio_net_hdr *vhdr;
>      bool hasip4, hasip6, csum_valid;
> =40=40 -1298,7 +1308,6 =40=40 igb_build_rx_metadata(IGBCore *core,
>      *status_flags =3D E1000_RXD_STAT_DD;
>=20
>      /* No additional metadata needed for non-EOP descriptors */
> -    /* TODO: EOP apply only to status so don't skip whole function. */
>      if (=21is_eop) =7B
>          goto func_exit;
>      =7D
> =40=40 -1315,64 +1324,6 =40=40 igb_build_rx_metadata(IGBCore *core,
>          trace_e1000e_rx_metadata_vlan(*vlan_tag);
>      =7D
>=20
> -    /* Packet parsing results */
> -    if ((core->mac=5BRXCSUM=5D & E1000_RXCSUM_PCSD) =21=3D 0) =7B
> -        if (rss_info->enabled) =7B
> -            *rss =3D cpu_to_le32(rss_info->hash);
> -            trace_igb_rx_metadata_rss(*rss);
> -        =7D
> -    =7D else if (hasip4) =7B
> -            *status_flags =7C=3D E1000_RXD_STAT_IPIDV;
> -            *ip_id =3D cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
> -            trace_e1000e_rx_metadata_ip_id(*ip_id);
> -    =7D
> -
> -    if (l4hdr_proto =3D=3D ETH_L4_HDR_PROTO_TCP &&
> net_rx_pkt_is_tcp_ack(pkt)) =7B
> -        *status_flags =7C=3D E1000_RXD_STAT_ACK;
> -        trace_e1000e_rx_metadata_ack();
> -    =7D
> -
> -    if (pkt_info) =7B
> -        *pkt_info =3D rss_info->enabled ? rss_info->type : 0;
> -
> -        if (etqf < 8) =7B
> -            *pkt_info =7C=3D BIT(11) =7C (etqf << 4);
> -        =7D else =7B
> -            if (hasip4) =7B
> -                *pkt_info =7C=3D E1000_ADVRXD_PKT_IP4;
> -            =7D
> -
> -            if (hasip6) =7B
> -                *pkt_info =7C=3D E1000_ADVRXD_PKT_IP6;
> -            =7D
> -
> -            switch (l4hdr_proto) =7B
> -            case ETH_L4_HDR_PROTO_TCP:
> -                *pkt_info =7C=3D E1000_ADVRXD_PKT_TCP;
> -                break;
> -
> -            case ETH_L4_HDR_PROTO_UDP:
> -                *pkt_info =7C=3D E1000_ADVRXD_PKT_UDP;
> -                break;
> -
> -            case ETH_L4_HDR_PROTO_SCTP:
> -                *pkt_info =7C=3D E1000_ADVRXD_PKT_SCTP;
> -                break;
> -
> -            default:
> -                break;
> -            =7D
> -        =7D
> -    =7D
> -
> -    if (hdr_info) =7B
> -        *hdr_info =3D 0;
> -    =7D
> -
> -    if (ts) =7B
> -        *status_flags =7C=3D BIT(16);
> -    =7D
> -
>      /* RX CSO information */
>      if (hasip6 && (core->mac=5BRFCTL=5D & E1000_RFCTL_IPV6_XSUM_DIS)) =
=7B
>          trace_e1000e_rx_metadata_ipv6_sum_disabled();
> =40=40 -1426,58 +1377,126 =40=40 func_exit:
>  =7D
>=20
>  static inline void
> -igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
> +igb_write_lgcy_rx_descr(IGBCore *core,
> +                        struct e1000_rx_desc *desc,
>                          struct NetRxPkt *pkt,
> -                        const E1000E_RSSInfo *rss_info, uint16_t etqf, b=
ool ts,
> +                        const E1000E_RSSInfo *rss_info,
>                          uint16_t length)  =7B
> -    uint32_t status_flags, rss;
> -    uint16_t ip_id;
> +    uint32_t status_flags;
>=20
>      assert(=21rss_info->enabled);
> +
> +    memset(desc, 0, sizeof(*desc));
>      desc->length =3D cpu_to_le16(length);
> -    desc->csum =3D 0;
> +    igb_build_rx_metadata_common(core, pkt, pkt =21=3D NULL,
> +                                 &status_flags,
> +                                 &desc->special);
>=20
> -    igb_build_rx_metadata(core, pkt, pkt =21=3D NULL,
> -                          rss_info, etqf, ts,
> -                          NULL, NULL, &rss,
> -                          &status_flags, &ip_id,
> -                          &desc->special);
>      desc->errors =3D (uint8_t) (le32_to_cpu(status_flags) >> 24);
>      desc->status =3D (uint8_t) le32_to_cpu(status_flags);  =7D
>=20
> +static uint16_t
> +igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt,=20
> +uint16_t etqf) =7B
> +    uint16_t pkt_type =3D 0;
> +    bool hasip4, hasip6;
> +    EthL4HdrProto l4hdr_proto;
> +
> +    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
> +
> +    if (hasip6 && =21(core->mac=5BRFCTL=5D & E1000_RFCTL_IPV6_DIS)) =7B
> +        eth_ip6_hdr_info *ip6hdr_info  =3D net_rx_pkt_get_ip6_info(pkt);
> +        pkt_type =7C=3D ip6hdr_info->has_ext_hdrs ? E1000_ADVRXD_PKT_IP6=
E :
> +                                                E1000_ADVRXD_PKT_IP6;
> +    =7D else if (hasip4) =7B
> +        pkt_type =3D E1000_ADVRXD_PKT_IP4;
> +    =7D
> +
> +    if (etqf < 8) =7B
> +        pkt_type =7C=3D (BIT(11) >> 4) =7C etqf;
> +        return pkt_type;
> +    =7D
> +
> +    switch (l4hdr_proto) =7B
> +    case ETH_L4_HDR_PROTO_TCP:
> +        pkt_type =7C=3D E1000_ADVRXD_PKT_TCP;
> +        break;
> +    case ETH_L4_HDR_PROTO_UDP:
> +        pkt_type =7C=3D E1000_ADVRXD_PKT_UDP;
> +        break;
> +    case ETH_L4_HDR_PROTO_SCTP:
> +        pkt_type =7C=3D E1000_ADVRXD_PKT_SCTP;
> +        break;
> +    default:
> +        break;
> +    =7D
> +
> +    return pkt_type;
> +=7D
> +
>  static inline void
> -igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> +igb_write_adv_rx_descr(IGBCore *core,
> +                       union e1000_adv_rx_desc *d,
>                         struct NetRxPkt *pkt,
> -                       const E1000E_RSSInfo *rss_info, uint16_t etqf, bo=
ol ts,
> +                       const E1000E_RSSInfo *rss_info,
> +                       uint16_t etqf,
> +                       bool ts,
>                         uint16_t length)  =7B
> -    memset(&desc->wb, 0, sizeof(desc->wb));
> +    bool hasip4, hasip6;
> +    EthL4HdrProto l4hdr_proto;
> +    uint16_t rss_type =3D 0, pkt_type;
> +    bool eop =3D (pkt =21=3D NULL);
> +    memset(&d->wb, 0, sizeof(d->wb));
> +
> +    d->wb.upper.length =3D cpu_to_le16(length);
> +    igb_build_rx_metadata_common(core, pkt, eop,
> +                                 &d->wb.upper.status_error,
> +                                 &d->wb.upper.vlan);
> +
> +    if (=21eop) =7B
> +        return;
> +    =7D
> +
> +    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
> +
> +    if ((core->mac=5BRXCSUM=5D & E1000_RXCSUM_PCSD) =21=3D 0) =7B
> +        if (rss_info->enabled) =7B
> +            d->wb.lower.hi_dword.rss =3D cpu_to_le32(rss_info->hash);
> +            rss_type =3D rss_info->type;
> +            trace_igb_rx_metadata_rss(d->wb.lower.hi_dword.rss, rss_type=
);
> +        =7D
> +    =7D else if (core->mac=5BRXCSUM=5D & E1000_RXCSUM_IPPCSE &&
> +               hasip4) =7B
> +        d->wb.lower.hi_dword.csum_ip.ip_id =3D
> cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
> +        trace_e1000e_rx_metadata_ip_id(d->wb.lower.hi_dword.csum_ip.ip_i=
d);
> +    =7D
>=20
> -    desc->wb.upper.length =3D cpu_to_le16(length);
> +    if (ts) =7B
> +        d->wb.upper.status_error =7C=3D BIT(16);
> +    =7D
>=20
> -    igb_build_rx_metadata(core, pkt, pkt =21=3D NULL,
> -                          rss_info, etqf, ts,
> -                          &desc->wb.lower.lo_dword.pkt_info,
> -                          &desc->wb.lower.lo_dword.hdr_info,
> -                          &desc->wb.lower.hi_dword.rss,
> -                          &desc->wb.upper.status_error,
> -                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
> -                          &desc->wb.upper.vlan);
> +    pkt_type =3D igb_rx_desc_get_packet_type(core, pkt, etqf);
> +    trace_e1000e_rx_metadata_pkt_type(pkt_type);
> +    d->wb.lower.lo_dword.pkt_info =3D cpu_to_le16(rss_type =7C (pkt_type=
=20
> + << 4));
>  =7D
>=20
>  static inline void
> -igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
> -                   struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
> -                   uint16_t etqf, bool ts, uint16_t length)
> +igb_write_rx_descr(IGBCore *core,
> +                   union e1000_rx_desc_union *desc,
> +                   struct NetRxPkt *pkt,
> +                   const E1000E_RSSInfo *rss_info,
> +                   uint16_t etqf,
> +                   bool ts,
> +                   uint16_t(*written)=5BMAX_PS_BUFFERS=5D,
> +                   const E1000E_RingInfo *r)
>  =7B
>      if (igb_rx_use_legacy_descriptor(core)) =7B
> -        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
> -                                etqf, ts, length);
> +        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,=20
> + (*written)=5B1=5D);
>      =7D else =7B
> -        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
> -                               etqf, ts, length);
> +        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, etqf,=20
> + ts, (*written)=5B1=5D);
>      =7D
>  =7D
>=20
> =40=40 -1513,19 +1532,6 =40=40 igb_pci_dma_write_rx_desc(IGBCore *core,=
=20
> PCIDevice *dev, dma_addr_t addr,
>      =7D
>  =7D
>=20
> -static void
> -igb_write_to_rx_buffers(IGBCore *core,
> -                        PCIDevice *d,
> -                        hwaddr ba,
> -                        uint16_t *written,
> -                        const char *data,
> -                        dma_addr_t data_len)
> -=7B
> -    trace_igb_rx_desc_buff_write(ba, *written, data, data_len);
> -    pci_dma_write(d, ba + *written, data, data_len);
> -    *written +=3D data_len;
> -=7D
> -
>  static void
>  igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
>                      size_t pkt_size, size_t pkt_fcs_size) =40=40 -1551,6=
=20
> +1557,137 =40=40 igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_R=
ingInfo *rxi)
>             ((core->mac=5BE1000_SRRCTL(rxi->idx) >> 2=5D >> 20) & 31) *=
=20
> 16;  =7D
>=20
> +typedef struct IGB_BaState_st =7B
> +    uint16_t written=5BMAX_PS_BUFFERS=5D;
> +    uint8_t cur_idx;
> +=7D IGB_BaState;
> +
> +typedef struct IGB_PacketRxDMAState_st =7B
> +    size_t size;
> +    size_t total_size;
> +    size_t ps_hdr_len;
> +    size_t desc_size;
> +    size_t desc_offset;
> +    uint32_t rx_desc_packet_buf_size;
> +    uint32_t rx_desc_header_buf_size;
> +    struct iovec *iov;
> +    size_t iov_ofs;
> +    bool is_first;
> +    IGB_BaState bastate;
> +    hwaddr ba=5BMAX_PS_BUFFERS=5D;
> +=7D IGB_PacketRxDMAState;
> +
> +static void
> +igb_truncate_to_descriptor_size(IGB_PacketRxDMAState *pdma_st, size_t
> +*size) =7B
> +    if (*size > pdma_st->rx_desc_packet_buf_size) =7B
> +        *size =3D pdma_st->rx_desc_packet_buf_size;
> +    =7D
> +=7D
> +
> +static void
> +igb_write_payload_frag_to_rx_buffers(IGBCore *core,
> +                                     PCIDevice *d,
> +                                     hwaddr (*ba)=5BMAX_PS_BUFFERS=5D,
> +                                     IGB_BaState *bastate,
> +                                     uint32_t cur_buf_len,
> +                                     const char *data,
> +                                     dma_addr_t data_len) =7B
> +    while (data_len > 0) =7B
> +        assert(bastate->cur_idx < MAX_PS_BUFFERS);
> +
> +        uint32_t cur_buf_bytes_left =3D cur_buf_len -
> +                                      bastate->written=5Bbastate->cur_id=
x=5D;
> +        uint32_t bytes_to_write =3D MIN(data_len, cur_buf_bytes_left);
> +
> +        trace_igb_rx_desc_buff_write(bastate->cur_idx,
> +                                     (*ba)=5Bbastate->cur_idx=5D,
> +                                     bastate->written=5Bbastate->cur_idx=
=5D,
> +                                     data,
> +                                     bytes_to_write);
> +
> +        pci_dma_write(d,
> +                      (*ba)=5Bbastate->cur_idx=5D +
> +                      bastate->written=5Bbastate->cur_idx=5D,
> +                      data, bytes_to_write);
> +
> +        bastate->written=5Bbastate->cur_idx=5D +=3D bytes_to_write;
> +        data +=3D bytes_to_write;
> +        data_len -=3D bytes_to_write;
> +
> +        if (bastate->written=5Bbastate->cur_idx=5D =3D=3D cur_buf_len) =
=7B
> +            bastate->cur_idx++;
> +        =7D
> +    =7D
> +=7D
> +
> +static void
> +igb_write_payload_to_rx_buffers(IGBCore *core,
> +                                struct NetRxPkt *pkt,
> +                                PCIDevice *d,
> +                                IGB_PacketRxDMAState *pdma_st,
> +                                size_t *copy_size) =7B
> +    static const uint32_t fcs_pad;
> +    size_t iov_copy;
> +
> +    /* Copy packet payload */
> +    while (*copy_size) =7B
> +        iov_copy =3D MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->io=
v_ofs);
> +        igb_write_payload_frag_to_rx_buffers(core, d,
> +                                             &pdma_st->ba,
> +                                             &pdma_st->bastate,
> +                                             pdma_st->rx_desc_packet_buf=
_size,
> +                                             pdma_st->iov->iov_base +
> +                                             pdma_st->iov_ofs,
> +                                             iov_copy);
> +
> +        *copy_size -=3D iov_copy;
> +        pdma_st->iov_ofs +=3D iov_copy;
> +        if (pdma_st->iov_ofs =3D=3D pdma_st->iov->iov_len) =7B
> +            pdma_st->iov++;
> +            pdma_st->iov_ofs =3D 0;
> +        =7D
> +    =7D
> +
> +    if (pdma_st->desc_offset + pdma_st->desc_size >=3D pdma_st->total_si=
ze) =7B
> +        /* Simulate FCS checksum presence in the last descriptor */
> +        igb_write_payload_frag_to_rx_buffers(core, d,
> +                                             &pdma_st->ba,
> +                                             &pdma_st->bastate,
> +                                             pdma_st->rx_desc_packet_buf=
_size,
> +                                             (const char *) &fcs_pad,
> +                                             e1000x_fcs_len(core->mac));
> +    =7D
> +=7D
> +
> +static void
> +igb_write_to_rx_buffers(IGBCore *core,
> +                        struct NetRxPkt *pkt,
> +                        PCIDevice *d,
> +                        IGB_PacketRxDMAState *pdma_st) =7B
> +    size_t copy_size;
> +
> +    if (=21(pdma_st->ba)=5B1=5D) =7B
> +        /* as per intel docs; skip descriptors with null buf addr */
> +        trace_e1000e_rx_null_descriptor();
> +        return;
> +    =7D
> +
> +    if (pdma_st->desc_offset >=3D pdma_st->size) =7B
> +        return;
> +    =7D
> +
> +    pdma_st->desc_size =3D pdma_st->total_size - pdma_st->desc_offset;
> +    igb_truncate_to_descriptor_size(pdma_st, &pdma_st->desc_size);
> +    copy_size =3D pdma_st->size - pdma_st->desc_offset;
> +    igb_truncate_to_descriptor_size(pdma_st, &copy_size);
> +    pdma_st->bastate.cur_idx =3D 1;
> +    igb_write_payload_to_rx_buffers(core, pkt, d, pdma_st,=20
> +&copy_size); =7D
> +
>  static void
>  igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>                            const E1000E_RxRing *rxr, =40=40 -1560,91=20
> +1697,58 =40=40 igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt =
*pkt,
>      PCIDevice *d;
>      dma_addr_t base;
>      union e1000_rx_desc_union desc;
> -    size_t desc_size;
> -    size_t desc_offset =3D 0;
> -    size_t iov_ofs =3D 0;
> -
> -    struct iovec *iov =3D net_rx_pkt_get_iovec(pkt);
> -    size_t size =3D net_rx_pkt_get_total_len(pkt);
> -    size_t total_size =3D size + e1000x_fcs_len(core->mac);
> -    const E1000E_RingInfo *rxi =3D rxr->i;
> -    size_t bufsize =3D igb_rxbufsize(core, rxi);
> -
> +    const E1000E_RingInfo *rxi;
> +    size_t rx_desc_len;
> +
> +    IGB_PacketRxDMAState pdma_st =3D =7B0=7D;
> +    pdma_st.is_first =3D true;
> +    pdma_st.size =3D net_rx_pkt_get_total_len(pkt);
> +    pdma_st.total_size =3D pdma_st.size + e1000x_fcs_len(core->mac);
> +
> +    rxi =3D rxr->i;
> +    rx_desc_len =3D core->rx_desc_len;
> +    pdma_st.rx_desc_packet_buf_size =3D
> +        igb_rxbufsize(core, rxi);
> +    pdma_st.rx_desc_header_buf_size =3D
> +        igb_get_queue_rx_header_buf_size(core, rxi);
> +    pdma_st.iov =3D net_rx_pkt_get_iovec(pkt);
>      d =3D pcie_sriov_get_vf_at_index(core->owner, rxi->idx % 8);
>      if (=21d) =7B
>          d =3D core->owner;
>      =7D
>=20
>      do =7B
> -        hwaddr ba;
> -        uint16_t written =3D 0;
> +        memset(&pdma_st.bastate, 0, sizeof(IGB_BaState));
>          bool is_last =3D false;
>=20
> -        desc_size =3D total_size - desc_offset;
> -
> -        if (desc_size > bufsize) =7B
> -            desc_size =3D bufsize;
> -        =7D
> -
>          if (igb_ring_empty(core, rxi)) =7B
>              return;
>          =7D
>=20
>          base =3D igb_ring_head_descr(core, rxi);
> +        pci_dma_read(d, base, &desc, rx_desc_len);
> +        trace_e1000e_rx_descr(rxi->idx, base, rx_desc_len);
>=20
> -        pci_dma_read(d, base, &desc, core->rx_desc_len);
> -
> -        trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
> -
> -        igb_read_rx_descr(core, &desc, &ba);
> -
> -        if (ba) =7B
> -            if (desc_offset < size) =7B
> -                static const uint32_t fcs_pad;
> -                size_t iov_copy;
> -                size_t copy_size =3D size - desc_offset;
> -                if (copy_size > bufsize) =7B
> -                    copy_size =3D bufsize;
> -                =7D
> -
> -                /* Copy packet payload */
> -                while (copy_size) =7B
> -                    iov_copy =3D MIN(copy_size, iov->iov_len - iov_ofs);
> -
> -                    igb_write_to_rx_buffers(core, d, ba, &written,
> -                                            iov->iov_base + iov_ofs, iov=
_copy);
> +        igb_read_rx_descr(core, &desc, &pdma_st->ba=5B1=5D, rxi);
>=20
> -                    copy_size -=3D iov_copy;
> -                    iov_ofs +=3D iov_copy;
> -                    if (iov_ofs =3D=3D iov->iov_len) =7B
> -                        iov++;
> -                        iov_ofs =3D 0;
> -                    =7D
> -                =7D
> -
> -                if (desc_offset + desc_size >=3D total_size) =7B
> -                    /* Simulate FCS checksum presence in the last descri=
ptor */
> -                    igb_write_to_rx_buffers(core, d, ba, &written,
> -                          (const char *) &fcs_pad, e1000x_fcs_len(core->=
mac));
> -                =7D
> -            =7D
> -        =7D else =7B /* as per intel docs; skip descriptors with null bu=
f addr */
> -            trace_e1000e_rx_null_descriptor();
> -        =7D
> -        desc_offset +=3D desc_size;
> -        if (desc_offset >=3D total_size) =7B
> +        igb_write_to_rx_buffers(core, pkt, d, &pdma_st);
> +        pdma_st.desc_offset +=3D pdma_st.desc_size;
> +        if (pdma_st.desc_offset >=3D pdma_st.total_size) =7B
>              is_last =3D true;
>          =7D
>=20
> -        igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
> -                           rss_info, etqf, ts, written);
> -        igb_pci_dma_write_rx_desc(core, d, base, &desc, core->rx_desc_le=
n);
> -
> -        igb_ring_advance(core, rxi, core->rx_desc_len /
> E1000_MIN_RX_DESC_LEN);
> -
> -    =7D while (desc_offset < total_size);
> -
> -    igb_update_rx_stats(core, rxi, size, total_size);
> +        igb_write_rx_descr(core, &desc,
> +                           is_last ? pkt : NULL,
> +                           rss_info,
> +                           etqf, ts,
> +                           &pdma_st.bastate.written,
> +                           rxi);
> +        pci_dma_write(d, base, &desc, rx_desc_len);
> +        igb_ring_advance(core, rxi,
> +                         rx_desc_len / E1000_MIN_RX_DESC_LEN);
> +    =7D while (pdma_st.desc_offset < pdma_st.total_size);
> +
> +    igb_update_rx_stats(core, rxi, pdma_st.size, pdma_st.total_size);
>  =7D
>=20
>  static bool
> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h index
> 82ff195dfc..c4ede22181 100644
> --- a/hw/net/igb_regs.h
> +++ b/hw/net/igb_regs.h
> =40=40 -452,6 +452,7 =40=40 union e1000_adv_rx_desc =7B
>  =23define E1000_SRRCTL_BSIZEHDRSIZE_MASK         0x00000F00
>  =23define E1000_SRRCTL_BSIZEHDRSIZE_SHIFT        2  /* Shift _left_ */
>  =23define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF       0x02000000
> +=23define E1000_SRRCTL_DESCTYPE_HDR_SPLIT        0x04000000
>  =23define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
>  =23define E1000_SRRCTL_DESCTYPE_MASK             0x0E000000
>  =23define E1000_SRRCTL_DROP_EN                   0x80000000
> =40=40 -692,11 +693,12 =40=40 union e1000_adv_rx_desc =7B
>=20
>  =23define E1000_STATUS_NUM_VFS_SHIFT 14
>=20
> -=23define E1000_ADVRXD_PKT_IP4 BIT(4)
> -=23define E1000_ADVRXD_PKT_IP6 BIT(6)
> -=23define E1000_ADVRXD_PKT_TCP BIT(8)
> -=23define E1000_ADVRXD_PKT_UDP BIT(9)
> -=23define E1000_ADVRXD_PKT_SCTP BIT(10)
> +=23define E1000_ADVRXD_PKT_IP4  BIT(0)
> +=23define E1000_ADVRXD_PKT_IP6  BIT(2)
> +=23define E1000_ADVRXD_PKT_IP6E BIT(3)
> +=23define E1000_ADVRXD_PKT_TCP  BIT(4)
> +=23define E1000_ADVRXD_PKT_UDP  BIT(5)
> +=23define E1000_ADVRXD_PKT_SCTP BIT(6)
>=20
>  static inline uint8_t igb_ivar_entry_rx(uint8_t i)  =7B diff --git=20
> a/hw/net/trace- events b/hw/net/trace-events index=20
> e4a98b2c7d..9a02261360 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> =40=40 -277,9 +277,9 =40=40 igb_core_mdic_write_unhandled(uint32_t addr) =
=22MDIC=20
> WRITE: PHY=5B%u=5D UNHANDLED=22
>  igb_link_set_ext_params(bool asd_check, bool speed_select_bypass,=20
> bool
> pfrstd) =22Set extended link params: ASD check: %d, Speed select bypass:=
=20
> %d, PF reset done: %d=22
>=20
>  igb_rx_desc_buff_size(uint32_t b) =22buffer size: %u=22
> -igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void*=20
> source, uint32_t len) =22addr: 0x%=22PRIx64=22, offset: %u, from: %p, len=
gth: %u=22
> +igb_rx_desc_buff_write(uint8_t idx, uint64_t addr, uint16_t offset,=20
> +const void*
> source, uint32_t len) =22buffer =23%u, addr: 0x%=22PRIx64=22, offset: %u,=
=20
> from: %p,
> length: %u=22
>=20
> -igb_rx_metadata_rss(uint32_t rss) =22RSS data: 0x%X=22
> +igb_rx_metadata_rss(uint32_t rss, uint16_t rss_pkt_type) =22RSS data: rs=
s:
> 0x%X, rss_pkt_type: 0x%X=22
>=20
>  igb_irq_icr_clear_gpie_nsicr(void) =22Clearing ICR on read due to=20
> GPIE.NSICR enabled=22
>  igb_irq_set_iam(uint32_t icr) =22Update IAM: 0x%x=22
> =40=40 -294,6 +294,8 =40=40 igb_irq_eitr_set(uint32_t eitr_num, uint32_t =
val)=20
> =22EITR=5B%u=5D =3D 0x%x=22
>  igb_set_pfmailbox(uint32_t vf_num, uint32_t val) =22PFMailbox=5B%d=5D: 0=
x%x=22
>  igb_set_vfmailbox(uint32_t vf_num, uint32_t val) =22VFMailbox=5B%d=5D: 0=
x%x=22
>=20
> +igb_wrn_rx_desc_modes_not_supp(int desc_type) =22Not supported=20
> +descriptor
> type: %d=22
> +
>  =23 igbvf.c
>  igbvf_wrn_io_addr_unknown(uint64_t addr) =22IO unknown register
> 0x%=22PRIx64
>=20
> diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c index=20
> a603468beb..aa65b5452c 100644
> --- a/tests/qtest/libqos/igb.c
> +++ b/tests/qtest/libqos/igb.c
> =40=40 -109,6 +109,9 =40=40 static void igb_pci_start_hw(QOSGraphObject *=
obj)
>                          E1000_RAH_AV =7C E1000_RAH_POOL_1 =7C
>                          le16_to_cpu(*(uint16_t *)(address + 4)));
>=20
> +    /* Set supported receive descriptor mode */
> +    e1000e_macreg_write(&d->e1000e, E1000_SRRCTL(0),=20
> + E1000_SRRCTL_DESCTYPE_ADV_ONEBUF);
> +
>      /* Enable receive */
>      e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
>      e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
> --
> 2.25.1



