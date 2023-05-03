Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4D6F5C3D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 18:51:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFfP-0004A7-BE; Wed, 03 May 2023 12:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1puFfL-00049s-4s
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:49:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1puFfH-0007z4-G2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:49:18 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343DKAG0000462; Wed, 3 May 2023 16:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=SUEajafulmVHCGo4g0NjfRi4mELVsvpDpkAqYxzVrSw=;
 b=Ix3URBLgRb/QU9bgvoDyLfR0ef+6759Qf+eavXyLEhVDVhSWSpGb9KYHJLOhrgB1Mo99
 cZazTEd8rgLws07TKf93VECBh2TNPI2e9ts6saDdKeOEtgDOgH0TNyzG+FoqtH44O1pf
 +/MC8x7j6vFF7nABacyQEmb0Onzph8rCoNu0tq9ZRhp/VSFqA6vfgoYLIlaxHzIVosNi
 6spicxL+EUcfpzhXP6vkp2ItlvCxhZW5p6MUTid+eE4nG+/yEex0LDDKJ1t4UKFRU3Yz
 h47sjBOk9G5Jn8zPZiBH/ikglFKsDUYoGvWssWrthp9fb6EAxADq4ghGj7KaSSE3EGbK kQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbjwn9825-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 16:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3mF875XlbqQ7gPtgt7cKpN6LUvuH0LNG81S67i9iv7rlQo5oeTmS8g5NDpf+Wl2fong1ZRuBs8B/8Pkh0zPB8QHaz/TLaPgoxXC6rZoG4YYpwKKy3Yq3gHX7p3XIAAapNe71j9W+T5HQopurK4y8AGzjeDqSnP/jRGlv4Isaw/NAd99aDWIJxe6ZUrF10YaaNc65/d6Bqg7XNJtyZa6P4I1D9Hf4Qp26ufzqDzy6+T0WfmuJYj24LORmmdxyvWeGA44tZi8+UgZ373YlViLM766y1WUeCnBGQ5tgh2PTDy9vuwK7uD/ZqSzAa9rQWibRHGbZrxGOaVh5L2VKdwRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUEajafulmVHCGo4g0NjfRi4mELVsvpDpkAqYxzVrSw=;
 b=J34VPcKNtzLRfgVTS1N4TE3sovWFh+DBhYO0237Au27jB/uOWDDrCkf6DFS/s96aiw3OF89btb99EAZUFnHQZW0ByohvJQd3b35nqSoGxJmpIJcZ0GIFvCWhCj3Z5rhT8VtVh5EsRE91zGSY0Xm98syi2hiysLb+N8asFW1XknaKw4KSP/l70dLS6nFtAcPQjBBWXcvR9/ltMo9I1J5Brvftx4pDmdXD1nlSgajCKaHSeMvGKgC8uLzXyqo0YlSL4fmNjG0DjODZF1/QIJ5j/r/JGaPYJlZO3VcxJi8dCeZxhUibh0+zs7ST3y3M0SLKkrKZxABG7NRNb2FrUMf7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL0PR02MB6548.namprd02.prod.outlook.com
 (2603:10b6:208:1c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 16:49:09 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6340.030; Wed, 3 May 2023
 16:49:08 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v3] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
Thread-Topic: [PATCH v3] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
Thread-Index: AQHZfGvsgwsjsn1mKkuuaDCAhY+Ae69G1QgAgAHswQA=
Date: Wed, 3 May 2023 16:49:08 +0000
Message-ID: <SN4PR0201MB88086668862228E23405B7ACDE6C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230501203125.4025991-1-tsimpson@quicinc.com>
 <9699ff6f-3406-dd61-31d7-a288a96cf697@rev.ng>
