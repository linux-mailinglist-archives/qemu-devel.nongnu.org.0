Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17105307341
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 10:57:43 +0100 (CET)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l543a-0006ff-5g
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 04:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1l540F-0004C7-5B
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 04:54:15 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:31242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1l540C-0002Aa-IN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 04:54:14 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10S9agaf031693; Thu, 28 Jan 2021 01:53:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=MZYhVL5D09f7RWbMm8TavDWaa7e1oaQW45bnGVOKUwk=;
 b=suN02Gb6vMMxGUNSiyqdcmqg/r48yMgpoJ+D5zEpciQRgMzA8Ng7Ev+J+J50rua5EoLs
 vrnBHxHFIGtyEk8lgJQ8n4griE6mVEOe7Rk2m9tPfdtRjr21OOMLRXH/JrQ9JhvqL/ft
 t+nxG7onT0hXn7U6dzE2LZ2nYrl3XcrkqsVMYTsfX6uNaZxIQrdX4frzH+J9osEnPhT3
 91LsvPnYA5Y2uZYgzQHC1b6CSUHqv3P/IkS3AG0a6320/BKLO5/RNBFZWrlCfHip2iyv
 v3B4DpvXFVoBcEIpNI3aWZo42/FJxXmk3FmzRiqrU6LAHLGd17Q+o1BNoTT50VZlJ3Dx hw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0b-002c1b01.pphosted.com with ESMTP id 368m0mbeqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 01:53:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfJqr1D7CY+mWHUL7gPeZgVbdjQstuuUEo2eQjl6NJnNwlAKHlo6b+pXTqytABDQ4cvGucKJ8GPI7SUI0rJnc1kcOh1xAKVv9zuer8WDHXBDuSsMIDfR/0zGGeXpV0y+UCVsD3dHHXk+ADg5WvwEIUbWxvVZLfoC6IewFTcnaRtdvp5tq39MVwtJ/qMUr72HWfQavjCcetbM4IUIfUcIVwAnIqkLS9Xz25IrDqsTbYoyMVCSYxBEctjs3CS+cBGeC407OrXPmPjfEgfzDlnOZDiSmSXq+8tUB9S3zIcSEZU33c/JTghFg6/DN3gAzacaXD87IKHK/wz5gztA3AA9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZYhVL5D09f7RWbMm8TavDWaa7e1oaQW45bnGVOKUwk=;
 b=beTeEMwJNcHZzzaVy4hIRdj3lXN7DCRsOm6uzng0Xw3jD3rEJWqUW2UNKmgQJbzlSPneTxfS4REdBl0o4wbqK7QePfNwRGEGnvQo1H6rO0DzVzFiyZuBjtwXr0GsJJOCP1tEcTQSbGPmzOy2cnJuVbKmE/HYwWM43yU7GZhT1Y8GsTSVVwql/pXYKanBDgqEB0V9C97xFh//pOJsfoRhdR4avdb9gViB6fquylu8keByDjZoiQXjpD+XoBSCVWPFLIQnSsg0HqTWr8Ji7CwptBv/p6zN0XvSCTX0K9VLHduLaWFmW1JKho1E+ziLi2DxP0zfLDwmoKV7R3BDDlbSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MW4PR02MB7140.namprd02.prod.outlook.com (2603:10b6:303:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 09:53:47 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::2c19:5dc1:9081:871a]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::2c19:5dc1:9081:871a%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 09:53:47 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Jag Raman <jag.raman@oracle.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>
Subject: RE: [PATCH v20 01/20] multi-process: add the concept description to
 docs/devel/qemu-multiprocess
Thread-Topic: [PATCH v20 01/20] multi-process: add the concept description to
 docs/devel/qemu-multiprocess
Thread-Index: AQHW7qHECUmcEc0gHUujJvgd+kUuPqo4mTAAgAMhqgCAARmqoA==
Date: Thu, 28 Jan 2021 09:53:46 +0000
Message-ID: <MW2PR02MB372301AD37A53464F76A6BEC8BBA9@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
 <32d4ecfc33e9d1dc875ea39f9cfb4d990c8a4934.1611081587.git.jag.raman@oracle.com>
 <dd56d46e-b869-3cad-7de4-8a787d7acd73@kaod.org>
 <62049317-8D97-431E-88E2-1D9457215492@oracle.com>
