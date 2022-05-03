Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3F519259
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:33:50 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm21d-00079M-QQ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1JD-00063C-3f; Tue, 03 May 2022 18:47:55 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:47456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1J4-00013l-HH; Tue, 03 May 2022 18:47:53 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243HG2AG027666;
 Tue, 3 May 2022 15:47:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=zWLKo0sCNXWw1FxOdf6mZNA8RM/f290uCJZLmomnB0s=;
 b=X1+J45pTkw5mp+2MX6PkMEsf6S1GK/YNpBpuIzLZZnJfrS5x7uNqB53cQxm2IAmvg9f6
 EEiqYt76CFxC6U80arPHSN6kJXEtrm48qxVeZ3jDbWvehdQp/S4kt3v9ZJOVq39QCWCZ
 kq+xSt1FRr6TtaSFzxvjNtc770nyVi/0XmI= 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fs2mxm24c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0Ke5LyCzVWaoa/OuxGqM7cIlX86hKoEuEAQzEtLQxld1jJuPejjYpe7nHbgfUvx52pKPkYJGysPTirR6G62ph2hPNZ2OA1Q1PoJdJKP/+B/HvgPos5vRe3RoN4cyaKZMc6V2vXXF1wVxhv4U+vwLSPUNEpz5yKradf8Sz7vua/y/BaYF2SsThMTUweLCwYJYbRltpymedy7rRhMGeNM7dE7lLgiJKXmrIM+xDI+zeoZaIejAVBX8mQoA1KhM5qWxPfuAMZwnGzzNbc/KkIkD2MoP5DWFJkfuLbGyUqidtFjuV/SLYjywyetl059+uzsO9p5guzYXtKPFTDI/w5ZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWLKo0sCNXWw1FxOdf6mZNA8RM/f290uCJZLmomnB0s=;
 b=PHWUcscXFwr5jO2FcW6Akrj3hYXdNH/TDGySjrC+xZTEFD2bZB3V61+qVMxFWlbvd+meCZNUgKHOvH+ut4d9tCqq78EWeNxVSqIFsAydTX8gu7uOtIcENFO8vswJmR49bK0wET53bo+Qg0xqh+IIYVH36yvXwGkkT/6AR1IEFvl1pCeR2A2ceToEti73nZxLudBTuLhFht/QUwJaXB9BJgRQP5/EWpGAd23iZUYVcdcEypl9TgOAXzG1GmMwhkTY2MryvtTIsOfbdj+bz+UY943CkDoMX6GJc3GAxooJAn7JcWjD60pxZ+mPP2nics24631BAcohZbXidMIiL89TTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB3925.namprd15.prod.outlook.com (2603:10b6:5:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 22:47:41 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541%4]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 22:47:41 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYXy6+7tiiaA0Gq0SF+yxrT9QWG60NrPWAgAAUQwA=
Date: Tue, 3 May 2022 22:47:41 +0000
Message-ID: <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
References: <20220503204451.1257898-1-pdel@fb.com>
 <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
