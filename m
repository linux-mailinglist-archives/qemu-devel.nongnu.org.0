Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6E4860CD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:00:17 +0100 (CET)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Mky-0007Mz-AA
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:00:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYh-0001HA-1S
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:38 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:22680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYc-0003TU-T4
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:33 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N5d7i019176;
 Wed, 5 Jan 2022 22:47:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=RDK4ZRwt0SKhzgZpZmio5GwTX9vjVbizSaPKr/pCvq4=;
 b=xEDoaB62222BmAR2AtLIHXVTnb8CY5lVdSaFVTtZFNIMIZg2v5ofnXzUvpEHlAz+9i5O
 UPPWEO2HMEUcD4hjjjRMKIpBzzMT5QiAScqclvrsKeeOafDSKRfyp4gkDZQPslmbn1vs
 +bYJ68OxdP5XrHIiNmn+3ueYL1mf4PcLG9YcS3vsoMa+2zqaDBWK1Jc8w7a5lJajEvPK
 ggymx/7HLokfrESM9GZH0Yp7PH2YWB5L4LZF5LMhfFCJbWKVwx4c/Me2gDSVUSO72J9s
 J+5o2Umn956sIMWrgbtPA6oF6f3DHnB4JDD1qcE5DnaYsqhGe7kpzO6Oqpxnn7BSi+LS /A== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmq00jfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 22:47:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eblkq/X6gSuSZOyif/PE+8ivV6fA+MRFIdx3JM0xXnRvRgDwzePD1VKB7/nZv8Rebkm1Va656FKrDitUhW6PNG11c9N0V76zu3cd2cIDikQhFbR7p/5m5HPCYAkyNjHsrwFtE+dsSuNNI03R5r07V6yTxW4tNfXZlcfL5JtIZoXE8pEtElsvT31WY9xT4wYxsSlRLGAoOnHCxsiTEHVDj11NmYmM96DqjAh6c0P9xGgkvqGjwtBGNBWM77+qDR8JNro5s7q91tGQNOZEbZXj88S72rW+CqoohxhQjvq98bFocu9oZBrYMZZYRreGEZmrf2OAfnc7kaEFp/Ox4/TU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDK4ZRwt0SKhzgZpZmio5GwTX9vjVbizSaPKr/pCvq4=;
 b=eNeGMgbJThBgMOTt2IdT20mduJk4L5x7K9SijOFzso0cUpn3HCnQ71dzLrQI3ti8VhHQtxXnMNiX/qPhQKbUlStBV7x2bLwpqB0RDX6ezGcILoyveoPxdYf7Vlk5pU48Gyc9yl4zd2lPwnOn8KMVuG5nmESRIDwyKW6ffQ+Qsi60cYlv/7oUQSouE1M4utvp8IzTpUyKpKVCvcH6DgmBi2egAw5wB5v0G+bzTCaDlG9SOXnBxaHubkA+lXkE2M/nrjZ1BYCBLcGOQV0pK+y+knMYAeHpcCHkCy4Hcn782VGaH9OuDlWhq9OmrPufZHjI7e54UG7tZNdnlBSB8W7/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 06:47:24 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:47:24 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v2 0/5] Clean up error handling in libvhost-user memory mapping
Thread-Topic: [PATCH v2 0/5] Clean up error handling in libvhost-user memory
 mapping