In-Reply-To: <9699ff6f-3406-dd61-31d7-a288a96cf697@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL0PR02MB6548:EE_
x-ms-office365-filtering-correlation-id: ac1976cd-a596-482e-ee27-08db4bf65091
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LH668ODto/oPIW13ZLRMyG/esA8I1MHJrXSY25XMUs/rpOZ9JRj79xn+39jqTz5oNaSm5yxPwbIsak1zvZui+IK/II+3afGRNL+LcGJl5+mz6GhFvhD4X+4goTSvpTGS49akE0NlbRbmqWbXdL6pfN2sMlhLZQW46NCcOBItsK5AmwmBoCyzHjtwUY4B6O/1AF4K3StERpyYyn7zmanm3erRLvxnQG1TYrx/pkDnSSN+5Ovan5LZ2hPstTUyPK1MzS40Gr02eB93ZlCrXsDX1Fmvo00O8PTa3uwk+poIuFt7KqBwUW42/BpTcU1kvmfb8epBYgl/RDgKdow/UnA9O1c+uYEsOttIo+sBh+Ck79Y+3IDDlxtrAl/3zS/7DNMmDfhRw9Renq8CA5G83at4pMW/98kqIqNx0AT8OkT+ajdHUM96O41URzwm8BbnOtcbK6HDMgyk/9gCEYscmgdk5iB/JbK0cQLVXXlQdulcn1Kyw4ftJacMsussvKUrCxX7n4JSlkc+hbWzRrJe/i/bfv8tv1swzJBSy+PM1080sMj7q5uicZ1CIjpziYK8XTWPgIDanmrvLx8aiiYqiv221E5wt/IToTI3uN0EWvZj5tG3/tg203nIUJwwqTeWPA6T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(66899021)(2906002)(52536014)(5660300002)(33656002)(8676002)(8936002)(66476007)(66446008)(64756008)(41300700001)(66946007)(76116006)(66556008)(86362001)(55016003)(478600001)(110136005)(316002)(4326008)(54906003)(71200400001)(7696005)(122000001)(38070700005)(38100700002)(107886003)(186003)(53546011)(83380400001)(26005)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkdNYUxVelJ0Rms1RTdLN2l6MitkdEhrN1ZQbzJRSVh2SjdmR2ZySEdJcExu?=
 =?utf-8?B?MzZKMFl5elNHWGNuUUxPaWJlTWJYLzEzVDFDU2NzTzMxb1hUSE5yU0drYUJv?=
 =?utf-8?B?bGdTZGdMRXpqYjJTa3FHb3pkM05sLzhxTDQ5OFhYYVF4ODNzSFRHcG52c0h6?=
 =?utf-8?B?aFJNUzFpODg4a0J2eFg0b2kxT2FZN0NyakRiUkNTSm9OMHp4Z2Q2ZGZYSFNX?=
 =?utf-8?B?Vmp6TUR1dHdkSG9WZVVGbDNYaC9uRGt0S3BtM0JKM0Z1VUt3bzBFdUdnKytY?=
 =?utf-8?B?UWJhczJhOWU3a2dlczd4SnBTMi8yS3N1QSsvVVMzYk1qRjVsUWdtMU8rTElu?=
 =?utf-8?B?TkhxNm9razJQRmFsYlNMZkYzT1h4RDZEcTE1U0dzZDFFYzRLc2xCK3RoRUpl?=
 =?utf-8?B?N25WRGs0c2h1a0w4VG45Q21hZWY1WlJLdzF6SHlIZWpFOGhFYXc3SHdvOUVX?=
 =?utf-8?B?NUZwV2o2ZzFPMUplSU4xSzgybWZrbWo4V29oUms4RVkwajdsVGxvMFB2cmJ5?=
 =?utf-8?B?cGlJRno4T29XTU1rWG96YVpMQmFYOUk2czczNzlkd1NkeDQxZ1hScnRTbTJB?=
 =?utf-8?B?U2E1SkRvZXJVYWFILzdYamN5ZDRPTFc0OWdmR0FNOG56MDRGamI1RER6ZlpG?=
 =?utf-8?B?YW5UWW4ydzQ4ajZUT1BWN0ErcEQxWkw4L1U3VGREbk5ZMVJwUUZDRm9EUkZV?=
 =?utf-8?B?MjgwZ2daQ2NXeHV0dGZZSXJzMjdpckVGZ1lZQTFHWkxXbVRMcUk3SjZVRVVT?=
 =?utf-8?B?WDJ2VFJ3Ynk2anF5bnJ1aG5EVUNkdlVqWU5aNDU4UWdFSjlkVWV3QnJJNlhn?=
 =?utf-8?B?bCthZG5RenhpMFVRNTkzYUk3YlRtOXZxb1FVUTE4c1oyTHdkRVk4cHVNcEtL?=
 =?utf-8?B?RFdaOGlGcjRqUkVIcWhINHk3OHRyeGMxcTFVcEJNSG5NKzVOYTlrdmRFQkNP?=
 =?utf-8?B?VERvL3Q1YTNpWjZveHk5b3QvekIzalM5UWd1MWJjNklPdS80UzlKYVorVDlP?=
 =?utf-8?B?VnF1aWt3cWZJRk9WYlExRGtXYUtRQjlPVTY3Z2xEUXZaUE05L3Y5U1k0ZUpa?=
 =?utf-8?B?WEF0dDBaMmtOaDllZ20zYVQyc1JMc0VwTTY3ekd3VDdHNU1UTm5DVE5JbUpT?=
 =?utf-8?B?dDNKV1NEMVJKVHYwdU92Z0hvbk9BYURFVTE4NWxHUTVFWVF4WG5hWjFRVmt4?=
 =?utf-8?B?aFZSeitCeXBVRnozUHZ2NTZTOTdyL0xIYlRWMkJPMWl3V3NjSnNiT0loeFVF?=
 =?utf-8?B?S0ZzdkgwT2JxRW9CaG1MVkhUc1JIOWlYMjdEcDBPUkJFSmo5SVczR3REcUo5?=
 =?utf-8?B?SHE3NG54dnR6Q2hZalVtWm9FT0ZqREZwdlBFSkJTOE9tUEZGMENtTktXWXpS?=
 =?utf-8?B?ZWs1Vm9RNnFiUlQvTVhDRk0xNEw0UTB5clMwZmdTOE53OHgxNi9OWUZQS0RU?=
 =?utf-8?B?RWJjMjAzcmR4MXkvKytpUmt3Mmw3eXkzMHZJenkxT2c5SmFIczZTbWxibkU1?=
 =?utf-8?B?b3RtR2ZmdVRaWnVMb1RMKzFWNFh0R1cydHlJWHVNaXp5S0FiNmpjd3BWV3Mz?=
 =?utf-8?B?eFgxeitqKy9OcTFGTlZ6Vmp6aG1pN2ttR1BwRXNPV1Nra3R1d0JYWDhsaE50?=
 =?utf-8?B?U2FoMnRkUWYzbTFwdXl0K1NJK2RXRTVsT283UjZPV0YwRkpFNXFMd3FBYkl1?=
 =?utf-8?B?dERhVXVBV1ZZaVo1ZG5xNHJzTmw5bFdLUXU4aFlZM2JEYmcybFpaSlFId2Ev?=
 =?utf-8?B?cjk0azZxSllEbkdHWGxIOW9BSEIxUUUwcGRJeWkxbFF2ZGFncC9YN2pIL0F1?=
 =?utf-8?B?SGgzOVBCNEtkWklGcFZEWXJjVDZLcnRIZ0hKbGx0K3poVDdnN0Rwdk1SRTU2?=
 =?utf-8?B?TTdwcjBycDJOanBiY3BZMTdWMUlkVWVmM29IcTZ4Y3cwWVpYZXIyd2puZU4w?=
 =?utf-8?B?ZytuOVFzTm5RNzg2VWoycy9SRFkxVUtMNnV0aUdhV0NDRm1zOGd5NXVTS3JF?=
 =?utf-8?B?MEZrcXdqRldWQzJIV3piK0U1d3RFZmxJdUxPZnE5TXZ1aUhocEthcnJBMzRL?=
 =?utf-8?B?SnlkczJ3MkRrOHJkK1JTcXB3WDhDUUNwQk5EcDZXaXZvZ3VZNDFZZjZ6Nkkz?=
 =?utf-8?Q?ggTGQdDB0aZZq8zsuKTCFNyI4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3VVVGGZukfGMIvjwmy5+sp1QBoMd7T1colkCydCwHE8/K9UEheLvf2l9hMjwgELSOEX2ifgmXw1JJ7gW2VixjoldZoiRRbZ094X6Mtx/x1OXzPB34WYbmHZ0kztr2bMv1ajm94VWqgKsHcZbnaYSaL/fpAK1AvWtS+c8XewAtY/DsI+tm9vTxzVNhSwGgP1aH7d06jjhsckEKFSv/tsG1faMUU4tUjEvOPCK693FYpNM4kuv5JyL5j3nVJKDeqlOh0Zf4MF3a+ASmPcUXlW8ajX1+QUXozJxNdocs4xR/RKHptWsar0bGXZgCd0IYQMQ3A8d9tlRCk6TqRS9LmFb+tkSsBqRBUtmv/KP0kHqLZC0Mo+fN05FHaqYswhJYT2bnF2x58G/QWbPGlASti6mG2/4MsIGnwy47fIDBMteMAk+aCr6v3cmDayHmiogdhu0jLwqFqr87TG56RF8/Kp/qnWlp6GxAN4pZHBQBb2vHNGfGzXZ4WEuxrpPyWviaBgavadqooLtWMgEMSyVr0yHEHyHaYHht0othxuKqPvXuVetEMhJUp+MbsN3eK7zCJLMiM/dqmWuRVet5tDEaWCdRc0lp1Y2Bxz0GN3VC/TXE4NcHrW5ecKiwtL0fdlTo11WBXPW3jl1m2YFD65r3XZcqBzWGsghtInszGDDVSG98Aa545lwIXfYNgmmd0HzbEMwuzCAbkCaSfGnjDknogp3Ug1j0dTURbs/KO5ED6cmtHNS3A6xVXgmgo8DgA+Tb7zR0FYjIZkjP61ZCi+2MGFcmh5RFenn0m7S5s53JUhcqtlohfnjh1MppXI4SrjuItBd
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1976cd-a596-482e-ee27-08db4bf65091
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 16:49:08.8764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ucVs8Y+LETDuiuGvRSgNWJDj96wgDeMCkwJFnQ972I+gy4volg1ZVT4oAakKdJZWzWacXBqviXaZpr4zFjidg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6548
X-Proofpoint-GUID: qwXYB7PL6nEBkjzzPmOPRiUbKF_SE8BF
X-Proofpoint-ORIG-GUID: qwXYB7PL6nEBkjzzPmOPRiUbKF_SE8BF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_12,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=917
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030143
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDIsIDIwMjMgNjoxMiBBTQ0KPiBU
bzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25n
bnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBwaGlsbWRAbGluYXJv
Lm9yZzsgYWxlQHJldi5uZzsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5jb20+OyBNYXRo
ZXVzIEJlcm5hcmRpbm8gKFFVSUMpDQo+IDxxdWljX21hdGhiZXJuQHF1aWNpbmMuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYzXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkaXRpb25h
bCBpbnN0cnVjdGlvbnMNCj4gaGFuZGxlZCBieSBpZGVmLXBhcnNlcg0KPiANCj4gT24gNS8xLzIz
IDIyOjMxLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYw0KPiA+IGIvdGFyZ2V0L2hleGFnb24v
aWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYw0KPiA+IGluZGV4IDg2NTExZWZiNjIuLjBhZDkx
N2Y1OTEgMTAwNjQ0DQo+ID4gLS0tIGEvdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2Vy
LWhlbHBlcnMuYw0KPiA+ICsrKyBiL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1o
ZWxwZXJzLmMNCj4gPiAtOTYxLDkgKzk3MywxNiBAQCBIZXhWYWx1ZSBnZW5fY2FzdF9vcChDb250
ZXh0ICpjLA0KPiA+ICAgew0KPiA+ICAgICAgIGFzc2VydF9zaWduZWRuZXNzKGMsIGxvY3AsIHNy
Yy0+c2lnbmVkbmVzcyk7DQo+ID4gICAgICAgaWYgKHNyYy0+Yml0X3dpZHRoID09IHRhcmdldF93
aWR0aCkgew0KPiA+IC0gICAgICAgIHJldHVybiAqc3JjOw0KPiA+IC0gICAgfSBlbHNlIGlmIChz
cmMtPnR5cGUgPT0gSU1NRURJQVRFKSB7DQo+ID4gICAgICAgICAgIEhleFZhbHVlIHJlcyA9ICpz
cmM7DQo+ID4gKyAgICAgICAgcmVzLnNpZ25lZG5lc3MgPSBzaWduZWRuZXNzOw0KPiA+ICsgICAg
ICAgIHJldHVybiByZXM7DQo+ID4gKyAgICB9IGVsc2UgaWYgKHNyYy0+dHlwZSA9PSBJTU1FRElB
VEUpIHsNCj4gPiArICAgICAgICBIZXhWYWx1ZSByZXM7DQo+ID4gKyAgICAgICAgaWYgKHNyYy0+
Yml0X3dpZHRoIDwgdGFyZ2V0X3dpZHRoKSB7DQo+ID4gKyAgICAgICAgICAgIHJlcyA9IGdlbl9y
dmFsdWVfZXh0ZW5kKGMsIGxvY3AsIHNyYyk7DQo+ID4gKyAgICAgICAgfSBlbHNlIHsNCj4gPiAr
ICAgICAgICAgICAgcmVzID0gKnNyYzsNCj4gPiArICAgICAgICB9DQo+ID4gICAgICAgICAgIHJl
cy5iaXRfd2lkdGggPSB0YXJnZXRfd2lkdGg7DQo+ID4gICAgICAgICAgIHJlcy5zaWduZWRuZXNz
ID0gc2lnbmVkbmVzczsNCj4gPiAgICAgICAgICAgcmV0dXJuIHJlczsNCj4gDQo+IEFoLCBnZW5f
Y2FzdF9vcCgpIGNhbiBiZSBzaW1wbGlmaWVkIGEgZ3JlYXQgZGVhbCBoZXJlIHRvDQo+IA0KPiAg
ICAgIEhleFZhbHVlIGdlbl9jYXN0X29wKENvbnRleHQgKmMsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWVlMVFlQRSAqbG9jcCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBIZXhW
YWx1ZSAqc3JjLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIHRhcmdldF93
aWR0aCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBIZXhTaWduZWRuZXNzIHNpZ25lZG5l
c3MpDQo+ICAgICAgew0KPiAgICAgICAgICBIZXhWYWx1ZSByZXM7DQo+ICAgICAgICAgIGFzc2Vy
dF9zaWduZWRuZXNzKGMsIGxvY3AsIHNyYy0+c2lnbmVkbmVzcyk7DQo+ICAgICAgICAgIGlmIChz
cmMtPmJpdF93aWR0aCA9PSB0YXJnZXRfd2lkdGgpIHsNCj4gICAgICAgICAgICAgIHJlcyA9ICpz
cmM7DQo+ICAgICAgICAgIH0gZWxzZSBpZiAoc3JjLT5iaXRfd2lkdGggPCB0YXJnZXRfd2lkdGgp
IHsNCj4gICAgICAgICAgICAgIHJlcyA9IGdlbl9ydmFsdWVfZXh0ZW5kKGMsIGxvY3AsIHNyYyk7
DQo+ICAgICAgICAgIH0gZWxzZSB7DQo+ICAgICAgICAgICAgICByZXMgPSBnZW5fcnZhbHVlX3Ry
dW5jYXRlKGMsIGxvY3AsIHNyYyk7DQo+ICAgICAgICAgIH0NCj4gICAgICAgICAgcmVzLnNpZ25l
ZG5lc3MgPSBzaWduZWRuZXNzOw0KPiAgICAgICAgICByZXR1cm4gcmVzOw0KPiAgICAgIH0NCg0K
R3JlYXQgc3VnZ2VzdGlvbiwgdGhhbmtzIQ0KDQo+IA0KPiBPdGhlciB0aGFuIHRoYXQgdGhpcyBw
YXRjaCBsb29rcyBnb29kOg0KPiANCj4gVGVzdGVkLWJ5OiBBbnRvbiBKb2hhbnNzb24gPGFuam9A
cmV2Lm5nPg0KPiBSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4NCj4g
DQoNCg==

