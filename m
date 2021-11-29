Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5544625AA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 23:39:14 +0100 (CET)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrpIn-0004NO-7B
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 17:39:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mrpHE-0003RU-FL; Mon, 29 Nov 2021 17:37:36 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:21404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mrpHC-0005zl-Of; Mon, 29 Nov 2021 17:37:36 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATJlPi3014803;
 Mon, 29 Nov 2021 14:37:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=oMYUKzMf3AqjZw2OTiLdgWwS4bklURhRRHqnzKqGOwg=;
 b=vSEHTTTux891GyoSPKx50UN5LlEddkJFrHobJPah+kkC+0FdcYRs4fXgbq5GeKFZfJzu
 2rfJdWn7GpJw6kv0nfAnqWkO+rCkbBipTvu+QoCPVCIpz95UlhIeBmediTz+plAvCXL8
 9PdBwy0sxolRbOlJm2dwhSFtNK+lA0feAgnd7TLoVOq1YJA1rq1uRPXj2ZVlgVRmdQxC
 NI4aEOjLp3Q/8LGzzthb5v3wwp+ITZdDDp3M6Iff2heKnwNvkupxb024zKe9q503jrBs
 O2+dof2adWbzgmnlg91DH/BKYVVKV2lswWk1TnHtflFPXaj1yIi1629vQClFQiHLFTH0 kg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3cmppx9ydd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:37:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwxjofLJkA4BJ+Qipsh4pW8R9++RVXGUhFCcUf4xEvz053jE4JXB26WBaxx7XF2zMOzO2S49tzy04fbeDXBRcpEWFP6Yr+30n4hk9K7LlCCNJBqeQ8BFvqjPpNX8KuAxZwe6pbmjqM1oFYzZ/v8sNatEMXY758B+VpDwd0WYu2ueazUMZwbz92qsmko6g1IQC0gBihymeTx5IfCMHbuN0KuEZynGXAyk0q2klSwajShzzBbOpGps5U03yFltMzoxMga0OqnWnaHQVjNznX3+Fbtdazgv+R6wxT6s2L/ZTyLkR6A47Ou5bfUcTi/2yOGGlkupMGAFbZuZlbzrJrSB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMYUKzMf3AqjZw2OTiLdgWwS4bklURhRRHqnzKqGOwg=;
 b=a6Usv5CNynTsvj9T9eZ47VvuT+qVe7Vz2pc7vfxQ5RAExMw6TD0BrJ/lAml0uS7nQES6jCQ32Jy8j/uaZ8MOJDp6wYR08YCmphd/1j4+Gqu9vE/6cerjp5qSZIp74lM491GMIpBENMlvESnXbwoj3TrLaAOmX8jjGh4XLHHCBmGMohbwdQdWxZpRVIZi8xUUn9TNSV1kSMMOkyS9Lm/RufSHhrvkstlPbQui43mHpfR19nXgRzPXjwOLhrIVf+niJveRs+fBrCdtnKsP6SLatPm0132dxL/ZFt4lCm/GycRrSz54F67lvZnBFfF2hkfEt1hm717De0anGhe+gILwSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB6173.namprd02.prod.outlook.com (2603:10b6:208:1bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 22:37:29 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%7]) with mapi id 15.20.4713.027; Mon, 29 Nov 2021
 22:37:29 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH 10/10] vhost-user-blk: propagate error return from generic
 vhost
Thread-Topic: [PATCH 10/10] vhost-user-blk: propagate error return from
 generic vhost
