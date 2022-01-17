Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A664900C3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:19:24 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JUJ-0007YW-Qn
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNo-0006lX-Ld
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:40 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:8520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNl-0003Mt-OB
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:40 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20H3I4GS011096;
 Sun, 16 Jan 2022 20:12:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ntUOdEHzsaOY78kdSbKxbEuBjHHqoZPjDrvgo2JQr0o=;
 b=oVR82AP35Qba4NvYr4OmqmwudONbXsMGp3j/BRQ0pJaTW6WbYVf2FAlwqQcAAaAO8LON
 T0cJ+zneXyBDVLKvGslz92VltWlXbpkUKp36yrgM3Tta8JqptoIOL1oxwQLqpu1rnxkr
 Sh1qgQwKLs8irKvm3nM0SNEunQcr4GBPYuPayG59Z5VpjexFas0ELYhZp8YJ7kp820aM
 pmE+MoNHf6Y6PbftqGNIJnooaiolCZo1q0PKAPGEFpzzROZnsIg1WTsVTGZRFhBfeAwE
 PQ2JwxRNLtQztOQ5c8ESCryL24s3Fcr7AEG/I2ONUb+ii7XCVyK+cpBR0GQlVJ4RbgNJ jA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkufw2hf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J71NLPsb+EnwbU2gX50iizdfVePzgOjP2jqqRBjgxuh9FJFhnOPqvqdKVGZu0pY+qYwvnicPyHkVsJZXYtae8jIolSZ98xu2NIpkvyFETp2LFF30cZHVw/Rcezoyvu8IZTVGl8DCGUEl/2t+nXJi3uMH/GsHXSriCP0zg+1tzWHgPEi+bj7u4LOpNCcvhXAqDm9pvQt4h8z/Fh+yoxw07ZR/Xr3/Ad0I+jesAK+7DXivh9eI3HogTKZ4JSu/AkLBIX+ntGsBUzLByQ4sRUcQgRaiucA1g2zArc3BtZUfrBUhk0MfA9rhl63ALLYwKU5sXAFBQsCF5XHl9J6SLqT/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntUOdEHzsaOY78kdSbKxbEuBjHHqoZPjDrvgo2JQr0o=;
 b=eVo5KH88HQeyPCiaGkfotzlwF2O448uIb6+VYP/TdzKnPxInGiDu6fyIlxxcjfsOaT5fGSjUxQ0YrNpVFgVY1P0mSYmRzdm8WRghbCXfIPMe76gqpuLM9YDZsrOSbs83joU9B2x384eQahHRGDjRGLXuGuZGuEpmYthSakyYkqveEnvtWuNJD324+KKd0M51L5m9XKeL9wgxjOc8hjcyU4YA8HrsnbtWqzysF5ezlHhQ4g7X9L91ZUhckdK0gArY6lL2Sk9NDqk82AdUpNQVUzay4UatF9ci8Sk/iYQmCIf0PEsgwMDzFAoYiClWb9zxiJRLhyX78AUF1kRFrZnliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:33 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:33 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 4/6] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Topic: [PATCH v3 4/6] libvhost-user: fix VHOST_USER_REM_MEM_REG not
 closing the fd
