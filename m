Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89F652641
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:29:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7h7h-00077Y-9C; Tue, 20 Dec 2022 13:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p7h7f-00077B-DC
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:13:51 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p7h7d-0004WU-26
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:13:50 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BKHJRko032431; Tue, 20 Dec 2022 18:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=KnASwqmUas5SDFmwd4pVcM2Z4Cwmu8KRNwmLg387KUY=;
 b=lylJnbjwgZ+02+OQH/KBT5WjhlaNCoz4t3wCpWtSfX5jH+kx2RKi4xBjop4L+vh1Edoh
 7CmQpcPBRCvimIfnRfodY7OfAc8hJ01UZ7uoyHHIpRGtEI06NjGLuMf4Mb3Cdhc+eRM5
 HDw1/uRYJgjKtaQ40M4JjvHC7ZXsncFTM0sPii3vLjIxDYyAVxODkLOpQJbkqodkkXjQ
 yILxg50tzooRvhGafcskQM60PItEVTsaA04RQBRJ0/YlebaCwjFnO+l13slYZo1pxqgr
 Z83R/0Q+INUvUzicoz9fm7shScjI+7TYJmUcFop66lZHKOJouk2Tq1ia2qJKPJ69CsCM 9A== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk195j659-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 18:13:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv6nVksjcKycAdqzGJfiXbcnT0mo5k6pDlQu4irqPRbL58RY10lYzD9E5NjFiQEhy4LZoGH75ZPXEJoHZbhRDMlycgKEFVDK/c77Gno0vF2CPbzAEzCvKC2rAnT2PuGwP88dO9V4wLP5mwShq89k5ytq7xWLpn+pUli2L/DMdk93eeVkHgkrpQLMHUejosKh9ZdRgFoMrZ0RX8QV32oEiNo5xj7afVwyABQFLnU68K/h3FuO2RZiMp477eofPyzMOodrkjtmWIPaNE6+BEFpTjVekbKUZf5YmdT15JuuO6FgTNjRSPtANZy17ecBsZF1WanNxQ/X0KIgbmYwwn9akQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnASwqmUas5SDFmwd4pVcM2Z4Cwmu8KRNwmLg387KUY=;
 b=Nl1yXbp1UnOPkdLOigr4d0fR4AWvrNlR/3iIuMP0EWTFCu8GrQijSlzue9V+9qPAtQaewcJ0cc2zmMM5F80vFodZwVKL3eXPqbjsGpnzdh5M7p7Cyl4XggEh4TuQ6+e83AnxP+SCJ7TFw/ChTGWtkEt+Fdat8HAgmPRJHsi8tjI5243KTRhbD1oZ436aZkzsOLGNUksZnAzutJwRvmrdqjB6VuHP4YUMRPXmM7TkbspOzskIvbZ9BH7Od87iKreGE+ZijwWEH9r6zGNfNjJUP7XOXF9+JR1lqh5fiHVQ73muGS+diRBgC2WAz8FS6LXnERzWffTkezA5XkASOfFQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6966.namprd02.prod.outlook.com
 (2603:10b6:610:85::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:13:41 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%9]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:13:41 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Montesel
 <babush@rev.ng>, Anton Johansson <anjo@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Brian Cain
 <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Subject: RE: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Thread-Topic: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Thread-Index: AQHZEY/d4l7DwLBzykarvNsciXPtUa513Z8AgACI/wCAAFnqgIAAGJMAgABAtQA=
Date: Tue, 20 Dec 2022 18:13:41 +0000
Message-ID: <SN4PR0201MB880814C126024737A8F684F2DEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <efcdbcb2-87c3-870f-5462-fad7a276de7a@linaro.org>
 <144e9b21-3bcc-4519-bdc7-4293f2c4af90@linaro.org>
 <20221220135151.1e5394b9@orange>
 <ff4cbe8d-1aa4-3d8c-9085-29e1696f98c0@linaro.org>
