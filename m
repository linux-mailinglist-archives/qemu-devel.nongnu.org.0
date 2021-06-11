Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EA3A4A02
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 22:16:52 +0200 (CEST)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrnaF-0005Z5-Bd
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 16:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnYg-0004fJ-Sz; Fri, 11 Jun 2021 16:15:16 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:34290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnYZ-0006ED-It; Fri, 11 Jun 2021 16:15:14 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BKCB6S001461; Fri, 11 Jun 2021 13:15:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=AbUKk9YctN2kVH1sUePSVPYcZuhP3O/EQDCQbqvIVtc=;
 b=p+hnEbPhvMIcEzM1UbLZW7vS+guNNQMzowCTbuk9osZHFMWGTDcYlYXiRTIiHZ+ipUHq
 JPb7sf2U1pZ71yWVZjxnEmXic7X/IhkLKgZlZTOaOhZjGDcc8Ug9NKStmxrTToPxK8OU
 PmFB+W6LLQzPU26IznkIFasZkGO+rd64IwRZmun4SZjSCdIjOmk2Z3yECsAFbOfwsoYt
 GNR1vZtu5aKIiN6jV7fbHEqjQ0BEvXQQjpSxNatwzWQizec7iUyUnnfScyelUQwdCZmE
 AIAewG+OJSyG/oFNEl5WILt0wv4xVG+clA8cVtwk6ezmzSAeJRjhn2gFIXiPOGKKgpBD BA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0b-002c1b01.pphosted.com with ESMTP id 393mqmb4yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 13:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIhhWPm84k+tq5vjzb0+sqe4cSruBv6tAIWpFZi8l7TtH2zE5GEd6sx6JWXYs3pXbiZSYQIgnv2KsKcyhXzICJrhEMfmDBi3DsFrHfkHXWRvveqCUBXERe5wqroIvCMmrLMXtNfcdA4/f9gi5On6W06zaWGAa3u9l6IRw/NHA9mMz8JRe5GvHWQdGohveLPBAxmAIvJLSLC4c+4diPpJmmZ+NOzDmPazWkh80SWIuleAI0MYpWoGQ7mOQAEuvFaJPOdVajfzY8XXMYyP27sK2OSy9wQ2mTJTVy/86khnhUMVCI5qy4O3sxADr1q4vdV2X+eskCTto8nwgfJZWz4JBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbUKk9YctN2kVH1sUePSVPYcZuhP3O/EQDCQbqvIVtc=;
 b=dRuSsxVyFeWyJVJuEnLVlNNLF/Ugmmsp1K3npB8SDvXmSTyIYCBT12WJ0z6xPCzPumUIh+BQiz5vaagqWKXSDORqfjMu1165xQvY5VQOodIcbGBS8OeaTLnThOWG9szSsJqE1Ru6WPlo2fkb3aRaC50F7jSfZewrvOWKw97BCLaBzKOikGfT30WAJl2BbK/glVoBR1sef6/j7NLzLiueRlBIoAr7GlGAFwZSCcqf03FpZlPw3/kvd93vZkeBCcKhM0hkQLxdjueC+AoBhus1hElnMfQLRgWPYrXUD2Ec/IlxS7D0N8SK49KAbemt7oGYVZuQcvIJB+glP+DvlSqWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4878.namprd02.prod.outlook.com (2603:10b6:805:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 20:15:03 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 20:15:03 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 7/7] vhost-user-blk: Implement reconnection during realize