In-Reply-To: <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adf9832a-74bb-48e0-e285-08da2d56ee46
x-ms-traffictypediagnostic: DM6PR15MB3925:EE_
x-microsoft-antispam-prvs: <DM6PR15MB39250A86FBB8487C0F890D54ACC09@DM6PR15MB3925.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m2qCA2OFtQWTaE8pSqLxezLX/STZUhmAiFuPHay5qJN4P7zjvsupvLgV1Hc+3yz75KbwtmDja7rmwzvwemKeNKm9Z9QCPLwyS3hF0iNkwsG4BTyXkpxjQJy8nQhLH78bFmuF6f0vlE1nyfqQFdzZExV5GKaWXbZP0n3GQJDeW3nreYTwCmArlMDbBbx42U4Ne5KfccX8XMtQv3vAW2uxMuQAwDWpkkg517klzAAeZwGFCs7H89BOu/NGklvp5Q8wpPIyFz5NjM4BjYX8UOyicesTH01KzYZUu+2p2scz4V0PcuEczEFK5ILpPMwmICzZLAV0g28ltzLzayT6ZLjxgrIux0e2IBeW0GZNjKt7GIQrBmT7oig3B7yFGUt/1d5KMXpErPkQ87v51OQmvzh9H62DUzv6piLxjXOTU4O6D5Wm02DrBR//b95LKO0wXFufk5dGRpChTMHZ3h9w6xfAjbbcVE9whLx9QsFags4AYBvvf1OpLoEwj2D0ITHZd65EVqFIBBkADNYXo1eJQ62AewhbBXjx0azw7YelusCWVQYN5Nsj7G8AShbXzM+6xnJziyTciDaeXHurlL75r+O8/9k3AeiIXi7yPybKfNEqiHpgSUiVZVBxBM98Drh7VLSRWvJF3jkg1PvoGlFTqYSnDv7atW6UMyMhd8m/sN8oB0C2tXid4LTGpZGyf3CDblPeGl9+L9bXSCwEwqBmR99q96/f4/WMoIgcWdEon52UCIfYQ5MZk55jemGWozuiJtkKSnEstsunSp3T4JyV/KdtyKLKFV1aOlhA704AhYBEdhY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(66556008)(2616005)(66574015)(8676002)(4326008)(38070700005)(64756008)(66446008)(66476007)(36756003)(316002)(38100700002)(66946007)(76116006)(54906003)(8936002)(6512007)(71200400001)(86362001)(5660300002)(508600001)(186003)(6486002)(2906002)(6506007)(53546011)(33656002)(109986005)(83380400001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjhpM3Q3cnpvcm9jRkNmTldOVGcxQjdOaTZpbENSRG03Z0ZwR3grRzFhNCtQ?=
 =?utf-8?B?dXZqTFc3RGEwZkc4T2RzYkQ0VWQxUWxLZUhXMTV1dXlwRXNhc045TXFUajlC?=
 =?utf-8?B?YXhSRXBhcFlIMVBGTysvd2xsNGd2ZjRZN1pmdHdHQ1dONzBqSFhuNzE0dVNp?=
 =?utf-8?B?amc0Wjl4VEErWGVVQ0lZOWwzeWpYNVZvcVZxcmRUcVY5U2VDdHQzaGVKSld5?=
 =?utf-8?B?Z0FHUkpBZW9IR2EwbjRvemVNMlkvRlBnekhFNXBONi9VTFY1c3ZlTW5hVDBu?=
 =?utf-8?B?Yy9IclZxek41WUd3QWFrb0ZTQmpqZ2U2UVFjUGgxYVNpbFBMdC8wYm9oekZj?=
 =?utf-8?B?SGJXdVZLWDlZWjJVYjBITzhvdWNKSGt1VDZOTDVITkUzekRHekFKaVNDdDNy?=
 =?utf-8?B?Y2tkWW1tM1hZTE5HZHZlRElEYTlnYVVhU2hrWW9BOS90N2lkKy91SUo4Z1ZQ?=
 =?utf-8?B?WWkwWS9kV0kxamhYYUxSM0trM0pXTDVEb2pJbXlkQjlKV1VNdWxqYm1zNmph?=
 =?utf-8?B?eXVnWjBlaWMvc3E5SWFkY3lreXR2THg1YVlBbWRVTWJIV056cHdrWTI0dDFr?=
 =?utf-8?B?N0lOVEpmd0xwUnFSczJsRnN1MlBHd0d5RnhvWWJqZHp2L2hTMGwxQTBoM0Z1?=
 =?utf-8?B?d3MyKzlsUVowam9BM1hVK3BKZENyRjlHMW1Pd0xvY3ZXV3E5MUhpSFQwQ0RG?=
 =?utf-8?B?SUdWNGNlM2FvdnRFZUtUYi9tL21CLzlTakxhTmhBN1FoWE9IT0pOVi9BMlVS?=
 =?utf-8?B?aldwaU1RemZGTk5EYVNMaDg5eUt4UVA2eWNEc3pVK2VidGQvSXZEQXZFT3o3?=
 =?utf-8?B?cTdmQ1FjMEJrcFIwRXJtUy80YXBNUHVpWkdSc1lJN0kvVHZmS0ViZWZZMWY5?=
 =?utf-8?B?WjdMUTkvTjF4Z2syR1lvamM4aWh5NUJBLzJuU2JkK0t3bFpVR0xuRTZZMmts?=
 =?utf-8?B?eGlHbzB0eU5IYStuVnVaNldTQWcreTVNbUU3RjRua0kzU3czTTFSbzVsZ2dS?=
 =?utf-8?B?N2FQNU5WTlcrZGdaYXlMYVFRZlZCZTg3SDdMekllMmZEWTd5TTQ3TjAwbnlN?=
 =?utf-8?B?ZHJ0akVKd01YcXA5czJqbFFXK0NINW95MjNmWXRoRi9YcTlzT2dRWG13ekp0?=
 =?utf-8?B?YVgrVU1yR2psd1F1S3JHd1VMOUxLcGRPZ2k0WVA1UFZISUtIbGt0Y3RJUkR6?=
 =?utf-8?B?eFBhOElreGplY1BwMzZsZ2JFa2pYZTNYUDhEQkxYOCtDRThVVlBYSE5sUmhy?=
 =?utf-8?B?a212dDJCNkNCU0hsSjI0SUFZUnN1dDF3Nlo5cVExd0dKNjNIN3QwdzBqQ2pK?=
 =?utf-8?B?V0NkR1ZXTzZ2cVAxZzhVeDZmWjdYajlFM09xYkhwSU1CY2xDVkExa1hrWGFk?=
 =?utf-8?B?RWd0S3BPczJmblI5ZkpOYUdFL1pRUlVNNC9Tb3ZwZjdwQTNpNlBNY1hvKzVY?=
 =?utf-8?B?Q3FJTEV3bVFhTzNVOU10NVJ0Uk5QSGFWcVB4WURTb0haa2Rja082dXRSVTRx?=
 =?utf-8?B?VTNFdlBodytLRmQvYkNmajhUUlJCSU9qMllQSG93R25CZ2pYeW0yaEZ3YnRs?=
 =?utf-8?B?ekdtZGYvbVhrMGR5ZFcvRitjbkFvTmUyaHpvby8vS1NjWEc4bzlkcUQ2RFdR?=
 =?utf-8?B?WVByRCtwV1ZFeXYvZ21YVWlpMmc5UkpwK2RMSVhTZUttb1lsRjM3NzM5RmFQ?=
 =?utf-8?B?TUVyVWFQUzlvNzJyd1BrYTdyYTFYN3ZWbmdNbHRtMjlFVjFReHlMMmFjaHBl?=
 =?utf-8?B?am9ubDdocFZ2ek1sb1ErQ05PYXdCQWJrRzVocmkyZFFJaGxLWGZqenpwVllk?=
 =?utf-8?B?ZWVDYkF3SHg4OHplQjA5bytUbVZMWWxadlRuaTYrOVN1KzgzTE56dW53MFVq?=
 =?utf-8?B?RWZRMVhDaDhkYXRCTlI1cm5GckgwNkdiWURTTE0yaE50SjNrSEd4bWNBQWlY?=
 =?utf-8?B?SDRsZDM4MGMxc2l2SHZZS1I0dWw4MHYyQjZnTzYrMzFzMnJRc1BmMkVwYmtw?=
 =?utf-8?B?UDlmczJROEN2eGNoRE9UMmVFeDh1bzROUWZiaEU4WHkyMFI1LzBucDM3Z1hr?=
 =?utf-8?B?dHZBZ3Y1MGQ1TjQ3U2p5ZWZxaHBpS2NjYTJUVFU3cUQxSWJlQ2hzMHNxTDM1?=
 =?utf-8?B?dXN3MGFGZ3p0dFRwblJxU0w4RFdUb2d0Nmo3VUI2SmZ6YjBtMnBRNGlOQ0ZT?=
 =?utf-8?B?aXJ3MEVkRlFFV3dXU2VPdmdQNC83THZnYWFKeDF2cFJ6dEdKbDR6TGo5Y1cr?=
 =?utf-8?B?SXVOWXYvay82TVkvU1FXSHc2anp5S1ZDY0k0TU01SHN1UHhoakFpRklNMGU1?=
 =?utf-8?B?RDk0SUNtUWh5M1YzSDM3ZDNuRHExMWs5YWxLTVRxNFRPOE1TYkt0cGJqYXoz?=
 =?utf-8?Q?iGGsW5QCigsGf2gE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0ACD6672197C14FBD7B611DE006EF91@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf9832a-74bb-48e0-e285-08da2d56ee46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 22:47:41.3938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLgKtxU5ayhy6RCs6uXamcVOU/rM8Kwoto/zbOq+e7waeWAwtBZq9eQtr/Osskw4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3925