In-Reply-To: <ff4cbe8d-1aa4-3d8c-9085-29e1696f98c0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6966:EE_
x-ms-office365-filtering-correlation-id: f5707228-c1b7-4279-2e82-08dae2b5ecb4
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cC/2DYbQrNyCzx1uc9HIgHpEicYejtB5V9QmpISjL+ZMtOU2c9AtWMcunOQAuB3uetiqbASGyGbd+Z/+n5jsWV8kTESFwGeesc1cSSzcfbGuTAV0i4bxq2bIJjcWl49SYjYMRUrW9tACV+rBl3EVAQD1PaxLvEqfmGGWEYC4ao/i7GM6AYAs2ZqGoQB/cKbWnfNTq/WA5i/b2IEWyJc07/ALgWDouIM1Fs0+tik6v0ThywrpfYN9pRI67rneRNxm3FSn+dKTy4uLrJiiEWZGcIa8Cq0k9CgrAvAp7vZSuT3xIxuElpqv3l14iDBpyJKGGwZVWLLz6FrmGz4Swy+MCY83RA9tRe72fJ3j/qNZ/nOWV8MKPlEeUzREqS3O5rpame1ONXVblsgsIpe00+E9Jd2boa5arWsV5L78g9w5xbvT3FXGqwQs2G/VHdU5NCMnwW2l0mhayNMCC9huDnzbofKHdVk6sqmLuw7Ja5Ajzb3YvJFsIMjlZlz922RtIJLczMaIuMD4tGWDHVF4XkTKDYZQY8QnMYEaV+fJPVdS1PDTVjrY4zrJ94JDrKwWQuyO5dFTefL8igdPSJmsp5h6QEvun5wON0GoGF7ZK5Yi3t6TdTRT8CwnnWZr4GFuAwwtQzR3/BaY1tP90i7eSzILQJxPjSVEnoPq03eEdRYhOgUyXiV/93xOY3BEk1zUtLmfLvOxm88pOSA4ynAmT3owbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199015)(41300700001)(52536014)(2906002)(55016003)(8936002)(15650500001)(66476007)(5660300002)(4326008)(66946007)(76116006)(66556008)(86362001)(38070700005)(66446008)(64756008)(8676002)(110136005)(316002)(54906003)(122000001)(7696005)(53546011)(6506007)(26005)(9686003)(186003)(71200400001)(38100700002)(83380400001)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjJLTlkrMWQwandOU1dwajkybnV6dmdRZ1IxUlJURGxkSUg1RUx3OFBkbThN?=
 =?utf-8?B?WHFQL3h2c0pUSnZYcTZxb0xFVitHelR0YkZLVk9iKzZXcEJybGZoU2hIUWJV?=
 =?utf-8?B?ZmlqbnM0WE90ekRWY2dNM2c0MFVKVnA2R0EyVTFyRjhpT0x0K0YzTlFINkVV?=
 =?utf-8?B?YXV2Smw4UXJTejU3SU5OSnFGRnY2d1JSdjUxcENEUVdTa1VVeFJBMVdlSEg4?=
 =?utf-8?B?Y25ZNUpTQlZFeVVTamtMTU5iVjVJRzExOFYzT0VqcERqZHZxTCtkajVKdlk5?=
 =?utf-8?B?SDkyWk5TcnY2cXVUK3cvdmsyRmpzODk2MUhhU2hUZm5WSHdUWUNncDhpeWNn?=
 =?utf-8?B?ZktuamFuUW45cXhjRXMvZloyV2pSUW1yVnQ1aEFtNmxkTHpTZ21NWkZ4d1pq?=
 =?utf-8?B?amFwYjdFTkNCZWVzclBGQk1MbGR0NmQrSW5RUnVoMnRpSklZWlNwMlZIcFhp?=
 =?utf-8?B?ZVord2pnTWg3ZTM4bjZZekQ4TERDdWYvd3RXd3dDMHh2Q3pNOHpKVDQ1NnNK?=
 =?utf-8?B?SW9tVmNNNkpvc1VqK0JscDNCam9UdnV5K2xHMC82TWhjMGE4Z1Q1a0lTYVF3?=
 =?utf-8?B?U0IrYWdqUmxlTkprWitON1l5SnYxcmVnYkgrNlAwd25ZaklqR0ZGd0REeDlJ?=
 =?utf-8?B?aDVmMkNDUDR6bzVhdEhRT1VKZVJ2dk1RMTRydFQ0aklxWmpZTmV3Q25HR0Ru?=
 =?utf-8?B?N2xWWU1qaEVvMWNBRzEyMlQydFNJOE9CT3NBY3NCcVVtQzFzaHRHcTBCTjZ0?=
 =?utf-8?B?Z01QMjZ5OUZyWnA1a0VuM1VhQzhoZ2xKTHI5dmNMZVRiTXlObEY1bnE2SytS?=
 =?utf-8?B?dG9PRnNQbmk0MTJIVHh5VWRXbnFtS1c5RlNpVUZmRVZJVkZRSEVSS3NRMURp?=
 =?utf-8?B?b3NqYWY4MW55dlIzSmY4UUJrT2hBOEl4THdOZjNHdi94SW9qcW56Znh2UzhB?=
 =?utf-8?B?RjV0c29DQi8wUkhkZ0hOa2RHYWxpRitBNm84cmhTUWtJTmpRa1YxNmY1Q3RK?=
 =?utf-8?B?WXUwOXlzZVlCYkZEeVM3Zm1XUkprMUkwWW8wU2Facmp5eGxUQXFtZjRUZERW?=
 =?utf-8?B?cW5oQXB4Vy9lQXEwZ2FsNm1lVC84WkxlTnlhR1J5SDJGYUZ3S0NrckE0a1FS?=
 =?utf-8?B?ZVU2QzZ5T3p1amI4ci8vY0xwV0ZrWW1iM2tTM3o1UGIxejZOUGNTSjdlS1NI?=
 =?utf-8?B?a3JKck9yMUMyTVZkRlN6eC85THY1ejZEY0tSQXg5NHRjWmFEa1FOQjB5eXhV?=
 =?utf-8?B?VkRhUzc5RUNMTUx0OTliNUU2MElVVFJLWm5hMlFzekJUbnpzMkJxV0tNU0dU?=
 =?utf-8?B?SlpnSkl2dFJlNFVlSjljc3YxaDdDN202eEIvaXluNnNwVGRpY2l0Tk5MT0Ns?=
 =?utf-8?B?d3QxMGtuazVrSTNaVEkrcVJxYi9rZktQUWl2NDk2dXVydTA5Q083VEhvSEtr?=
 =?utf-8?B?U1ZIcEtzZVZ3K2NiajVuRFZTZUEwNVRZUEpNdHc2RE5ab05qSGNkc09HQXZP?=
 =?utf-8?B?azJnM2Ywb1NVdmNla2hXUFNtaVZDQXRuVmE1MENza0FuSGJMajFwQkxEc00v?=
 =?utf-8?B?RXU1SSsxTk0raEJKUE5sd083a3VsOGVKOXp3OThSOE5ZZThubVUybG1TYVFu?=
 =?utf-8?B?bXk4WWUycXpGZTFoNEQySEZoNmx4emR4dy95RFFRcUg4R0VWelk0KzBkNXRs?=
 =?utf-8?B?QlZrVjVGcFM5U0dRbkJjWktYc05UMzAwaVRyTVZ1enZyaks4c0xhMTdPK1Fu?=
 =?utf-8?B?RDhYUVBJcmNqTTJHbm1NSEd3MDNBSHUzRG1vMnNkM0FhbDBPVFdRTHJHV2VF?=
 =?utf-8?B?bmxPb25uTTR2L1Jrc0IwZ0YvWG50WTZVWUZJV2x0Vi9zcG83V29kU09QdXBZ?=
 =?utf-8?B?MUxFa3hSQ0V0RnpaSUp5MWU1R1VhelVFZ2ZOZEZOU21nQ2FYZFhjR2pmbXlC?=
 =?utf-8?B?RzM5NWFNMHNDZE8xNkY3bG1GZXllc2tKc3lGRmdDWitZL0M0TEhsV29TNVhF?=
 =?utf-8?B?cnVRLzhJRERVQTFsQVlIc0xVT0RkL0c5UnlGcGJrelFoN1RYSlJ3WUttdjc3?=
 =?utf-8?B?c0RWSFdMNTlSWW5WZk5CYTZLSHpLOVliUnY3TFdlem5qTXJFOEFWdzQraXdh?=
 =?utf-8?Q?nhRL9F2+spbpSX4MzZHaLoh43?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5707228-c1b7-4279-2e82-08dae2b5ecb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 18:13:41.3910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CwajnIsIkmZPIf8dTKip2dLkmWwTJzpi3jWYcjaWZf6FdFE0DKlUmUB35Wr7zgVrILNqvI6sv4BCnc0pP96DRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6966
