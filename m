Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CF485151
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:43:58 +0100 (CET)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53ls-00069P-T8
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1n53gY-0007xH-Iq
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:38:26 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:18846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1n53gW-00006g-3l
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:38:25 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205A2RPF002481;
 Wed, 5 Jan 2022 02:38:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=q7gOta+v7uTyLu3P/KXdetoMA75jNMzo9aiFmB67jC8=;
 b=HLDIaNNV2h5YVYPS7uApuBIIbMQOmTOGgzFi2NmTQNVVlBowhvx46vB8mMKn3zXCNYBV
 zsyNAdMsZHfDp0TucJ8FK+5c7xAg25ckhYlc/Zs8wHErFlQzuFswPgC62qd+AYPUYcl8
 Ka9f8kgd1hmVz1FilTQFYXGmntCe1JqGHbIJ+s+0/Oaj+Z0nV2nmM1e08AQg1vPzPAY2
 oG83mvbjeeJzEs8nhrJ8jnnWfOpWkgRY9gtYDMZMv1TGDxqlEeFn+Im9kIGyBxv2LEjO
 3+ye4YN/WuEfn4ckOJDy5ouGoJY3CNfj2GDclYP0Y8DoXKiAkyi3c2rN9MkgSY/KYpsL Eg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dcuvtsamp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 02:38:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlGrxzUUu+9SSrC+LQfssd7TrnCTDgf38zbJOVlz1hLGp15GdgoLVT3C7L77MDUBOtMA+0rS5B9FJ8+Cd607sOlKC8h2tk6yn59uhhTUZ/9e+35Qy7mXSjfEFQzDC1c3UuH7TjuvtQnA6WFSp5LviG9giQQ6c6Wfn4H9JGjdKRF79sli2WQS2hoyZS5efe6zRtwv0L/1SZlw8vHtjjtE8KR4jKunL7GvdaOuqgyzFhpd07BiPX/12IEIT/8fkL8dhb8aU/XKMjccwVhL+QHiNADonczggF/A1491qptySN3dT47NZGr0609ZoXPOUcwnVRZHapt9f3qF5xL2eJ+LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7gOta+v7uTyLu3P/KXdetoMA75jNMzo9aiFmB67jC8=;
 b=jDubNhOQD4lF2jCzxHEaRdo0Q1poYJmvsCC52pfZUx5juKL5+etxp4eWtDGDrimq5ERg1J4joSkWplKuLr97deXblWqjyuCA6M01bw6pTza2u7RwVfN0rkeR9jPQg68dZyZ0Y11bUmHQLYCFA6MxVEUFQcnQqivAoniSBo7gjC7fC5VpdcmVx1sOMkdPIu2u110nB0rzPRV+k0WQXHvxbMxXM+Oh9/EOnpQ85bPBmyfs/+Aucr92b0H4iwiG0SPLI9EiTpp4UICccqauizVYKQprBBQSA8emxNf07/JHdCU+JCWtx6bOKUFMzaA8x6oYJYLQi+MhJsXZGgsno8+6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8005.namprd02.prod.outlook.com (2603:10b6:8:16::16) by
 DM6PR02MB4636.namprd02.prod.outlook.com (2603:10b6:5:26::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.15; Wed, 5 Jan 2022 10:38:10 +0000
Received: from DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::6c73:31fc:fc27:8690]) by DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::6c73:31fc:fc27:8690%7]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 10:38:10 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Levon <john.levon@nutanix.com>
Subject: RE: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Topic: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Index: AQHX8cmDJg8CYXXqAkKbFuAi0z6Uu6w0+ZMAgAICnACAHV/R4A==
Date: Wed, 5 Jan 2022 10:38:10 +0000
Message-ID: <DM8PR02MB80054A55BCA44CD3525364308B4B9@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
In-Reply-To: <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77257502-0d85-4056-5ff5-08d9d0377807
x-ms-traffictypediagnostic: DM6PR02MB4636:EE_
x-microsoft-antispam-prvs: <DM6PR02MB463668812F939C53C6BFB2558B4B9@DM6PR02MB4636.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4otQzaSGI2ISywhJrisEOBLB+hP5z4CLsuUyW2St8vQxjiI80HVE1Eg5BhFdyimsPDceGlkK6MXfEzQ1Suy3EO9+pqiQqyTAs/6j05gvwjFd2vHX6ICYiSjsEPPRew8Cx9Yan4nUxijFCiPlUmIDMKR+U25ZKCDkDtiM4k7P4UzjOWRQ0U5a3TfVExPF9S8LdS8phXa+o0wEoZxeTOYgwStJjArXDq4t2SYcsZsWTtwy2Y+5kNHAJemSapCBEFsIdhao7Z/WBBA8fUVCbmV7s/fgnpucILdSCfaC+ujSkhLyUhKhaCLSNRInfjuqbKYGxU66oeTJcjqj37w9Tz7gFvSJYO60fuotM2fXDcb6z58XHZ5598NmGV0uqmkE6wZ5W23V99swAwsj1I36+2W+Be/OnZUiFxkEwkQ9jETw1vt5xUU1OZbZRjIDHwuHtah1P8WOkqZI4wqhm7tA4rH3s6Kk1HMK8HGDbkg0g+ep/tKKx4EkuBHz9n+MahRHGqqinZb1a1cy1v7byMXdA3IvLklGB8VQbCiByqLF+D4940SknYFdIw3fgO3MB0KQ/7/uTZMRF5Wt5esbr16fMkBmvlgtqWEAbt5wIlDMTks/QAoYBeYQ04+w6WR+mvlMyElDEbafHplgPKVKKnIjUpHvHLfwDU5ydkBdVhrtXluWdSs/CDvXrJqIKQ094IsYs950tI/iL/HFg72nmLg5PlN8Rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8005.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(76116006)(55016003)(66946007)(8676002)(7416002)(110136005)(316002)(2906002)(83380400001)(508600001)(5660300002)(38070700005)(6636002)(52536014)(53546011)(54906003)(6506007)(26005)(122000001)(33656002)(66476007)(86362001)(186003)(38100700002)(7696005)(66556008)(44832011)(66446008)(107886003)(9686003)(4326008)(71200400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlVBczRqb3BhOWV4QXVnOWp5WHlBMStPVDR1QUJ4NW5CbC94NEw0em45U0x1?=
 =?utf-8?B?NWJ6VGtuVEtaLzRjUGxKL3QwR1lmNDFaUlZJaFRZQVR4OEl4MUtDZE5oMjVI?=
 =?utf-8?B?Um1pakVUQlNiWUpMRzNxOTdHV3NDdHZjZS9lU0xuZGNnUTNQaXdOYUNiT1Yr?=
 =?utf-8?B?Yjh2VFYwZFh1eWNqNlpNTWpuMHQySC9TZVFyZmx5RkhIckpiV2FiYmljVkFJ?=
 =?utf-8?B?MUtpRUFkVmRheEtsQTA3Zzh3M0tvemlBNGo0dENlQlBpaGc5YlFMcEFTdTNZ?=
 =?utf-8?B?L2szdy8vYTFjbmhVK2doeWtYanhuL0lHYnh1R0V6RUtidjN6YUNTaU1aRXpV?=
 =?utf-8?B?TWluMFJtbm92U2Z1YlNJOWwrZXNGakZRSFNwWlFsQmZUWVczRXZ5dC81V1NZ?=
 =?utf-8?B?YkVrOGVxZzZRQW5TMnZ0ckhZc3ptUk9iT1o1K2dncCtaY3ZFdng4TTdVVmtC?=
 =?utf-8?B?ZGk1T2tRdUZsbXBQd0ppTzBZbDUzeFJiY3MvQlh0WGRQNk4yWmdHZWNUemk5?=
 =?utf-8?B?SENJK0lEaU85U1c4US9lUk02dGJlZThRcTdITGVTZCtxWTVyeWs0d1E5T3R1?=
 =?utf-8?B?MVc4LzlIcXdic3hIcmxndUtqNVllZkUvYW55WlFlRmgzVlR5eEprUWhmU2VX?=
 =?utf-8?B?ek5XOEFvUzJKOXNwdGxhWFNpSW01NzcwWFBHaDVIRnYyeWNWOTlGRVQxU2lI?=
 =?utf-8?B?M3NxLzZNUUNKTUJvUDRoOEhOQmNXZUlvV09WbHpyZUE1R2Z5K2JFR0J4RjZ1?=
 =?utf-8?B?TW5GNjY0endXWGRqa01wQ1MxWGM4QmJLZjd2QkJlSFFEVEpBMENPSzBidUYz?=
 =?utf-8?B?UENOSHVLN2MwM1UzMDRONmJUQkRZODkwdncwQ3FEblN4M2dqWElDRnNqaVlO?=
 =?utf-8?B?UnRSMlB1TlRoa3BzUEdsRGpZZEZhSHdTWFh2UFdHY09IV3pmY3N4RzBqUjY3?=
 =?utf-8?B?QytOamZ4RFJ4R2JaY2d0dElJRHVQQ1NOREkvckJqV082dVhQdUh6akRIOGwx?=
 =?utf-8?B?Mno2bHlGZGpRUEh1bWpVRUN6eUZxcFVTdjdOZVVkWktFQlFtalpINkxKTDdz?=
 =?utf-8?B?RmhXeDdXQjBjeld4MnBTVlUrSFJEbWtEMHJkNW5Sc1cweGVnaWRkWGF6U1p0?=
 =?utf-8?B?QUI5UTloSTZpbFlRNlJERko3a1J3cWo5YTJ5Rko2M2xYRHhaSHFMV2xTUU5M?=
 =?utf-8?B?d1IyTmdvdTV0VVN2THk2dWh5d3kzUTE1RklrSFRmaUd0cXFIVktLc3RRc3JZ?=
 =?utf-8?B?MDQ4TFdnczdpWnZxclNDaXF5Z2o3M3VSbmVraHpvMTluM1ZlcnVJcFAwTHkv?=
 =?utf-8?B?bjUxZFVGeDJFSnovK0ZZWkNZV1E1RWRYY1MreFRTUFFqcEtGb2tuMUZKMkZR?=
 =?utf-8?B?RFNVa2o1dWNTeHJpVmlvUDZaMUFaalN6SG9vY3Y1MS9KMit4WUNxczg3d2J0?=
 =?utf-8?B?WDliYjhSY0Zwa3pzcGxtRVk5c200NGlQcCs5NTRCQzdjZDNHTFU5MmNuMDNH?=
 =?utf-8?B?aFlHeU11aFA2YXB6V0J5Q21HSmhvL08wWGxjWUxGREkzTFZHcUJCaG14d2w0?=
 =?utf-8?B?YXNXd29JKzlYSnRCMEtBTEFPTmdwbmNxY0MyekRDbHpVaHFnTEJ1emVPUnVj?=
 =?utf-8?B?RkI3dHVEWmRTTzdGMWllN3llbDVXZlpkdVRiQUN6QUlZSnVsVmNFWTFxMHlM?=
 =?utf-8?B?clk5ZzdxTzBMTGx3T2hib2svaUthQWozNUlWWVAvMHh4YXNVaWROOTBNZ3pE?=
 =?utf-8?B?NHc5UlZmS0lQaWlKSnZNanVBZDdTZ0pXUVlxMDcwdEFybzg2bWw5UStkd0tX?=
 =?utf-8?B?dEJHN0lsUWlUOW03MW0zekJJSjhoYVFiam1QMm8xdXB5MzRFOFRnMGt0M2pu?=
 =?utf-8?B?bXpuWEdDa2ZNckU2eGxXZDdFZThlLzBQYi9zT2tMTFl2aFA0QkdGc2hydHNu?=
 =?utf-8?B?ZG9tMTlIZVN0OE5YN1cyRS9SckMvQWZjTzQwcjdPWFZCNVhaNWlQcU1VeEFW?=
 =?utf-8?B?MUpROWtkazV1SWhiS3BGbWdOYmJjTUxQb0ppbFAwT3NHVEttaUhLdHZiWVBO?=
 =?utf-8?B?RjFIUy9CR1BIZkxpaFpGdHVJTVpZUWRqUm1HRkJhS3FQYS91N2JIM0ZGNGlQ?=
 =?utf-8?B?dU9mSS9jaFJzeTZFRFpoTTk3M1d1QWtpRmNGNEZyRVhTc3JieGZBdCtET1cy?=
 =?utf-8?B?cWR3NkJVS2dSbDhESWJUVHgwN2w0TThydTdSVDQ4NCtvbjFKSG1INXU2aVFD?=
 =?utf-8?B?alZybVJWandDTlhzWUFSeXU3YmlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8005.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77257502-0d85-4056-5ff5-08d9d0377807
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2022 10:38:10.4057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5VhEMfemGRjqo2YxUkGei8JNy+ou9ko/ow59+Kj4a27xzVhxOa3eDS7AjqrG2OLBLcSDVYSmJue46kxCoZ1XQcNojz86qZQAnG1LKN81Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4636
X-Proofpoint-GUID: LgR8esCVL-NTfFp4Y73zUTgZxEI9Spjr
X-Proofpoint-ORIG-GUID: LgR8esCVL-NTfFp4Y73zUTgZxEI9Spjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFnIFJhbWFuIDxqYWcu
cmFtYW5Ab3JhY2xlLmNvbT4NCj4gU2VudDogMTcgRGVjZW1iZXIgMjAyMSAxODowMA0KPiBUbzog
U3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgSm9obiBMZXZvbg0KPiA8am9o
bi5sZXZvbkBudXRhbml4LmNvbT47IFRoYW5vcyBNYWthdG9zIDx0aGFub3MubWFrYXRvc0BudXRh
bml4LmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IEFsZXgg
V2lsbGlhbXNvbg0KPiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+OyBNYXJjLUFuZHLDqSBM
dXJlYXUNCj4gPG1hcmNhbmRyZS5sdXJlYXVAZ21haWwuY29tPjsgUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kNCj4gPHBoaWxtZEByZWRoYXQuY29tPjsgcGJvbnppbmlAcmVkaGF0LmNvbTsgYWxleC5i
ZW5uZWVAbGluYXJvLm9yZzsNCj4gdGh1dGhAcmVkaGF0LmNvbTsgY3Jvc2FAcmVkaGF0LmNvbTsg
d2FpbmVyc21AcmVkaGF0LmNvbTsNCj4gYmxlYWxAcmVkaGF0LmNvbTsgRWxlbmEgVWZpbXRzZXZh
IDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT47IEpvaG4NCj4gTGV2b24gPGpvaG4ubGV2b25A
bnV0YW5peC5jb20+OyBKb2huIEpvaG5zb24NCj4gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+
OyBUaGFub3MgTWFrYXRvcw0KPiA8dGhhbm9zLm1ha2F0b3NAbnV0YW5peC5jb20+OyBTd2Fwbmls
IEluZ2xlIDxzd2FwbmlsLmluZ2xlQG51dGFuaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY0IDA3LzE0XSB2ZmlvLXVzZXI6IHJ1biB2ZmlvLXVzZXIgY29udGV4dA0KPiANCj4gDQo+IA0K
PiA+IE9uIERlYyAxNiwgMjAyMSwgYXQgNjoxNyBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5o
YUByZWRoYXQuY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgRGVjIDE1LCAyMDIxIGF0IDEw
OjM1OjMxQU0gLTA1MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPiA+PiBAQCAtMTE0LDYg
KzExOCw2MiBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpY2UoT2JqZWN0ICpvYmos
DQo+IGNvbnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPiA+PiAgICAgdmZ1X29iamVjdF9p
bml0X2N0eChvLCBlcnJwKTsNCj4gPj4gfQ0KPiA+Pg0KPiA+PiArc3RhdGljIHZvaWQgdmZ1X29i
amVjdF9jdHhfcnVuKHZvaWQgKm9wYXF1ZSkNCj4gPj4gK3sNCj4gPj4gKyAgICBWZnVPYmplY3Qg
Km8gPSBvcGFxdWU7DQo+ID4+ICsgICAgaW50IHJldCA9IC0xOw0KPiA+PiArDQo+ID4+ICsgICAg
d2hpbGUgKHJldCAhPSAwKSB7DQo+ID4+ICsgICAgICAgIHJldCA9IHZmdV9ydW5fY3R4KG8tPnZm
dV9jdHgpOw0KPiA+PiArICAgICAgICBpZiAocmV0IDwgMCkgew0KPiA+PiArICAgICAgICAgICAg
aWYgKGVycm5vID09IEVJTlRSKSB7DQo+ID4+ICsgICAgICAgICAgICAgICAgY29udGludWU7DQo+
ID4+ICsgICAgICAgICAgICB9IGVsc2UgaWYgKGVycm5vID09IEVOT1RDT05OKSB7DQo+ID4+ICsg
ICAgICAgICAgICAgICAgcWVtdV9zZXRfZmRfaGFuZGxlcihvLT52ZnVfcG9sbF9mZCwgTlVMTCwg
TlVMTCwgTlVMTCk7DQo+ID4+ICsgICAgICAgICAgICAgICAgby0+dmZ1X3BvbGxfZmQgPSAtMTsN
Cj4gPj4gKyAgICAgICAgICAgICAgICBvYmplY3RfdW5wYXJlbnQoT0JKRUNUKG8pKTsNCj4gPj4g
KyAgICAgICAgICAgICAgICBicmVhazsNCj4gPg0KPiA+IElmIG5vdGhpbmcgZWxzZSBsb2dzIGEg
bWVzc2FnZSB0aGVuIEkgdGhpbmsgdGhhdCBzaG91bGQgYmUgZG9uZSBoZXJlIHNvDQo+ID4gdXNl
cnMga25vdyB3aHkgdGhlaXIgdmZpby11c2VyIHNlcnZlciBvYmplY3QgZGlzYXBwZWFyZWQuDQo+
IA0KPiBTdXJlIHdpbGwgZG8uDQo+IA0KPiBEbyB5b3UgcHJlZmVyIGEgdHJhY2UsIG9yIGEgbWVz
c2FnZSB0byB0aGUgY29uc29sZT8gVHJhY2UgbWFrZXMgc2Vuc2UgdG8gbWUuDQo+IFByZXNlbnRs
eSwgdGhlIGNsaWVudCBjb3VsZCB1bnBsdWcgdGhlIHZmaW8tdXNlciBkZXZpY2Ugd2hpY2ggd291
bGQgdHJpZ2dlciB0aGUNCj4gZGVsZXRpb24gb2YgdGhpcyBvYmplY3QuIFRoaXMgcHJvY2VzcyBj
b3VsZCBoYXBwZW4gcXVpZXRseS4NCj4gDQo+ID4NCj4gPj4gKyAgICAgICAgICAgIH0gZWxzZSB7
DQo+ID4+ICsgICAgICAgICAgICAgICAgZXJyb3Jfc2V0ZygmZXJyb3JfYWJvcnQsICJ2ZnU6IEZh
aWxlZCB0byBydW4gZGV2aWNlICVzIC0gJXMiLA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgby0+ZGV2aWNlLCBzdHJlcnJvcihlcnJubykpOw0KPiA+DQo+ID4gZXJyb3JfYWJvcnQg
aXMgZXF1aXZhbGVudCB0byBhc3N1bWluZyAhby0+ZGFlbW9uLiBJbiB0aGUgY2FzZSB3aGVyZSB0
aGUNCj4gPiB1c2VyIGRvZXNuJ3Qgd2FudCB0byBhdXRvbWF0aWNhbGx5IHNodXQgZG93biB0aGUg
cHJvY2VzcyB3ZSBuZWVkIHRvIGxvZw0KPiA+IGEgbWVzc2FnZSB3aXRob3V0IGFib3J0aW5nLg0K
PiANCj4gT0ssIG1ha2VzIHNlbnNlLg0KPiANCj4gPg0KPiA+PiArICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gPg0KPiA+IEluZGVudGF0aW9uIGlzIG9mZi4NCj4gPg0KPiA+PiArICAgICAgICAg
ICAgfQ0KPiA+PiArICAgICAgICB9DQo+ID4+ICsgICAgfQ0KPiA+PiArfQ0KPiA+PiArDQo+ID4+
ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2F0dGFjaF9jdHgodm9pZCAqb3BhcXVlKQ0KPiA+PiAr
ew0KPiA+PiArICAgIFZmdU9iamVjdCAqbyA9IG9wYXF1ZTsNCj4gPj4gKyAgICBHUG9sbEZEIHBm
ZHNbMV07DQo+ID4+ICsgICAgaW50IHJldDsNCj4gPj4gKw0KPiA+PiArICAgIHFlbXVfc2V0X2Zk
X2hhbmRsZXIoby0+dmZ1X3BvbGxfZmQsIE5VTEwsIE5VTEwsIE5VTEwpOw0KPiA+PiArDQo+ID4+
ICsgICAgcGZkc1swXS5mZCA9IG8tPnZmdV9wb2xsX2ZkOw0KPiA+PiArICAgIHBmZHNbMF0uZXZl
bnRzID0gR19JT19JTiB8IEdfSU9fSFVQIHwgR19JT19FUlI7DQo+ID4+ICsNCj4gPj4gK3JldHJ5
X2F0dGFjaDoNCj4gPj4gKyAgICByZXQgPSB2ZnVfYXR0YWNoX2N0eChvLT52ZnVfY3R4KTsNCj4g
Pj4gKyAgICBpZiAocmV0IDwgMCAmJiAoZXJybm8gPT0gRUFHQUlOIHx8IGVycm5vID09IEVXT1VM
REJMT0NLKSkgew0KPiA+PiArICAgICAgICBxZW11X3BvbGxfbnMocGZkcywgMSwgNTAwICogKGlu
dDY0X3QpU0NBTEVfTVMpOw0KPiA+PiArICAgICAgICBnb3RvIHJldHJ5X2F0dGFjaDsNCj4gPg0K
PiA+IFRoaXMgY2FuIGJsb2NrIHRoZSB0aHJlYWQgaW5kZWZpbml0ZWx5LiBPdGhlciBldmVudHMg
bGlrZSBtb25pdG9yDQo+ID4gY29tbWFuZHMgYXJlIG5vdCBoYW5kbGVkIGluIHRoaXMgbG9vcC4g
UGxlYXNlIG1ha2UgdGhpcyBhc3luY2hyb25vdXMNCj4gPiAoc2V0IGFuIGZkIGhhbmRsZXIgYW5k
IHJldHVybiBmcm9tIHRoaXMgZnVuY3Rpb24gc28gd2UgY2FuIHRyeSBhZ2Fpbg0KPiA+IGxhdGVy
KS4NCj4gPg0KPiA+IFRoZSB2ZnVfYXR0YWNoX2N0eCgpIGltcGxlbWVudGF0aW9uIHN5bmNocm9u
b3VzbHkgbmVnb3RpYXRlcyB0aGUNCj4gPiB2ZmlvLXVzZXIgY29ubmVjdGlvbiA6KC4gVGhhdCdz
IGEgc2hhbWUgYmVjYXVzZSBldmVuIGlmIGFjY2VwdCgyKSBpcw0KPiA+IGhhbmRsZWQgYXN5bmNo
cm9ub3VzbHksIHRoZSBuZWdvdGlhdGlvbiBjYW4gc3RpbGwgYmxvY2suIEl0IHdvdWxkIGJlDQo+
ID4gY2xlYW5lc3QgdG8gaGF2ZSBhIGZ1bGx5IGFzeW5jIGxpYnZmaW8tdXNlcidzIHZmdV9hdHRh
Y2hfY3R4KCkgQVBJIHRvDQo+ID4gYXZvaWQgYmxvY2tpbmcuIElzIHRoYXQgcG9zc2libGU/DQo+
IA0KPiBUaGFub3MgLyBKb2huLA0KPiANCj4gICAgIEFueSB0aG91Z2h0cyBvbiB0aGlzPw0KDQpJ
J20gZGlzY3Vzc2luZyB0aGlzIHdpdGggSm9obiBhbmQgRllJIHRoZXJlIGFyZSBvdGhlciBwbGFj
ZXMgd2hlcmUgbGlidmZpby11c2VyIGNhbiBibG9jaywgZS5nLiBzZW5kaW5nIGEgcmVzcG9uc2Ug
b3IgcmVjZWl2aW5nIGEgY29tbWFuZC4gSXMgaXQganVzdCB0aGUgbmVnb3RpYXRpb24geW91IHdh
bnQgaXQgdG8gYmUgYXN5bmNocm9ub3VzIG9yIF9hbGxfIGxpYnZmaW8tdXNlciBvcGVyYXRpb25z
PyBNYWtpbmcgbGlidmZpby11c2VyIGZ1bGx5IGFzeW5jaHJvbm91cyBtaWdodCByZXF1aXJlIGEg
c3Vic3RhbnRpYWwgQVBJIHJld3JpdGUuDQoNCj4gDQo+ID4NCj4gPiBJZiBsaWJ2ZmlvLXVzZXIg
Y2FuJ3QgbWFrZSB2ZnVfYXR0YWNoX2N0eCgpIGZ1bGx5IGFzeW5jIHRoZW4gaXQgbWF5IGJlDQo+
ID4gcG9zc2libGUgdG8gc3Bhd24gYSB0aHJlYWQganVzdCBmb3IgdGhlIGJsb2NraW5nIHZmdV9h
dHRhY2hfY3R4KCkgY2FsbA0KPiA+IGFuZCByZXBvcnQgdGhlIHJlc3VsdCBiYWNrIHRvIHRoZSBl
dmVudCBsb29wIChlLmcuIHVzaW5nIEV2ZW50Tm90aWZpZXIpLg0KPiA+IFRoYXQgYWRkcyBhIGJ1
bmNoIG9mIGNvZGUgdG8gd29yayBhcm91bmQgYSBibG9ja2luZyBBUEkgdGhvdWdoLCBzbyBJDQo+
ID4gZ3Vlc3Mgd2UgY2FuIGxlYXZlIHRoZSBibG9ja2luZyBwYXJ0IGlmIG5lY2Vzc2FyeS4NCj4g
Pg0KPiA+IEF0IHRoZSB2ZXJ5IG1pbmltdW0sIHBsZWFzZSBtYWtlIEVBR0FJTi9FV09VTERCTE9D
SyBhc3luYyBhcw0KPiBtZW50aW9uZWQNCj4gPiBhYm92ZSBhbmQgYWRkIGEgY29tbWVudCBleHBs
YWluaW5nIHRoZSBzaXR1YXRpb24gd2l0aCB0aGUNCj4gPiBwYXJ0aWFsbHktYXN5bmMgdmZ1X2F0
dGFjaF9jdHgoKSBBUEkgc28gaXQncyBjbGVhciB0aGF0IHRoaXMgY2FuIGJsb2NrDQo+ID4gKHRo
YXQgd2F5IGl0J3MgY2xlYXIgdGhhdCB5b3UncmUgYXdhcmUgb2YgdGhlIGlzc3VlIGFuZCB0aGlz
IGlzbid0IGJ5DQo+ID4gYWNjaWRlbnQpLg0KPiANCj4gU3VyZSwgd2UgY291bGQgbWFrZSB0aGUg
YXR0YWNoIGFzeW5jIGF0IFFFTVUgZGVwZW5kaW5nIG9uIGhvdyB0aGUNCj4gbGlicmFyeSBwcmVm
ZXJzIHRvIGRvIHRoaXMuDQo+IA0KPiA+DQo+ID4+ICsgICAgfSBlbHNlIGlmIChyZXQgPCAwKSB7
DQo+ID4+ICsgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LA0KPiA+PiArICAgICAgICAg
ICAgICAgICAgICJ2ZnU6IEZhaWxlZCB0byBhdHRhY2ggZGV2aWNlICVzIHRvIGNvbnRleHQgLSAl
cyIsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgby0+ZGV2aWNlLCBzdHJlcnJvcihlcnJubykp
Ow0KPiA+DQo+ID4gZXJyb3JfYWJvcnQgYXNzdW1lcyAhby0+ZGFlbW9uLiBQbGVhc2UgaGFuZGxl
IHRoZSBvLT5kYWVtb24gPT0gdHJ1ZQ0KPiA+IGNhc2UgYnkgbG9nZ2luZyBhbiBlcnJvciB3aXRo
b3V0IGFib3J0aW5nLg0KPiA+DQo+ID4+ICsgICAgICAgIHJldHVybjsNCj4gPj4gKyAgICB9DQo+
ID4+ICsNCj4gPj4gKyAgICBvLT52ZnVfcG9sbF9mZCA9IHZmdV9nZXRfcG9sbF9mZChvLT52ZnVf
Y3R4KTsNCj4gPj4gKyAgICBpZiAoby0+dmZ1X3BvbGxfZmQgPCAwKSB7DQo+ID4+ICsgICAgICAg
IGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1OiBGYWlsZWQgdG8gZ2V0IHBvbGwgZmQgJXMi
LCBvLT5kZXZpY2UpOw0KPiA+DQo+ID4gU2FtZSBoZXJlLg0KPiA+DQo+ID4+IEBAIC0yMDgsNiAr
Mjg0LDggQEAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9pbml0KE9iamVjdCAqb2JqKQ0KPiA+PiAg
ICAgICAgICAgICAgICAgICAgVFlQRV9WRlVfT0JKRUNULCBUWVBFX1JFTU9URV9NQUNISU5FKTsN
Cj4gPj4gICAgICAgICByZXR1cm47DQo+ID4+ICAgICB9DQo+ID4+ICsNCj4gPj4gKyAgICBvLT52
ZnVfcG9sbF9mZCA9IC0xOw0KPiA+PiB9DQo+ID4NCj4gPiBUaGlzIG11c3QgY2FsbCBxZW11X3Nl
dF9mZF9oYW5kbGVyKG8tPnZmdV9wb2xsX2ZkLCBOVUxMLCBOVUxMLCBOVUxMKQ0KPiA+IHdoZW4g
by0+dmZ1X3BvbGxfZmQgIT0gLTEgdG8gYXZvaWQgbGVhdmluZyBhIGRhbmdsaW5nIGZkIGhhbmRs
ZXINCj4gPiBjYWxsYmFjayByZWdpc3RlcmVkLg0KPiANCj4gVGhpcyBpcyBkdXJpbmcgdGhlIGlu
aXQgcGhhc2UsIGFuZCB0aGUgRkQgaGFuZGxlcnMgYXJlIG5vdCBzZXQuIERvIHlvdSBtZWFuDQo+
IHRvIGFkZCB0aGlzIGF0IGZpbmFsaXplPw0KPiANCj4gSSBhZ3JlZSBpdOKAmXMgZ29vZCB0byBl
eHBsaWNpdGx5IGFkZCB0aGlzIGF0IGZpbmFsaXplLiBCdXQgdmZ1X2Rlc3Ryb3lfY3R4KCkgc2hv
dWxkDQo+IHRyaWdnZXIgYSBFTk9UQ09OTiwgd2hpY2ggd291bGQgZG8gaXQgYW55d2F5Lg0KPiAN
Cj4gVGhhbmsgeW91IQ0KPiAtLQ0KPiBKYWcNCg0K

