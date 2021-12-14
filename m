Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D54474607
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:08:02 +0100 (CET)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9PN-0001ay-Sj
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:08:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=198241f851=hkleynhans@fb.com>)
 id 1mx9D4-0007vu-Um
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:55:18 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:16560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=198241f851=hkleynhans@fb.com>)
 id 1mx9D2-0000VG-CV
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:55:18 -0500
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE8Q1Em005041;
 Tue, 14 Dec 2021 06:55:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=RjYqPgsHKyTX2ovoIKYCz/fMSEE+48fePWAZPMaSIyI=;
 b=YECLqjXNYI2JK4IguQVtgETwp8dxTUvqjnA8ZgeyMmjrXH0vS8pg7w8xmrPOR5YA3UAk
 uT7tguBGSiumW4SFoHc7I2Xp597rX3yugTGFoZBATD11RkxMGagsi/9I9zMEkF1iQE1s
 oJI+pWjvSZhHI8qlkXuyc6Zv1nqBNMB3zWA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3cxqrbafan-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Dec 2021 06:55:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 06:55:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDq8Uqd2UOEiqUM1PTP5UvQgmjifWjrRSSdvEIRWlxTdy6doehWAONwf+tPAKJ9x3D2zBOfLdhErIyOjnD9i8TsTU4ZGRnrozLmiRPoFlgNa3A5sGJBHpowFlWPHpvs5gECnzK7AUVJBOkaZxN8lhh5CxwEMVt9gyseRRLUx0rJabButYWMc4OtjTpJOhTyS1liLRxe/OkHom/cwu7vsOFENWDSj54r5WL9N5g8g0PXl6VaaaTnJmVXeuUUCBIF5L6hfNmui7huCtIBQVedHaAsUxQLGJ4M8Oi59RBWj/C1o+mH45pedXD2ghUlkUnVBbeF6xWdfC2BJ2agn/PNKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sto5xq5LGqv2lIzZUKJXeSP3AGylutdS7lyFSlLIS+E=;
 b=oeJVqWY/7TfepHjZ4qyc+wzI/O0fMQA+JU/P6qZn4qkgEZmNwCymzsiY0qdG7YAB9+V6Hhv52kzVyulTiUglQKCKBPJGBZPubWdvjMTmdtzd9+twh8mkRPfCR+zTWw86FRJIkf/2Bz7V6mgpnpB5EkFuWA0GrqPOk0T4oyFacx52ctOBsg7hTl+RQ7RFKQ/kYOSrERR/PoFgZaZsXUNTzh7oSh8FE2L/++Mj8nC2A5M/wW1yQskoiRnlcIk2lp7ClSi2DZwHb5iJlcsisveKNBJOT5crwGjldTZtA6Cyi2ABcrzBH7FYsv1yJUGrkkE4E06hdbG/+wjctHhH8CbCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3572.namprd15.prod.outlook.com (2603:10b6:a03:1b2::24)
 by BYAPR15MB3190.namprd15.prod.outlook.com (2603:10b6:a03:111::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 14:55:03 +0000
Received: from BY5PR15MB3572.namprd15.prod.outlook.com
 ([fe80::84c5:3255:12c:bd58]) by BY5PR15MB3572.namprd15.prod.outlook.com
 ([fe80::84c5:3255:12c:bd58%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 14:55:02 +0000
From: Henry Kleynhans <hkleynhans@fb.com>
To: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, "Henry
 Kleynhans" <henry.kleynhans@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "henry.kleynhans@fb.com"
 <henry.kleynhans@fb.com>
Subject: Re: [PATCH] Relax X509 CA cert sanity checking
Thread-Topic: [PATCH] Relax X509 CA cert sanity checking
Thread-Index: AQHX8N9GtZEAtAWEZE2NGpCNo7jGjKwx9+UAgAAahog=
Date: Tue, 14 Dec 2021 14:55:02 +0000
Message-ID: <BY5PR15MB35728B48C640AC319375D99AB8759@BY5PR15MB3572.namprd15.prod.outlook.com>
References: <20211214113930.9205-1-henry.kleynhans@gmail.com>
 <YbiZNMxfHFRZFjFS@redhat.com>
In-Reply-To: <YbiZNMxfHFRZFjFS@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b3a6d99-002a-4098-f26a-08d9bf11b56c
x-ms-traffictypediagnostic: BYAPR15MB3190:EE_
x-microsoft-antispam-prvs: <BYAPR15MB3190410696ED392047D80EE8B8759@BYAPR15MB3190.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ZSOOPdWhLiAk9m0smy4xoiTs7pjMw4fH54P0KHftpLYWOvmWzirApk2K2wni1Z2r3e9tnplYyZmdCXgNR5oQf9aCnjjvopMlcCLDYFkbWyurNWl2l5mWK8ULWdx5XSWXdMzQATL9JXDq7NA/czVz4Z5f7CARtcgzCOcVGfhZb4730eBHDPlZ0idmH2c+SqBDAbBySYQcPsuEwrgA40GdWLVPU8pXyxKjg/ClduDJB6kjBso9VhFnb7UFaJSHFjFe5qMH0YQ8b630gBCPupm0nUwewg8Z7xdM6XgJ/GE2wCWhAtqQnb4LzzHx8FRWs1qwTrzX3Qz2r4WXz/92PH+19YxMtAscubbqAREYM7dJ922AWBQ+vsJAxgcMvTi0qoORlsJ0Rg3qM1Yi6v8q9+33JBhrmIPEL6UVNqVSQj30Rhte+jb4ZV27mWIuofZUFJ4s1IPX8y8QquCPkKmA/rS3kjnM8AcXierm9iiPAUw1WIXN6kBS8/Ove5YP05M0WzKf0GJXmHzthKF+BD3fJtZ0rK7irVvt+MLNZO09/sqI08BceoENasZa9Z/XAltUU+SBEXl1V4DfGiOLujf3BN+KrZOKhuNNM+x5LWBV93+Fpz0P/yFvrmyAUrzzxnKRTNPEYrnzT3yMHi97WX9bBtakWu/NedEXuL+E8xgeXi/iG3c5LHpK9UMVZUjYmx4kEEZqtu8/bc/X34lsZT/yn31zx9kvmh252njmipXQw9kNM2Hb91R64dVwF0VgmhyT54RUF7m77nYgPmTku6JZgZ1BBgIVpg8g2bPe3WwBWJhoQphrztXi9B4axpDt5u3wLFYLalkN+RM/LQuP3mUEek6NQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3572.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(8676002)(38070700005)(55016003)(7696005)(508600001)(9326002)(52536014)(33656002)(2906002)(8936002)(316002)(4326008)(166002)(186003)(5660300002)(66946007)(122000001)(71200400001)(9686003)(91956017)(76116006)(66446008)(66556008)(64756008)(66476007)(86362001)(83380400001)(966005)(6506007)(53546011)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bHGTbnRZV+Y9vTs595W5atWwbVXEyu32MZ1/DWGML+KzJhVb11uzA2/iRz?=
 =?iso-8859-1?Q?/BnKeRYJoqxys6GzCXNX7Xvv8B6l0cAS8JHEggxyBO3ynsfYIxJK1/ItBX?=
 =?iso-8859-1?Q?RPlnCW3GJXuyutdvYdTxTsi+XdtsIh5DTHmvQOwhvDWBYVzvbUKdsmOaJ/?=
 =?iso-8859-1?Q?M9tqIHDv9S5OIy7cZNjqG5v9JAte/8X0zsUPbFFnlfXVKc7lL1E6WslGoZ?=
 =?iso-8859-1?Q?y8kzx9QzCQGelIVp/tfRq+Vodr0TTqhYKqDbbbRLVGIclMNbQrphMN7gxv?=
 =?iso-8859-1?Q?PZGKNdnsYAegbSql8Hi/cSQA0/bu5UQwBw1gki482Y6YnvkFSCxg+qgfQi?=
 =?iso-8859-1?Q?kG2yjNbwFtw6aCEqlA4JDpiT7xYazDPe0qYX8v4jhgKHdhHYZn26xUU0tq?=
 =?iso-8859-1?Q?FX4JPRUMhcvrixwqr6j4qEhZTFlMzQ0FUFg/lp8MN0zFVZDQ/RYpGxBli6?=
 =?iso-8859-1?Q?Ph61m3ije4L3filM1QWdqvXtCi9dgYcqJHvK94W3f+fe1LZ4A54dOCs6LM?=
 =?iso-8859-1?Q?8Gb8i5q+oPn0PXUFOv8lpfSh51qnWO55bSxtNYr4DCcVluVGUrIkW0zjfa?=
 =?iso-8859-1?Q?9Q0lXiZTIRLNBg28Pp+iUJO/rn2CnYlSQ51o/hV2dRpwmqtl0BVBiKbf77?=
 =?iso-8859-1?Q?nS5vx5mK4vhsg1rjpOd8+nME6GdKumT3+IwfZqw7d5wkKdIsLqyFvgp2q3?=
 =?iso-8859-1?Q?mPnzmTomeu+KsVsVH39THGDb1OtV5GDboORqcKITwH174YUGsunekV+vJc?=
 =?iso-8859-1?Q?6ouA9NFKOt+BQu+SEy95uf3Qpxva2P1hXHRojQ2WGttjBB0bSH2skgmwdT?=
 =?iso-8859-1?Q?XH5rpOvdWEj2PXSOcWPpEmrDBgrZmduhPl9hGupQJvuLTtrflseMLfmJjV?=
 =?iso-8859-1?Q?nNaVa2ZbTioLL9eWw0yJn6Uyk2f0E3Qo1lX0VRzjsCFKgZy/V8nT8cGZwE?=
 =?iso-8859-1?Q?Nmc+XGJ0dZWTUW5H9rOKQWi6xP6DtlgaizLVc+LXpS3BSjHzEOOYYcwOB1?=
 =?iso-8859-1?Q?eMlFw8noz8T783Y9LdxKqReHJ4WlgJOo3nEY0sJs7EWfRkkvhS8rL9xgar?=
 =?iso-8859-1?Q?8jR89F0LAxqrajEuzN+f7j0trmvltELtMn3m3R0Ke4yzxBFkSKZUL7aR0J?=
 =?iso-8859-1?Q?PFVGZJEvfarx0Isr05gN3dZgSIWfimKMqroRj8qJQQcs19NGdFyZr7N/Wb?=
 =?iso-8859-1?Q?JeBs5CORGTK5e3N98ay+Ec3WV1Nz+B5TyU30E81GFt7C51O+XKhaqs09Lk?=
 =?iso-8859-1?Q?fJA5K+9c+Kia+Y6/x7nHs+iIcuw+7K9IWnlH19YDXeAHk27TDBYRXWDp8r?=
 =?iso-8859-1?Q?v/FGw108ZaYUHMetshYtXDptmbA3wMkHek9CqkFVqrlp1f196rTmiXX9sc?=
 =?iso-8859-1?Q?LojQBfJaaUTS57KcuJNgtqyF8G0ulezIDKHg3HkBTxboEKv0uo2ToyFNBJ?=
 =?iso-8859-1?Q?BUGF20XgbmG8HHrexyze159pie8pWm6kgyOqgyZlgSXQpf5F+1sbY16vjP?=
 =?iso-8859-1?Q?Z9P2h2UmuNiOXpo9EemfqchXIazvQmbAjUgMdVXLpHUsHa2T11v9cwsocw?=
 =?iso-8859-1?Q?EUp3c9v1mfjyBaz6p1Tems6HknYGeOURGxzCPVUO/jLACGctnO0jtJOIN3?=
 =?iso-8859-1?Q?HnIKIX2ESky2YGf7vUT9cW6LPgl+0Dax7VHzDsx+dns8m2gLjil8cANBpn?=
 =?iso-8859-1?Q?E8n8dZ4uWCfcRB/+v126lCvb8ESIQ4i4NRttqYwV00NGpav25rXKfr8v+S?=
 =?iso-8859-1?Q?W25Q=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR15MB35728B48C640AC319375D99AB8759BY5PR15MB3572namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3572.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3a6d99-002a-4098-f26a-08d9bf11b56c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 14:55:02.7551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jy31PHRjdGdUk16WOtedn2QmmI2mTT2qURGCM8J4WkS7jLfNLaVepWJSLDSoZpb0IZ/KpqmefKw/qB9hj3T6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3190
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: atT8ET8KdGSROAL7we5EVSchvJOokhSW
X-Proofpoint-ORIG-GUID: atT8ET8KdGSROAL7we5EVSchvJOokhSW
X-Proofpoint-UnRewURL: 25 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_06,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=fb_outbound_notspam policy=fb_outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140086
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=198241f851=hkleynhans@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR15MB35728B48C640AC319375D99AB8759BY5PR15MB3572namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I agree that this would allow QEMU startup with a broken TLS setup.  Maybe =
the better solution is to only validate the chain of trust.  Would a patch =
that does that be acceptable?

Kind regards, Henry

From: Daniel P. Berrang=E9 <berrange@redhat.com>
Date: Tuesday, 14 December 2021 at 13:16
To: Henry Kleynhans <henry.kleynhans@gmail.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>, Henry Kleynhans <hkleynh=
ans@fb.com>, henry.kleynhans@fb.com <henry.kleynhans@fb.com>
Subject: Re: [PATCH] Relax X509 CA cert sanity checking
On Tue, Dec 14, 2021 at 11:39:30AM +0000, Henry Kleynhans wrote:
> From: Henry Kleynhans <hkleynhans@fb.com>
>
> The sanity checking function attempts to validate all the certificates
> in the provided CA file.  These checks are performed on certificates
> which may or may not be part of the signing chain and duplicates checks
> that should be performed by the TLS library.
>
> In real life this causes a problem if the certificate chain I want to
> use is valid, but there exist another expired certificate in the CA
> file.
>
> This patch relaxes the sanity checks to only ensure we have at least one
> valid certificate in the CA certificate file and leave the actual
> validation to the TLS library.

IIUC your scenario is that you have something like

   Root CA -> Sub CA1 ---> Server Cert
      \                \-> Client Cert
       \---> Sub CA2

And the ca-cert.pem file given to QEMU contains all of 'Root CA',
'Sub CA1' and 'Sub CA2', despite 'Sub CA2' being irrelevant
from POV of QEMU's needs for the chain of trust.

Now 'Sub CA2' is expired so QEMU is rejecting the entire
'ca-cert.pem' at startup.

Your suggested change makes it so that we only validate that
one of these three certs is OK, so if 'Sub CA2' is expired
it dosn't block startup.

The trouble is that this equally ignores problems if 'Sub CA1'
is expired (or otherwise invalid), which is exactly the
scenario that we're aiming to detect.


TLS certificate config mistakes are an incredibly common
problem and the error reporting when this happens at time
of TLS session handshake is terrible. This leads to a
stream of support requests from users wondering why their
TLS sessions won't establish, which are very hard for us
to debug as maintainers. The validation made a significant
difference to this by giving users clearer error reports
upfront instead of letting QEMU startup with a broken
TLS cert setup.

Thus I'm loathe to relax the validation in the way proposed
here.

Is there a reason you aren't able to just set the
property  'validate=3Doff' on the tls-creds-x509 object
to skip the validation in the case where you know your
CA bundle is valid overall, but contains broken certs ?


>
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  crypto/tlscredsx509.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index 32948a6bdc..fb056f96a2 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -473,6 +473,7 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX5=
09 *creds,
>      gnutls_x509_crt_t cert =3D NULL;
>      gnutls_x509_crt_t cacerts[MAX_CERTS];
>      size_t ncacerts =3D 0;
> +    size_t nvalidca =3D 0;
>      size_t i;
>      int ret =3D -1;
>
> @@ -505,11 +506,15 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCreds=
X509 *creds,
>      for (i =3D 0; i < ncacerts; i++) {
>          if (qcrypto_tls_creds_check_cert(creds,
>                                           cacerts[i], cacertFile,
> -                                         isServer, true, errp) < 0) {
> -            goto cleanup;
> +                                         isServer, true, errp) =3D=3D 0)=
 {
> +            ++nvalidca;
>          }
>      }
>
> +    if (nvalidca =3D=3D 0) {
> +        goto cleanup;
> +    }
> +
>      if (cert && ncacerts &&
>          qcrypto_tls_creds_check_cert_pair(cert, certFile, cacerts,
>                                            ncacerts, cacertFile,
> --
> 2.34.1
>
>

Regards,
Daniel
--
|: https://berrange.com<https://berrange.com>       -o-    https://www.flic=
kr.com/photos/dberrange<https://www.flickr.com/photos/dberrange>  :|
|: https://libvirt.org<https://libvirt.org>          -o-            https:/=
/fstop138.berrange.com<https://fstop138.berrange.com>  :|
|: https://entangle-photo.org<https://entangle-photo.org>     -o-    https:=
//www.instagram.com/dberrange :|

--_000_BY5PR15MB35728B48C640AC319375D99AB8759BY5PR15MB3572namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hi Daniel,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I agree that this would allow QEMU startup with a broken TLS setup.=
&nbsp; Maybe the better solution is to only validate the chain of trust.&nb=
sp; Would a patch that does that be acceptable?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Kind regards, Henry<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Daniel P. Berrang=
=E9 &lt;berrange@redhat.com&gt;<br>
<b>Date: </b>Tuesday, 14 December 2021 at 13:16<br>
<b>To: </b>Henry Kleynhans &lt;henry.kleynhans@gmail.com&gt;<br>
<b>Cc: </b>qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;, Henry Kleyn=
hans &lt;hkleynhans@fb.com&gt;, henry.kleynhans@fb.com &lt;henry.kleynhans@=
fb.com&gt;<br>
<b>Subject: </b>Re: [PATCH] Relax X509 CA cert sanity checking<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">On Tue, Dec 14, 2021 at 11:39:30AM +0000, Henry Kleynhans wrote=
:<br>
&gt; From: Henry Kleynhans &lt;hkleynhans@fb.com&gt;<br>
&gt; <br>
&gt; The sanity checking function attempts to validate all the certificates=
<br>
&gt; in the provided CA file.&nbsp; These checks are performed on certifica=
tes<br>
&gt; which may or may not be part of the signing chain and duplicates check=
s<br>
&gt; that should be performed by the TLS library.<br>
&gt; <br>
&gt; In real life this causes a problem if the certificate chain I want to<=
br>
&gt; use is valid, but there exist another expired certificate in the CA<br>
&gt; file.<br>
&gt; <br>
&gt; This patch relaxes the sanity checks to only ensure we have at least o=
ne<br>
&gt; valid certificate in the CA certificate file and leave the actual<br>
&gt; validation to the TLS library.<br>
<br>
IIUC your scenario is that you have something like<br>
<br>
&nbsp;&nbsp; Root CA -&gt; Sub CA1 ---&gt; Server Cert<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \-&gt; Client Cert<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \---&gt; Sub CA2<br>
<br>
And the ca-cert.pem file given to QEMU contains all of 'Root CA',<br>
'Sub CA1' and 'Sub CA2', despite 'Sub CA2' being irrelevant<br>
from POV of QEMU's needs for the chain of trust.<br>
<br>
Now 'Sub CA2' is expired so QEMU is rejecting the entire<br>
'ca-cert.pem' at startup.<br>
<br>
Your suggested change makes it so that we only validate that<br>
one of these three certs is OK, so if 'Sub CA2' is expired<br>
it dosn't block startup.<br>
<br>
The trouble is that this equally ignores problems if 'Sub CA1'<br>
is expired (or otherwise invalid), which is exactly the<br>
scenario that we're aiming to detect.<br>
<br>
<br>
TLS certificate config mistakes are an incredibly common<br>
problem and the error reporting when this happens at time<br>
of TLS session handshake is terrible. This leads to a <br>
stream of support requests from users wondering why their<br>
TLS sessions won't establish, which are very hard for us<br>
to debug as maintainers. The validation made a significant<br>
difference to this by giving users clearer error reports<br>
upfront instead of letting QEMU startup with a broken<br>
TLS cert setup.<br>
<br>
Thus I'm loathe to relax the validation in the way proposed<br>
here.<br>
<br>
Is there a reason you aren't able to just set the<br>
property&nbsp; 'validate=3Doff' on the tls-creds-x509 object<br>
to skip the validation in the case where you know your<br>
CA bundle is valid overall, but contains broken certs ?<br>
<br>
<br>
&gt; <br>
&gt; Signed-off-by: Henry Kleynhans &lt;hkleynhans@fb.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; crypto/tlscredsx509.c | 9 +++++++--<br>
&gt;&nbsp; 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c<br>
&gt; index 32948a6bdc..fb056f96a2 100644<br>
&gt; --- a/crypto/tlscredsx509.c<br>
&gt; +++ b/crypto/tlscredsx509.c<br>
&gt; @@ -473,6 +473,7 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCred=
sX509 *creds,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gnutls_x509_crt_t cert =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gnutls_x509_crt_t cacerts[MAX_CERTS];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t ncacerts =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; size_t nvalidca =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t i;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D -1;<br>
&gt;&nbsp; <br>
&gt; @@ -505,11 +506,15 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCr=
edsX509 *creds,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ncacerts; i++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (qcrypto_tls_=
creds_check_cert(creds,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacerts[i], cacertFile,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; isServer, true, errp) &lt; 0) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; go=
to cleanup;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; isServer, true, errp) =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++=
nvalidca;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp; if (nvalidca =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cert &amp;&amp; ncacerts &amp;&amp;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qcrypto_tls_cred=
s_check_cert_pair(cert, certFile, cacerts,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ncacerts, cacertFile,<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com">https://berrange.com</a>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; -o-&nbsp;&nbsp;&nbsp;
<a href=3D"https://www.flickr.com/photos/dberrange">https://www.flickr.com/=
photos/dberrange</a>&nbsp; :|<br>
|: <a href=3D"https://libvirt.org">https://libvirt.org</a>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -o-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"https://fstop138.berrange.com">https://fstop138.berrange.com</a>=
&nbsp; :|<br>
|: <a href=3D"https://entangle-photo.org">https://entangle-photo.org</a>&nb=
sp;&nbsp;&nbsp;&nbsp; -o-&nbsp;&nbsp;&nbsp;
<a href=3D"https://www.instagram.com/dberrange">https://www.instagram.com/d=
berrange</a> :|<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_BY5PR15MB35728B48C640AC319375D99AB8759BY5PR15MB3572namp_--