Thread-Topic: [PATCH 7/7] vhost-user-blk: Implement reconnection during realize
Thread-Index: AQHXXUbChkp15IbxOkOUdMJoFMlQiqsPQlsA
Date: Fri, 11 Jun 2021 20:15:02 +0000
Message-ID: <20210611201500.GF26687@raphael-debian-dev>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-8-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-8-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8021a926-0a50-4b48-f611-08d92d1598c3
x-ms-traffictypediagnostic: SN6PR02MB4878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB4878620CAA11127A95E688AAEA349@SN6PR02MB4878.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7SlSdnZsb5l0pmR6SOzVvDXQOLhP5u+nME5EvZY/RmbGsRw37GsD0Y3tC1y5nSJiRmwZ0Wg1Usx+ab4bGfOiuD2KB97PH+Hjxa1F5HpMTTt9CLORkWehNCNeAX76lOGU5LBCR8YgSE8OR9TbRx9/as03iAvHMps8IEPN5B8fqPt4QtqNWHJOsa0hgMDh5ZzkYO4ZLJ0+tGiipcUpJKMTsNvuyxWNUv2oeqaPx4LZWImcqiNHuHoOqI5T0vXCHSJdd48uhnuQCWNSzPzsz7oSgmRRVNa1pVOsidZ8KgspaKLcarETsF4UERVGXIOQBDgDAGt4KsQirMVZWtVmEeCKsFtZ8J32ymz9YhDXXksZ0hdLAUr04M5FtckxVNb9ImtkEHVN/z33bsNb7/X+PU8OBR+onf+vUcLM1B/2uSooa4x3LO4k0ty0Z3kFYF+R98Ud1RYZAnwrbez7OBZnUjJKNelYI84InlNOtul4ctCY3+50+2YoRkNdGhlX/mnTeTVJIoYzyPkpIbxoYC8+kE3eDkGhKo/EIPBqi+RIszCc8EG8U2IKUXj7mJO5bmnyVQ2yVadEe7+13S7r+H8Z07UKkHeB0SITU0BjjCZ+C4IYaU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(346002)(39860400002)(366004)(396003)(376002)(76116006)(8936002)(66476007)(64756008)(66556008)(91956017)(66446008)(8676002)(54906003)(5660300002)(66946007)(316002)(6916009)(86362001)(6506007)(83380400001)(33656002)(1076003)(9686003)(6486002)(478600001)(6512007)(38100700002)(71200400001)(122000001)(2906002)(4326008)(33716001)(26005)(44832011)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HNO48NCe3WfSqmqmUKXoZeoEW7XudZpDO5FgbOYSbuxV7motkq2T1NbuQk5T?=
 =?us-ascii?Q?AYcKoJwxm17e60+Eym0DGC1U8eeshbu6Ua7IFNdN5spPcZuIEOyX31tceyj4?=
 =?us-ascii?Q?6IEndknAuhibzMFxYw0IeoylDzVaTwKzr9iIQxKX7WzEGxZr/fo8/AH28Ihe?=
 =?us-ascii?Q?SGkgvddXRXHrnBrxf5QJoJnMrCFL6B9pnrVBV5TP2UNl+Ln2M2yRC6QliUdZ?=
 =?us-ascii?Q?p8OAp+3WZr9qCWzCX1HLe0HAniS5wHHvUL4WqbbKWuVur1zZ/VP1epTH6Jl9?=
 =?us-ascii?Q?XsxpHupJXXnnhQyUC3G///H/SMh+kdWrNAiA/r4cW/n74pRTx1eFWeayFC+u?=
 =?us-ascii?Q?eWIAy44juNWQ8ZIWtq9Q9rpBTmXzA1yKB3X/tvKGSAAYpX1/oBRXO/WV1QVC?=
 =?us-ascii?Q?okDsDnZBcXez6YAo4ppwbj4UlYF8c+/VGT37asGvnZ5ze0SR77+z/kkH4Bim?=
 =?us-ascii?Q?m9jPFlphuJagVHOit9IBfubTRBIErc7eYQV9WJLhhoU+kytVUmNE7PxzMtLq?=
 =?us-ascii?Q?hzNvtb5GPA0Tc24QudUTvy+aJmI4dyB0ytT1Mp5rEuAEqKPScY8RBZerba9O?=
 =?us-ascii?Q?g/H1jON55UUVwaj2qvmRjOOqfu8VC3zRxDbK0fz04Cc3oD68IYtAY6Nz7zTU?=
 =?us-ascii?Q?B809qt7Cl23xSAqWUggxcuB1vhQHPztWNDDFWBwxJjqbaomQGEcN/b+Imx40?=
 =?us-ascii?Q?eEpO/v4zPZ/OLLagS2/Tk2jrb0hg1Ro8tEPqGpjuEsqb2vPpY/aBHeoYvyt9?=
 =?us-ascii?Q?AemgCxdZd0vrCZHjwwJAraPNT6XGmYiH98TLV7dz0vzDwHDMw12oi1bERIA1?=
 =?us-ascii?Q?UM+ytlZAPQ0c6PB5fiP6yliqvUB5a+WAil/siHx6KiOoZmOAAUy/8bcgARr9?=
 =?us-ascii?Q?X33Ozxo6mV53ZkykzO8qgTyBUxxdIaN3Y7ST8JarzUhyrayZSk5c+fQXTYuf?=
 =?us-ascii?Q?xT70ut5atZwMVVTkAOPo3I//B3XNlECKht4DfEvCGsxWAymKRlTok8uqAnei?=
 =?us-ascii?Q?Q4sgqSGnVvOeC+vQ1D+L6t5hNX6sK83mI4YgCPK0DepHipcxAd/YOgnjN4/8?=
 =?us-ascii?Q?jcvnUy/QOJc+3nciTSL+1CMs1E5CCR7c8hdSKAnAxbAzQ1a7FYKG5CvMQ9MD?=
 =?us-ascii?Q?bF1emIVmQTK5x8m9TnEAzEGacgCdgExpgoIEOehulkF85CZuHUrTbsbjjT0a?=
 =?us-ascii?Q?SicXMvlqRXPxOgPZsTObTYmT28F1Z6yn5S6CaQv5zBh2U4BUKiOFpylPA0dn?=
 =?us-ascii?Q?YFgn73rDgjk0gIyLI7JdhFRar4HQgIeumApjBJvg/s8wnivDE6WbOz+01Rt/?=
 =?us-ascii?Q?i9SoXsDbGGdVgheIbT0/0BNla3+2CgD2dJlT1ZDkNK3Zgw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B22604560D7A94CBE5F82D217AD10FE@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8021a926-0a50-4b48-f611-08d92d1598c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 20:15:02.8939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZL4OqzJrgKh2qoT4shXu7u10HETAr38HptTAyTQ97efBc/H5Ak5yuxC7m4GNZuL79pT1sfp5tvqDXGPVDSRs/MpFd9tsOj+u7liulF0gQH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4878
