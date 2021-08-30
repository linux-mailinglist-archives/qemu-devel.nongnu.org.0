Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D413FAFEE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 05:04:52 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKXbP-0002tz-1U
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 23:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXXY-0006zm-C4
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:00:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXXU-00057t-Cs
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:00:51 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17TEOVTM026248; 
 Mon, 30 Aug 2021 03:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=C7FOTtuM7cZufxvflAJ8z2qOIoqyJNPnpHVzT2a8NhQ=;
 b=aUTXe8W+GwcVQmYUIie3iPGyOt17bsmXVJd6WCoSNB+0IZqJ1oJh24CzsMzFawLQHxB3
 W+Ip+v4ba44JIHcYDTuEpMJaBPSC850EAQ37WNelfw/vLWPojzU76t/KjBUxtMvtywgf
 d39gSbjR9kzerBBf9VJ9uCSWsxieHBq7cbQkpTxWDsTVqGVDUtPJl0nR/no9cQJjpEnk
 xQ9FT2tM/LNxhNd/pdihpSetF5Sz62Tc+XbcQAKYmxE8iS74ktiQuLbiDsuiFg4ZuxYe
 r8CZA79FbQNVHB6fhLe151G2+zXObkRWmQbBkjGLjKOjnOjhRbROOgbS+1gggRxqjvt6 3g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=C7FOTtuM7cZufxvflAJ8z2qOIoqyJNPnpHVzT2a8NhQ=;
 b=xFrStft5EHAId87Lm0gmQSUFHDzNrFNE2fv/vV2WRbzPCw3/tC6F1XYa7p+pGE6N2fgz
 m3xYTcFlgdUYUZOV7HYgVdNtfGS2tVoLHHe9xY+l2uZIG5lO3LO5gogABbF7iov/TaVa
 p6GuIOHBUo8wGWXs9wwZhGBNm1y6pWl37MLKS9CelQN9SAo++dZ4WziIpfgRHqNNbspE
 8OE8w7ot6bJBWv9vX1admA/AzadVwmAnyvkDGiMciHG0vVtcJj568aAbRNYa+dqMnNcR
 kzL099oAWzZaIiCxmIGzD/Tw93FqJYX04y98sahnhp5L14BT87OTkLpWkT62afJgA6Iw KQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arbymge1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:00:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17U2neIc003283;
 Mon, 30 Aug 2021 03:00:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3030.oracle.com with ESMTP id 3aqb6b6gxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVaXM1WSAGNiN01KI3FLhrucIq+9iAOfPBVoYrn89n2LSg3TV+O6APvtxkI+2/iwdOyxcKlBqRmat6tzC7KkrXXjz4+j4E4wB6tPE4CBy5oRpDoMgk4p5V+ilvV6cf++vfpUphdY0yLjN0wrHyhkTKeiGGZcjDTYSEqDjf5HOoSg0LJPP5/VWooM8hSB/6D9ufbQZ7p+DjivNsTy/mgddXjqjp2gxyJsWagfoWeas9W7jwlmLe7G5HyWZULtXrVJXtJx01co8wm1XWzoVC3mhrzxpeOvpY9aS6LeT/mdYV/XATUIto0kpeoiEEZY6bvxtfx7BI8rkNLJAlaPqCsPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7FOTtuM7cZufxvflAJ8z2qOIoqyJNPnpHVzT2a8NhQ=;
 b=RavxNC1GzgsBDcjiE0DsjTb8QcXBjz9vfJgdmE4tLUwxZvLaW3H/u3OVzqgvkLHEeN91Y2866Vx9J3OF38H+PfUL/ItRx9g+DXwGzInBBEBmCUSRauJKE8lO4RSbgyN7pMbiW0t4idGy4LRA+c/i2dc8WLFRLvPvEr7VquXOnVkCPAHtHjN1tnmIWtYYDQEVaVLLdxtRjG/DW9+oE0WF8HBqjGhfT17QGSLAmiCxS4u5OBAe7lFLUsE5xnK2loxBCYlxy2KqNxYKxtxuSJyL3+Rm8wHhOqLm5cH0AZclYWr41FgMCj4RuIW0Qtv4WpZtSNBV/mc4Hj+BBVQcBoGmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7FOTtuM7cZufxvflAJ8z2qOIoqyJNPnpHVzT2a8NhQ=;
 b=goSVJ+UtkC93+hnDpW6RmoK8DhmmuXLdJ4F6/JxVRZ7TY1zBS8MGN4e9XVepdKi2rA70k7BmJo/mrjG7p3dcAR9wIOljpRPuF6+oZGV4bsciS8XNMz4mxFtOCgB3FAG+/gODCcFyDK5mg9BmWc/FXlgcWwYAy2FTWSGpukwwYbs=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1454.namprd10.prod.outlook.com
 (2603:10b6:300:23::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 03:00:37 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4457.017; Mon, 30 Aug 2021
 03:00:37 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Topic: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Index: AQHXkr3ElMGqWLWPTUyD8mY3/VudXauCv3UAgAixeAA=
Date: Mon, 30 Aug 2021 03:00:37 +0000
Message-ID: <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
In-Reply-To: <YST++FLqV02TlusW@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65203009-c346-419b-3999-08d96b6257bc
x-ms-traffictypediagnostic: MWHPR10MB1454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB14544909BC9D2D380B7BEF4BB6CB9@MWHPR10MB1454.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8c5KA8iJXIu0wJgRbD2kmg8vEwXT3w3PAzBI8BwWKL8ooChFPI7/mxTGCwA6MtFNYu0zRv3e+taphOP3WTXRjZuNT6i7BcOdBOm4Lnl6r6RGFGeyfQAtj6SLWUc++f7nzy6ZJdRz5bMzGZIi3tqZ0Hmen/k+G/Ia9g0vakRnDZvG5GXsevSQtvVVO5bGjj28YjfZaPumRXN6FWap+NxyI3DMgX6DRsmoiPhCEa44vo64VfQlFrr7SGfSKSFasqeTbGZPpjJ0c5drqiMlmeToSj14VHpcS67exVR1pFeAGz0HUEaRXsMFVr0hiot7O/lIZOxCULrh+xwLQ8HLzD9gpRgPMsS2xS6nlcaVK/QMN8Zdu6FLfF8qz5GDNLyqEw+5AGxi8tcoog8MVQ4J3xHKqFP8AcTOvAOuobYypWl7R8VYOcN+RHBBBX5YuC+0W1kGs2V7lWAGSXEzUjA2I5uhVIMgrcD4NxVZ3OaNDlEGcwZV1Cprgr1MdmVKBaXbO9dGclMc0tz/8bQqirjY5NJdenpKo8Ch0ZwdEHfcex7svK60N1R1upFbRqFcu+mrZCphFfoqEckiIX41oJ9rHnVGYP3yVsHHG4OTga7AJVFen2+rt3fG58tKD2hth1htCDpWs5zxQWh/gMB+UXK1B9WARurFxlMCdJxr7MAzrYqdCiIwm83FMCstwMH+NXyVj33CzV+5e6O7jRmWpcfkLf/MuwNIyQaWoHy8lCjqfkyLab0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(38100700002)(6486002)(316002)(6512007)(4326008)(2906002)(38070700005)(36756003)(122000001)(54906003)(26005)(64756008)(66476007)(66946007)(66556008)(53546011)(91956017)(76116006)(66446008)(6506007)(83380400001)(186003)(33656002)(86362001)(6916009)(8936002)(2616005)(8676002)(508600001)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUVWNDdVU2Qvci9vWkgrRWEvREJUZTI0S0ZvWmlZWDBIUU12Q2NFanY1QVVN?=
 =?utf-8?B?aFRtbVVrT1BaYWw2ZjRvbVAzdCtMRlUxRG1aVFUyMGhRNW5pSkxOMTdUVG5k?=
 =?utf-8?B?SzhwWk1BaXVkTlJFVFB3V2pCT1pDWXh4dVE1VXlaM0RTbnRIZmZsRU5HQlho?=
 =?utf-8?B?WlBxREl3VkVWRFVQeFlOUXRhTEcvS05DUmZTV012eFB6U3pwWThZOHpUcDF2?=
 =?utf-8?B?M0JyTFJxV1llcWtrcjNzUm8zdWg5cTdjM1g0R3FEalJ3ZG5rbEJTUzNrWFlY?=
 =?utf-8?B?TXB3M1VGUlJnR3FBN0dNNWRKMlErTDdrdjlPenBSeHBxOVlrc05qOWx6bG5Q?=
 =?utf-8?B?WEozYUJoZmlZUUlqajVXMmdDNUpySER2dDRKeEpVelZWMWpKdmlGQXphWk53?=
 =?utf-8?B?MlM4NWR0SWp1NUtTYmhpZGdFOHNCenFPSjJzUnJzSnBKUDlHcEd0eFZxaVNt?=
 =?utf-8?B?bjYzcTNYT2VsUkhxY0R5dlRDTHlyS0gzUHlJNTEweFdJVmQ1OWdobEpoZEt3?=
 =?utf-8?B?cmIyQ3ptRlBDTnhoMVhxVG5qZUNybmJ1Mmg2aUhXTUpRRXhmTUttaEwxOXIx?=
 =?utf-8?B?K244TVF2OWFMb0pNbFVGaGQ1Z204OFQreUFtUyt0eEZLekZtMUZTTzJLRzl1?=
 =?utf-8?B?clJlcVFXcHNDL2FlRTNHLzZuRkVmV1RaTWRjaWJGQUhyaUM0Z2IwcGZDL2F1?=
 =?utf-8?B?ZVc4VGR6MG9rN1M5SEFvQzVzOGsxaElBSUtxRkxBV0hWRU43OTNrV3RleXZG?=
 =?utf-8?B?YUJSTE1DMi8zTno1YmlBdHFPYUF0YzVkMEozQVQ3eEVJSmRtRFZzU2R4YTB4?=
 =?utf-8?B?ZnNWd1ZWTFJCOXpPb0thYlBXQVFvN0NiRFJHWXVVVUplRXEvWkdJM0hid3Rq?=
 =?utf-8?B?K3oydmhOdlZob204Rml2WW1TZ3EvRDR6UFpuZTNoT0RSLzVLSXhWcHpaMDc0?=
 =?utf-8?B?dzBIelpqQk9XeHNOS0xURG9KRE8vb1c0dDBBMDdWWHdCOGZNcy9KVmg3b3Bv?=
 =?utf-8?B?YUJtaVAwMUtMV1YwSkxnQWloL3RQZXdSS1Mwd3FDd2tTQUlpZzVvWnVGSldk?=
 =?utf-8?B?MnVad25TbGJ2Zkh5bk5KeDNMVjhpWUJVMXZnRXRqWG16Ty9YdEQwTE1wOFRP?=
 =?utf-8?B?K2Q5b3RMV2VBNGh0RTM3OHdUQ3d6VXFZTXBZT3d3RTl6U29mZm11NjlsTVgr?=
 =?utf-8?B?SVd4dnFLaUR6VWZSdzFWZGhYM0l3cFZtVTNtcUxFRW8yV2FBVmdoUTc4NkVF?=
 =?utf-8?B?QmpCTDlwWndhN1RYKzl5b09DOVBvOFVmaWVIb2VqYTlPU2lVWjNjL2cxRFFT?=
 =?utf-8?B?ZXZhWVEzSThWWFdpcFBHcWtJUlRZS3Qxd094WXQvdWtwcGVIRGJhQVJuOHhJ?=
 =?utf-8?B?VlU0bzdsSmJvREVZYVRmazB5Ym55OGswc25DYVkvZTNZUys0VGFxYVZHTHN2?=
 =?utf-8?B?a3Z5ejZKK2NrbHpackFIVnV5Vld0ZE5VQ3VFWWQ2QXF3M0xPd0ZuRkRyOWYv?=
 =?utf-8?B?ZE9CVDdFUXlJaTRCdHFpdWtFQnBWT2JlUWlrUlE1Z1RwMHdubUl3STVlWHB2?=
 =?utf-8?B?dUIrS1Zna3lIOXZJaWhhU0d2c0ozWEpRUGVQa3J5NDFlanp4N3kxOUZNQTQv?=
 =?utf-8?B?dEErVGl1MFlrYkdmc0lFL3MxTUVkdU1pbERoSUtrYzY0djU4dXVFSnZZellU?=
 =?utf-8?B?K29wRHJwMklWdndBMHJobEozMzZzQURWWW9IbWRiWDY5RVcyNzFHUlZCdVhh?=
 =?utf-8?Q?hJCqpPb7TLwgQ2S+tvl0gywJk+YUL3hjntSeyUv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74BD7873E293FF419E316B6379C5D08C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65203009-c346-419b-3999-08d96b6257bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 03:00:37.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZtWHpkaoYYYgt+dxhtUR12boUDfQcdgBrg2fP0r7yPe1vXIFU8JZLZrDLfllXs3gCKxp690XF4UOjwFcvS2+gUn5gHbQ5EA+mjab2aKlQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1454
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300016
X-Proofpoint-ORIG-GUID: tmYBqzYWzlHnX8OIdU16IsgjjUIo_zH6
X-Proofpoint-GUID: tmYBqzYWzlHnX8OIdU16IsgjjUIo_zH6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDI0LCAyMDIxLCBhdCA3OjE1IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBdWcgMTYsIDIwMjEgYXQgMDk6
NDI6MzdBTSAtMDcwMCwgRWxlbmEgVWZpbXRzZXZhIHdyb3RlOg0KPj4gQEAgLTMzNjEsMTMgKzMz
NjIsMzUgQEAgc3RhdGljIHZvaWQgdmZpb191c2VyX3BjaV9yZWFsaXplKFBDSURldmljZSAqcGRl
diwgRXJyb3IgKiplcnJwKQ0KPj4gICAgIFZGSU9Vc2VyUENJRGV2aWNlICp1ZGV2ID0gVkZJT19V
U0VSX1BDSShwZGV2KTsNCj4+ICAgICBWRklPUENJRGV2aWNlICp2ZGV2ID0gVkZJT19QQ0lfQkFT
RShwZGV2KTsNCj4+ICAgICBWRklPRGV2aWNlICp2YmFzZWRldiA9ICZ2ZGV2LT52YmFzZWRldjsN
Cj4+ICsgICAgU29ja2V0QWRkcmVzcyBhZGRyOw0KPj4gKyAgICBWRklPUHJveHkgKnByb3h5Ow0K
Pj4gKyAgICBFcnJvciAqZXJyID0gTlVMTDsNCj4+IA0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBU
T0RPOiBtYWtlIG9wdGlvbiBwYXJzZXIgdW5kZXJzdGFuZCBTb2NrZXRBZGRyZXNzDQo+PiArICAg
ICAqIGFuZCB1c2UgdGhhdCBpbnN0ZWFkIG9mIGhhdmluZyBzY2FsZXIgb3B0aW9ucw0KPiANCj4g
cy9zY2FsZXIvc2NhbGFyLw0KPiANCg0KCU9LDQoNCg0KPj4gK1ZGSU9Qcm94eSAqdmZpb191c2Vy
X2Nvbm5lY3RfZGV2KFNvY2tldEFkZHJlc3MgKmFkZHIsIEVycm9yICoqZXJycCkNCj4+ICt7DQo+
PiArICAgIFZGSU9Qcm94eSAqcHJveHk7DQo+PiArICAgIFFJT0NoYW5uZWxTb2NrZXQgKnNpb2M7
DQo+PiArICAgIFFJT0NoYW5uZWwgKmlvYzsNCj4+ICsgICAgY2hhciAqc29ja25hbWU7DQo+PiAr
DQo+PiArICAgIGlmIChhZGRyLT50eXBlICE9IFNPQ0tFVF9BRERSRVNTX1RZUEVfVU5JWCkgew0K
Pj4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAidmZpb191c2VyX2Nvbm5lY3QgLSBiYWQgYWRk
cmVzcyBmYW1pbHkiKTsNCj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4gKyAgICB9DQo+PiAr
ICAgIHNvY2tuYW1lID0gYWRkci0+dS5xX3VuaXgucGF0aDsNCj4+ICsNCj4+ICsgICAgc2lvYyA9
IHFpb19jaGFubmVsX3NvY2tldF9uZXcoKTsNCj4+ICsgICAgaW9jID0gUUlPX0NIQU5ORUwoc2lv
Yyk7DQo+PiArICAgIGlmIChxaW9fY2hhbm5lbF9zb2NrZXRfY29ubmVjdF9zeW5jKHNpb2MsIGFk
ZHIsIGVycnApKSB7DQo+PiArICAgICAgICBvYmplY3RfdW5yZWYoT0JKRUNUKGlvYykpOw0KPj4g
KyAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiArICAgIH0NCj4+ICsgICAgcWlvX2NoYW5uZWxfc2V0
X2Jsb2NraW5nKGlvYywgdHJ1ZSwgTlVMTCk7DQo+PiArDQo+PiArICAgIHByb3h5ID0gZ19tYWxs
b2MwKHNpemVvZihWRklPUHJveHkpKTsNCj4+ICsgICAgcHJveHktPnNvY2tuYW1lID0gc29ja25h
bWU7DQo+IA0KPiBzb2NrbmFtZSBpcyBhZGRyLT51LnFfdW5peC5wYXRoLCBzbyB0aGVyZSdzIGFu
IGFzc3VtcHRpb24gdGhhdCB0aGUNCj4gbGlmZXRpbWUgb2YgdGhlIGFkZHIgYXJndW1lbnQgaXMg
YXQgbGVhc3QgYXMgbG9uZyBhcyB0aGUgcHJveHkgb2JqZWN0J3MNCj4gbGlmZXRpbWUuIFRoaXMg
ZG9lc24ndCBzZWVtIHRvIGJlIHRoZSBjYXNlIGluIHZmaW9fdXNlcl9wY2lfcmVhbGl6ZSgpDQo+
IHNpbmNlIHRoZSBTb2NrZXRBZGRyZXNzIHZhcmlhYmxlIGlzIGRlY2xhcmVkIG9uIHRoZSBzdGFj
ay4NCj4gDQo+IEkgc3VnZ2VzdCBtYWtpbmcgU29ja2V0QWRkcmVzcyAqYWRkciBjb25zdCBzbyBp
dCdzIG9idmlvdXMgdGhhdCB0aGlzDQo+IGZ1bmN0aW9uIGp1c3QgcmVhZHMgaXQgKGRvZXNuJ3Qg
dGFrZSBvd25lcnNoaXAgb2YgdGhlIHBvaW50ZXIpIGFuZA0KPiBjb3B5aW5nIHRoZSBVTklYIGRv
bWFpbiBzb2NrZXQgcGF0aCB3aXRoIGdfc3RyZHVwKCkgdG8gYXZvaWQgdGhlDQo+IGRhbmdsaW5n
IHBvaW50ZXIuDQo+IA0KDQoJT0sNCg0KDQo+PiArICAgIHByb3h5LT5pb2MgPSBpb2M7DQo+PiAr
ICAgIHByb3h5LT5mbGFncyA9IFZGSU9fUFJPWFlfQ0xJRU5UOw0KPj4gKyAgICBwcm94eS0+c3Rh
dGUgPSBWRklPX1BST1hZX0NPTk5FQ1RFRDsNCj4+ICsgICAgcWVtdV9jb25kX2luaXQoJnByb3h5
LT5jbG9zZV9jdik7DQo+PiArDQo+PiArICAgIGlmICh2ZmlvX3VzZXJfaW90aHJlYWQgPT0gTlVM
TCkgew0KPj4gKyAgICAgICAgdmZpb191c2VyX2lvdGhyZWFkID0gaW90aHJlYWRfY3JlYXRlKCJW
RklPIHVzZXIiLCBlcnJwKTsNCj4+ICsgICAgfQ0KPiANCj4gV2h5IGlzIGEgZGVkaWNhdGVkIElP
VGhyZWFkIG5lZWRlZCBmb3IgVkZJTyB1c2VyPw0KPiANCg0KCUl0IHNlZW1lZCB0aGUgYmVzdCBt
b2RlbCBmb3IgaW5ib3VuZCBtZXNzYWdlIHByb2Nlc3NpbmcuICBNb3N0IG1lc3NhZ2VzDQphcmUg
cmVwbGllcywgc28gdGhlIHJlY2VpdmVyIHdpbGwgZWl0aGVyIHNpZ25hbCBhIHRocmVhZCB3YWl0
aW5nIHRoZSByZXBseSBvcg0KcmVwb3J0IGFueSBlcnJvcnMgZnJvbSB0aGUgc2VydmVyIGlmIHRo
ZXJlIGlzIG5vIHdhaXRlci4gIE5vbmUgb2YgdGhpcyByZXF1aXJlcw0KdGhlIEJRTC4NCg0KCUlm
IHRoZSBtZXNzYWdlIGlzIGEgcmVxdWVzdCAtIHdoaWNoIGN1cnJlbnRseSBvbmx5IGhhcHBlbnMg
aWYgZGV2aWNlDQpETUEgdGFyZ2V0cyBndWVzdCBtZW1vcnkgdGhhdCB3YXNu4oCZdCBtbWFwKClk
IGJ5IFFFTVUgb3IgaWYgdGhlIOKAmXNlY3VyZS1kbWHigJkNCm9wdGlvbiBpcyB1c2VkIC0gdGhl
biB0aGUgcmVjZWl2ZXIgY2FuIHRoZW4gYWNxdWlyZSBCUUwgc28gaXQgY2FuIGNhbGwgdGhlDQpW
RklPIGNvZGUgdG8gaGFuZGxlIHRoZSByZXF1ZXN0Lg0KDQoNCj4+ICsNCj4+ICsgICAgcWVtdV9t
dXRleF9pbml0KCZwcm94eS0+bG9jayk7DQo+PiArICAgIFFUQUlMUV9JTklUKCZwcm94eS0+ZnJl
ZSk7DQo+PiArICAgIFFUQUlMUV9JTklUKCZwcm94eS0+cGVuZGluZyk7DQo+PiArICAgIFFMSVNU
X0lOU0VSVF9IRUFEKCZ2ZmlvX3VzZXJfc29ja2V0cywgcHJveHksIG5leHQpOw0KPj4gKw0KPj4g
KyAgICByZXR1cm4gcHJveHk7DQo+PiArfQ0KPj4gKw0KPiANCj4gLyogQ2FsbGVkIHdpdGggdGhl
IEJRTCAqLw0KDQoJT0sNCg0KPj4gK3ZvaWQgdmZpb191c2VyX2Rpc2Nvbm5lY3QoVkZJT1Byb3h5
ICpwcm94eSkNCj4+ICt7DQo+PiArICAgIFZGSU9Vc2VyUmVwbHkgKnIxLCAqcjI7DQo+PiArDQo+
PiArICAgIHFlbXVfbXV0ZXhfbG9jaygmcHJveHktPmxvY2spOw0KPj4gKw0KPj4gKyAgICAvKiBv
dXIgc2lkZSBpcyBxdWl0dGluZyAqLw0KPj4gKyAgICBpZiAocHJveHktPnN0YXRlID09IFZGSU9f
UFJPWFlfQ09OTkVDVEVEKSB7DQo+PiArICAgICAgICB2ZmlvX3VzZXJfc2h1dGRvd24ocHJveHkp
Ow0KPj4gKyAgICAgICAgaWYgKCFRVEFJTFFfRU1QVFkoJnByb3h5LT5wZW5kaW5nKSkgew0KPj4g
KyAgICAgICAgICAgIGVycm9yX3ByaW50ZigidmZpb191c2VyX2Rpc2Nvbm5lY3Q6IG91dHN0YW5k
aW5nIHJlcXVlc3RzXG4iKTsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKyAgICBvYmpl
Y3RfdW5yZWYoT0JKRUNUKHByb3h5LT5pb2MpKTsNCj4+ICsgICAgcHJveHktPmlvYyA9IE5VTEw7
DQo+PiArDQo+PiArICAgIHByb3h5LT5zdGF0ZSA9IFZGSU9fUFJPWFlfQ0xPU0lORzsNCj4+ICsg
ICAgUVRBSUxRX0ZPUkVBQ0hfU0FGRShyMSwgJnByb3h5LT5wZW5kaW5nLCBuZXh0LCByMikgew0K
Pj4gKyAgICAgICAgcWVtdV9jb25kX2Rlc3Ryb3koJnIxLT5jdik7DQo+PiArICAgICAgICBRVEFJ
TFFfUkVNT1ZFKCZwcm94eS0+cGVuZGluZywgcjEsIG5leHQpOw0KPj4gKyAgICAgICAgZ19mcmVl
KHIxKTsNCj4+ICsgICAgfQ0KPj4gKyAgICBRVEFJTFFfRk9SRUFDSF9TQUZFKHIxLCAmcHJveHkt
PmZyZWUsIG5leHQsIHIyKSB7DQo+PiArICAgICAgICBxZW11X2NvbmRfZGVzdHJveSgmcjEtPmN2
KTsNCj4+ICsgICAgICAgIFFUQUlMUV9SRU1PVkUoJnByb3h5LT5mcmVlLCByMSwgbmV4dCk7DQo+
PiArICAgICAgICBnX2ZyZWUocjEpOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIC8qDQo+PiAr
ICAgICAqIE1ha2Ugc3VyZSB0aGUgaW90aHJlYWQgaXNuJ3QgYmxvY2tpbmcgYW55d2hlcmUNCj4+
ICsgICAgICogd2l0aCBhIHJlZiB0byB0aGlzIHByb3h5IGJ5IHdhaXRpbmcgZm9yIGEgQkgNCj4+
ICsgICAgICogaGFuZGxlciB0byBydW4gYWZ0ZXIgdGhlIHByb3h5IGZkIGhhbmRsZXJzIHdlcmUN
Cj4+ICsgICAgICogZGVsZXRlZCBhYm92ZS4NCj4+ICsgICAgICovDQo+PiArICAgIHByb3h5LT5j
bG9zZV93YWl0ID0gMTsNCj4gDQo+IFBsZWFzZSB1c2UgdHJ1ZS4gJzEnIGlzIHNob3J0ZXIgYnV0
IGl0J3MgbGVzcyBvYnZpb3VzIHRvIHRoZSByZWFkZXIgKEkNCj4gaGFkIHRvIGp1bXAgdG8gdGhl
IGRlZmluaXRpb24gdG8gY2hlY2sgd2hldGhlciB0aGlzIGZpZWxkIHdhcyBib29sIG9yDQo+IGlu
dCkuDQo+IA0KDQoJSSBhc3N1bWUgdGhpcyBpcyBhbHNvIHRydWUgZm9yIHRoZSBvdGhlciBib29s
ZWFuIHN0cnVjdCBtZW1iZXJzDQpJ4oCZdmUgYWRkZWQuDQoNCg0KPj4gKyAgICBhaW9fYmhfc2No
ZWR1bGVfb25lc2hvdChpb3RocmVhZF9nZXRfYWlvX2NvbnRleHQodmZpb191c2VyX2lvdGhyZWFk
KSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmZpb191c2VyX2NiLCBwcm94eSk7
DQo+PiArDQo+PiArICAgIC8qIGRyb3AgbG9ja3Mgc28gdGhlIGlvdGhyZWFkIGNhbiBtYWtlIHBy
b2dyZXNzICovDQo+PiArICAgIHFlbXVfbXV0ZXhfdW5sb2NrX2lvdGhyZWFkKCk7DQo+IA0KPiBX
aHkgZG9lcyB0aGUgQlFMIG5lZWRzIHRvIGJlIGRyb3BwZWQgc28gdmZpb191c2VyX2lvdGhyZWFk
IGNhbiBtYWtlDQo+IHByb2dyZXNzPw0KPiANCg0KCVNlZSBhYm92ZS4gIEFjcXVpcmluZyBCUUwg
YnkgdGhlIGlvdGhyZWFkIGlzIHJhcmUsIGJ1dCBJIGhhdmUgdG8NCmhhbmRsZSB0aGUgY2FzZSB3
aGVyZSBhIGRpc2Nvbm5lY3QgaXMgY29uY3VycmVudCB3aXRoIGFuIGluY29taW5nIHJlcXVlc3QN
Cm1lc3NhZ2UgdGhhdCBpcyB3YWl0aW5nIGZvciB0aGUgQlFMLiAgU2VlIHRoZSBwcm94eSBzdGF0
ZSBjaGVjayBhZnRlciBCUUwNCmlzIGFjcXVpcmVkIGluIHZmaW9fdXNlcl9yZWN2KCkNCg0KDQo+
PiArICAgIHFlbXVfY29uZF93YWl0KCZwcm94eS0+Y2xvc2VfY3YsICZwcm94eS0+bG9jayk7DQoN
Cg0KCQkJCQkJCQlKSg0KDQoNCg0K

