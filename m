Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F052DCF1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:42:51 +0200 (CEST)
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrl6o-0003vC-BO
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nrl3v-0002dl-KS
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:39:51 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:16540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nrl3o-0001QZ-74
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:39:50 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JH9EN1008961;
 Thu, 19 May 2022 11:39:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=Vw2gOvQWY8cVTOqoszpl4DU5m3+TLCwW+RucuH0An7I=;
 b=ba0/s2wU6m7c4g/+Sh08L+QgeI3oPd4PRhS8jkcH+elp5TAnZ7Qkjnmq27Jpp1l7uMT+
 1fNgjkH45dpVHYCyZdONUKLrFN/MtWV5xnxUrpWqXjG3wfPAQTjGDngl433jD1Ij5diA
 N14EJjZSuhVXHuFuCR4GRi4cDrPMLrMQQONQCoe7wjX827TxJTf1acgujA2Adn9r/lRy
 fkw7G1nltynjM0NLOQMGIWuG8MabPVvasfFex5nact+Of1izBGTnLW3Dwm6YV7suFUDF
 aRJjcxjngfcllyn4Dsjw1uEc/jadhltvhRwBL2yJX1LpAon1B+P559EMwmjknFgIH3gY SA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3g28ruuw62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 11:39:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8J+WFSPGWKXX3emefG4FVwpKveC7xg6KD7x+Vbv/xV4tbmUbU4LsFje0eAN95Unuy2wytrApzXtReRCEpVR5aIaP0fSGXnIoceceR0Au4gG5GAflCId8pFMwe1aGqX990ajE7XvRd/sahFMOi2QEz8T+XXUc1fq8i8v3J4mKIa1k5mM5MrcDBGZRBASB8iDLhki9cxjmeVD9gzQFn9KFAcvdPxAYhVumib3jVCHBaRCW+XhYzVNNxct87BLeoKi2NYqNomf7DwsMgOaj5kXhDj1pigDtT/oZ1fS7pjwFGrDXT2OcWojYJUJcBt02L2ph6EyCiHwkTggdKQFlKGfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw2gOvQWY8cVTOqoszpl4DU5m3+TLCwW+RucuH0An7I=;
 b=VGfnJOhgrNXF07Km7CYPIE5koDn/64AkCDL68Emq/FPTruly6mTie7MFJncRdmJLM7kqMRdjOBxNlxL7PH/FO1OOkWT/sYTHYyBRQTB3eRsAmqueekMULzuvzq3BTQ2zQkOr2G01wg4gX+MjxvUn6fSVgYgwkAHMrGy2c3XilIpKkt9vxqkp+O42w+m1WuoHLFrYQquLyxBhn9jvKxrbdgYYQiq9nDfSCfpuaZUaW8gKJ1IIPMWjch/kJW+V+MXlwq/nn/88i+GRRcqUUsssXEPpgYxiOzM7yz7Vy87jN+vIT5r99t0kg0oUcrYZBay2mma/eWM9XNsPQGnPQmOWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB5982.namprd02.prod.outlook.com (2603:10b6:208:116::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 18:39:39 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%8]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 18:39:39 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: Raphael Norwitz <raphael.norwitz@nutanix.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, Alexis Lescouet
 <alexis.lescouet@nutanix.com>, Felipe Franciosi <felipe@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>
Subject: Re: Accelerating non-standard disk types
Thread-Topic: Accelerating non-standard disk types
Thread-Index: AQHYaUvCbyr7NDMI806tQ3+qwDN2D60jGH0AgAN0gQA=
Date: Thu, 19 May 2022 18:39:39 +0000
Message-ID: <20220519183938.GB13470@raphael-debian-dev>
References: <20220516173831.GB13284@raphael-debian-dev>
 <fb522282-c750-2652-2e27-87c68819100b@redhat.com>
