Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE16ED0DF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:01:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxgC-0004TK-BV; Mon, 24 Apr 2023 11:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiles@qti.qualcomm.com>)
 id 1pqw8z-0005kG-Ds
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:22:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiles@qti.qualcomm.com>)
 id 1pqw8r-0000B4-F6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:22:12 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33O7ZsFQ020407; Mon, 24 Apr 2023 13:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=MFXRmctDEk1ucnCnK3UKc0eRn6AXh4viVSSk2nfoFmU=;
 b=omqD5tsjThrdLsjOsTi5vjag/aAi0i31gL0wSfaTO5CXG7jn/bZFIzoGaGUpWuESjlLg
 Z08C+7+J3oiNeEKFqtpfuOgkN7fxuBfCtcEjM6ZCs3VzFxrV+BkWVzvHPPau9Iq8Jqwc
 hK7Z0jd1xximcsJ7pGFIHfQlCYy46byjGM3qyeCV3U2XzPvfGUkyMrtQSBIrFp4aDf0V
 rUJ4xynO8wGrmoiurUVwb2v51/aCH7d33lyagGWPjl4p6JCdxR4kD/c00bI8MgNKIJRt
 43F6vDJGYGdAW5Nc2VADNOhcQHrh7pa7CoTmNUEkoMUOgix3CF8K/2QNOuTq9rndIYxQ 1A== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q48c13eqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 13:22:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1VquV8PmGkrrK2w+l6/oEvUtlsLi8W186LBy0KsmKS2RqGfXZgUMyqZQE5JTpr9+bfjitJXhHVz2X4pzZgXNu/NcLTkUbD6DzXFJVV03oILS2ENs9NS+cO1Y0w4qAcKkDMY/ORoM0zLf0maRV8FvduMyes3Zaldw5aQiegjXAxqpPXbIfBLfaQl6INfEYIsnD9U0Ly8NyAwThzNqD0cDVmGyDb0yiY98ShWjLqaoL7x+VJM6RWJY/T9mhsAr0GtI/ozI4G0u7M/XXe/Lku6Uk5LNFuKknYR76H8LyNVRihsDOhMBQqkN8/yo+owHgBxZo4cTtHX3DZixCVFoYiuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFXRmctDEk1ucnCnK3UKc0eRn6AXh4viVSSk2nfoFmU=;
 b=RjA7U+J74xtRH1XAqLqDuEpSI9cuQvgDWSxKq0Gq/riFs8JCccESktuzn04/dBdOTaDkz/21VBtMirunda8/K3/oEOS2tsl3G8qZ648meeEBaI04UFnZcy0LE8moK6i8iNz1R5p6ge4auBwSunlJsGabO8PHmrfZpuwBlM8sQOjZF3Yo6ajYma4Zexfsln8G5dYytULUqQKCAAkgo0dU1r2v9DPGQqh8Fq7HsfRyalZqNA4OcWl6KZ5bP+vSwl2IOX8Xzygkmn1YIAXQKHqlmyNKsBBTvhRp4G4CEMkjePlHfz0va6XYoQBAkQf/kxdyLPV9bu4agWMDLUiDV/S+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW2PR02MB3641.namprd02.prod.outlook.com (2603:10b6:907:7::16)
 by SA2PR02MB7514.namprd02.prod.outlook.com (2603:10b6:806:135::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 13:21:56 +0000
Received: from MW2PR02MB3641.namprd02.prod.outlook.com
 ([fe80::7703:b3ba:f688:61d7]) by MW2PR02MB3641.namprd02.prod.outlook.com
 ([fe80::7703:b3ba:f688:61d7%6]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 13:21:54 +0000
From: Jamie Iles <jiles@qti.qualcomm.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: "Jamie Iles (QUIC)" <quic_jiles@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Thread-Topic: [PATCH v2] accel/tcg/tcg-accel-ops-rr: ensure fairness with
 icount
Thread-Index: AQHZdq2XGsM2eM+LtE+PoeXR6U8g1K86ch4A
Date: Mon, 24 Apr 2023 13:21:54 +0000
Message-ID: <ZEaCctJfl/5Cye7K@JILES.na.qualcomm.com>
References: <20230424112907.26832-1-quic_jiles@quicinc.com>
 <e612395f-ade3-6ceb-a611-8c9c41caeb31@linaro.org>
In-Reply-To: <e612395f-ade3-6ceb-a611-8c9c41caeb31@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW2PR02MB3641:EE_|SA2PR02MB7514:EE_
x-ms-office365-filtering-correlation-id: 33d5e23d-9ff8-4f2e-c11c-08db44c6dfa1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Nc82ujXzGp/EtXcxylgnBZMdhgCPVNVV9VEuxZsGkd1g7RewzRXyx7ogvK3RCSvFK0Qfyyk5nnaLEzAl9PT9WADcx1VVLBVaDoG81E1Vk8zOX89Ig5kYSHuAtg99ozBwUf+bJrVUd+8QSp3MRrfa9aqBgewZKMSMWI6olehy8hjHFa15+bEXFZXU8TEGtj1r1xz6XEwdmLVRh7YtPLV9DI6x7+rAJXvN/W93LCKu01BdUaDlIbTSq68tFAIr2ETumvMZZHNikcl3B5gB/9ffaQEnD5wF40kdtKjvmHFEad9CRLjpmH+UqV1F3gkWCawndWMxgApVqG2vOpXo3OLVYs0l6a2UldBpR1swbhqw2GgC1A5kG1a+9GFrVBYVkqjW7BzoATgpdyVIHtSHhr0xIY/+agSvjM6aZFgrNhk5OuAJCeFM86YfDj4wlxpNuMuKxgZ9T6Ca0aJjnF2kq8+qwGK74lCYknXdB+ly0mdgYm5nInMJfgu8bSTiLLYqW6WcpjLtDwCfm2JkcbZIk4T6V5yj3uZdyHRnHNZ2cJmV8615iFFtQODq0hec8Qz/blJGLtFnzzb/Kg+5uavnvZEE2ohURG9vu+Pzv5kaLrdPODfAmyGKBIsGoq2paOTFHxv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3641.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(66899021)(54906003)(86362001)(186003)(53546011)(6486002)(26005)(9686003)(6506007)(6512007)(71200400001)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(316002)(83380400001)(91956017)(66946007)(76116006)(2906002)(38100700002)(122000001)(41300700001)(8676002)(8936002)(38070700005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RDoItR6mZyarxnTvX2FYdhno4MGCtEZvx9iGS9QU0yyVEUBT9ts+YD8PFW?=
 =?iso-8859-1?Q?76iWp3rUZAA98yGWv94bHi4a2tx8omoTCE/COWIjVkiH3vSK29ACb4VYVH?=
 =?iso-8859-1?Q?muZY1AR/hjiQZSDpKN3eKEOLWqbf2f/ZMLzfcevj89qE+D6lePN9rHf+VC?=
 =?iso-8859-1?Q?ZpJ39e118mrQcTy9tAv+BVes9xmL39jcPYQOBOuhrVn1GhJTxRpRVU18S7?=
 =?iso-8859-1?Q?7U7xBYGcx+DG68gC+VsZ/8AyGWoSFIM8XYVJh5U4DDr/aNhUqqCHjv8xxA?=
 =?iso-8859-1?Q?gI4740OaPA6XFIr1TsMeP4+yEfFdBs85gLyk35CT+L5XKJCJ1a2aVQ6lXL?=
 =?iso-8859-1?Q?W851+Yhsmfjkz8K7Px5chZOOsbjQnUH6heggXfI9ip+pHeAhT6Dgug8pqq?=
 =?iso-8859-1?Q?ohPKFaKBWfJPFdld0p5GY8mPjQpVlTsD2sy2gEQ+dTi/GlX46VFSKxGQgw?=
 =?iso-8859-1?Q?PGfkW5dlGZ39BsSGsr5GndEjzlgwxY5kD2eCJPuFDjzxb65UBuvAeM7lXm?=
 =?iso-8859-1?Q?CbC01J41Z8cnSFk/xRJ1Ptp+UbSeA3ftrt91AyWl10ifR66BED5WYkkSpL?=
 =?iso-8859-1?Q?wwpaCeNX5beUpPnFprUEBTRQuteJveodG8KJeszTQTn4/A1OuVgqGL7VBi?=
 =?iso-8859-1?Q?vnPcRfCGDkzUspTUQVfPXeAtwpec+fP53U2M0lZeXA+XNGmb31jhZ9dUjR?=
 =?iso-8859-1?Q?mx32QMZOEIBQKKl8Kl7KZlaI74gTws33azNZGADC0HeyIpnALG3RPsn+jE?=
 =?iso-8859-1?Q?9wxCD3gMOdCOV4/9+N25PwQ/JH5jrzabOP3hkGXWsh601XS4+Qv7eKP5rO?=
 =?iso-8859-1?Q?tnjIvBwmRjqMaN8a0+o2cyLRhHNxw050t1w0ruGmZJnIO5S4zdZ28e3Xx8?=
 =?iso-8859-1?Q?OLUimpSBUMVp4Xzi6XmrgnwKOEe44NLSgw/zBpp5Dueeqd7J+aNPBZvktv?=
 =?iso-8859-1?Q?e0P/CwnV4w0KqAXB7bAJNUnwawqc5S3SLh/JijUGzbSgMAVAj95y0x7qhO?=
 =?iso-8859-1?Q?8hv+yXRh8vvlVxRN2GTKuYdtawtnNUuhxEcmspwVm8+HxdhwdguPLETUly?=
 =?iso-8859-1?Q?vDKZz2ZV0eYSG+QPJTCLKsQ3WQO7lsUs3VYbzEPYr5+SOyx6oTIQ1zHi3V?=
 =?iso-8859-1?Q?fBBsJpla6npiQ4OPxvX/G+D2/R+X4YS0ukqJRAv/tNbYsZvOjCYHEA5XDQ?=
 =?iso-8859-1?Q?3WFLXGq9LO68FRpuN2aJb0A8Gt06tS2aH3oh8s1subgvVEZ1CFh0ARmv73?=
 =?iso-8859-1?Q?Uz4r4q9+UIWOkwOWzYTwjhwaIDIgVt1QFqNF1EzDbuDoV6yT+jtvcNA2aZ?=
 =?iso-8859-1?Q?RyTLv6V1FQ+M4QV8pgqLwzawsf2J1E9gDFc7mJ4XI6CjtS3zEaHAS/0hFU?=
 =?iso-8859-1?Q?YaIfUCO3GY9nYbONgMc12Zd2CF74ZI3jhDyYaRqFzkjW0pPVtdLBUOf214?=
 =?iso-8859-1?Q?gJ52YNKbjJTqnCXeGspHzyVYw4B0UyKJT9LwSbK3G/7+SLo2lT+fuO6iPf?=
 =?iso-8859-1?Q?ahPKhUtzw4O9Acg/QQWhWAhVet0SdF2t5Oqtojm6qzVoED53srL1aNzZxH?=
 =?iso-8859-1?Q?UuOwU+pXrFObV+wCvUaBdmYJGayxM3hWqyZvmLzfEuaBm73kG+3kFlNPLY?=
 =?iso-8859-1?Q?Hiw55sPlNLaqlvrGrHStlqFZ+6O5fYVi3EaOfUU+Mz92cCYp7TWGfRGQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4120128DA1E4CB48A738573551185E6F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Zs76HIVuhVneuoqXEOWMS/ZAhnbrWEn20UTjw36QO82FVFm3z6eE0CIgg80kZUcvZjXq/toAKHZZpGuAdZv7KBrBF5kQKi0dd13WkJK5+o9FrgYWgwesmyAx1aFesNTSk4nyWMeogzQtKF7lHdzRYzDPYKnESOE8vvjWlHvB+2UcNzqdQTzKy//fao0yzvV852WIjmvLQ67SKNsiBwCe0dc8RTLUnJlK3L/UraKAN+4FSq/urYk0OfFrdDMym0cK4jiVEoRF2xwmVrInUWkCXWnTVW/paA5JJXxE7tK4PbHoxSSeWwd2+sNRvnptMgR0g1it3+GeeL9jc/4BxgR7bl7WIBDwMmv6+nVJQNKLzlkn/PplfmkSH6CfxyjaNc9qqPwajsTUYOoUYcXaosxuOcnErDVsJBCtD555GGwqQeqSPPo+5Yz6ohMWxO1Wi+pJb/6KGA7zO7UIt6IQxjTR3cbA/Vcs9QlM9K877laM5R4tIbj1ow8N8YtLHjerjoeTJLq7uKmtgju5wgATMTFAqslItw5zENE1oqbNiVqxJ3FVYG04hVjNUmoekT6YeVAH7yuOch8rvfZOD/8op4XfPfD/d1twc/dNEcoqoJXQ0hj2V8EQ/vfPl9qRT2gJeY+e6UUl1JY0znB9nB6iDrxDscITwEFjPgC/mKzfOq1Gi8JWkj1wi5a7bK8vRFO5jFyfL0tywcy40i8tVvxmA7E3NoDzHATtAoQPeucYYUnMcjP8HQoi9vVgnqfp/pEBPdnoqychn0pE6FTqSA956Dfr9GZ8Wtp+PeAu3zV8pV4FHmTn3/rkk7ZEHxnQWJt/IvdQDocblXFYXB9wXWxrBEIgFQ==
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3641.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d5e23d-9ff8-4f2e-c11c-08db44c6dfa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 13:21:54.8660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzUgTzU3yHpKd8aWFyckQA60o/QHL7PGXnBm5eNO5ZbhWByPzTD8rlbJAAByhqOrEDL6xIvgk8hvxJ28d5g8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7514
X-Proofpoint-GUID: pQ3FTJ1Y8KHsmZbWSkPdzEuKW_SEig62
X-Proofpoint-ORIG-GUID: pQ3FTJ1Y8KHsmZbWSkPdzEuKW_SEig62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=405 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240120
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=jiles@qti.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Apr 2023 11:00:19 -0400
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

Hi Richard,

On Mon, Apr 24, 2023 at 02:06:18PM +0100, Richard Henderson wrote:
> WARNING: This email originated from outside of Qualcomm. Please be wary o=
f any links or attachments, and do not enable macros.
>=20
> On 4/24/23 12:29, Jamie Iles wrote:
> > +/*
> > + * Calculate the number of CPUs that we will process in a single itera=
tion of
> > + * the main CPU thread loop so that we can fairly distribute the instr=
uction
> > + * count across CPUs.
> > + *
> > + * The CPU count is cached based on the CPU list generation ID to avoi=
d
> > + * iterating the list every time.
> > + */
> > +static int rr_cpu_count(void)
> > +{
> > +    static unsigned int last_gen_id =3D ~0;
> > +    static int cpu_count;
> > +    CPUState *cpu;
> > +
> > +    cpu_list_lock();
> > +    if (cpu_list_generation_id_get() !=3D last_gen_id) {
> > +        cpu_count =3D 0;
> > +        CPU_FOREACH(cpu) {
> > +            ++cpu_count;
> > +        }
> > +        last_gen_id =3D cpu_list_generation_id_get();
> > +    }
> > +    cpu_list_unlock();
> > +
> > +    return cpu_count;
> > +}
>=20
> The read of cpu_count should be in the lock.
>=20
> (Ideally we'd expose QEMU_LOCK_GUARD(&qemu_cpu_list_lock) which would mak=
e the read+return
> trivial.)

Sure, can do that, I can add that as a first patch and update other=20
users.

>=20
> >   /*
> >    * In the single-threaded case each vCPU is simulated in turn. If
> >    * there is more than a single vCPU we create a simple timer to kick
> > @@ -185,6 +212,9 @@ static void *rr_cpu_thread_fn(void *arg)
> >       cpu->exit_request =3D 1;
> >=20
> >       while (1) {
> > +        int cpu_count =3D rr_cpu_count();
> > +        int64_t cpu_budget =3D INT64_MAX;
> > +
> >           qemu_mutex_unlock_iothread();
> >           replay_mutex_lock();
> >           qemu_mutex_lock_iothread();
> > @@ -197,6 +227,8 @@ static void *rr_cpu_thread_fn(void *arg)
> >                * waking up the I/O thread and waiting for completion.
> >                */
> >               icount_handle_deadline();
> > +
> > +            cpu_budget =3D icount_percpu_budget(cpu_count);
>=20
> I think you can move the call to rr_cpu_count() here, so that it only hap=
pens if icount is
> in use.
>=20
> Why cpu_budget =3D INT64_MAX as opposed to 0 or 0xdeadbeef?  It's not set=
 or used except for
> icount_enabled.

That's left over from an earlier version, I can leave it uninitialized.

Thanks,

Jamie=

