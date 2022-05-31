Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE0538A1A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 05:08:22 +0200 (CEST)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvsF3-0007Pg-6r
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 23:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvsDK-0006g4-EI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 23:06:34 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:63230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvsDG-0002ji-RG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 23:06:32 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V2rXEj016668;
 Mon, 30 May 2022 20:06:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=YBJIRLvKub/9u+u8jkRkIF++aFUTfheuJVN+UvChZGo=;
 b=z9Nx6pTh2c/ZvXQaHCyKg1Sotdj2rKF0cIeqDCL9myi7lc07dHzekSt3fSkrjONenaBw
 D4Q4zGuLmsZmADIWhjNV4q1d8jWjmp7eRZQv57yU9UBmOVupfkJU/pDQnSvL0pp7EoRy
 ZRrI7l2daf6GPwEXxvSt/2KTEuR25nf70E1Rq2xdJjiu9rTHfcf1lIoi/4bCekhjmtWq
 CcNGoYXEOY5rjHX++6Es3jpSkPMSxzy/vwUjqLyxYnoo3DnsvzbV30SGdjwZfqazLnUk
 jYYpD6XwhBx1uEmXJ0JFH9eeCjwz31KYYX5wXWzkgUaVaKgCujW3O2xDWYmcZn0lQ80y gg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gbg2tmayw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 20:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtV3MfTOiAzw+ukeiRPKqUo/OF/NJVRRXzikgibBgxuyNjvPZTjj3iybOLFw4c/nbXc3b9pmnOp5pUG4KdJQpFmGuyHY3heYfNnR1rIIqauAFGO75ljlo8yj6gGie4IZGADEWTq1023rPjrp8BGY9whKBo0tcuUVLuJjT7e8Etee1v5OpAvnJXwrmOcZroZhb/Mbg9kptvc4YzHi2blvyUeyBd4+bDq0V7rg3aOe9PZ1XOzv7npmS1FDg3oiWfAqtBN16k5Da3URGf4f0iPsk/A7vW0Bs/28AxBl9baOSPUH/XTx47MsJWZ/LHZUwC3a7CBaiJ3mGBiPavZrNJOmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBJIRLvKub/9u+u8jkRkIF++aFUTfheuJVN+UvChZGo=;
 b=Jc69awnEfuojMOT4fcxVU3tJxO2tpsl4V98IQ5TLrF1BEoAdSQ3mI/CvrYDlNs51W67Zqnu58Ef/RD2h/z/EreC9cjGGxv222s+cGgL0iCNmul8xh4x1fygGL2jvkWUFWtbp3gWvf6KX3ZKaxUTv9/wlRAXpC0ZYIVhVsojxMtGtq8hUqej7Q7QgcUFYTJFq+OqIjzuGrOLORzph+P+p3vkSchzw4fg5O3DtRI8+2nn1rHdiD8C1e1LKsaJU9xjbfqj4uC2Gr221X83/2afsiH14QhpEijFtvdXMKlpjKN2roxf/YLwjC+3n8wKuqslpOKK2Zkt9ax6dh2HAlv8cYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB6989.namprd02.prod.outlook.com (2603:10b6:208:20f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 03:06:20 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 03:06:20 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: Raphael Norwitz <raphael.norwitz@nutanix.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, Alexis Lescouet
 <alexis.lescouet@nutanix.com>, Felipe Franciosi <felipe@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>
Subject: Re: Accelerating non-standard disk types
Thread-Topic: Accelerating non-standard disk types
Thread-Index: AQHYaUvCbyr7NDMI806tQ3+qwDN2D60jGH0AgAN0gQCACUFoAIAH9tgA
Date: Tue, 31 May 2022 03:06:20 +0000
Message-ID: <20220530173722.GA8262@raphael-debian-dev>
References: <20220516173831.GB13284@raphael-debian-dev>
 <fb522282-c750-2652-2e27-87c68819100b@redhat.com>
 <20220519183938.GB13470@raphael-debian-dev>
 <Yo5ShDNRTEPcBz1c@stefanha-x1.localdomain>
In-Reply-To: <Yo5ShDNRTEPcBz1c@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c2b286f-6892-45c2-498b-08da42b2895f
x-ms-traffictypediagnostic: MN2PR02MB6989:EE_
x-microsoft-antispam-prvs: <MN2PR02MB69895F4D640053ED10D787F9EADC9@MN2PR02MB6989.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+OX7NpVtmp09P2uoGzuGv3dLeBrmcsxlzAdwJSi3LcdzAcT+pPwtfy7XBl5VBiYZEX/9VcB3xUTA3zicaKvuPkgeE5GpQFhR2iFcBihsDglyPU21XBW0s88KIZ+R6GsJJVgYkZVs8taHUKg9IlIH4g7C8aA6Xy7Px1/S2dhCCH96x5Bjru4QkP2UyUQQ/2de0OeAu/+87zIFfgn1pLRy7Gpk2bP2NeW+Ym3FgOBZQTCq12D2y4dLIDnXsvDhOCYSlqF2WASDf3jyhhYfsAiOIspWzyh/P8nRBLKdLMD834qU71wojlsTTbWbUUrhsQDgNLUsDLCFPvpG5gtqDJapg+lnSF1E3Q3P52ja7YpZ7uhO6x8FAZQr52smdOY2nYREqKsh2F98RRe+yxrZ4FLYqIJvtmI6yeUAc/KkCUgjNGjJYr/U3rG3d1k9zcWjN2JlS/1sFzJgofSJzOda8V26sSDZHHWLOTWZ0hqbOuFTMG9W2pVtAo7j5KEX9Uzn56J7J6BYrDxX3ddHLcHKuzItULk/7lArAGCMONCqGmIG7DGQTzzwXA8at+PiHmoH60Z46yWLYIduIlsoCpyuRtkJmWZZro/FnXJQqks6xgYMnT2QP8ID349TarT+aoY2GcndhL3e/m+1wVtV8ik9ZiKxnvsgA6lzBqqjM6fQM7E48r7YmA/CE5C0cx4srF7AKFAwDP6b5Pwu8untNjNPDoz0Xv6passCxVBr9/OK6me7NpFo9gti1jVRpM6krancFqLLkc/naMf7QtxkpV3U/ue1LEVLtflCqDD6nJ5/zBoBnKcTa0YSCX0TVoyqGZlinF9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38100700002)(186003)(1076003)(66946007)(64756008)(66556008)(6916009)(54906003)(8676002)(4326008)(316002)(71200400001)(66476007)(66446008)(76116006)(38070700005)(8936002)(6506007)(86362001)(966005)(508600001)(53546011)(6486002)(44832011)(5660300002)(33656002)(33716001)(122000001)(3480700007)(9686003)(26005)(6512007)(2906002)(175924003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVduOTFBdGRiV1c0YzR0UlVGMXBuLzA2YjIzd3FISFRaUjNxbUUweDBRU21m?=
 =?utf-8?B?cjdJSGdBVERielFmV1lnMnRyOVFVTnh2V3J3ZnRhOTI4UkRxbWhpZ3RnNm5W?=
 =?utf-8?B?aDBKaHQvSkNLcjdQS3NjcHBpcmZiRE1wOVM0MkRzZ3J5ZkxBRlpnVEkyaE0r?=
 =?utf-8?B?MzNyZ20rMFlzMnovUjZlc0ZwMitKYkxZRFFRZEhqZUJuNGdxdGJuWWVsdEtk?=
 =?utf-8?B?aVp3YVR3dDRDc3lUVXVEdlhVQ21tSUlJWE5RZWw4aGNNZU9OTXd2aHZIcGM3?=
 =?utf-8?B?WHZNaHdYdWZVUnRRV2xHSXhmZHNHdWNzdCtUYm5od0g2TzdFbkQ1YjJLd29J?=
 =?utf-8?B?QnlUTnFub201OWNPOWJ2N25JSEN6SEwvYms4dHB4ZzNhb0pvVnIxWFlkc0lN?=
 =?utf-8?B?UmpvamFsck43NGlZamlYUlVsWXRxWThvTlVvT1FwK3dvYXppQ0M4K2FhcjFV?=
 =?utf-8?B?SHUwUmZlQ2thUUt2aE5UQjNqeG1JU2dpWE13ZmlmcG9mMmlTQ0liWnBMWWdH?=
 =?utf-8?B?RlRheDJxbUpmd3kwc0NIendlMW9mR1Mra29uU3RxbmFESnk2UWk3cEFXbTc0?=
 =?utf-8?B?MVBiUmtCV09rVnkzUjljQ0xCQk5pY3IycW9mUUF0M0dCSDJGY3VnT0lXN3dn?=
 =?utf-8?B?d2JJa1MybUR0TGJidVdidlBReFIzcURmd29MQjljcy9TZS9yTmV6eTdmbzZt?=
 =?utf-8?B?NFZBMEw1MXg1YXYyVmY2bTJXR1dpTUJRakJDcXhFUTZ1ZmFEVlI1NGxnNXVx?=
 =?utf-8?B?OUl5TVVTcHNQYXlLOUh2ZzQ4NVRHWXQyUVhMRWc4K2pNUEZEaWZWZUpKbER3?=
 =?utf-8?B?R1VBNDJkaFkxMFJsc0J0dk9mMHMrQWd0TW5IbGFaZmxRcVNmRTdkUG83NGcv?=
 =?utf-8?B?azBOUWRuMzBDbSs0ZVNvV3FsZEpuRDAvUWJNU2xtNGVmQ1UzS0ZKNThLUC8x?=
 =?utf-8?B?VEs4a3UyUVJNbHl3dEkxeUh3QUk0bWRveWFkVEpuTE5kRHM5a2VoVDVUQ2Zl?=
 =?utf-8?B?SlBqVVpPVFdkTDRNNzgweFIxcGIrakx6TnpETjcza0hNaGNuR2lXN0RwSmlq?=
 =?utf-8?B?N0dQSUcwNmNWK1RnTDRtRzlZUXVxTjBxTkxJZnFxY3U0bktIOVlmdUFRUUlT?=
 =?utf-8?B?RzRWM2Y4Si90bi9TMjlPTUtLelJsa3U4N1JtWlc1a0FpMjV0TDRWbW5QVmxN?=
 =?utf-8?B?TXlaK25NTko5ZkxFaHFSSHBtMnpxRkJwejVkWEVwYjFrdjVMeHZMSjBOblNE?=
 =?utf-8?B?L0ZnZXVrMVE0RnU5eVFKRjJBWkFXZTUvaUJad1Z0bGxHRTB1ZkducE94ODhF?=
 =?utf-8?B?MGptYWFCaWpvZy83TXlOWmhjZkljWlJQWDJ3Rlp6ZUVzOTZ4b1dNR0RwTDMr?=
 =?utf-8?B?aEpWUmNkRWZyUXZxRnI2Sy9BS1MwRXNlTThVMWJMbmhGWTlsT2lVWjJqcHhj?=
 =?utf-8?B?c3E0U2xDUnJMUTJGanlHQ2lQUWNObUVkdnBqam9FblNiaFQ4VFBqZEJ2VHRD?=
 =?utf-8?B?VWhNK0JJTXg3RC9keHJ4VTdqRTYrMy9ScFcrRmI2TjI2UHNTTmxCMkJiSnJI?=
 =?utf-8?B?TEJtWm1WVUpLTTZrdVRlS24zTkxoZ1J1SndId0VvZ2YwWmhlSlB6MTN4eFAy?=
 =?utf-8?B?Um5VMGtvU0g5L09YRXpmbzV2elFiaEg3bFBNVU5XY04xSjF5UjY2c2xWUnVo?=
 =?utf-8?B?STZJRW1HcGc4ckFYVGJDeC9OeHdWdUhZSUJnSEIwY3JtYWNYbGhsdVg1YjJG?=
 =?utf-8?B?RGlnaFFQTW1BcE14ODJRTHVFL0xnR2gxVGt5VUd0MHR1bWRnODZnVTI5V2FR?=
 =?utf-8?B?ODZKQ0IxTGRnV1V0STlNOHN6OGhVeFlrYTkxR3htekREazlCNHVjNDRZdlRJ?=
 =?utf-8?B?OUhvandidU9NVUZGd2xGZ3FPUjdRUkFFY3dkZmlRMjFUdXNrMkVlaW5iZUgr?=
 =?utf-8?B?VHExeUpWOHUzeGxvRkIrT21IOWdBOE50djdDYVFrVUhpTytobHhSTmV6Uzh3?=
 =?utf-8?B?b2pGV2F0TlY3SWxNRnEwZ2cyaUlBaW9MdHp6d2FOMDVtMGEwcTE3MFhPVFlp?=
 =?utf-8?B?NDkxb0N4Zzg5UE0rUTF6aFE4K2VGYXNxYm1lZ1I1cmpxWjc2R1ViTTR1UmlK?=
 =?utf-8?B?ajVFbEk3NHZNZUZXS2ZqT2tCdWZ4MWxpcTBMd052Y0xvL2hvOXF5TmxVN3Zz?=
 =?utf-8?B?WnVETjFsN1lhckRVNDNoSFFLelVGUmlDbW95bXNZYlpzUnUvQys0c2FkZkh5?=
 =?utf-8?B?TmZLRnZmbUJIcVM0djFEMWFQTy8zRDFCS1RPWEYzeXZaeGUrYzVFaHUyaXhv?=
 =?utf-8?B?Ui80UWtCaGt2SmdKWXFSNVZ3TTFJbWpSQ0VWRUI4NkowdytOL0NkTTlDWFFE?=
 =?utf-8?Q?tcwRbgk9xjpwmSlgxrh5YWwxCmMwHh7fVQ2gW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <960D19DD5F013E46BA01BA8C62DCCD83@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2b286f-6892-45c2-498b-08da42b2895f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 03:06:20.2213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0L3fgUVwuKQCod1CTtOxy4zoyLPLKtmD0e3vNudfTvdfel+ZGtfUD6xRQoMMAFZrJweFhlFnyavLqWiZgxcNR3PnUfpgla+LQQYVtagnDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6989
X-Proofpoint-GUID: XfbYGTUl8WCM4BNGQztt9SL_on67qdr4
X-Proofpoint-ORIG-GUID: XfbYGTUl8WCM4BNGQztt9SL_on67qdr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_01,2022-05-30_03,2022-02-23_01
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

T24gV2VkLCBNYXkgMjUsIDIwMjIgYXQgMDU6MDA6MDRQTSArMDEwMCwgU3RlZmFuIEhham5vY3pp
IHdyb3RlOg0KPiBPbiBUaHUsIE1heSAxOSwgMjAyMiBhdCAwNjozOTozOVBNICswMDAwLCBSYXBo
YWVsIE5vcndpdHogd3JvdGU6DQo+ID4gT24gVHVlLCBNYXkgMTcsIDIwMjIgYXQgMDM6NTM6NTJQ
TSArMDIwMCwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gPiA+IE9uIDUvMTYvMjIgMTk6MzgsIFJh
cGhhZWwgTm9yd2l0eiB3cm90ZToNCj4gPiA+ID4gWzFdIEtlZXAgdXNpbmcgdGhlIFNDU0kgdHJh
bnNsYXRpb24gaW4gUUVNVSBidXQgYmFjayB2RGlza3Mgd2l0aCBhDQo+ID4gPiA+IHZob3N0LXVz
ZXItc2NzaSBvciB2aG9zdC11c2VyLWJsayBiYWNrZW5kIGRldmljZS4NCj4gPiA+ID4gWzJdIElt
cGxlbWVudCBTQVRBIGFuZCBJREUgZW11bGF0aW9uIHdpdGggdmZpby11c2VyIChsaWtlbHkgd2l0
aCBhbiBTUERLDQo+ID4gPiA+IGNsaWVudD8pLg0KPiA+ID4gPiBbM10gV2UndmUgYWxzbyBiZWVu
IGxvb2tpbmcgYXQgeW91ciBsaWJibGtpbyBsaWJyYXJ5LiBGcm9tIHlvdXINCj4gPiA+ID4gZGVz
Y3JpcHRpb24gaW4NCj4gPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3Yy
L3VybD91PWh0dHBzLTNBX19saXN0cy5nbnUub3JnX2FyY2hpdmVfaHRtbF9xZW11LTJEZGV2ZWxf
MjAyMS0yRDA0X21zZzA2MTQ2Lmh0bWwmZD1Ed0lDYVEmYz1zODgzR3BVQ09DaEtPSGlvY1l0R2Nn
JnI9SW40Z21SMXBHektCOEc1cDZMVXJXcWtTTWVjMkw1RXRYWm93X0ZaTkpaayZtPXdCU3FjdzBj
YWwzd1BQODdZSUtnRmdtcU1IakdDQzNhcFlmNHdDbjFTSXJYNkdXX0ZSLUo5d082OHYtY3lycG4m
cz1DUC02WlktZ3FnUTJ6TEFKZFI4V1ZUck1Cb3FtRkhpbEd2V19xbmYybXlVJmU9ICAgaXQNCj4g
PiA+ID4gc291bmRzIGxpa2UgaXQgbWF5IGRlZmluaXRlbHkgcGxheSBhIHJvbGUgaGVyZSwgYW5k
IHBvc3NpYmx5IHByb3ZpZGUgdGhlDQo+ID4gPiA+IG5lc3Nlc2FyeSBhYnN0cmFjdGlvbnMgdG8g
YmFjayBJL08gZnJvbSB0aGVzZSBlbXVsYXRlZCBkaXNrcyB0byBhbnkNCj4gPiA+ID4gYmFja2Vu
ZHMgd2UgbWF5IHdhbnQ/DQo+ID4gPiANCj4gPiA+IEZpcnN0IG9mIGFsbDogaGF2ZSB5b3UgYmVu
Y2htYXJrZWQgaXQ/ICBIb3cgbXVjaCB0aW1lIGlzIHNwZW50IG9uIE1NSU8gdnMuDQo+ID4gPiBk
aXNrIEkvTz8NCj4gPiA+DQo+ID4gDQo+ID4gR29vZCBwb2ludCAtIHdlIGhhdmVu4oCZdCBiZW5j
aG1hcmtlZCB0aGUgZW11bGF0aW9uLCBleGl0IGFuZCB0cmFuc2xhdGlvbg0KPiA+IG92ZXJoZWFk
cyAtIGl0IGlzIHZlcnkgcG9zc2libGUgc3BlZWRpbmcgdXAgZGlzayBJL08gbWF5IG5vdCBoYXZl
IGEgaHVnZQ0KPiA+IGltcGFjdC4gV2Ugd291bGQgZGVmaW5pdGVseSBiZW5jaG1hcmsgdGhpcyBi
ZWZvcmUgZXhwbG9yaW5nIGFueSBvZiB0aGUNCj4gPiBvcHRpb25zIHNlcmlvdXNseSwgYnV0IGFz
IHlvdSByaWdodGx5IG5vdGUsIHBlcmZvcm1hbmNlIGlzIG5vdCB0aGUgb25seQ0KPiA+IG1vdGl2
YXRpb24gaGVyZS4NCj4gPiANCj4gPiA+IE9mIHRoZSBvcHRpb25zIGFib3ZlLCB0aGUgbW9zdCBp
bnRlcmVzdGluZyB0byBtZSBpcyB0byBpbXBsZW1lbnQgYQ0KPiA+ID4gdmhvc3QtdXNlci1ibGsv
dmhvc3QtdXNlci1zY3NpIGJhY2tlbmQgaW4gUUVNVSwgc2ltaWxhciB0byB0aGUgTlZNZSBvbmUs
DQo+ID4gPiB0aGF0IHdvdWxkIHRyYW5zbGF0ZSBJL08gc3VibWlzc2lvbnMgdG8gdmlydHF1ZXVl
IChpbmNsdWRpbmcgcG9sbGluZyBhbmQgdGhlDQo+ID4gPiBsaWtlKSBhbmQgY291bGQgYmUgdXNl
ZCB3aXRoIFNBVEEuDQo+ID4gPg0KPiA+IA0KPiA+IFdlIHdlcmUgY2VydGFpbmx5IGV5ZWluZyBb
MV0gYXMgdGhlIG1vc3QgdmlhYmxlIGluIHRoZSBpbW1lZGlhdGUgZnV0dXJlLg0KPiA+IFRoYXQg
c2FpZCwgc2luY2UgYSB2aG9zdC11c2VyLWJsayBkcml2ZXIgaGFzIGJlZW4gYWRkZWQgdG8gbGli
YmxraW8sIFszXQ0KPiA+IGFsc28gc291bmRzIGxpa2UgYSBzdHJvbmcgb3B0aW9uLiBEbyB5b3Ug
c2VlIGFueSBsb25nIHRlcm0gYmVuZWZpdCB0bw0KPiA+IHRyYW5zbGF0aW5nIFNBVEEvSURFIHN1
Ym1pc3Npb25zIHRvIHZpcnRxdWV1ZXMgaW4gYSB3b3JsZCB3aGVyZSBsaWJibGtpbw0KPiA+IGlz
IHRvIGJlIGFkb3B0ZWQ/DQo+ID4NCj4gPiA+IEZvciBJREUgc3BlY2lmaWNhbGx5LCBJJ20gbm90
IHN1cmUgaG93IG11Y2ggaXQgY2FuIGJlIHNwZWQgdXAgc2luY2UgaXQgaGFzDQo+ID4gPiBvbmx5
IDEgaW4tZmxpZ2h0IG9wZXJhdGlvbi4gIEkgdGhpbmsgdXNpbmcgS1ZNIGNvYWxlc2NlZCBJL08g
Y291bGQgcHJvdmlkZQ0KPiA+ID4gYW4gaW50ZXJlc3RpbmcgYm9vc3QgKGFzc3VtaW5nIGluc3Rh
bnQgb3IgbmVhci1pbnN0YW50IHJlcGx5IGZyb20gdGhlDQo+ID4gPiBiYWNrZW5kKS4gIElmIGFs
bCB5b3UncmUgaW50ZXJlc3RlZCBpbiBob3dldmVyIGlzIG5vdCByZWFsbHkgcGVyZm9ybWFuY2Us
DQo+ID4gPiBidXQgcmF0aGVyIGhhdmluZyBhIHNpbmdsZSAiY29ubmVjdGlvbiIgdG8geW91ciBi
YWNrIGVuZCwgdmhvc3QtdXNlciBpcw0KPiA+ID4gY2VydGFpbmx5IGFuIG9wdGlvbi4NCj4gPiA+
IA0KPiA+IA0KPiA+IEludGVyZXN0aW5nIC0gSSB3aWxsIHRha2UgYSBsb29rIGF0IEtWTSBjb2Fs
ZXNjZWQgSS9PLg0KPiA+IA0KPiA+IFlvdeKAmXJlIHRvdGFsbHkgcmlnaHQgdGhvdWdoLCBwZXJm
b3JtYW5jZSBpcyBub3Qgb3VyIG1haW4gaW50ZXJlc3QgZm9yDQo+ID4gdGhlc2UgZGlzayB0eXBl
cy4gSSBzaG91bGQgaGF2ZSBlbXBoYXNpemVkIG9mZmxvYWQgcmF0aGVyIHRoYW4NCj4gPiBhY2Nl
bGVyYXRpb24gYW5kIHBlcmZvcm1hbmNlLiBXZSB3b3VsZCBwcmVmZXIgdG8gUUEgYW5kIHN1cHBv
cnQgYXMgZmV3DQo+ID4gZGF0YSBwYXRocyBhcyBwb3NzaWJsZSwgYW5kIGEgdmhvc3QtdXNlciBv
ZmZsb2FkIG1lY2hhbmlzbSB3b3VsZCBhbGxvdw0KPiA+IHVzIHRvIHVzZSB0aGUgc2FtZSBwYXRo
IGZvciBhbGwgSS9PLiBJIGltYWdpbmUgb3RoZXIgUUVNVSB1c2VycyB3aG8NCj4gPiBvZmZsb2Fk
IHRvIGJhY2tlbmRzIGxpa2UgU1BESyBhbmQgdXNlIFNBVEEvSURFIGRpc2sgdHlwZXMgbWF5IGZl
ZWwNCj4gPiBzaW1pbGFybHk/DQo+IA0KPiBJdCdzIG5pY2UgdG8gaGF2ZSBhIHNpbmdsZSB0YXJn
ZXQgKGUuZy4gdmhvc3QtdXNlci1ibGsgaW4gU1BESykgdGhhdA0KPiBoYW5kbGVzIGFsbCBkaXNr
IEkvTy4gT24gdGhlIG90aGVyIGhhbmQsIFFFTVUgd291bGQgc3RpbGwgaGF2ZSB0aGUNCj4gSURF
L1NBVEEgZW11bGF0aW9uIGFuZCBsaWJibGtpbyB2aG9zdC11c2VyLWJsayBkcml2ZXIsIHNvIGlu
IHRoZSBlbmQgaXQNCj4gbWF5IG5vdCByZWR1Y2UgdGhlIGFtb3VudCBvZiBjb2RlIHRoYXQgeW91
IG5lZWQgdG8gc3VwcG9ydC4NCj4gDQoNCkFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgcmVwbHkgLSBJ
IHdhcyBvbiBQVE8uDQoNCkZvciB1cyBpdOKAmXMgbm90IHNvIG11Y2ggYWJvdXQgdGhlIG92ZXJh
bGwgTE9DIHdlIHN1cHBvcnQuIFdlIGhhdmUgb3VyDQpvd24gaVNDU0kgY2xpZW50IGltcGxlbWVu
dGF0aW9uIHdpdGggZW1iZWRkZWQgYnVzaW5lc3MgbG9naWMgd2hpY2ggd2UNCnVzZSBmb3IgU0NT
SSBkaXNrcy4gQ29udGludWluZyB0byBzdXBwb3J0IFNBVEEgYW5kIElERSBkaXNrcyB3aXRob3V0
IG91cg0KaW1wbGVtZW50YXRpb24gaGFzIGJlZW4gcmVhbGx5IHRyb3VibGVzb21lIHNvLCBldmVu
IGlmIGl0IG1lYW5zIG1vcmUNCkxPQywgd2Ugd291bGQgcmVhbGx5IGxpa2UgdG8gdW5pZnkgb3Vy
IGRhdGEgcGF0aCBhdCBsZWFzdCBhdCB0aGUgaVNDU0kNCmxheWVyLg0KDQpXaGlsZSB0aGUgb3Zl
cmFsbCBjb2RlIG1heSBub3QgYmUgcmVkdWNlZCBzbyBtdWNoIGZvciBtYW55IG90aGVycyB0b2Rh
eSwNCml0IG1heSBtYWtlIGEgc2lnbmlmaWNhbnQgZGlmZmVyZW5jZSBpbiB0aGUgZnV0dXJlLiBJ
IGNhbiBpbWFnaW5lIHNvbWUNClFFTVUgdXNlcnMgbWF5IHdhbnQgdG8gZGVwcmVjYXRlIChvciBu
b3QgaW1wbGVtZW50KSBpU0NTSSB0YXJnZXQgc3VwcG9ydA0KaW4gZmF2b3Igb2YgTlZNZSBvdmVy
IGZhYnJpY3MgYW5kIHN0aWxsIHN1cHBvcnQgdGhlc2UgZGlzayB0eXBlcy4gQmVpbmcNCmFibGUg
dG8gb2ZmbG9hZCB0aGUgdHJhbnNwb3J0IGxheWVyIHZpYSB2aG9zdC11c2VyLWJsayAoZWl0aGVy
IHdpdGggc29tZQ0KYWRkZWQgbG9naWMgb24gdG9wIG9mIHRoZSBleGlzdGluZyBTQ1NJIHRyYW5z
bGF0aW9uIGxheWVyIG9yIHdpdGgNCmxpYmJsa2lvKSB3b3VsZCBtYWtlIHRoaXMgZWFzeS4NCg0K
RG9lcyB0aGF0IHNvdW5kIHJlYXNvbmFibGU/DQoNCj4gU3RlZmFuDQoNCg==