In-Reply-To: <fb522282-c750-2652-2e27-87c68819100b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a972c98e-9931-4c62-573a-08da39c6ee6e
x-ms-traffictypediagnostic: MN2PR02MB5982:EE_
x-microsoft-antispam-prvs: <MN2PR02MB5982F8A882256CC9FAD552DBEAD09@MN2PR02MB5982.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zTH9vrYw55yaPo/giWCMKwF6nu6d736a5Rqz6m63EhZj+kpA2Mno5OkSZqcbVguvb0VUXfk4V4Vnqy67hnfpBz2ImkMv+ir+VUmeHW8cRaLnut03MENI8QA5dMlkp7dmIiQmaIyO0Kq6at7lYWj4qXJuKnDt/LTzrUJFzZBim2zeEAWqqZtHs5j6owRyw2PtGO07gbh0gvkeiUbdilD55PKufiSfah63A4qcaKZ06t3m+GQEyywxHtLv3k2cnjkAe3oUX+9j/WlMagRu4C3zO3wcA5/tZqKPiWHTpDjAsK69kCB6l/HRWQJqXPzkoJRCz+k0GZA4/8k2bnTzyWMteFvdT+E4x0eDoMUAq3aLJcFo3hHE2Gg/Q9TxgJKXtdBtegBfQIFED94hufzNCSX/VdmvAMN17jGmvYVdj2k8/tptlrcaZyd52fsyW7Dv1R9H2RYq8RIgW7QVtRF+Xgigr9rXZzl2nKYL8kZYoZEz4vlnDgWQDHfj7GGzOsoIt2d1nRotTHJWD1FySD8b4aBmsPlrjh6wrAbG4wD3CmpPKqSdz9oLC9HmF2HLqA4SUKknL6rPrS9qv+3eGXn0OJvQSlOtNKiyn5F445NpMzpEtY9k7DcKVNiHMHKSyuOSGh1PNAh49SaI/BAhb67SVAYjuqkFHTc/JZ4EcmtEBZNN2N1zMm0KQsyOteSzn9htBE2+1NyuLnlEWprO4+POEI27BzKFsTAAmlxn5Fm7QwVZOG6U5gSL5Z5OYxNd79IbUpKZX6ejsy7twmmOvGOKNQ24rfVcT0N6YhtNKreVTMXMidFvzLNKnkkEsu7SP1m7sXF2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6916009)(8936002)(966005)(33716001)(6512007)(9686003)(26005)(5660300002)(33656002)(6486002)(508600001)(6506007)(122000001)(86362001)(54906003)(66446008)(38070700005)(2906002)(66946007)(186003)(66556008)(38100700002)(64756008)(76116006)(66476007)(91956017)(4326008)(3480700007)(71200400001)(53546011)(8676002)(316002)(44832011)(1076003)(175924003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ems1aURDVXV1dm4zRFFabkRsOFVCR2s0STc1Q0lFQVA5YTlPZzhyK0JuNHB5?=
 =?utf-8?B?a05PTm5mb2dTRk9uNzhaeU1EblNIRi9VWTk2YnFmVTlRMzlXRWtEOVhhTnhh?=
 =?utf-8?B?MzQra0t0bUxRRVFqM3Npb2tpKzJCYTZRM0tjbm9jOVlsc0RNS3BuZFRWK08x?=
 =?utf-8?B?NWpiSTZKVG9uSnR1VnhncWVzR0ZkQ1p2YjdLN2ZMYkdqaENQWSs4dGJyT0pU?=
 =?utf-8?B?aEFoQ29KOVBaMGhrTEVmRThFaXBJSXkwMDc1TUM5d0ZGZTlWNjhIRW5FeGpQ?=
 =?utf-8?B?bFpRSXpLb3I0UFNUdmVweitZbFYvZ1F1OE8vQW9vTmpNRVNFS2xPbThad1FP?=
 =?utf-8?B?UmdiWFd2aXpnZ3ZtVU1TRThvMWx6ZmtXU2JvZFQ1REUzdkx6clVmZ3BYVjdt?=
 =?utf-8?B?UWI4L1phcHB0YmszUnpKV0hpekNUWi8yYXc5ZWc4b2t5cms0c2p3QzBQYlc4?=
 =?utf-8?B?RXhmcUJUZHgvSVZucGIwUXZKQ0wxVXdhcHVsM3lKaHRhUlA2OGZjL21SYjBi?=
 =?utf-8?B?dkJMYXJvUkszaXk4eUxZQjN5dzErSnJWak9teDNjR1VTclR5VUdEMlJDZEVu?=
 =?utf-8?B?a3pzUHgxUnZnZWo0QW4veHhjeFMrKzdoK3NvbDlQYkZWNURKc0JZT1JzQnpr?=
 =?utf-8?B?bVJVVTNRcTFGdWpqalZSVjkxQWhORGJvT0pJQ2NHNFRGaGFKRVRNT2xLaTNR?=
 =?utf-8?B?Uk4vWDlDVElyK0RMMzRLRHpUUW5qYlYrNlRUN2F4YThsSld5WUxmOGJLMEVR?=
 =?utf-8?B?Snk5U0ErTDVmYzN2KzdLSEpwOXh3ZWFSQ3hFSGZ3Y1F2TU0vb2RIb2xFdkJv?=
 =?utf-8?B?RXBnalMrSGVZOWNkUHg2S3Y5a1BsdlBmRkt5UHhiOFRvdnVqZ2tTZEp2TU5S?=
 =?utf-8?B?N080K29hSWZoN2s4WEM1WUdhemp1cG9MNzJMNnQ4RXd4aEhIRDdDVEtPeDJG?=
 =?utf-8?B?L01wQThacWpiMWFmWU5aTFBlNlkzSFVRUkV6N05aOXR1b0pTbkx6a2N6c3V4?=
 =?utf-8?B?ckhOeFg2Q3JVblArNGd4cUxUWmVpQlJrZFZhcGpha1VJbk1kZWJhUlhpRFRM?=
 =?utf-8?B?Z1dMMnZZc3JnSVh6MDBTdFNEeUxmVmxvN0wxUWo0Z2UvV1QzOG1wbkFmUVZz?=
 =?utf-8?B?UFdZcFNZUmYzSnhIMUxCeE0vOG9pcjBRUnJicEJXVkh2eGVUY1MvSkpiUHpm?=
 =?utf-8?B?SEVyaVZkTUtlUkNVR0xJT2F1aGc0T3MxRnhnZ3hLNHRuNG1OV2VZbEw5TjVz?=
 =?utf-8?B?SUVaOWlFL0tyc3JNWkFjdVFaVHlMNzhZSnNPdmJwV1pwVzZLR2dweDJ6OHdp?=
 =?utf-8?B?QVczUGJRZnlaWHFLVkxaM2MrdDd6Qnl5d1JJS3Y0aDRmREdtRi9zWVdqVmYr?=
 =?utf-8?B?b1l4Z1E5eXE2aXFIOFkwWWkxRFdSRHY5TFdLeXQxNUZzMlhlVm9IOGRNTm5n?=
 =?utf-8?B?Q2lUY2pidWJRNmZMcGFOYXpyKzlTYXJWQzFQU0hscUU3WThEMjlFclV2K2xa?=
 =?utf-8?B?dVQrMlhXd1VjVGF3UmgzVnBybks0bitsckNSWWcvamh6ckRhU1liQlNFV1l2?=
 =?utf-8?B?Y3MxQ0RzbFBLMm5LYXJqRE1BTmVFdjRuM0tiM2xzMWhieW1McTJQcTZPRExP?=
 =?utf-8?B?b09CUllobXplUGY1TGJRY0hBejM0TzlEeWhITDdrZ2RJMHdIcys4dlVab3dS?=
 =?utf-8?B?MUpDY2JNL3k0RDZjNE43dTdNTHRoem5icjgyWDNYbjdCemhNZkpKenhRWWo0?=
 =?utf-8?B?SzdjcFFwWW9aUUZHV1p1TW5DbloxelNnQXorTllkbnJvT2I1aDd2dlp4elhv?=
 =?utf-8?B?K0JIcnRCWDVQbm5pRkxnb0hpMVF5Y0ZNZ2lFbmFNOXltT09YaEhkWDBwRTM0?=
 =?utf-8?B?SlFUdUNTNFRlTXFUTER0NXRzVHFVMXU0dW9OVFdubzZmdUZMR0F6Y3ZRNEQv?=
 =?utf-8?B?dzNCdnEwMFBaWlo2bWRpRnFZMzNHQ3VHRkxjUUVXUVM5YnVHODZrVXRvb1pq?=
 =?utf-8?B?MjgwNlNUTmFGQVQ0R1ZGZ0dnRVpWeGVteDNvbVUyajV2Wm9MT2tiZjBRSVNj?=
 =?utf-8?B?N2FkWnI5MWQxVzN0SEZsdDJyUEJQZnZiaEdjUjhCQmxYdVVkQkw3NlI4L1Bk?=
 =?utf-8?B?cTE3SUZCTTIvWUVBZXo3ZjdVRERISjA2ZW9wN0lkS3g4Qm1SU1pmNDVEL0VQ?=
 =?utf-8?B?QVVKMktpNjFTdU9DTEQrRXFrZlI4clFMcVpQRjh5VHk3ZU1nZ1N5dUZDUE94?=
 =?utf-8?B?NVJ3Zis5QXp6WDd2UDR3ckNRb2g5aW1pS0ZxdloweDFZOWNUWVFoaktjY2Ew?=
 =?utf-8?B?NThiTDJVRWNLM1ptZEVwamJNVysraVN5ZjJhekxpZCtHaks5clZwL3c2eWJy?=
 =?utf-8?Q?2/nmQMmfZkGPnu6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BE32E0D734EE6458FEFE7B113E8DCB2@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a972c98e-9931-4c62-573a-08da39c6ee6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 18:39:39.2550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgJ4I+6q/Oe0b7daJ2+gTemOEV/X7HrFX2vmguW6ecz4Nv3UyjBTs+h/BbjIf+mUk3l2Zt1oH2z7BADi1Hc3gk2laFIa29UEkwxA5jiYrWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5982
X-Proofpoint-GUID: 9wbe2zVprkgZORMyp3e_n2eGUv2FpZXx
X-Proofpoint-ORIG-GUID: 9wbe2zVprkgZORMyp3e_n2eGUv2FpZXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_06,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCBNYXkgMTcsIDIwMjIgYXQgMDM6NTM6NTJQTSArMDIwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToNCj4gT24gNS8xNi8yMiAxOTozOCwgUmFwaGFlbCBOb3J3aXR6IHdyb3RlOg0KPiA+IFsx
XSBLZWVwIHVzaW5nIHRoZSBTQ1NJIHRyYW5zbGF0aW9uIGluIFFFTVUgYnV0IGJhY2sgdkRpc2tz
IHdpdGggYQ0KPiA+IHZob3N0LXVzZXItc2NzaSBvciB2aG9zdC11c2VyLWJsayBiYWNrZW5kIGRl
dmljZS4NCj4gPiBbMl0gSW1wbGVtZW50IFNBVEEgYW5kIElERSBlbXVsYXRpb24gd2l0aCB2Zmlv
LXVzZXIgKGxpa2VseSB3aXRoIGFuIFNQREsNCj4gPiBjbGllbnQ/KS4NCj4gPiBbM10gV2UndmUg
YWxzbyBiZWVuIGxvb2tpbmcgYXQgeW91ciBsaWJibGtpbyBsaWJyYXJ5LiBGcm9tIHlvdXINCj4g
PiBkZXNjcmlwdGlvbiBpbg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92
Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMuZ251Lm9yZ19hcmNoaXZlX2h0bWxfcWVtdS0yRGRldmVs
XzIwMjEtMkQwNF9tc2cwNjE0Ni5odG1sJmQ9RHdJQ2FRJmM9czg4M0dwVUNPQ2hLT0hpb2NZdEdj
ZyZyPUluNGdtUjFwR3pLQjhHNXA2TFVyV3FrU01lYzJMNUV0WFpvd19GWk5KWmsmbT13QlNxY3cw
Y2FsM3dQUDg3WUlLZ0ZnbXFNSGpHQ0MzYXBZZjR3Q24xU0lyWDZHV19GUi1KOXdPNjh2LWN5cnBu
JnM9Q1AtNlpZLWdxZ1EyekxBSmRSOFdWVHJNQm9xbUZIaWxHdldfcW5mMm15VSZlPSAgIGl0DQo+
ID4gc291bmRzIGxpa2UgaXQgbWF5IGRlZmluaXRlbHkgcGxheSBhIHJvbGUgaGVyZSwgYW5kIHBv
c3NpYmx5IHByb3ZpZGUgdGhlDQo+ID4gbmVzc2VzYXJ5IGFic3RyYWN0aW9ucyB0byBiYWNrIEkv
TyBmcm9tIHRoZXNlIGVtdWxhdGVkIGRpc2tzIHRvIGFueQ0KPiA+IGJhY2tlbmRzIHdlIG1heSB3
YW50Pw0KPiANCj4gRmlyc3Qgb2YgYWxsOiBoYXZlIHlvdSBiZW5jaG1hcmtlZCBpdD8gIEhvdyBt
dWNoIHRpbWUgaXMgc3BlbnQgb24gTU1JTyB2cy4NCj4gZGlzayBJL08/DQo+DQoNCkdvb2QgcG9p
bnQgLSB3ZSBoYXZlbuKAmXQgYmVuY2htYXJrZWQgdGhlIGVtdWxhdGlvbiwgZXhpdCBhbmQgdHJh
bnNsYXRpb24NCm92ZXJoZWFkcyAtIGl0IGlzIHZlcnkgcG9zc2libGUgc3BlZWRpbmcgdXAgZGlz
ayBJL08gbWF5IG5vdCBoYXZlIGEgaHVnZQ0KaW1wYWN0LiBXZSB3b3VsZCBkZWZpbml0ZWx5IGJl
bmNobWFyayB0aGlzIGJlZm9yZSBleHBsb3JpbmcgYW55IG9mIHRoZQ0Kb3B0aW9ucyBzZXJpb3Vz
bHksIGJ1dCBhcyB5b3UgcmlnaHRseSBub3RlLCBwZXJmb3JtYW5jZSBpcyBub3QgdGhlIG9ubHkN
Cm1vdGl2YXRpb24gaGVyZS4NCg0KPiBPZiB0aGUgb3B0aW9ucyBhYm92ZSwgdGhlIG1vc3QgaW50
ZXJlc3RpbmcgdG8gbWUgaXMgdG8gaW1wbGVtZW50IGENCj4gdmhvc3QtdXNlci1ibGsvdmhvc3Qt
dXNlci1zY3NpIGJhY2tlbmQgaW4gUUVNVSwgc2ltaWxhciB0byB0aGUgTlZNZSBvbmUsDQo+IHRo
YXQgd291bGQgdHJhbnNsYXRlIEkvTyBzdWJtaXNzaW9ucyB0byB2aXJ0cXVldWUgKGluY2x1ZGlu
ZyBwb2xsaW5nIGFuZCB0aGUNCj4gbGlrZSkgYW5kIGNvdWxkIGJlIHVzZWQgd2l0aCBTQVRBLg0K
Pg0KDQpXZSB3ZXJlIGNlcnRhaW5seSBleWVpbmcgWzFdIGFzIHRoZSBtb3N0IHZpYWJsZSBpbiB0
aGUgaW1tZWRpYXRlIGZ1dHVyZS4NClRoYXQgc2FpZCwgc2luY2UgYSB2aG9zdC11c2VyLWJsayBk
cml2ZXIgaGFzIGJlZW4gYWRkZWQgdG8gbGliYmxraW8sIFszXQ0KYWxzbyBzb3VuZHMgbGlrZSBh
IHN0cm9uZyBvcHRpb24uIERvIHlvdSBzZWUgYW55IGxvbmcgdGVybSBiZW5lZml0IHRvDQp0cmFu
c2xhdGluZyBTQVRBL0lERSBzdWJtaXNzaW9ucyB0byB2aXJ0cXVldWVzIGluIGEgd29ybGQgd2hl
cmUgbGliYmxraW8NCmlzIHRvIGJlIGFkb3B0ZWQ/DQoNCj4gRm9yIElERSBzcGVjaWZpY2FsbHks
IEknbSBub3Qgc3VyZSBob3cgbXVjaCBpdCBjYW4gYmUgc3BlZCB1cCBzaW5jZSBpdCBoYXMNCj4g
b25seSAxIGluLWZsaWdodCBvcGVyYXRpb24uICBJIHRoaW5rIHVzaW5nIEtWTSBjb2FsZXNjZWQg
SS9PIGNvdWxkIHByb3ZpZGUNCj4gYW4gaW50ZXJlc3RpbmcgYm9vc3QgKGFzc3VtaW5nIGluc3Rh
bnQgb3IgbmVhci1pbnN0YW50IHJlcGx5IGZyb20gdGhlDQo+IGJhY2tlbmQpLiAgSWYgYWxsIHlv
dSdyZSBpbnRlcmVzdGVkIGluIGhvd2V2ZXIgaXMgbm90IHJlYWxseSBwZXJmb3JtYW5jZSwNCj4g
YnV0IHJhdGhlciBoYXZpbmcgYSBzaW5nbGUgImNvbm5lY3Rpb24iIHRvIHlvdXIgYmFjayBlbmQs
IHZob3N0LXVzZXIgaXMNCj4gY2VydGFpbmx5IGFuIG9wdGlvbi4NCj4gDQoNCkludGVyZXN0aW5n
IC0gSSB3aWxsIHRha2UgYSBsb29rIGF0IEtWTSBjb2FsZXNjZWQgSS9PLg0KDQpZb3XigJlyZSB0
b3RhbGx5IHJpZ2h0IHRob3VnaCwgcGVyZm9ybWFuY2UgaXMgbm90IG91ciBtYWluIGludGVyZXN0
IGZvcg0KdGhlc2UgZGlzayB0eXBlcy4gSSBzaG91bGQgaGF2ZSBlbXBoYXNpemVkIG9mZmxvYWQg
cmF0aGVyIHRoYW4NCmFjY2VsZXJhdGlvbiBhbmQgcGVyZm9ybWFuY2UuIFdlIHdvdWxkIHByZWZl
ciB0byBRQSBhbmQgc3VwcG9ydCBhcyBmZXcNCmRhdGEgcGF0aHMgYXMgcG9zc2libGUsIGFuZCBh
IHZob3N0LXVzZXIgb2ZmbG9hZCBtZWNoYW5pc20gd291bGQgYWxsb3cNCnVzIHRvIHVzZSB0aGUg
c2FtZSBwYXRoIGZvciBhbGwgSS9PLiBJIGltYWdpbmUgb3RoZXIgUUVNVSB1c2VycyB3aG8NCm9m
ZmxvYWQgdG8gYmFja2VuZHMgbGlrZSBTUERLIGFuZCB1c2UgU0FUQS9JREUgZGlzayB0eXBlcyBt
YXkgZmVlbA0Kc2ltaWxhcmx5Pw0KDQo+IFBhb2xv