X-Proofpoint-GUID: RGCL7n23wJGLisJhYzN7CgSJoWATJBoA
X-Proofpoint-ORIG-GUID: RGCL7n23wJGLisJhYzN7CgSJoWATJBoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_06,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAy
MCwgMjAyMiA4OjIwIEFNDQo+IFRvOiBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5n
Pg0KPiBDYzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnOw0KPiBQYW9sbyBNb250ZXNlbCA8YmFidXNoQHJldi5uZz47IEFudG9uIEpv
aGFuc3NvbiA8YW5qb0ByZXYubmc+Ow0KPiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBw
ZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT47IHN0ZWZhbmhhQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQVUxMIDAwLzIxXSBIZXhh
Z29uIHVwZGF0ZTogYnVnIGZpeGVzLCBwZXJmb3JtYW5jZSwgaWRlZi0NCj4gcGFyc2VyDQo+IA0K
PiBPbiAyMC8xMi8yMiAxMzo1MSwgQWxlc3NhbmRybyBEaSBGZWRlcmljbyB3cm90ZToNCj4gPiBP
biBUdWUsIDIwIERlYyAyMDIyIDA4OjMwOjAyICswMTAwDQo+ID4gUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPiB3cm90ZToNCj4gPg0KPiA+PiBEbyB3ZSByZWFsbHkg
bmVlZCB0aGlzIGxldmVsPyBJSVVDIHRoZSBwcm9ibGVtIHdpdGggLVdleHRyYSBpcyB1c2luZw0K
PiA+PiBhIG5ld2VyIGNvbXBpbGVyIHRvb2xjaGFpbiBpdCBjYW4gaW5jbHVkZSB3YXJuaW5ncyB3
ZSBoYXZlbid0IGZpeGVkLg0KPiA+PiBNYXliZSB3b3J0aHdoaWxlIGJ1dCBpdCBjYW4gYnJlYWsg
ZnJvbSB0aW1lcyB0byB0aW1lcy4NCj4gPg0KPiA+IEkgdGhpbmsgd2UganVzdCB3YW50ZWQgdG8g
YmUgb3Zlcmx5IHplYWxvdXMuDQo+ID4gRmxhZ3MgdHlwaWNhbGx5IHVzZWQgYnkgUUVNVSBhcmUg
ZmluZS4NCj4gPg0KPiA+IFNoYWxsIEkgc2VuZCBhIHBhdGNoIHRvIGRyb3AgLVdleHRyYT8NCj4g
DQo+IFdlbGwgSSB0aGluayBzbywgYnV0IG1lYW53aGlsZSBJJ20gc3VycHJpc2VkIG5vYm9keSBl
bHNlIHJlcG9ydGVkIHRoYXQsIG5vdA0KPiBldmVuIHRoZSBDSS4NCg0KV2hhdCB2ZXJzaW9uIG9m
IGNsYW5nIGFyZSB5b3UgdXNpbmc/ICBJIHRyaWVkIDE1LjAuNiwgYnV0IGp1c3QgZHJvcHBpbmcg
dGhlIC1XIGV4dHJhIGRpZG4ndCBmaXggdGhlIHByb2JsZW0uICBUaGlzIHdvcmtlZCBmb3IgbWUN
Cg0KZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21lc29uLmJ1aWxkIGIvdGFyZ2V0L2hleGFn
b24vbWVzb24uYnVpbGQNCmluZGV4IGU4ZjI1MGZjYWMuLjRkYmNlYjc3NjUgMTAwNjQ0DQotLS0g
YS90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZA0KKysrIGIvdGFyZ2V0L2hleGFnb24vbWVzb24u
YnVpbGQNCkBAIC0xOTcsNyArMTk3LDcgQEAgaWYgaWRlZl9wYXJzZXJfZW5hYmxlZCBhbmQgJ2hl
eGFnb24tbGludXgtdXNlcicgaW4gdGFyZ2V0X2RpcnMNCiAgICAgICAgICBpZGVmX3BhcnNlcl9k
aXIgLyAncGFyc2VyLWhlbHBlcnMuYyddLA0KICAgICAgICAgaW5jbHVkZV9kaXJlY3Rvcmllczog
WydpZGVmLXBhcnNlcicsICcuLi8uLi9pbmNsdWRlLyddLA0KICAgICAgICAgZGVwZW5kZW5jaWVz
OiBbZ2xpYl9kZXBdLA0KLSAgICAgICAgY19hcmdzOiBbJy1XZXh0cmEnXSwNCisgICAgICAgIGNf
YXJnczogWyctV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlJ10sDQogICAgICAgICBuYXRpdmU6
IHRydWUNCiAgICAgKQ0KDQpUYXlsb3INCg==