Thread-Index: AQHYAslCTexIUVU8PEm04h1374z/dA==
Date: Thu, 6 Jan 2022 06:47:24 +0000
Message-ID: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43f45ab2-7770-40b4-b192-08d9d0e0655c
x-ms-traffictypediagnostic: BL0PR02MB6530:EE_
x-microsoft-antispam-prvs: <BL0PR02MB653058DB1789A1C4FC0D6DD5EA4C9@BL0PR02MB6530.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tSWsGRp90iTaIS/gN225iVNESBPOf6A+otaB/I0KYxMduFxcz3sUQ6IKuUSlCPALVGO/jFgfV9BNskQLj2tH6i7HCUW8VyE/5ETkaHm5vJ5abHqhDQtU54TVyCZM0aX13XGB3S5j+O/cCCfqiY3ITf5u2CVzRVG5gmXtk6BKla5mu8788rZDdZcMY8s/gdAZugan5ZFC6q63vj+UoL7pttH35zzCULsYmHiHRkMC2VCFtAjpDajLztTprxjKoq5bgmDAL6gGjJRyN0EOG958YTkCyOzzsSe4z2XvXVPOaa4chrFy1Mos14EqRNuXIKttn6BZHsxkdsxiJ3kYfchwQCPWr/KyY9NsgQQxR8PFUhLT3KI2RW5Spkg5+2ZsoCKv7wd24xPFCEhGfw7dg5mENbxtJ7e2JJjU1svHRmjqgIWgpZnZ5NSztAHngXEtbfa69+1kFjy2BTy7tdXQksMcjGDfH4lS+cjWlPA38Lqtu+Tg6K6yhJLU4buGqgPxT/X6E/rMeHouHgBvYf0R0WDQ85dLJtQA4Hld2d/CMrq+S8QNeB/G4Tf0snH5QvYWRKPKdcuKMfDBOoY2jLw0/tI/gKCEL8dhoO3IVNyE3Eikd0EKMertxKAcF/XmeRFJeAoZS1DM5Ic802JDOqM+3jb8DdxX92Gmf8fSeMup+QEWeLcNIgkdo+FEqtPc71rMVpR60PsqQhyFWm4Nnz5UJwOBKXmwTNZ5BqtX0fahuKe6PUU3qeRwwV5vPOmvTZGIZznOhHP9h7u/L0S+spiqRHkzYX/lNKRu3T3LYoxgAjfqxie0noc+lGs2QNvT72zIKphz+tqzUmRFfqrOMRMGC+s01Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(508600001)(66446008)(4326008)(76116006)(186003)(2906002)(966005)(316002)(122000001)(6512007)(66476007)(71200400001)(66556008)(66946007)(5660300002)(91956017)(64756008)(54906003)(6486002)(38070700005)(110136005)(44832011)(36756003)(83380400001)(1076003)(2616005)(38100700002)(86362001)(107886003)(8676002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3NHVzUrUERNY3JDMGNlVHQxMDBaeit2dVJCanV0VDVWMkhDaHZYRU9FYUZQ?=
 =?utf-8?B?MGFJSDhkd0llcUxsMkoyalU0T0wrcUdBWk1jRDk5d1BvNGpUNXFoM0hDYWZF?=
 =?utf-8?B?eW45d3pDV2haZGVETmRhU1BCTm1uN1VVd2dteUZVMnA3TC9Ra1RMd2NIazhB?=
 =?utf-8?B?ZURYQXllUXRTNkp2UWNqejRnd215WmE2YS81d0hzV0NWcU5BUGY3S0VtNWZw?=
 =?utf-8?B?Qi9EVzUrNU9KZjc2dUI3U0pDMGRzNTBCTTV5R3hmVUNoell0Yzc5akZpdzVK?=
 =?utf-8?B?eE1rcnozeWE2WjJlR1YvVEQ2RllFUzQzZFFQQTFFd1BHN000eEtwUmdZaXJr?=
 =?utf-8?B?aFh1ZmVrL3EwUXprczJSMDduc3U0aUZkMCtzbXhydHdKN2p5QUw0Sm5kMWVJ?=
 =?utf-8?B?T3ZSNkpUeEIwNFl6amd0TzBrUDI3UUxDV0hQUzk2bThRL2F6d1FvWXVUaTds?=
 =?utf-8?B?RjZMd1U3RFpxRjhVcHFKeTRpK1dWV25LVldqTHVzT0ZrWXFhek1NVWFmUGVR?=
 =?utf-8?B?cUZYUmxHUXRwRXJGS1RDQUwxQ2kxYlZFTmVJS0E1Y1R1YXB3d0IwSnlENzNr?=
 =?utf-8?B?dHIvS3lzNTZ5TUd3TThrTGJab014UFN6RGVYZnptZEdaTVVTeHJBclNCZUtt?=
 =?utf-8?B?MDdtU291Wk94VldlQmN4MURJdnFHZnRQOWcrM1AvdEF3bXVMYXlLNnFhSmVJ?=
 =?utf-8?B?ZkovMUh0MHkrWHM0U2RVclZIRmxvdDNUcDcxS2hGekNYdUpJYldJc1ZBelVv?=
 =?utf-8?B?azRmeXNHcVRGbXBFU296Zm0vRzJYTDRiVDVZQXpQOXlsTlRWamRNbk83b3pR?=
 =?utf-8?B?RGhYTEYzb2NuSm1NeTN6U2lnMzhIcXFROUppRm5kREcxNEVnZlI3Qk82WVF6?=
 =?utf-8?B?bHBmVHNVYldWR3JGNnhTNWJ5VitSaHhDS3pmeVlvQmpqTC9HU0ErMzRPSkdF?=
 =?utf-8?B?K1hBTVdqRVprM3dtZGduTTFSNmRiNnE0eXJFdCthY1BjNHpic0VsSnkyR2tV?=
 =?utf-8?B?Ni9jblhoV2RpaWtjNWxQRHc0Ry9oOFczNGwwWmdNQXVzRzFsUE1MallTS0oy?=
 =?utf-8?B?b0tDYVRnSmxhNCs2dlZIczFEUjFKbzNsZWFwa0pzeTJQTzU3QXVHSDd3MjZ2?=
 =?utf-8?B?UlhmbWtPNWwrMkF3QXdvODVtV2g4U1VDTFNwUCtxT1hDWkhEdFJRSW10bnBQ?=
 =?utf-8?B?elQydHdHTmJ6YWRKeCtsQlR4eEVBRWhDOTZRdDNyVG1wV2c2cVR0TXdZTndM?=
 =?utf-8?B?clRLWFNzR0tmRVBGMTgyLy9najY1TVRjYm9lQUFpRG1ycE5yWlBOeGtoNzND?=
 =?utf-8?B?ZzNqZnJ4MVFsOUhlMy9qSktEc2ZuT3NmdDBFc1FEb0R1SlFqb0drd2NtczJH?=
 =?utf-8?B?V2M4QWIvTDc2aUREUHRNekg3MHRzd21PNnFjY21GY1dlM2FWZ0Q1Mit4ejI2?=
 =?utf-8?B?Zyt3RlAyMjFrYzl2dDlpbXVpaHpib2l6MDd4Qmx1V2VwT3c1S2JyU3NmVWIw?=
 =?utf-8?B?UFdZamh2blE0TzE4MWt2UTNUVFpxNzdGNTNCZHFINExYcFFXOUlCZFdzZTBu?=
 =?utf-8?B?cXpLa2JlVE90NUtCRWRyOTJmSFF3Y2JtTmFHZHByVWY3RDJiYWdQaUJLS0Jl?=
 =?utf-8?B?Skx3VTVJQ2dpVVpaT05OdzZBM2NyQi9yRmpPNXFudWVZMTR3Wkc0Tk1KMXEz?=
 =?utf-8?B?NS8vSW5BMld3azZXWkJ6SDNvSlRmT1FDa3VKazBLM0hKMW9xYnZWc0FDeE0y?=
 =?utf-8?B?MGRZZlB6ZDZ0eWJhRTdOSlBHdmNKZldyekxyR3BmT0ROM0xUOTZhWi9rOERZ?=
 =?utf-8?B?VTZUQjhwejMwQmtaYzY3OVRkWTJJUnlMOGlwQ21UL0R6NTNGVFhwa3MxczFj?=
 =?utf-8?B?TkxvVEJ1UzdMUjlpTU02dnBOeUU2TFFuUnp1aUZJT0hoWGx3WVZ3a3FPZjQ4?=
 =?utf-8?B?S0pQME9FTFI2b0dPMlBob0w1UGpQTHoxZXZCZ0krdkV0MHR4UzJIT0NkcUlQ?=
 =?utf-8?B?OWh1M0ZxNkwxK1dUQXVIK0VFWi80OWoveGROYko5ZEhRNVpTemtyN1dUa0JR?=
 =?utf-8?B?K2w0Wlp0TExVOXhQU1p1VmFMckEwYXVKazBOOUtraUVTbGhQTThKLzZneTZu?=
 =?utf-8?B?VUtCcURpQ1htWXVCdVZHR2UzemhNd0pGL1pCSmJQY1hCSWNQaGxWNDJMYnV3?=
 =?utf-8?B?N3h5M3FjWTByMGNoM1ovSWlMcWpBRENCdm83SlFKYUtjU2I5Y2xpeG1RZ1dr?=
 =?utf-8?Q?m2ZCWdiCc1TOAlfTCJJLcSUxgOzH/6wxAScjVXqt5s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85CB53B1FF3C8A4E888F37A724E7451B@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f45ab2-7770-40b4-b192-08d9d0e0655c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 06:47:24.0680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhTWmFmnIs1MzI3riFyYb10/y7yhGTzlxEO5wvZ7lSP8XTbHRmf0aWB7kVwFDpHhb/kF0otUwzP+q4TjUpnAp7ip6SIgjoYei6UOcwHpePY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-GUID: jivIxkcDWXMV-X1jsnIZGnC_THVj0SI3
X-Proofpoint-ORIG-GUID: jivIxkcDWXMV-X1jsnIZGnC_THVj0SI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_02,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGV5IFN0ZWZhbiwgTWFyYy1BbmRyZSwgTVNULCBEYXZpZCAtDQoNCkFzIHByb21pc2VkIGhlcmUg
aXMgYSBzZXJpZXMgY2xlYW5pbmcgdXAgZXJyb3IgaGFuZGxpbmcgaW4gdGhlDQpsaWJ2aG9zdC11
c2VyIG1lbW9yeSBtYXBwaW5nIHBhdGguIE1vc3Qgb2YgdGhlc2UgY2xlYW51cHMgYXJlDQpzdHJh
aWdodGZvcndhcmQgYW5kIGhhdmUgYmVlbiBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCBp
biB0aHJlYWRzDQpbMV0gYW5kIFsyXS4NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Fl
bXUtZGV2ZWwvMjAyMTEwMTgxNDMzMTkuR0ExMTAwNkByYXBoYWVsLWRlYmlhbi1kZXYvDQpbMl0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC85MzkxZjUwMC03MGJlLTI2Y2YtYmNm
Yy01OTFkM2VlODRkNGVAcmVkaGF0LmNvbS8NCg0KQ2hhbmdlcyBzaW5jZSBWMToNCiAqIENoZWNr
cyBmb3IgYSBzaW5nbGUgZmQgdnVfYWRkX21lbV9yZWcgYW5kIHZ1X3JlbV9tZW1fcmVnIHJldHVy
biBmYWxzZQ0KICAgaW5zdGVhZCBvZiB0cnVlLg0KICogQ2hlY2sgZm9yIG92ZXItcnVubmluZyBt
YXggcmFtIHNsb3RzIGluIHZ1X2FkZF9tZW1fcmVnIHJldHVybnMgZmFsc2UNCiAgIGluc3RlYWQg
b2YgdHJ1ZS4NCiAqIHZ1X3JlbV9tZW1fcmVnIHVubWFwcyBhbGwgbWF0Y2hpbmcgcmVnaW9ucy4N
CiAqIERlY3JpbWVudCBpdGVyYXRvciB2YXJpYWJsZSB3aGVuIGxvb3BpbmcgdGhyb3VnaCByZWdp
b25zIGluDQogICB2dV9yZW1fbWVtX3JlZyB0byBlbnN1cmUgbWF0Y2hpbmcgcmVnaW9ucyBhcmVu
4oCZdCBtaXNzZWQuDQoNClRoYW5rcywNClJhcGhhZWwNCg0KRGF2aWQgSGlsZGVuYnJhbmQgKDEp
Og0KICBsaWJ2aG9zdC11c2VyOiBTaW1wbGlmeSBWSE9TVF9VU0VSX1JFTV9NRU1fUkVHDQoNClJh
cGhhZWwgTm9yd2l0eiAoNCk6DQogIGxpYnZob3N0LXVzZXI6IEFkZCB2dV9yZW1fbWVtX3JlZyBp
bnB1dCB2YWxpZGF0aW9uDQogIGxpYnZob3N0LXVzZXI6IEFkZCB2dV9hZGRfbWVtX3JlZyBpbnB1
dCB2YWxpZGF0aW9uDQogIGxpYnZob3N0LXVzZXI6IHByZXZlbnQgb3Zlci1ydW5uaW5nIG1heCBS
QU0gc2xvdHMNCiAgbGlidmhvc3QtdXNlcjogaGFuZGxlIHJlbW92YWwgb2YgaWRlbnRpY2FsIHJl
Z2lvbnMNCg0KIHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIHwgNTEg
KysrKysrKysrKysrKysrLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yMC4xDQo=