Thread-Index: AQHYC1hzhTdPV+Hio0Of0p9AfUTQhQ==
Date: Mon, 17 Jan 2022 04:12:33 +0000
Message-ID: <20220117041050.19718-5-raphael.norwitz@nutanix.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 071fdd94-bc63-4f09-a5ee-08d9d96f9670
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB8018F35CFEDDA75016F30C31EA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Pa9eU2grN5KrosL3BCb0T1ovpOQOnoxvDTSfBfitk7NLgwmq1PSAtpJfO/iGoT+UjLXLMjc091SQOiWaa9rbICMyONaV2nu9AjoFPB2JibW0qMDmkmGsL9OmeV6Lnpv4ZUOFx8X8iXxiX0JFmZQ/xLMrYhV3mFYHo5fIdt+eQu0QBqR6wju/gFurvQUIPRSJVrT40yusSoJhZOQyrtG5rs+/eWFRIKEm39cRcMDlNkpcJKvTOmXEj78ZSloKnTlV7zORrorm/Wjk/6QAhjygQa9g+N/Km8zsgU8ie0+wlwW+gK6eBcp2Z9k0lFjBYOajNP0nOlJkLWsB8I5T2lYfqyRA9SQOYqVAVG7JlxAoJgk5fPYvPfSADt2GKaefVIBjS9PM+4CAyIdds54DBqONLsdno3h7rNH5Rted0AF2zx82n/0PFDdv9dXg3xya+QR93jlrsAitnhn0NdrK3zlgmgwEmt0eISFjW7Im7HqQWFO7WS+N/n/0ocrRWGfG7/bEmo5lFe4n7M70SrXh7wTa9jA6xWL/3GH0IdDz2xFEV7MEpN7dIES26EESdZIY4cyja42b/QE4/1L/p/DRsfpG9F2w4myLPC0XtmyXK3SLQ5fi2p/5lK2TkJR0NpSjEKQZ+A4EqvFUhLL0HPvZKpiXuwQgk6gBKEFTr/legq0+K/oQeTWigt6K/1COgU0Xn5Wb3A5RWVm9+5tru3V4fS39Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(4744005)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk9DUUVqR1VRalR2bGRlYmZaVitSTGlBS01MdXZielE5Wk5kMkJGTHhMZ09y?=
 =?utf-8?B?T1JNdjEyZUlSNFdLdHBTc1MrUys3MEdKZm14VGJ3bDBybWEvOFpDaU9VaWht?=
 =?utf-8?B?TWlvWUFlQkFqM2Z6MWFlY3c0UFpSOW5uRVR0aDNpbVFaQUJUQm5TVkZRQUVR?=
 =?utf-8?B?K3NKckVBai9SZitUZ2tzNk9OTXV1aFVQLzNPdFBRejhvN3lKRzg3ZEFNbHpa?=
 =?utf-8?B?YTBOQm1wUEJCTnV4ekdMWTJqcjFqaDAxczZhaDFlTjlnR05FWjZSR3haa3Ro?=
 =?utf-8?B?cEFyUzB3dzI0cDZEQmlMT1hRNkE0SjVOZ1RyOWx6UG1QaG9zRUR1Vm9RR0FM?=
 =?utf-8?B?M3JucTFKa1pQUmdQSS9mVmNNRzRiRGp1Sys4R0h3d3orRnZNdGpYK3dWdjVV?=
 =?utf-8?B?Y1NvNGs1MXQ5WlROVWxXSWNyZmtabTRvQ3U0eHdwbVVrSUVnZWxnY29IcmpH?=
 =?utf-8?B?Y3ViVnZBanlmZWlwbWxkSXQwN1REdDMyVUJZUGdxRlJlUVp2ZTJWRUdrU25w?=
 =?utf-8?B?SVg4bU9CUnhhUmlQUUNBcU1oUnhrTm9reHUvZU1pWkk2TzhhZkVDTGhwTlcy?=
 =?utf-8?B?OEtSVkNjRFdlZTlxU1RBRUxhWFp5NmJIcEdJV0RDUFRGUVVzbGorY0ZZL0Y1?=
 =?utf-8?B?THZ2ekphc2JVUjNLYkdHRXBLSWltWnBka0tYZGJmM3FrV3B4NlpBa3VoRDRj?=
 =?utf-8?B?dWdIYzloL0hUbzI3dGh5ZnlodU4vbDEzS2NjY0FiTktZWnRQQzRubTdVNG5v?=
 =?utf-8?B?Q2ZiWDNoUmQrNHBoTnNXNy9janBwRXBSSkdIcG9QWVFKc2VyVGdIdDNVN3ZM?=
 =?utf-8?B?TktPTjZmeEs2RTY2OW5QMjNoVFAwbkxyVkFFS2VHb2RUVDI2c29Pb1B6RGov?=
 =?utf-8?B?TEV5SVNoRFc1emQ5VGhPM0VrNzlXZUdIOFlpRXBtQVl1OTNyTDUyRVFJbWUy?=
 =?utf-8?B?T28xM0EzTnd4UlUyNk55RDBqMkp3Q0UraFB2ZFV4L1dWb1IrMmM5amVLeWVp?=
 =?utf-8?B?WElDK01MZE10amRYYk5jaVcyT3NyZkRubVFwampOMUxCd2dTUUtEMjcwWFlL?=
 =?utf-8?B?OU1kSTUwdXV0V1FveXFpSERHa0g0ZUg0L3VGTDJOSHo1c1MyUXllNXhLUHBB?=
 =?utf-8?B?bUNJMGh5U3A3Y1FVNjFNNjJ5RmJGb3R4b09udEZwRWRlRHUxdm1tbjRLMmpy?=
 =?utf-8?B?V1c0SUY2UWN6Q01RR2tEcFBzaGhoKy91eG9iZWJJZUdTelNxRGEwaXBHOFE2?=
 =?utf-8?B?Q1ZwVkYzTlUwSDBRVUxWRDl3SFkxT0MzNGR4RnB5dHlZZzlMMXp4Q2lua0c1?=
 =?utf-8?B?NVMxS3pGa0UxVE1NOUtYMEdoMVRjenNHcVNKUGtCUnQxSFNMZzA5djJuUkxk?=
 =?utf-8?B?WjB5eUlIYlBrWnVwSEVSSG1ZdWIvZ01qbVY2L0VkeGVibGJ1djZiN0FtYS9v?=
 =?utf-8?B?SnJlTGJrTjU5a1NhQTJZclJNajEyRDhNdHBpOEVuYXpUc2xYdEdvTnRlVkRz?=
 =?utf-8?B?eDg1WGhlcXNFTHNpY3BudUpkMVpYSUhwUHB0dDZOek9VeGNrU2lLY2YyaEVV?=
 =?utf-8?B?QXNCL0JDY2pCYkdmZitIVUtpVGJ5cGZjaWI3WnpqTXZJMzlNRG95My9CL01O?=
 =?utf-8?B?eHBUSkpFRlJYbHJYNUt1SkJ1TjRzcEhKMGthZ0RkNjd4bDlHQWtJV3VvVGNl?=
 =?utf-8?B?T3AyTWJaTk5mcS9YL0h1SHdVeFFucndpdjI1cXRYU1FsZHN1bnQxd01saVdy?=
 =?utf-8?B?N1lqNXVISGVGZ1RLQ1F1WFZIWTJzTGFUbWxYeEhkdHdhUVduTUlyNFFRUk0y?=
 =?utf-8?B?S09qKzI2aTRBMVh2Qkdqa0QwV2tqOEk1NzJWMUhtUUVGZnJ1bzVhZ3BvWW5F?=
 =?utf-8?B?bFdDbSszejM4c2VnajcvYkNNc0dlcXN3enFneGRKVC9RRHNUYXgrZDZaZWUw?=
 =?utf-8?B?SC9qU0wzUXpVdUxHYXY1ZEhPdSs2QysxZmlYTnNGZzBYQlpPOHJQeVU5Nm81?=
 =?utf-8?B?U3VaaFNDYkFMaGxZWlpmU1JMdmI4U2RiK2g3eUZVTU9HV3VqQXptSWlOQlhu?=
 =?utf-8?B?TzVQWUd2SlNmUlF3S1BoYlVkM0JDVkpRZm9rdThCeEZIMmZ3Yi9uMk50amdh?=
 =?utf-8?B?L0FHUTg1TDNwRTBSWXNsSThYSFVIZnlkTU9ERllZSnhzTXdEWjFSL0xUdGhG?=
 =?utf-8?B?NG5PVHQwREZrMGp1TG1ZL1FkME92QVJOT1FZem92K2dabWdsWVFLMGRBcVpW?=
 =?utf-8?Q?H0iqd5iSuP3Wkpuquok7r/jrS2Zwf56PelJ5tTxelc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DE309A181A84B4D96A7705A703E5152@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071fdd94-bc63-4f09-a5ee-08d9d96f9670
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:33.7886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AddtD1LBAWzpG9mScpgURbPe7aMXSI4MYQtPj0rYn+1g4gu6Uyk03RhrIkDgftohx46xXk/oxGBgXNoiGIFUi1dQCRPo/otgsaZqczWBRO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-GUID: gT4SscprzXs-6jxcYGMQRtaKCxZ23eky
X-Proofpoint-ORIG-GUID: gT4SscprzXs-6jxcYGMQRtaKCxZ23eky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQoNCldlIGVuZCB1cCBu
b3QgY2xvc2luZyB0aGUgZmlsZSBkZXNjcmlwdG9yLCByZXN1bHRpbmcgaW4gbGVha2luZyBvbmUN
CmZpbGUgZGVzY3JpcHRvciBmb3IgZWFjaCBWSE9TVF9VU0VSX1JFTV9NRU1fUkVHIG1lc3NhZ2Uu
DQoNCkZpeGVzOiA4NzViOWZkOTdiMzQgKCJTdXBwb3J0IGluZGl2aWR1YWwgcmVnaW9uIHVubWFw
IGluIGxpYnZob3N0LXVzZXIiKQ0KQ2M6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5j
b20+DQpDYzogUmFwaGFlbCBOb3J3aXR6IDxyYXBoYWVsLm5vcndpdHpAbnV0YW5peC5jb20+DQpD
YzogIk1hcmMtQW5kcsOpIEx1cmVhdSIgPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4NCkNj
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQpDYzogUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCkNjOiBDb2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29t
Pg0KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQpT
aWduZWQtb2ZmLWJ5OiBSYXBoYWVsIE5vcndpdHogPHJhcGhhZWwubm9yd2l0ekBudXRhbml4LmNv
bT4NCi0tLQ0KIHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIHwgMiAr
Kw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3N1YnBy
b2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIGIvc3VicHJvamVjdHMvbGlidmhv
c3QtdXNlci9saWJ2aG9zdC11c2VyLmMNCmluZGV4IDdkZDhlOTE4YjQuLjNmNGQ3MjIxY2EgMTAw
NjQ0DQotLS0gYS9zdWJwcm9qZWN0cy9saWJ2aG9zdC11c2VyL2xpYnZob3N0LXVzZXIuYw0KKysr
IGIvc3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmMNCkBAIC04NjgsNiAr
ODY4LDggQEAgdnVfcmVtX21lbV9yZWcoVnVEZXYgKmRldiwgVmhvc3RVc2VyTXNnICp2bXNnKSB7
DQogICAgICAgICB2dV9wYW5pYyhkZXYsICJTcGVjaWZpZWQgcmVnaW9uIG5vdCBmb3VuZFxuIik7
DQogICAgIH0NCiANCisgICAgY2xvc2Uodm1zZy0+ZmRzWzBdKTsNCisNCiAgICAgcmV0dXJuIHRy
dWU7DQogfQ0KIA0KLS0gDQoyLjIwLjENCg==