X-Proofpoint-GUID: b5FZWgmqHbeLsrfNjNCGlfGp8pV2mql2
X-Proofpoint-ORIG-GUID: b5FZWgmqHbeLsrfNjNCGlfGp8pV2mql2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=61228a338c=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDMsIDIwMjIsIGF0IDI6MzUgUE0sIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gNS8zLzIyIDIyOjQ0LCBQZXRlciBEZWxldm9yeWFz
IHdyb3RlOg0KPj4gSGV5IGV2ZXJ5b25lLA0KPj4gSSdtIHN1Ym1pdHRpbmcgYW5vdGhlciBGYWNl
Ym9vayAoTWV0YSBQbGF0Zm9ybXMpIG1hY2hpbmUgdHlwZTogdGhpcyB0aW1lIEknbQ0KPj4gaW5j
bHVkaW5nIGFuIGFjY2VwdGFuY2UgdGVzdCB0b28uDQo+PiBVbmZvcnR1bmF0ZWx5LCB0aGlzIG1h
Y2hpbmUgYm9vdHMgX3ZlcnlfIHNsb3dseS4gMzAwKyBzZWNvbmRzLiANCj4gDQo+IFRoaXMgaXMg
dG9vIG11Y2ggZm9yIGF2b2NhZG8gdGVzdHMuDQoNCkVyZywgeWVhaCBJIGZpZ3VyZWQgYXMgbXVj
aC4gSeKAmWxsIGp1c3QgcmVzdWJtaXQgaXQgd2l0aG91dCB0aGUgYXZvY2FkbyB0ZXN0IHRoZW4s
DQppZiB0aGF0IHNvdW5kcyBvayB0byB5b3UuDQoNCj4gDQo+PiBJJ20gbm90IHN1cmUgd2h5IHRo
aXMgaXMgKHNvIEkgZG9uJ3Qga25vdyBob3cgdG8gZml4IGl0IGVhc2lseSkNCj4gDQo+IFRoZSBm
dWppIGhhcyB0aGUgc2FtZSBraW5kIG9mIHByb2JsZW0uIEl0IHRha2VzIGFnZXMgdG8gbG9hZCB0
aGUgbHptYSByYW1kaXNrLg0KPiBDb3VsZCBpdCBiZSBhIG1vZGVsaW5nIGlzc3VlID8gb3IgaG93
IHRoZSBGVyBpbWFnZSBpcyBjb21waWxlZCA/DQoNClllYWgsIG9uZSByZWFzb24gaXMgdGhhdCBG
YWNlYm9vayBPcGVuQk1DIG1hY2hpbmVzIGhhdmUgYW4gdW5uZWNlc3NhcmlseQ0KYmlnIGluaXRy
YW1mcyB0aGF0IGluY2x1ZGVzIGFsbCB0aGUgcm9vdGZzIHN0dWZmLCB3aGVyZWFzIHJlZ3VsYXIg
T3BlbkJNQw0KbWFjaGluZXMgaGF2ZSBhIHNtYWxsZXIgaW5pdHJhbWZzIHJpZ2h0PyBJIGRvbuKA
mXQgZW50aXJlbHkga25vdyB3aGF0IEnigJltIHRhbGtpbmcNCmFib3V0IHRob3VnaC4NCg0KSSB0
aGluayBtb3N0IEZCIG1hY2hpbmVzIGhhdmUgbW92ZWQgdG8genN0ZCBjb21wcmVzc2lvbiByZWNl
bnRseSB0aG91Z2gsDQpidXQgdGhpcyBvbmUgbWF5IGhhdmUgYmVlbiBtaXNzZWQ6IEkgY2FuIGZp
eCB0aGF0IG9uIHRoZSBpbWFnZSBzaWRlLiBJ4oCZbGwNCmFsc28gZXhwZXJpbWVudCBtb3JlIHRv
IHNlZSBpZiBpdOKAmXMgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIGltYWdlLCBvciBwb3NzaWJs
eQ0KYSByZWdyZXNzaW9uIGluIFFFTVUuIEl0IHdvdWxkIHJlYWxseSBiZSBzdXBlciBhd2Vzb21l
IGlmIGl0IGNvdWxkIGJvb3QgZmFzdGVyLA0Kc28gSeKAmW0gdmVyeSBtb3RpdmF0ZWQgdG8gZmlu
ZCBhIHNvbHV0aW9uLg0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBDLg0KPiANCj4gDQo+PiBhbmQg
SSBkb24ndCBrbm93IGhvdyB0byBvdmVycmlkZQ0KPj4gdGhlIGF2b2NhZG8gdGVzdCB0aW1lb3V0
IGp1c3QgZm9yIGEgc2luZ2xlIHRlc3QsIHNvIEkgaW5jcmVhc2VkIHRoZSBnbG9iYWwNCj4+IHRp
bWVvdXQgZm9yIGFsbCAiYm9vdF9saW51eF9jb25zb2xlLnB5IiB0ZXN0cyBmcm9tIDkwcyB0byA0
MDBzLiBJIGRvdWJ0IHRoaXMgaXMNCj4+IGFjY2VwdGFibGUsIGJ1dCB3aGF0IG90aGVyIG9wdGlv
biBpcyB0aGVyZT8gU2hvdWxkIEkgYWRkDQo+PiBBVk9DQURPX1RJTUVPVVRfRVhQRUNURUQ/DQo+
PiBAc2tpcFVubGVzcyhvcy5nZXRlbnYoJ0FWT0NBRE9fVElNRU9VVF9FWFBFQ1RFRCcpLCAnVGVz
dCBtaWdodCB0aW1lb3V0JykNCj4+IFdoYXQgaXMgdGhlIHBvaW50IG9mIHRoaXMgZW52aXJvbm1l
bnQgdmFyaWFibGUgdGhvdWdoLCBleGNlcHQgdG8gc2tpcCBpdCBpbiBDSVQ/DQo+PiBJZiBJIHJ1
biB0aGUgdGVzdCB3aXRoIHRoaXMgZW52aXJvbm1lbnQgdmFyaWFibGUgZGVmaW5lZCwgaXQgZG9l
c24ndCBkaXNhYmxlIHRoZQ0KPj4gdGltZW91dCwgaXQganVzdCBza2lwcyBpdCByaWdodD8gSSB3
YW50IGFuIG9wdGlvbiB0byBydW4gdGhpcyB0ZXN0IHdpdGggYSBsYXJnZXINCj4+IHRpbWVvdXQu
DQo+PiBUaGFua3MsDQo+PiBQZXRlcg0KPj4gUGV0ZXIgRGVsZXZvcnlhcyAoMSk6DQo+PiAgIGh3
L2FybS9hc3BlZWQ6IEFkZCBmYnkzNSBtYWNoaW5lIHR5cGUNCj4+ICBody9hcm0vYXNwZWVkLmMg
ICAgICAgICAgICAgICAgICAgICB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
PiAgdGVzdHMvYXZvY2Fkby9ib290X2xpbnV4X2NvbnNvbGUucHkgfCAyMCArKysrKysrKy0NCj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQoN
Cg==

