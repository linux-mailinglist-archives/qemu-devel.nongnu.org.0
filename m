Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678D3F9E83
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:07:32 +0200 (CEST)
Received: from localhost ([::1]:33096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgGJ-0007ST-6t
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJgEi-0005uM-0l
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:05:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJgEf-0006Qi-Ie
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:05:51 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGZ6CP024870; 
 Fri, 27 Aug 2021 18:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=rRgR1LyNoZkKDOP8m+hbh5cX0uhiHg6czyBEjP9N5Zo=;
 b=iRvF25ReufvdfzyTcsGq+JVywqWaxUX79t5zIBKlTy2UCQlDqnr1N2pTkN61eIoLYpP9
 r4jQNx9YgbX2hN4XM2OKromc97VnLZ815V4FFRdQ+H6AUVCS6RkVIM27nwCrXRScTxae
 ChCOIZxP1uD8hUEYqv++i2uM4IjsoFnz8twxVGXzBIEBrSlIQV/uF5iUhlQqRLCCHKOp
 wgxWgWDPsCsp55eqAwxuvs1pz988Cxgy7IJAwPRmkCIjMeW5iL7liy7rDk76/isYlUsi
 kwi1mxPts89MTIGWZCoEF90R3wC/r3XQl77vfbGqK/7Ta5SrEU9y+f2CMpLEgYDv+muy Bw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rRgR1LyNoZkKDOP8m+hbh5cX0uhiHg6czyBEjP9N5Zo=;
 b=rfJNxJDUnccR5QK5D3ZLrcFtHnlBcwzeUkk9/n5vUmdHE35+AccUpamKqXDuI1TbNndD
 ROSRhaJBIFkQA49gREC13o8N62NCppyO95Z5W83v6vdQQOaphsPCOCNQJoh5/x/7D3d7
 xxf1nYnWhXyITkLRwSrqbkZVHM2vNbmrVXVsxgPyFwC5X9OGPzC4hyX5+ggHkbqg3s+7
 j5hpwDvlwQo4TwhTDY5WnbDlzZ5jgB/k/CVioLDKL8DM3W+TMsHcisZZ0OE6LDtD4gK6
 W5/rOVF+mpvb1yKxOY4slXwUaJxYkZoiSJu1Gegx4FPms+V5vnaHE6Bw27Jrx1hg8Wom 3w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap4xv4642-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 18:05:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RI1oaC076566;
 Fri, 27 Aug 2021 18:05:46 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by userp3030.oracle.com with ESMTP id 3ajpm542q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 18:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUcf4HFgiZt0QsncAJAuYUQ/cTuWb461LgauEtSVXsE4E6/q22jeoyqDHUzpCGudVB0puqBEOj9zcWZh6sfIRpjOp+xqgGPbu4NRwN2vUhw87lSkuBMsgMlyM61QvMDiTGdPwQ77grCEMLmgIIMKcvvdxEo0ENbfU4EgIfh6cpN2xDb8+jdAWW5lqGqxsJqooxrTxcPijLKP/rSHxAKzYzy35tKRUCW5pn6kVppQbQR36RWvlExhBIGGLQ1zKUj2eGvZ/N+R3Mxq+3xDWtvs3XJB44y7Fr/vB7Rn1ZOt4GlUWyxW/jw59AjSvMLAFOR9SNo+UxS9iUC0vnV6gyzL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRgR1LyNoZkKDOP8m+hbh5cX0uhiHg6czyBEjP9N5Zo=;
 b=dYwULHLbd5JbgXkLLi43AyqwIW/qs4KXsMfnQ9ygqiLIz6Kf6pW0B/KKpn+lss+YHY6xJ2SfIy6gehvH9Fdfc3PsmvyJQ6XZJ2AbVT95qZF1Swb5+ldAbdKBV8e7sO7n1zzKmP2tZZb61RWBeKmMO+RSTRLriWhjsk3jHa57pLuNDe7kkI1F9BTn61tKD+Dgubshq3Q9IhtOJD+pXABLDrhvKAxZusqj/L4szMuWf6KQwmU/p9+6gCHRyZLwT/h73teTlklCXBM2o9nU/L9T34M2JR3osMoyPhTokLa1y+rhxHkFEktFrEDy0IxVk8ghporADnWrM7hT0uFLQbV0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRgR1LyNoZkKDOP8m+hbh5cX0uhiHg6czyBEjP9N5Zo=;
 b=MtWWJG2tQk4KXWhnPRIVZ2sdROz2Tl80MrEbon7G6PUCYr9tBL2q1ZDYZuJPL/N26wgx9ZsmAfIbBv+3cupJH3/7BKXnIiU2e+qJw9XzYy0aBtnLuI6Aif6+SSxYGEf5Q8KdC0OpqfD4EIxOaPnjvDMMEuup2oJKhAXzUsxuqbk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BL0PR10MB3426.namprd10.prod.outlook.com (2603:10b6:208:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Fri, 27 Aug
 2021 18:05:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:05:43 +0000
From: Jag Raman <jag.raman@oracle.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
Thread-Topic: [PATCH RFC server v2 01/11] vfio-user: build library
Thread-Index: AQHXm2a73T+62xCt1k2axheiChVl6auHpX4A
Date: Fri, 27 Aug 2021 18:05:43 +0000
Message-ID: <E3ABEC3E-2344-4FF7-83D7-E3651B4F399A@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
In-Reply-To: <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27daa00a-4982-4c6e-f5ef-08d9698549a9
x-ms-traffictypediagnostic: BL0PR10MB3426:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR10MB34262470F482AAE1EF83795A90C89@BL0PR10MB3426.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zepC4i2W7RMI1s3M4Gl1DcFw7FA9x0nC3A+rt/F0XucCF6fXML2qqyuoV/RyvhcsV3lp0XAJ+h8lxeakxFeq958nUavPpzAltD0rBPKUrXhCF/9+DWgW/g0bUSNo3bpeBPwBNPgLteN/ULlrJWAATD5DDxyL7fp5fwnNwU/D4CCMCAGdL3yjBX74H0dJwHd77ecbTEcIyjHP6sLnF0dtbZM7Hhz6vF3olzDinRifOwc1v3PsDZQlRSTfvUDroK4ykPilogIW1nPne4axu1pSmQjTZCr0LnCd33OmXZcZvhw74j+EX01eyeqD05rQVcW04ABZxgPty+ylthtHtixaaJJnkKkzQf68XdJtRbyFqvlBqjn51t2TqK2YNl/22MQyk4h5Q/JOQZFbxwl3lW/84B4LIqpc5r6+rcB9J/wg8WyHYUmJ/tTAJkHNiQ8cyYI1hcCiLJ2Kst3J10IajqgWDQjO5bYwLnVUeCEE7Q+5Q6ydgBEafy+SBYI8ywXtwzvo3OXjRPFW6mhhadYwenNAJduLgIDMizlJHOlP34Obx9H9zAQ0QYRkrCh6PnxOz1anD302yAk2tS0D/yeh8n1uUp9DdvEiexPRnvUtslchy9yXqC1nERXbZJLfnEylQzB0Hct7YVxGIQYUrHSjy54Yq3LM27SaU0KLJgSQBo3fK4eMqsf6zwkELd8yoekiFuQplk8F/ANts3CHveaKhBOnCP32lbluF5HBm7paApin+zNhJQb2l/4jwngit1tYMCPSwylXmoTLRtagSDb3h2pL3SgN3Ns6oauVyo/bzsl02TJMg9KbcGVpZWl36L/fF5gwi1PsavW3Ds1tE+XkEpgaIpsbzEImlFrPmRl/fJuFlw4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(366004)(396003)(136003)(6506007)(5660300002)(6486002)(8936002)(71200400001)(44832011)(2906002)(7416002)(966005)(6512007)(54906003)(316002)(6916009)(4326008)(53546011)(36756003)(66946007)(33656002)(86362001)(122000001)(64756008)(66446008)(76116006)(91956017)(8676002)(38100700002)(2616005)(38070700005)(186003)(83380400001)(478600001)(66476007)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N01HVjd3UVVuaFhycUl2eEFDNmJGcDFGQzBLQ21MdHRKbWV2cldUMVUyRE5T?=
 =?utf-8?B?U1JyVnI0WUJmbUg1ZjlWaFNyQ2lueXYxN3FPVkIwOFliM05XNHN1SnZCczZw?=
 =?utf-8?B?WUxienIrdlUzNnREbTl2WkNZVnpNRFhHN0g3KzhPcXJhQkxJcHFhQnJjWDVr?=
 =?utf-8?B?a0dYYkNBbDhmUW5icWhCZUVjd0NOcW4zS1B1ZU9vVkhjY2xSNGhJeGNQVGZS?=
 =?utf-8?B?UXg3ZHd3cGhSR3RQTDdpU3ptRmhrbEpvWStDT2htaE1BUjZiZ0kzVHVQTjl1?=
 =?utf-8?B?dS94UDY2L1l6SCtFUitxcGJ3M05DbElSbWxsbnNRMWdmOUV4NHpkY1paU3dN?=
 =?utf-8?B?ZG5lVDlOL09JeElpay9ZWTJCNjNWVldTa0RyaDZ0TlloUmgyZEdwcFQrazMz?=
 =?utf-8?B?eEpPckdJNVUzNkVUNHVwUEtuYXIzdkc0WHJ0ckRnVTl5WDVDR1BKRkpIdmJQ?=
 =?utf-8?B?c3B5Vk1yYnVHeWdZbWRWQTFqdmZRYjU2UFBvZ2sxWDZMTGtaQ0VSZmp3a1JJ?=
 =?utf-8?B?K2J0SXBXSXJFTkQ0VEhwWFdjSE9SM2xrQ083NkVvT3NNZDVCRXNqREVjRTI0?=
 =?utf-8?B?aHpNcm1NRVY4NExOdExhd0wyOGhQak0zcmwxY3lKZHZGTThqelZ2akVSdU9X?=
 =?utf-8?B?akVhR0FacDBFR2RGaWJ5QXpXN3VHUG5nOG5TMEw5VVZRRE0rWVdraVY3a01D?=
 =?utf-8?B?RDRwN3FhcXdRNTFLb0VzR0Y3bm1Qd2J3WEo0Yjl2R1dDRzlOZGV6OW9naVly?=
 =?utf-8?B?Vk13djhyTFpITHd3T2U0cGJFLzFZOXpkNDFWemNEdUE0aExtMStVSVIraWpF?=
 =?utf-8?B?YWo2amEvcy9MTkpuTm1ySnR3Z0I5akRaZHhUeVhWWXdrSTlaQzJqNUZ0SG9Z?=
 =?utf-8?B?WHRSbksvcWorTTNHSnBKS25LOHhiOFdKaEJrK3pkVCtFMi9BWTJVcDBzV01t?=
 =?utf-8?B?aTJsVXpJcVQ2bWt0VDhZSkdZOFpobk9UZTJONUtDV05tNkFXQ2thdG1Md0NM?=
 =?utf-8?B?cFNsUE5lZlNpYm9vWHNWMGdreVQ0S0FTMWdLa3dPSkF5U2NFSUgvZ29yWitr?=
 =?utf-8?B?Y2NFNmhiYTlVZElocndzTitsZFpWelIxZEdyazJ4VHRxbHdKZGU5QkpzS3M0?=
 =?utf-8?B?RkgyL3BHeUY1b0FRTnZmZThvckNVZExyalNBaWxFaXgwck10ZkhFWkwrRkxt?=
 =?utf-8?B?OEhmWnBLMExTTTVib0U2T2Z6YWtKeWl6bG5TL2JCa0FZWXBVWXhlOWZxOGpF?=
 =?utf-8?B?T0FURFVuNU5jYm5hZGpEODVsd3VmeXdwOHc1VW03aGxOeEJFL0hGUnlPZ0Yx?=
 =?utf-8?B?NmVyR09ndVJ6N0JaTUlIZ1BJRStRZ00vOTRraGFCSmptbll0N0djM25sSm5Z?=
 =?utf-8?B?amxaWGpDemtGaVB4L2RUWVlnY2JkR09obmtxdk9UeVM0L1RUVXpXTndiZXNR?=
 =?utf-8?B?VTdiSjN3ZWdURTNMU3BHYmRqbTUwYnEzeHpzeHVSN0xWK1V2MXIzNG5kVTd0?=
 =?utf-8?B?cEttRDRidDhUL0xEcGdsMEVQUU9GK1dRQWovVlBMa1BodSttSEhqRkFZMFlK?=
 =?utf-8?B?eGJ3ZnZCeTAyd0M5Z05OZzBYUWxMWUJaeFZ5dC9TeGtaOU1BQU92VXl1cFpG?=
 =?utf-8?B?Ujl4bnI1UmQrc0hCZFhnTnFUSDFLU3p5NjZIeitISXBCL2JHOTJUU3lXRXFD?=
 =?utf-8?B?dHNDSGVVRGk1a2FtN0xvWGhIQmpzeHplUmVVaGxVUXdPNGNieEZPOHUwbTBG?=
 =?utf-8?B?aWFJbllET3gwWitRdmNocjN4ZHpiOVNLSTVRZ2IrSitqdlJpSlU1SU1hdDVq?=
 =?utf-8?Q?zOa+1I8BudWwX9uOy1kCJEw0Z3rQuxbYcBDwY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCD24A8FD052254BBA209C773DC42183@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27daa00a-4982-4c6e-f5ef-08d9698549a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 18:05:43.6668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWfLxjs8kLDgYa3WWEny3h4bPldc6HIhG5lHiJesuCnUlkcOUmSxFZWQgwVUbhnTKo61vm2AGIoErctOj4lFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3426
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270106
X-Proofpoint-ORIG-GUID: rk1OMqhyfzFEsAPIHaHb_XioenbQGF8Q
X-Proofpoint-GUID: rk1OMqhyfzFEsAPIHaHb_XioenbQGF8Q
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDI3LCAyMDIxLCBhdCAxOjUzIFBNLCBKYWcgUmFtYW4gPGphZy5yYW1hbkBv
cmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IGFkZCB0aGUgbGlidmZpby11c2VyIGxpYnJhcnkgYXMg
YSBzdWJtb2R1bGUuIGJ1aWxkIGl0IGFzIGEgY21ha2UNCj4gc3VicHJvamVjdC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNs
ZS5jb20+DQo+IC0tLQ0KPiBjb25maWd1cmUgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysr
Kw0KPiBtZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+IC5naXRtb2R1bGVzICAgICAgICAgICAgICB8ICAzICsrKw0KPiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgfCAgNyArKysrKysrDQo+IGh3L3JlbW90ZS9tZXNvbi5idWlsZCAgICB8
ICAyICsrDQo+IHN1YnByb2plY3RzL2xpYnZmaW8tdXNlciB8ICAxICsNCj4gNiBmaWxlcyBjaGFu
Z2VkLCA1MiBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDE2MDAwMCBzdWJwcm9qZWN0cy9s
aWJ2ZmlvLXVzZXINCj4gDQo+IGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUNCj4g
aW5kZXggOWE3OWEwMC4uNzk0ZTkwMCAxMDA3NTUNCj4gLS0tIGEvY29uZmlndXJlDQo+ICsrKyBi
L2NvbmZpZ3VyZQ0KPiBAQCAtNDI5MSw2ICs0MjkxLDE3IEBAIGJ1dCBub3QgaW1wbGVtZW50ZWQg
b24geW91ciBzeXN0ZW0iDQo+IGZpDQo+IA0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCj4gKyMgY2hlY2sgZm9yIG11bHRpcHJvY2Vzcw0KPiArDQo+ICtjYXNl
ICIkbXVsdGlwcm9jZXNzIiBpbg0KPiArICBhdXRvIHwgZW5hYmxlZCApDQo+ICsgICAgaWYgdGVz
dCAiJGdpdF9zdWJtb2R1bGVzX2FjdGlvbiIgIT0gImlnbm9yZSI7IHRoZW4NCj4gKyAgICAgIGdp
dF9zdWJtb2R1bGVzPSIke2dpdF9zdWJtb2R1bGVzfSBsaWJ2ZmlvLXVzZXIiDQo+ICsgICAgZmkN
Cj4gKyAgICA7Ow0KPiArZXNhYw0KPiArDQo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCj4gIyBFbmQgb2YgQ0MgY2hlY2tzDQo+ICMgQWZ0ZXIgaGVyZSwgbm8g
bW9yZSAkY2Mgb3IgJGxkIHJ1bnMNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkDQo+IGluZGV4IGJmNjM3ODQuLjJiMmQ1YzIgMTAwNjQ0DQo+IC0tLSBhL21lc29u
LmJ1aWxkDQo+ICsrKyBiL21lc29uLmJ1aWxkDQo+IEBAIC0xODk4LDYgKzE4OTgsMzQgQEAgaWYg
Z2V0X29wdGlvbignY2ZpJykgYW5kIHNsaXJwX29wdCA9PSAnc3lzdGVtJw0KPiAgICAgICAgICAr
ICcgUGxlYXNlIGNvbmZpZ3VyZSB3aXRoIC0tZW5hYmxlLXNsaXJwPWdpdCcpDQo+IGVuZGlmDQo+
IA0KPiArdmZpb3VzZXIgPSBub3RfZm91bmQNCj4gK2lmIGhhdmVfc3lzdGVtIGFuZCBtdWx0aXBy
b2Nlc3NfYWxsb3dlZA0KPiArICBoYXZlX2ludGVybmFsID0gZnMuZXhpc3RzKG1lc29uLmN1cnJl
bnRfc291cmNlX2RpcigpIC8gJ3N1YnByb2plY3RzL2xpYnZmaW8tdXNlci9NYWtlZmlsZScpDQo+
ICsNCj4gKyAgaWYgbm90IGhhdmVfaW50ZXJuYWwNCj4gKyAgICBlcnJvcignbGlidmZpby11c2Vy
IHNvdXJjZSBub3QgZm91bmQgLSBwbGVhc2UgcHVsbCBnaXQgc3VibW9kdWxlJykNCj4gKyAgZW5k
aWYNCj4gKw0KPiArICBqc29uX2MgPSBkZXBlbmRlbmN5KCdqc29uLWMnLCByZXF1aXJlZDogZmFs
c2UpDQo+ICsgICAgaWYgbm90IGpzb25fYy5mb3VuZCgpDQo+ICsgICAgICBqc29uX2MgPSBkZXBl
bmRlbmN5KCdsaWJqc29uLWMnKQ0KPiArICBlbmRpZg0KDQpPbmUgb2YgdGhlIHRoaW5ncyB3ZeKA
mXJlIHdvbmRlcmluZyBpcyBhYm91dCB0aGlzIGpzb24tYyBwYWNrYWdlIHRoYXQgd2UgbmVlZCB0
byBidWlsZA0KbGlidmZpby11c2VyIGxpYnJhcnkuDQoNClRoZSBnaXRsYWIgcnVubmVycyB0eXBp
Y2FsbHkgZG9u4oCZdCBoYXZlIHRoaXMgcGFja2FnZSBpbnN0YWxsZWQsIGFzIHN1Y2ggdGhlIGdp
dGxhYiBidWlsZHMNCmZhaWwuIFdvbmRlcmluZyBpZiB0aGVyZSdzIGEgd2F5IHRvIGluc3RhbGwg
dGhpcyBwYWNrYWdlIGZvciBhbGwgUUVNVSBidWlsZHM/DQoNCldlIGNoZWNrZWQgb3V0IHRoZSB2
YXJpb3VzIGpvYnMgZGVmaW5lZCBpbiDigJwuZ2l0bGFiLWNpLmQvYnVpbGR0ZXN0LnltbOKAnSAt
IHRoZXJlIGlzIGENCuKAnGJlZm9yZV9zY3JpcHTigJ0ga2V5d29yZCB3aGljaCB3ZSBjb3VsZCB1
c2UgdG8gaW5zdGFsbCB0aGlzIHBhY2thZ2UuIFRoZSDigJxiZWZvcmVfc2NyaXB04oCdDQprZXl3
b3JkIGFwcGVhcnMgdG8gYmUgcnVuIGV2ZXJ5IHRpbWUgYmVmb3JlIGEgam9i4oCZcyBzY3JpcHQg
aXMgZXhlY3V0ZWQuIEJ1dCB0aGlzIG9wdGlvbg0KYXBwZWFycyB0byBiZSBwZXIgam9iL2J1aWxk
LiBXb25kZXJpbmcgaWYgdGhlcmUncyBhIGRpc3Ryby1pbmRlcGVuZGVudCBnbG9iYWwgd2F5IHRv
DQppbnN0YWxsIGEgcmVxdWlyZWQgcGFja2FnZSBmb3IgYWxsIGJ1aWxkcy4NCg0KVGhhbmsgeW91
IQ0KLS0NCkphZw0KDQo+ICsNCj4gKyAgY21ha2UgPSBpbXBvcnQoJ2NtYWtlJykNCj4gKw0KPiAr
ICB2ZmlvdXNlcl9zdWJwcm9qID0gY21ha2Uuc3VicHJvamVjdCgnbGlidmZpby11c2VyJykNCj4g
Kw0KPiArICB2ZmlvdXNlcl9zbCA9IHZmaW91c2VyX3N1YnByb2ouZGVwZW5kZW5jeSgndmZpby11
c2VyLXN0YXRpYycpDQo+ICsNCj4gKyAgIyBBbHRob3VnaCBjbWFrZSBsaW5rcyB0aGUganNvbi1j
IGxpYnJhcnkgd2l0aCB2ZmlvLXVzZXItc3RhdGljDQo+ICsgICMgdGFyZ2V0LCB0aGF0IGluZm8g
aXMgbm90IGF2YWlsYWJsZSB0byBtZXNvbiB2aWEgY21ha2Uuc3VicHJvamVjdC4NCj4gKyAgIyBB
cyBzdWNoLCB3ZSBoYXZlIHRvIHNlcGFyYXRlbHkgZGVjbGFyZSB0aGUganNvbi1jIGRlcGVuZGVu
Y3kgaGVyZS4NCj4gKyAgIyBUaGlzIGFwcGVhcnMgdG8gYmUgYSBjdXJyZW50IGxpbWl0YXRpb24g
b2YgdXNpbmcgY21ha2UgaW5zaWRlIG1lc29uLg0KPiArICAjIGxpYnZmaW8tdXNlciBpcyBwbGFu
bmluZyBhIHN3aXRjaCB0byBtZXNvbiBpbiB0aGUgZnV0dXJlLCB3aGljaA0KPiArICAjIHdvdWxk
IGFkZHJlc3MgdGhpcyBpdGVtIGF1dG9tYXRpY2FsbHkuDQo+ICsgIHZmaW91c2VyID0gZGVjbGFy
ZV9kZXBlbmRlbmN5KGRlcGVuZGVuY2llczogW3ZmaW91c2VyX3NsLCBqc29uX2NdKQ0KPiArZW5k
aWYNCj4gKw0KPiBmZHQgPSBub3RfZm91bmQNCj4gZmR0X29wdCA9IGdldF9vcHRpb24oJ2ZkdCcp
DQo+IGlmIGhhdmVfc3lzdGVtDQo+IGRpZmYgLS1naXQgYS8uZ2l0bW9kdWxlcyBiLy5naXRtb2R1
bGVzDQo+IGluZGV4IDA4YjFiNDguLmNmZWVhN2MgMTAwNjQ0DQo+IC0tLSBhLy5naXRtb2R1bGVz
DQo+ICsrKyBiLy5naXRtb2R1bGVzDQo+IEBAIC02NCwzICs2NCw2IEBADQo+IFtzdWJtb2R1bGUg
InJvbXMvdmJvb3Ryb20iXQ0KPiAJcGF0aCA9IHJvbXMvdmJvb3Ryb20NCj4gCXVybCA9IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvdmJvb3Ryb20uZ2l0DQo+ICtbc3VibW9kdWxlICJz
dWJwcm9qZWN0cy9saWJ2ZmlvLXVzZXIiXQ0KPiArCXBhdGggPSBzdWJwcm9qZWN0cy9saWJ2Zmlv
LXVzZXINCj4gKwl1cmwgPSBodHRwczovL2dpdGh1Yi5jb20vbnV0YW5peC9saWJ2ZmlvLXVzZXIu
Z2l0DQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDQw
MzlkM2MuLjBjNWExOGUgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5U
QUlORVJTDQo+IEBAIC0zMzYxLDYgKzMzNjEsMTMgQEAgRjogc2VtaWhvc3RpbmcvDQo+IEY6IGlu
Y2x1ZGUvc2VtaWhvc3RpbmcvDQo+IEY6IHRlc3RzL3RjZy9tdWx0aWFyY2gvYXJtLWNvbXBhdC1z
ZW1pLw0KPiANCj4gK2xpYnZmaW8tdXNlciBMaWJyYXJ5DQo+ICtNOiBUaGFub3MgTWFrYXRvcyA8
dGhhbm9zLm1ha2F0b3NAbnV0YW5peC5jb20+DQo+ICtNOiBKb2huIExldm9uIDxqb2huLmxldm9u
QG51dGFuaXguY29tPg0KPiArVDogaHR0cHM6Ly9naXRodWIuY29tL251dGFuaXgvbGlidmZpby11
c2VyLmdpdA0KPiArUzogTWFpbnRhaW5lZA0KPiArRjogc3VicHJvamVjdHMvbGlidmZpby11c2Vy
LyoNCj4gKw0KPiBNdWx0aS1wcm9jZXNzIFFFTVUNCj4gTTogRWxlbmEgVWZpbXRzZXZhIDxlbGVu
YS51ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4gTTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1h
bkBvcmFjbGUuY29tPg0KPiBkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL21lc29uLmJ1aWxkIGIvaHcv
cmVtb3RlL21lc29uLmJ1aWxkDQo+IGluZGV4IGU2YTU1NzQuLmZiMzVmYjggMTAwNjQ0DQo+IC0t
LSBhL2h3L3JlbW90ZS9tZXNvbi5idWlsZA0KPiArKysgYi9ody9yZW1vdGUvbWVzb24uYnVpbGQN
Cj4gQEAgLTcsNiArNyw4IEBAIHJlbW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NF
U1MnLCBpZl90cnVlOiBmaWxlcygncmVtb3RlLW9iai5jJykpDQo+IHJlbW90ZV9zcy5hZGQod2hl
bjogJ0NPTkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiBmaWxlcygncHJveHkuYycpKQ0KPiBy
ZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMo
J2lvaHViLmMnKSkNCj4gDQo+ICtyZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9D
RVNTJywgaWZfdHJ1ZTogdmZpb3VzZXIpDQo+ICsNCj4gc3BlY2lmaWNfc3MuYWRkKHdoZW46ICdD
T05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21lbW9yeS5jJykpDQo+IHNwZWNp
ZmljX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVzKCdw
cm94eS1tZW1vcnktbGlzdGVuZXIuYycpKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3N1YnByb2plY3Rz
L2xpYnZmaW8tdXNlciBiL3N1YnByb2plY3RzL2xpYnZmaW8tdXNlcg0KPiBuZXcgZmlsZSBtb2Rl
IDE2MDAwMA0KPiBpbmRleCAwMDAwMDAwLi42NDdjOTM0DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvc3VicHJvamVjdHMvbGlidmZpby11c2VyDQo+IEBAIC0wLDAgKzEgQEANCj4gK1N1YnByb2pl
Y3QgY29tbWl0IDY0N2M5MzQxZDJlMDYyNjZhNzEwZGRkMDc1ZjY5Yzk1ZGQzYjg0NDYNCj4gLS0g
DQo+IDEuOC4zLjENCj4gDQoNCg==