Thread-Index: AQHX1xGUcdj1I5MsdESBlX2+NqH3i6wbNTuA
Date: Mon, 29 Nov 2021 22:37:29 +0000
Message-ID: <20211129223727.GD5722@raphael-debian-dev>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-11-rvkagan@yandex-team.ru>
In-Reply-To: <20211111153354.18807-11-rvkagan@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2977eb0c-7b00-4e45-5dce-08d9b388d3b5
x-ms-traffictypediagnostic: MN2PR02MB6173:
x-microsoft-antispam-prvs: <MN2PR02MB6173FD14027C549A44F96EB0EA669@MN2PR02MB6173.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtC+Zh6AsKgX4NI/Rlh4uHz0das1m0IXmZpjrPJ9tGhDZI/IkmGFwrDTxXOkOj3X7fbLXW/AZIEr55FGbTPbwcUBA/1BBV/XHQQu+1UXdYJbnV9xVvIgck0bpSkzrKdukpzkasXGTf22q7ODEOuZpEK8O8iR4TsrL/u8HbnAmyUT+iQHMHFqd/sWvz5OrgBTVSz6RRBsMkAFmJxMNFjr7TF8MX7yiqwQUkG3ebGZydJXnBDs016puvlZLob+4ChBX6lRmGka78uKqRWISUSBmJ61TixgTwvBEGfngvlY98is40xGnC30AaZAHgdGhn2Yzgk9LVQ5DoNUoB6V5QRg61f3mj6wqeHh6f0lrmm/F7SW3mxCFYpYfU2a1EwrNMMOuvruTBm4cpKaZPf2ZcEyToLCs0Xgox9oEF7ZG8FBuIvPQjhw56mjGCOwrflIJsHzbCg1ILAiQgBlcDHD4dwDfgasJUSVIx90WLxrcaW93B3RMNboQJzmqnxme0vYEQ8gKVdXSIwRDmG3hMiA0t2I/z290TiNeqelLWcH70WA78tnff2fIEsh6Cg91VSryV9W8ikk5TxGUQix9MAffAn0KcmHLifEzfosH6esODt6duFHSbc4hqqIU7YDgcZTDYJD0P0d39E4uEkPfUjo1g5V7Wj+/OQpDK2qK+2d8NAdAyu4KuQsAFk3f3DMIhnkmCUJFNV3c6bVTCL2rCEnumrQrVEQXbqYALWLDA/yFNCd0Hg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(186003)(38070700005)(508600001)(33656002)(4326008)(71200400001)(44832011)(76116006)(8676002)(122000001)(66556008)(91956017)(1076003)(66446008)(64756008)(66946007)(86362001)(316002)(66476007)(54906003)(83380400001)(2906002)(33716001)(9686003)(6512007)(38100700002)(26005)(6486002)(6916009)(4744005)(6506007)(8936002)(5660300002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OUtSorVRmAOetvuBsUI/naGi6qNsDL0lZBz8cSIGfaBJ3/QQ5gEQ9Azve8?=
 =?iso-8859-1?Q?SxYP4CRPp8LZIU8EPMf+Yxwp6TbZAhyecT2JoTyZKAzd9bZ2cz4F0Ai3u3?=
 =?iso-8859-1?Q?zSr1FxqM/Yfm6WXrfnB3TlbJaoPjR3+ab1R1NdRv3WGtd0+7JnyKbkXqEX?=
 =?iso-8859-1?Q?y/4uYDM0WARbgVxymGwZgc+BnIIWoFvoqqlOvhWRqsWw4geEcIMlXFz9r+?=
 =?iso-8859-1?Q?+idSqZwf+GNlVbil6ynWhuPLUK65tN/xnt9LLWHydMEJODJvRA7hcCMeWH?=
 =?iso-8859-1?Q?bAOaMiKw649Wtal8Jz0n/86IL2SmrQ3Cv04qNlLsCyWStqdX0mfhWzckzi?=
 =?iso-8859-1?Q?pO0vDSP8v0nxke69Z11Ys5GSenmvMeCnVYbCGNjkAy3OMsvU+oN94N9vHo?=
 =?iso-8859-1?Q?wmtWbgSfqEJE2jBKQXS8HFj2fVuaRRp/m7KlY/iOOgHcT6/xbpQFXlNhsX?=
 =?iso-8859-1?Q?9qrFiFY+KBx5Lwy/mVzur4v5gAQlmU5zDvgxfZhvjM+DGlRkduRixf6csV?=
 =?iso-8859-1?Q?JsmmsCsr+rufrp1FvSEg1VbgTAHUJmvg+noqlh8hF9jh6DK2cDgNcCA9qI?=
 =?iso-8859-1?Q?VESipDlL9sZcXO3hc1PX4/VL6Iq14dCKr7vfuygRixJT8aDJ4WybjY1nrc?=
 =?iso-8859-1?Q?ExlJbfZuPK6m9HhlJvYbJJQJmY8zTTSK2FT5XuYtUZx2aWBO6b/r63MzP+?=
 =?iso-8859-1?Q?8XGFnyBxXLhR0EUgvKzs7eH/9QMBL2r6oh3gAXJ/6Ck3tfGLttD0DH2wvC?=
 =?iso-8859-1?Q?z+OY0Nb8EvTEvARnFVEqPn9X5rhS1Y5M/6ya2BfaSUyKMHciigHJW2S5z4?=
 =?iso-8859-1?Q?ENxoqTivj0vwAxBBByD+8PYkzIs9/rK5tpoHROPN8sQnbT95fUl02Rh3qw?=
 =?iso-8859-1?Q?kRw6YbLl0HlapdzFwGuQYEGly38+2pzLRqREyyBv4n91i9yfMG3HaHLmaI?=
 =?iso-8859-1?Q?7zZTVmLA1ZYwwMQf1lsU1j8oFj1MysEkQZA2/ipF7hNuW7f7Ls6p4EJkef?=
 =?iso-8859-1?Q?Sag7UfuCF/IPeTbFCK8VNbk5+JsFtd50maa6+Ku7G00WHE6MB33o6FgEhH?=
 =?iso-8859-1?Q?m39kPaJPDQNiPzNLdi6G9xj5Dy6x/85hEUqFPrMoQWLfVGPPCnNVdUjeQv?=
 =?iso-8859-1?Q?IdHnQs2fF68wnxYMiif36LAdkQ4REEqJmY7BuzDdsIpC28MqCyamARLLn3?=
 =?iso-8859-1?Q?6KrFUQYcOHeEDOAs3luwjhCMCsC57dFAzpMy/HvcSveGQ32CXLEvtAP3UC?=
 =?iso-8859-1?Q?I6SRw3isd2Xnkvkua4YahGrQgn78HamAi26L+EKNS0CxiOXwZZ203Rnbyu?=
 =?iso-8859-1?Q?l+/624JQOTqgY6Zslai1BgqRiNno6ZwJJFnu22nyJMmlYu2RczQQrwISjb?=
 =?iso-8859-1?Q?gRDh/aaYuKATjgckPBBWTq5T1fms3V9K77/4HV4EsnKeqT0wy5wErjsXPy?=
 =?iso-8859-1?Q?lxb6f4hCQqsaQA3QwuED6G4rOBe5SdIdoBG7mdnw2JcOTW1t/n3x9py+j3?=
 =?iso-8859-1?Q?GURI7Ikfq8TuHap9O/IrHvrAKIunsU+Hy7UaVU+oGHxGQkefaL1kmBrapr?=
 =?iso-8859-1?Q?0mhW+sdKTO2bNsF476+HfyhG8DSGdbTl/oiRBNup6+LS8NBNFFt/5OsoZ1?=
 =?iso-8859-1?Q?lHd03JDivgAc42okXFFASIUQulDBZqnjMAxNjTSaZse/mW0OWD/WxLM8Ow?=
 =?iso-8859-1?Q?ezCTqug2TZ5w4md30vQgWw709TmjYTXrtlSUCYLIpBKd7uFZW1NB3zqW1x?=
 =?iso-8859-1?Q?J3xGVYmGExKRTVoPRuLKLtiUs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F9220CDB2103E543B0E579D12F935FE3@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2977eb0c-7b00-4e45-5dce-08d9b388d3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 22:37:29.8139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xetljeTE8gCaGfsbJ/UYirhSRMYuRDJdGEMkaCJE6PL243JkbiLn9ws5s94I1iDvjYy640w1V05cVvFBbE29Fu6CEMWdBh+ybm0er9EhDjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6173
X-Proofpoint-GUID: mq3DZmWvW2WTFnTMrvMKkBJXMSuNTp8e
X-Proofpoint-ORIG-GUID: mq3DZmWvW2WTFnTMrvMKkBJXMSuNTp8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ditto - not for 6.2.

I'm happy with this once the vhost and vhost-user patches go in.

Looks like vhost-user-vgpu, vhost-user-input and vhost-user-vsock also
return -1 on vhost_user_*_handle_config_change, so presumably those
should be fixed too.

On Thu, Nov 11, 2021 at 06:33:54PM +0300, Roman Kagan wrote:
> Fix the only callsite that doesn't propagate the error code from the
> generic vhost code.
>=20
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

>  hw/block/vhost-user-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index f9b17f6813..ab11ce8252 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -100,7 +100,7 @@ static int vhost_user_blk_handle_config_change(struct=
 vhost_dev *dev)
>                                 &local_err);
>      if (ret < 0) {
>          error_report_err(local_err);
> -        return -1;
> +        return ret;
>      }
> =20
>      /* valid for resize only */
> --=20
> 2.33.1
> =

