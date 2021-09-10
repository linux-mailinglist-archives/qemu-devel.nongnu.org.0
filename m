Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB2406D47
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:04:33 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOh8q-00075o-3u
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOh7A-0005um-8H
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:02:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOh77-00045R-C3
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:02:47 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A9UPqC005261; 
 Fri, 10 Sep 2021 14:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5hBSrVi+lwmjlpcqv5n0qUDKa9T/4L5J/qXI4x/Au2c=;
 b=xaBCbbatA0EIljF+2NZ7FlAGRrUSxhFnLjrkEPMK97grrymwfyWA8vqEo6YtRwulQ/IH
 bogz5eQ1PPyxTlBF/dFKIajhvhj/xyM6edx37TWqAnUi3qBir4b8zUFmM9vc/xWqkJS0
 tZm6K4YxtDDTPHBqhgV6zH4cVLEDyT58baM+8T17V5TfgEweoEM0F8hh10tqy29xnzHu
 cfGciw+0Cg0uOwJibolCOtbXhMfre296dW9vyE87iGEilGlVgO2OpsOl6YegHZW/S25a
 uA+nAIFN/uX8cHSzoRLIpw6U9saVhdBFu4AFOrZZDypPGzjyUmKQq5Or4ADQ5l3KvNja pA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=5hBSrVi+lwmjlpcqv5n0qUDKa9T/4L5J/qXI4x/Au2c=;
 b=iSvIqdvEmR3lUeWFwV4oYbKlaSkK5brDONJDPGG+5k8j/VkqlSM5oG6sFgl4pao0LudX
 YuSxeQkUrOYl6ByNfsVQ74Ii18vtk3D59TrMIB7YDWoyqjAGp+ybQt4Ymg0SxRn5EFwT
 7IdtdzK+G/f0z40LpJ3RlMZYrk3KK7gYtlrcVI575tyNyNYZxWpj7b65ef8nzvR60Q0s
 IKxTffop2SahjJHh/WhqoaZRn0WHsM4g9du/7bHD2yo9Ctfg9wqUPvcWGPnCgOv0IEvI
 iLvY0zg1oXvA3zbZV5A8cCFQeNbyc4e9GN8Sf9YbltA/tLuaMaRzvtyvMBj5jadjfuFQ Ng== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytj5hx2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:02:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18ADkIgR042873;
 Fri, 10 Sep 2021 14:02:38 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by aserp3030.oracle.com with ESMTP id 3aytgemk6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAvLH7DIZ+/1OIlXQV3h12A3iSsIMJe5MWubM219xPb6J33BVsHP88jvoe4n1W0IpUILjBloUww2xcd0VWqnqYP/lr8vmtx6Etp67jWJx8GY1gCz849eWd8bEM07hkhTjI/bknHB+g42mQySd8/r+u7oYoGYTkwCEavABeKrEOBQMCcbMDhZdAgh6yrGeAFG9+yQZq1JestnQMwMJb9SJwPLNttBa0m/uSMBzQqXn4a1f6K2zwnDuOFYkHIjZUlljtlnVVnyj6pHWDUvaxisA1nTHo/EBFsUUuaY310DZti8Znnf8SqIeX0RHBtDDQ2gjOYD5ca80ozdK6XDDs6uFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5hBSrVi+lwmjlpcqv5n0qUDKa9T/4L5J/qXI4x/Au2c=;
 b=Dk8qK/o7Q1bCGB2SNu01Cy4If4HdyL6XoSYl0VncdlV5L5/gUlyLz3xjrI88rxsv8zUf6phjvPzSKOM2FUlSBeyuokn9+xDcWRY+qOdc27F4AqpaZB2ktNQRBvzlCLmgONquq0iWSZCcDkZ/QrPDhefCqm1xyrKHBIe32jo8EGToIOPaxXGZT4jGdKNNRyb135Mz7ineYHd8gAbsSirwMVID9cw+qdF60K8L3nk9PagCkMxwCT8frcY0RLsCkHjs5D26iBLfukrLh5zoSy5KmFX3ql0x0savnp9X1NGt8Ewq29FA3/HxoVHfeUFNJW37WvhwPclro+RpFv9uWZkhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hBSrVi+lwmjlpcqv5n0qUDKa9T/4L5J/qXI4x/Au2c=;
 b=sZLAeyvyUFin6mUDaLgsmE5ZEcz7izgXK+wEL23fi/vwM6YGs+M1PtEU8pZef/mTp01Z2W85s00vXCSNAM4/Qbk595/yBL1bKR86+RDkWg0+/Xe1taH35H8FU/oEFVDVh3Vw3XM7C0CUZjnWGQDMn5kIj+Z4bWMtUQL6BRJQMxI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4015.namprd10.prod.outlook.com (2603:10b6:208:1ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 14:02:36 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 14:02:36 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Thread-Topic: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Thread-Index: AQHXm2axIjCdfadpxkGIfiW62B8HDaubb4qAgAHyq4A=
Date: Fri, 10 Sep 2021 14:02:35 +0000
Message-ID: <CB794281-0DED-43D1-A888-6F409AA03703@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <YTnDKxNREaBgpXKI@stefanha-x1.localdomain>
In-Reply-To: <YTnDKxNREaBgpXKI@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60d8aeef-b218-4c39-bacf-08d97463a498
x-ms-traffictypediagnostic: MN2PR10MB4015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB4015E7EB8781906AF5C14FFE90D69@MN2PR10MB4015.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZzMw1ub1Mggczk5RHaawb6kN1t6IRJKLrPKl7i/HBt+DnmpIWOXcZEycYddobw5OU3gatcO9UQlOD3QRKTNcZy8JK1oQnwAnjuUtCMxxI9EjAo6vj8pGm3/EOG/2FOaKiOfxiJ+KT0hbQoA2lY01R7uvrxqnf6dXTm7nCf+0FlrmphRmuM358D2kTt1nL3g88GKePzpj6hYm7nRlqOHCCsEezaNJ/gXUHhSeJgacbKBFQn7sCyxcj/HTm4Li8fihTyK5qxtqXUqjLV/4DoPw6+iyrVB3r/HSEaDTR8+Z9CUbj8dn0z9B0DIu+vSdDM84HpEuUVgNIVHkAemRO/+ZBjMr82NxywKON5EzbD/pgc3lAh6xC/qtC8H6kVD7wt9x8gxgRI7Daon3BKzHy1zzcXOPQHYchXdjv2Y6+sBBNNKAdLhAl5PpOk9OnOQEJPedpod4gIBsWhOMyHkpGech2et+2qR+gvb/v4WnBd8qFJqw/7FuL8hfbz+hYOf0y/2/r5JchavrsReBAGFSw1WJu3c8SG8B8UeoNseDZlgybZ2xH/oZ4+HrrWUqF9k3fwXL49FKiwq0NJ1FmXIgd/GTYcdKChgA78onWH2DuZ6nT19g6bMtPhjEfzF2W2r3MI/CU/3yCdKHyK+fuCV1bjPWCTo7P0B+NTfZObpYJzYamcwO2tN+QvKEuWcts01f6qZ+2ooRwzjk4HdwaVnckDTP2GckzeMAemPJewu3kLq5SmcFun8aHdloMPLXNMt4eWH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(346002)(396003)(53546011)(6506007)(7416002)(478600001)(4326008)(2906002)(33656002)(71200400001)(122000001)(38100700002)(86362001)(44832011)(6512007)(38070700005)(8936002)(91956017)(8676002)(66446008)(36756003)(64756008)(558084003)(54906003)(66556008)(66476007)(6486002)(76116006)(66946007)(316002)(5660300002)(186003)(6916009)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEtsU0NxZmFCNkErdXFaVGoyQnJ0bG0vL2dpV20ybVJmYnh2ZU82Zko1SW5s?=
 =?utf-8?B?eXl4Qnk0THJlbWlSQ080dFVyU1lzelhyMTg4ZmluU0dSbjhkd2d0R1lnQytY?=
 =?utf-8?B?YjNwd0t4b1pGS05DL1NlbUlGQlhmVkNrelNTWGZCNzFiRU50eGFSZ1h4aUlR?=
 =?utf-8?B?QllOM3FEVnVoNTV6MmhsSFQ1OWJHcU10VndPN0ZUS0k5QnV4cEVvVmtYVUJJ?=
 =?utf-8?B?bkFGYnBzNGJodUQyYmFlRGtUM2JnelJsUDhvUnliZ0M0a09VQmNibDhLK2h5?=
 =?utf-8?B?bXJydlBEaDRIeHJUam52RDdvbngyYnpEdHZhT2Flak5rQmxiaWhjeVJhaVd1?=
 =?utf-8?B?UHkwQnZDMTVETm5TMyt5clRidTZzT05MN2daRTRRanVCb2o0YWpHK3d3WGFO?=
 =?utf-8?B?Uko4OUxZcGhQTm40TUFNUFN2OVRHQ3IwT2VUT2krRG9uekQ1TmYzcVJIOHg2?=
 =?utf-8?B?M3pmY2lZaTdud1FwRiszTkdLczBrM2ZpZFZvQ21EUHZRZjFYdy9xaUFxa013?=
 =?utf-8?B?SmxtYndMUzFQRTh3TUdOZGFLZTdKMHg4bVhmM2EzNDE1ekVrRTBFYmVFc04y?=
 =?utf-8?B?T2crMkhQOHRTV2R3UXdXYVJ6UENDTkx2QWR2a25CWXJQTjlObk5VMEpuK3hw?=
 =?utf-8?B?L1RwWG9ySkR6V1Z0QmVaZnUzU2xUWnM1QjZoaGFrQ1hTcGh0R1hyZS9HZXdM?=
 =?utf-8?B?eWdlaWNoajFWWXArV0gvRG4zSTEwR0hMUXBUOHR0bGJnbm1wMnp0NXBiaTg1?=
 =?utf-8?B?blBnUmk4cDFLeXgwSTBhdjFhdlJreUhCeFZONUQzWitMejJubXkxbEpwdEtD?=
 =?utf-8?B?RmpFYk9QelI4dEhDYmRNQWQxR0ZUQjFRNTM0MlJ4SWZIV2FJc3NzdFNHWEla?=
 =?utf-8?B?TTErZ0s4bTRLQzhjdTZ6cUNrR0JEU0ZZUlNvTzk3R3FnSWVIMk5KUjRyT0ZC?=
 =?utf-8?B?US93NjVibXU2dkduL0dyZlh4N2tweTh2Q1Jrc2tMbnByWGlvWFI2bm1ydjRR?=
 =?utf-8?B?R1pkNlF5NDlyVVVQRkU1alJFclFhNDIxV3VBM2FEaFhveGpwTzdHeWNvWTNY?=
 =?utf-8?B?OTI5RytyUGkwbk1jTURFN1NDbkhvTnBQU2w4TDE2RTFQbUVUTC84MEdpTjgw?=
 =?utf-8?B?STAxUU8waEF2R0J3WFNITjRTV1BueVRrMzZZSXFiOW1sZHBGano1Tnc3RThK?=
 =?utf-8?B?QmF1Ylo0UHhMMjBEM25oeldYdStGMjZPTWtvRWhRck53QlgyMDRSb25UTDFw?=
 =?utf-8?B?OWlsVFIzNmdXN2xKRTNGVE1IVU9oeDYyTUV3R2ZGMk1nUm5OMWFVVUVWekVm?=
 =?utf-8?B?QzB4RE94ZEI3TVlmMHUzNXNVb0tDZnlFRlB6eEdHQ0t2cyt3TXdHcUpBaklX?=
 =?utf-8?B?cVorZlNldk1ObnFOZWNMdVdRdEl5VFhzVzhsSGV3L0Z2UHdiNGVmU1cxcFlQ?=
 =?utf-8?B?ZmNZYVUycitxUFJ5ZHp0L2cvL1B3Z1pTV0hnb0NtQ2IyeE9ER1BWUVlzS0VV?=
 =?utf-8?B?R055UTVhWTBMZU9tbFVKSHRlMFRLbktMWmRIR21pdW4raU52YU04SlBnZjd3?=
 =?utf-8?B?MUdJZkM3aDgxVFBwM3ErY2dwbU9KcVppclVRVkN3T3RCVjcwTTJBQUV4b3Fj?=
 =?utf-8?B?eTZySFlSQWRkOFR0NDNWTDlIYlVlTjlNVlZCeVRQNnNJMDdPai9QWXk4NVl6?=
 =?utf-8?B?cEQyb0JQaFZSVXZZSVFubW5aK0pFK1FCMTVIV09RUmFaU2ZwamRpakp6RFNt?=
 =?utf-8?B?dzNpd0pRMzc5eE5xdFBtWnNvTkRqbkxIak1yZmhnWlNxYWFvMWp2YVFxM2kr?=
 =?utf-8?Q?v6gAT+65I3q3Qk27ZChjZtUv2iVuBUhbKCQS8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A3230BD16EDEF4EB855358618C57468@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d8aeef-b218-4c39-bacf-08d97463a498
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 14:02:35.9953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmCphM8A8eknilW8kxjoEUnHADTDJs+J1EY4CokzEfQNIku2CIMdTpT/KWAgMaTu4jiXJtf0SuTaqxQ5qFv2kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4015
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=903 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100080
X-Proofpoint-GUID: 6P6hrc-uKaALPDyjyI_u8KcvM6vyznEP
X-Proofpoint-ORIG-GUID: 6P6hrc-uKaALPDyjyI_u8KcvM6vyznEP
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
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDksIDIwMjEsIGF0IDQ6MTcgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKYWcsDQo+IEkgaGF2ZSBmaW5pc2hlZCBy
ZXZpZXdpbmcgdGhlc2UgcGF0Y2hlcyBhbmQgbGVmdCBjb21tZW50cy4gSSBkaWRuJ3QgdGFrZQ0K
PiBhIGxvb2sgYXQgdGhlIGxpYnZmaW8tdXNlcidzIGltcGxlbWVudGF0aW9uLg0KDQpUaGFuayB5
b3UgZm9yIHlvdSBjb21tZW50cywgU3RlZmFuIC0gd2XigJlsbCBnZXQgY3JhY2tpbmcgb24gdGhl
bS4gOikNCg0KLS0NCkphZw0KDQo+IA0KPiBTdGVmYW4NCg0K