X-Proofpoint-GUID: O1JAvSlSp8tTT3XnSa_sGK8Tp06Dn_CA
X-Proofpoint-ORIG-GUID: O1JAvSlSp8tTT3XnSa_sGK8Tp06Dn_CA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:58PM +0200, Kevin Wolf wrote:
> Commit dabefdd6 removed code that was supposed to try reconnecting
> during .realize(), but actually just crashed and had several design
> problems.
>=20
> This adds the feature back without the crash in simple cases while also
> fixing some design problems: Reconnection is now only tried if there was
> a problem with the connection and not an error related to the content
> (which would fail again the same way in the next attempt). Reconnection
> is limited to three attempts (four with the initial attempt) so that we
> won't end up in an infinite loop if a problem is permanent. If the
> backend restarts three times in the very short time window of device
> initialisation, we have bigger problems and erroring out is the right
> course of action.
>=20
> In the case that a connection error occurs and we reconnect, the error
> message is printed using error_report_err(), but otherwise ignored.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index e49d2e4c83..f75a42bc62 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -455,8 +455,10 @@ static int vhost_user_blk_realize_connect(VHostUserB=
lk *s, Error **errp)
> =20
>  static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp=
)
>  {
> +    ERRP_GUARD();
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    int retries;
>      int i, ret;
> =20
>      if (!s->chardev.chr) {
> @@ -498,7 +500,17 @@ static void vhost_user_blk_device_realize(DeviceStat=
e *dev, Error **errp)
>      s->inflight =3D g_new0(struct vhost_inflight, 1);
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
> =20
> -    ret =3D vhost_user_blk_realize_connect(s, errp);
> +    retries =3D 3;
> +    assert(!*errp);
> +    do {
> +        if (*errp) {
> +            error_prepend(errp, "Reconnecting after error: ");
> +            error_report_err(*errp);
> +            *errp =3D NULL;
> +        }
> +        ret =3D vhost_user_blk_realize_connect(s, errp);
> +    } while (ret =3D=3D -EPROTO && retries--);
> +
>      if (ret < 0) {
>          goto virtio_err;
>      }
> --=20
> 2.30.2
> =