In-Reply-To: <62049317-8D97-431E-88E2-1D9457215492@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.106.77.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34479768-189f-48ba-137d-08d8c3729b48
x-ms-traffictypediagnostic: MW4PR02MB7140:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR02MB7140537A2DCBB39188F227488BBA9@MW4PR02MB7140.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0QMnNmYFIeaLbTxd87Gfpue6GuRZ1WtPlqdfCPF0vGWdMfD6NGcHNearjp/N4sh4ap8SSkYgPqQ1ILMUDMPOkIihQYJJ3+s4hWUVTyTW4BdWhnl+Nn3KflXMM1NvdRxVlvjGmj47AIQje4zzVNHe9gmHX6e06ShNEn+capjtsruK9zUkvEZbw1fyYB7vJAbGYliyQAFYDeEhstnUANq8meSH46PKKO9XlsKJCSYFKpcZiZ50LtdoZfhMAtwcGvlGw/zW+nrj5djUJdcinYvOsREVxDTQ/YlmCAlBSP54JfC/yicu+BT3X0FYIzEF0TinHGJ/FT+NMAt87O+R74Cf9GvE89xVju5v7YnZ9hmKhjBVZCre08j8p1QU69WtpiEbfNLYTTScLbFwKd/DBZeipePlXCQSwmJokWJZFuz7SkKsPksquhRjlFJYu5hNmFf+5cqgikit04pV1Ub4CFVW3Y9Rr8YNVdCMEZ04Nu6NrPuVtjs9JXz6g7D8/LhdpTQPreLbylqKvfo9k0qRslApwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(346002)(396003)(376002)(316002)(110136005)(76116006)(66446008)(6506007)(44832011)(86362001)(8676002)(66946007)(66476007)(52536014)(64756008)(66556008)(8936002)(54906003)(107886003)(2906002)(186003)(83380400001)(71200400001)(478600001)(33656002)(5660300002)(55016002)(4326008)(9686003)(7696005)(7416002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MDc5eXp5RXJ1Vk1DVzl6bnRobnduU3UzQzAyOWlmR2NDVnM2c2lUaTNxNzBw?=
 =?utf-8?B?M01kQjhLbWZVenJqaWRkTzc0SU15VzRLQ1hEbERGRWFBeTBiUi9CSUhEREZZ?=
 =?utf-8?B?TGhBMHVZUlcydXZOWkg5dkFVbGhkZmRQM3JGeVdYT2VrMGxLT0NTT2ZhbERD?=
 =?utf-8?B?SUNXZkxmQmpPQkhPQnhqYVZYUlhyWU9oVm1sY1FsMlFzdEViL1FZcmN2RU1K?=
 =?utf-8?B?enNaNGw0Z01LZER4NThaUmZFb2I3clptTUtaaVdkV0Y4OVRxOVNvTFRxVnNX?=
 =?utf-8?B?TEhsRHhMV0x3TVMwUi9FNmpQbC83ektTWGpBblpCU3RBaG9JdVRQYjhaSzhs?=
 =?utf-8?B?L2M4bUxQUVR0dW82VmZzTUJDL0dXNXNBSFg3dTBqZWFkRElKcEU0UnhweXI4?=
 =?utf-8?B?N3ZERVNRTFkzT3VoejFmUHJSUUYvSTFZejVLMFN5ZlJOUGJIVTZwc3dFU0Vy?=
 =?utf-8?B?N2hDd2FVamtncllHQ1A1RnZKWUdBT2g2a0xyYXhPQmJlYk9PQWNQcmJmcCtK?=
 =?utf-8?B?SDhUTlB5RVVMSzVXR0UzcWRUZXVpUk4weTlaWktKM0NYTGNFUTFJWTFjeGt6?=
 =?utf-8?B?amZKZ0lTZWZhNnVBRTJZaTFQRFZxNFM1WlY2cWVNcStTaVc2b0k3RWlsdWlW?=
 =?utf-8?B?NFFVVHhpZlRHVWdiZElSYTBmUVlTWUZIc1hzS2p4RE85NWkvNE1Mc3Q4SERL?=
 =?utf-8?B?UUNzbEkzVWZQZG9GK3NFWHJXZHpxNVNJRG9wc0haTGlPVnppbmhITWNLTUND?=
 =?utf-8?B?ODA5azVkMUpqZURCYU15ZDhISTBOWG03eEFkb282ZndpSHc5NWpUZyt1Y2RX?=
 =?utf-8?B?ZWljckVhM3hTWkp4MldhODVTcnVDRngvYWxYOHpndUhPWUpJTi8wSG1uS1Y0?=
 =?utf-8?B?cUZoOVMxRzNZYjFxbXhmUWpOVGEwV1BWUFFRdXRrWE9EYnVsWDUxcVVCSXkz?=
 =?utf-8?B?NTR0VWtiMWNnL1FVdDlzOEs0eWp0SVJaYXFMLzdiN0hPQlVsNTUvRGV2Yzd1?=
 =?utf-8?B?MnJDUlluZkNndGlQTmFKQldSRFJMKzV4bWxpVHA0NnZ2TmdKaThOZUZUUk44?=
 =?utf-8?B?WnM2S0Y1d1hjWS9YT1FPc290VXEyTXduY0UvYjZPbys4VnJRL1V3bVp3RU9u?=
 =?utf-8?B?Wm5jRmN5VmVuS0VPR1FHbE1JdVpsakI4WHZZM1IwWU1JUTZrbGNVM0NkVEdw?=
 =?utf-8?B?TGpDK0hwemdnbUZLaFZKa2pUUmZtc3hGc2MwekxpUmRVU0wzRUF3V0doZ2M4?=
 =?utf-8?B?R0RwT3VOWEVuQXhJb3pQSll5UHdUWFFNcUl4ei9yNFo3VEVVMHVXSHhua3gv?=
 =?utf-8?B?VVVQS3lzdVBMaVpqekxSakQ2M1c4a0UzMERVa3k0b1hEMWtWTG45TGZvTFM4?=
 =?utf-8?B?RHVxYUJzYVNuRUpSR2hVTnVxYmVmRXVzR09QTFRQNlJHa1VyclZ1QUl6VjJ1?=
 =?utf-8?Q?MwLNsfML?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34479768-189f-48ba-137d-08d8c3729b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 09:53:46.8497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6CWq7IfCQLiOCYiV5eURL9lRTW8rSBPEFP+7OnEMvGcr8AcxaFxWkVgImsD++oNKOfRO5itYENqOdiprImzph+NBGxdylqIb87U8Z3lu7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7140
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_05:2021-01-27,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>, qemu-level <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 John Levon <john.levon@nutanix.com>, "mreitz@redhat.com" <mreitz@redhat.com>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+IEkgdW5kZXJzdGFuZCB0aGF0IHRoaXMgZnJhbWV3b3JrIGlzIHRhcmdldHRpbmcgS1ZNIGFu
ZCBtb3N0bHkgUENJDQo+ID4gZGV2aWNlcyBidXQgSSB3YXMgd29uZGVyaW5nIGlmIGl0IGNvdWxk
IGJlIG9mIGFueSB1c2UgZm9yIGZ1bGwgc3lzdGVtDQo+ID4gZW11bGF0aW9uLiBXb3VsZCBpdCBw
b3NzaWJsZSB0byB1c2UgdGhpcyBmcmFtZXdvcmsgdG8gaW50ZXJjb25uZWN0DQo+ID4gUUVNVSBw
cm9jZXNzZXMgZW11bGF0aW5nIGRpZmZlcmVudCBtYWNoaW5lcyBidXQgc2hhcmluZyBhIGNvbW1v
biBidXMNCj4gPw0KDQpOb3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBieSAic2hh
cmluZyBhIGNvbW1vbiBidXMiLCBycmUgeW91IHRhbGtpbmcgYWJvdXQgYSBzaGFyZWQgYnVzIHdo
ZXJlIGEgbWVzc2FnZSBzZW50IGJ5IG9uZSBRRU1VIHByb2Nlc3MgaXMgdmlzaWJsZSBieSBhbGwg
b3RoZXIgUUVNVSBwcm9jZXNzZXM/DQoNCj4gDQo+IFdlIGFyZSBldmVudHVhbGx5IG1vdmluZyB0
b3dhcmRzIGEgdmZpby11c2VyIGZyYW1ld29yayB3aGljaCBpbXBsZW1lbnRzDQo+IFZGSU8gb3Zl
ciBzb2NrZXQuIFdoYXQgeW91IGFyZSBlbnZpc2lvbmluZyBjb3VsZCBiZSBzb21ldGhpbmcgaW4g
dGhlDQo+IGV2b2x1dGlvbiBvZiBRRU1VIGRldmljZXMgaW4gdGhlIGZ1dHVyZSwgYWx0aG91Z2gg
VkZJTyBkb2VzIG5vdCBzdXBwb3J0IGFsbA0KPiB0eXBlcyBvZiBkZXZpY2VzIHByZXNlbnRseS4N
Cj4gDQo+IEkgYW0gZm9sbG93aW5nIHRoZSBlZmZvcnRzIHRvIG1vZHVsYXJpemUgUUVNVSBkZXZp
Y2VzIGludG8gcnVudGltZSBsaWJyYXJpZXMsDQo+IHdoaWNoIHByb2JhYmx5IHdvdWxkIGJlIG9u
ZSBvZiB0aGUgc2lnbmlmaWNhbnQgc3RlcHMgdG8gZW11bGF0aW5nIGRldmljZXMgaW4NCj4gZGlz
dHJpYnV0ZWQgZmFzaGlvbi4NCj4gDQo+ID4NCj4gPiBVc2luZyB0aGUgcHJveHkgb2JqZWN0LCBj
b3VsZCBhICJzbGF2ZSIgUUVNVSBtYWNoaW5lIChob3N0KSBjb25uZWN0IHRvDQo+ID4gYSByZW1v
dGUgZGV2aWNlIGltcGxlbWVudGVkIGluIGFub3RoZXIgUUVNVSAoYm1jKSBtYWNoaW5lID8gb3Ig
YXJlIHdlDQo+ID4gY29uc2lkZXJpbmcgdGhhdCByZW1vdGUgcHJvY2Vzc2VzIGFyZSBkZWRpY2F0
ZWQgdG8gZGV2aWNlIG1vZGVsaW5nIGFuZA0KPiA+IG5vIG1vcmUuDQo+IA0KPiBQcmVzZW50bHks
IHdlIGFyZSBhZGRyZXNzaW5nIHRoZSBjYXNlIHdoZXJlIHRoZSByZW1vdGUgZGV2aWNlIGlzIGlu
IHRoZQ0KPiBzYW1lIG1hY2hpbmUgYXMgUUVNVS4gTW92aW5nIHRoZSByZW1vdGUgZGV2aWNlIHRv
IGEgZGlmZmVyZW50IG1hY2hpbmUNCj4gaGFzIGEgbmV0d29yayBib3R0bGVuZWNrIC0gdGhlIHBl
cmZvcm1hbmNlIG9mIHN1Y2ggYSBtb2RlbCB3b3VsZCBkZXBlbmQNCj4gb24gdGhlIHBlcmZvcm1h
bmNlIG9mIHZhcmlvdXMgcHJvdG9jb2xzIGxpa2UgUkRNQSAoZm9yIHJlbW90ZSBETUEpLCBldGMu
Li4NCg0KVGhlIHZmaW8tdXNlciBwcm90b2NvbCBkb2VzIHN1cHBvcnQgdGhlIHJlbW90ZSBkZXZp
Y2UgdXNlIGNhc2UuIEFzIEphZyBwb2ludGVkIG91dCwgcGVyZm9ybWFuY2Ugd2lsbCBiZSBwb29y
ICh0aGVyZSBtaWdodCAoPykgYmUgd2F5cyB0byBpbXByb3ZlIGl0KSwgYnV0IGlmIGNvbW11bmlj
YXRpb24gaXMgb25seSBvY2Nhc2lvbmFsIHRoZW4gaXQgbWlnaHQgd29yayBmaW5lLiBUaGUgdmZp
by11c2VyIHByb3RvY29sIGlzIGludGVuZGVkIGZvciByZW1vdGUgZGV2aWNlIGltcGxlbWVudGF0
aW9ucywgaG93ZXZlciB0aGlzIGRvZXNuJ3QgcHJlY2x1ZGUgYmVpbmcgdXNlZCBmb3IgYSBkaWZm
ZXJlbnQgcHVycG9zZSwgcHJvdmlkZWQgdGhhdCBpdHMgcHJpbWl0aXZlcyBhcmUgc3VmZmljaWVu
dC4gV2hhdCB3b3VsZCB5b3VyIHJlcXVpcmVtZW50cyBiZT8NCg0KPiANCj4gVGhhbmsgeW91IQ0K
PiDigJQNCj4gSmFnDQo+IA0KPiA+DQo+ID4gV2hhdCBJIGhhdmUgaW4gbWluZCBmb3IgdGhlIG1v
bWVudCBpcyBMUEMsIEZXIGFkZHJlc3Mgc3BhY2UgYW5kIHNvbWUNCj4gPiBJU0EgZGV2aWNlcywg
YnV0IHRoZSBsaXN0IGNvdWxkIGV4dGVuZC4NCg0KV2hhdCdzIHRoZSBiZW5lZml0IG9yIHJ1bm5p
bmcgYSBkZXZpY2UgcmVtb3RlbHkgaW4geW91ciB1c2UgY2FzZT8NCg==

