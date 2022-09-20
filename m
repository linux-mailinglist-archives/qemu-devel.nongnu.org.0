Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11215BE9C0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:12:34 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaevJ-0000Wo-E6
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1oabqZ-0008E2-2e
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:55:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:47524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1oabqV-0004RU-Vt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:55:25 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KBmfpE005523;
 Tue, 20 Sep 2022 11:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=kun1YQfjPh1qWOthx427b1WZGn6bBG33rTMh0gEG0m0=;
 b=PgbshMzIRgmkcrgC6m7cbIWORCJbVQo3KGewoVmdTpbOWVUQF/oM7Ld3KOiQujeSyzfJ
 qUeQZeCiyJdUErv/T9UZu6LE9d+4Ogf1lHAInbxxn4FUeXH2qtRPJzUvgU3k/HELp+zG
 Y0de4NvXh5yUaYgp9ld/g1Su7jXETC4QMjxrhsB++HXmJZ/gcSsD30CnWTd9Z9SUhc85
 A4UjFYgOE/M3U55YpKBjhbZqza012EoHHsfZFHMQt4riPQXwsMjRWUw30o2Jqzvgslm2
 1cLUFz50DvHCIvX7DupCrVzmR5lWm+KZ3u6cZbdX/uuSCKzr4TZXOT1RY3R5W1L3A0o6 Rg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jq8wg8v4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:55:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Okach3gOze0dIBfV07KBSmEzq3o6kY9E/kIi1JBljf4KyegDj3KK0a86Ll1G7qTg+AscRFkjv+87vuO7m7Jk/n6Chl9k660sduOHvI+B8eN9adG9TXMlrY7vSvVfhooBynIx5mDrzJ2wpux4z8V+uWzZ80IGiokmXOwMApuPgBF6ngxgLOLn02KrLq4dcyQQvBi0GtStYsj1SJ4mrpHeUi8sKahqg6MwMffGBRydZotZFfoj86A1ridce48h4D8M7XSGrKVfznGf9d54CgyaReUG7magkuGbX8xBgPguLFelO07CYzw/nguw0H79F3t/SK8/Kn58huUjA537KtTVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kun1YQfjPh1qWOthx427b1WZGn6bBG33rTMh0gEG0m0=;
 b=fUFiEFRy1Sv48havSYKsDIpfkS9TKVGDkf9W1yyC2mNlLSzjXL3IqoXjwAGtLGk2KWyKcAoYCObyvK+79ZiAt34TRmqK42rAX32ORw6IC4MJpMFSfjsCTZOXPDmcmftgyl3PfkOGPkn4H2NNR+3RTlY9R7BGJ1jtygTZlOKlMqZTDj7h58emsg8/Hsu/6wfPb05oXqMmmU64yuTj2pNJanEhyUXZq19EkytWbt7Jumz+pN0EKwdnb8Pj1rcwN7G6y6KTj+nczUUXgp0rzN/B62HRESa/dFCwLC6ZnNQktCinB9KdOfs6pcxZsOWHElAcXfF2NmIBvUUfTYesVH60/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM6PR02MB7036.namprd02.prod.outlook.com (2603:10b6:5:25c::7) by
 CO6PR02MB7810.namprd02.prod.outlook.com (2603:10b6:303:ae::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14; Tue, 20 Sep 2022 11:55:06 +0000
Received: from DM6PR02MB7036.namprd02.prod.outlook.com
 ([fe80::9c26:db6b:b1bb:73a2]) by DM6PR02MB7036.namprd02.prod.outlook.com
 ([fe80::9c26:db6b:b1bb:73a2%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 11:55:06 +0000
From: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "Matheus Bernardino
 (QUIC)" <quic_mathbern@quicinc.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "f4bug@amsat.org"
 <f4bug@amsat.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: RE: [RFC PATCH v2] gdbstub: only send stop-reply packets when allowed
 to
Thread-Topic: [RFC PATCH v2] gdbstub: only send stop-reply packets when
 allowed to
Thread-Index: AQHYybe3tK7Xsiq0wE2jPUko8G5F7a3oOnuw
Date: Tue, 20 Sep 2022 11:55:06 +0000
Message-ID: <DM6PR02MB703660CE3227918B083F7FE3F94C9@DM6PR02MB7036.namprd02.prod.outlook.com>
References: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
 <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
 <87edwb8ttp.fsf@linaro.org>
In-Reply-To: <87edwb8ttp.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR02MB7036:EE_|CO6PR02MB7810:EE_
x-ms-office365-filtering-correlation-id: 850ce134-ff21-4307-d11e-08da9afef5b5
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mLTdr0dm61WdBQKsXtgm/fo0OOLIFBREe15rcvBsSMV6qkn9Jyaq+3HrFN8aBpUm69IYL80c/AwHdm9ySEESeQovSlSp2jxcX5kfTmG+Ijab6eKc4bx4M274rzOheiO/7hraPGejK3UAHJUHf/O/Qrk9Lol0jHk0XbggkW67+aef3+qjeuAqhZJDduqkH9VHl1w2wyh/yGEyAXXd+El7gfFd2OatbpMkSf+Z+IgvFVjeFDc3gKIzkvHZ7nCfaxulGWRUlWZyUsBj3z/xB2rrPMcxOGAZeOwcnqwdK5aIJ3jL9IDvT+mQccRpQyEZjIFaEr96t7HuBEcEQ21F6rQ1ozf6nN5C7VjE6rlHJNHrKVUfGeD/nKrLbvdyrzSEUbGvVQAV49YaWtlYKK4R3GyuLwc4uILOBjaLyAmCLwKETyeW4dviV4Js+jUSrDXpvzGnIiNFeg7MGxUD16Yl7YEEmdEpbDmzjNcebpCnB/Au+i0+pfWpBAxaA80pgrXEAWxgQbWfwrrxKjcty/chx3qD3BzEdfRVUNeCKsD38H8FzLwtFdrk52QlWPtKtYdIz4jNV0Uzr33PVNhYx+Z82EvSYWJ33f7E7qc3AZuAuWROYcJVmLT6IXXNBy7nr7wp/qdMUzO9JajVj3F0O9uQXMxKnTL6zeXZ8WnrdPmzVeFwgsGOZclCE1GebWSASdQKeomwN6ZrREeBWlqHBrnJGTfsRU+kCDBtkShcgvj4VTfLEBvo70JUZut6kj1EYJwq4TdsfsRkFEIzniACZ/L/J0bIthcAkI9nf+UvnRElRKjaXF8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB7036.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(38100700002)(110136005)(38070700005)(66574015)(54906003)(83380400001)(86362001)(2906002)(316002)(478600001)(9686003)(26005)(966005)(55016003)(7696005)(41300700001)(6506007)(71200400001)(33656002)(186003)(122000001)(66446008)(76116006)(8676002)(4326008)(5660300002)(8936002)(66946007)(52536014)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjR5bVAwb3BJQVpIZmJ0S0NOL29mMFBHVnJaeS9BaTFFRU02MDQ1Vk56SWE2?=
 =?utf-8?B?cVFJdHMzeEQ1SHNQL1dITDNUL1lvdjRvRzg2d29PYW5OQkR4Q1JCWDFTbXB5?=
 =?utf-8?B?ZXJZM0Z5VG04TVRWS2hmcDMxNHRVSzZ6SHRIanJBanBxZUd2NmtqeGVCZ3VI?=
 =?utf-8?B?cGFRK0RRdmx5Rnd4M3AwZ3JHRXljL09BTHV3Z3FiUXd0YWZCcnJ1eVlRZHlv?=
 =?utf-8?B?U2t5eWpzU0JTOGg4bXhoaGpzc1U5SVpmWlVFNTVnS2pjTDgvZm5KNk1XVzl0?=
 =?utf-8?B?aHhBLzNlRStmMWpzbzJoODZkL1hqK0p6MU12UGhrTUVYQUZSd2FLQzhtekxk?=
 =?utf-8?B?U2ZrSmppZVg5dFRqNkVtUXNBSytTazd1cWJNdWc4Nkt6N0xsZ2FrQm5ibWlt?=
 =?utf-8?B?aXB5TkhCMjVKN3ZGcUF2dU9hTDg4dnNyMmlqWHVvUWZNQzF6MUgyY3lvT0dI?=
 =?utf-8?B?VXVoNFU4ZVVaU2tSSVQ3MUoraXQ2aU9NdlRDNFhiOWI1R1gyTDQ4NGpvSzFR?=
 =?utf-8?B?cVZKZ2xyWWpyQ24raFFtWXZBY1daR1M5cTUvTnVodUZzWFNJaHYyVnM5MmVB?=
 =?utf-8?B?OFJwY0pIY2pudDlMNTJ6K1EzSmpYcFZ2ZlcrQk1yVSsrSktGUVFNeW50YkZa?=
 =?utf-8?B?QWhCdnRFL0Y0Snl5ZTlaejBCY1FOQitWanZYblllVitYNXNEUW9jT3J2elJn?=
 =?utf-8?B?MUkxKzRmUFNlbUNlZlFsSC9uejR1WnR2elp1d3cvVjBtaVhUdTdXOExlSGcr?=
 =?utf-8?B?MThFNUF5QjBRdUo5VjlrR29qdXpucDdSVVZGdm84SUVDUlFQU0JpNURKOEZ6?=
 =?utf-8?B?UVhrR1A3dXRIYlQ2NHhFVk01ODAwKzlxV0E4bkNMNTVocnJFQkFQL3pMUjQ4?=
 =?utf-8?B?THdNZzkwZzY5WnVKeEJEWFhmUDNIS3E0QVhITFdRWVROaFV5cU00VENOd1Zz?=
 =?utf-8?B?SW9zbkpFL3U5MkxTNEYwSEgrVTVLZVIrOW9wSzRReG4zRVdMWUQ0cjJJeVRN?=
 =?utf-8?B?V3ZjZlVwRzNsU2NJam5RN2p4eDY0SXdrTnBvVXF1My8rK2RtMmJKVU9QL1hN?=
 =?utf-8?B?L1hDZ3YyZWFjcmNRWlBwZUZub2FtUkNKeWoxeWZmenFOalJnTnJ0QjNXK2pk?=
 =?utf-8?B?VkpQNnVkQTcwZ0FTL1BHdFRlZHZFVXpsNzNaVkdWejgyVyttUXh2SGtuQTVT?=
 =?utf-8?B?RjRNTW83UUMxMVVvRkJCNlZ0RjVqUlM1TjN2NFgxcGFJRGlqVDZmME1BRXRz?=
 =?utf-8?B?VEQxVHBOd0R0ZEpuQ1AzNExnZVkrcU1WME1oUmhXQVc0SnN5TGpia0hjV0RP?=
 =?utf-8?B?aGFRSENqeXdocE14dGtnOXpjbjlKY09FbXd2YkpxclU2TlpqVHJvaytPZFBQ?=
 =?utf-8?B?QThFTGpQSGRsaFdQQ0NvTXFYTmpCMVhMREFuY01DL1B2VzFxcS9KMk1JZWRu?=
 =?utf-8?B?MXdiVk9XUU1yOWFucytqa3hYT2hFNjd3WjVPcE5GU0xyOWZDN24raXlLcy9T?=
 =?utf-8?B?UnNqYWRuekptVWxtWjFxcTJIaVpxMnNNbmlBcC94citENzh2d1RnemhDN1d6?=
 =?utf-8?B?bVM3K01mN1MyTklHUzNxRCs3ajRMWG5iMk1CU3huNVkzKzVha2NtZzIzV1Vo?=
 =?utf-8?B?U1lGcjQ2YlJJdjRCTjROSEVwM3U0aU5vc0pBaTh1dUhKQUdSbkVYUTlBY2JD?=
 =?utf-8?B?KzBvWHkrMXpWZmpIYkdaYTFvcDZjaXI5aU5nMXpCY0JseUI2OEFKZU5VRGpP?=
 =?utf-8?B?VmcrN1N1Qmh3SXBhc1FlRnFiRi94OFIvckR3a25FekRYbjM1YmRoZGRMUDFL?=
 =?utf-8?B?L1hPZHpuc3VpYlg5NHg3ZE5jQVF0UnJhemx1aXI0RXpDWk5jRExFWE9QUy9U?=
 =?utf-8?B?VzNmQm93T3FKeWFjUnJUbE1wbkV5bGUvbEoydi9SZTc1ck1rMXA1c0VIc0tk?=
 =?utf-8?B?UVVHMFZVZG9xMlZ6ZDdzQkZ2ak5OaCtySTl6bDFYZjRudTFUcXdzYzN0QmJr?=
 =?utf-8?B?M0dRazd3K2FsNDBJU3lnTW40b1hPY21wbkNuYmRkRWtIZWxpMGpHMFh3b211?=
 =?utf-8?B?cWdwelY4TXFodjBET1EyUzl3bm9jUmZLVnFiVHRRb2c5VThkUmg2OXNoSnUy?=
 =?utf-8?Q?4SvnTHd1L2fz6xjuIohfTFqpO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB7036.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850ce134-ff21-4307-d11e-08da9afef5b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 11:55:06.0738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNlJDV1VxnzMalKQC0wLYPhSg7rUmGgtzRR/u2uyGpLxlre18dEH1T1tGtFUjDZBqtQmKd9F+ytEG4fKWdH9SMFClN/q/cvwPcOsrHnMPgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7810
X-Proofpoint-ORIG-GUID: -Tlf5xqrlTuhvIHeJHmaqf4Zxg-vAZ2Y
X-Proofpoint-GUID: -Tlf5xqrlTuhvIHeJHmaqf4Zxg-vAZ2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200070
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gTWF0
aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+IHdyaXRl
czoNCj4gDQo+ID4NCj4gPiBBbHRob3VnaCB0aGlzIGJlaGF2aW9yIGRvZXNuJ3Qgc2VlbSB0byBj
YXVzZSBwcm9ibGVtcyB3aXRoIEdEQiBpdHNlbGYsDQo+ID4gaXQgZG9lcyB3aXRoIG90aGVyIGRl
YnVnZ2VycyB0aGF0IGltcGxlbWVudCB0aGUgR0RCIHJlbW90ZSBzZXJpYWwNCj4gPiBwcm90b2Nv
bCwgbGlrZSBoZXhhZ29uLWxsZGIuIEluIHRoaXMgY2FzZSwgdGhlIGRlYnVnZ2VyIGZhaWxzIHVw
b24gYW4NCj4gPiB1bmV4cGVjdGVkIHN0b3AtcmVwbHkgbWVzc2FnZSBmcm9tIFFFTVUgd2hlbiBs
bGRiIGF0dGFjaGVzIHRvIGl0Lg0KPiANCj4gRG9lcyB0aGlzIG1lYW4gd2UgY2FuJ3QgaGF2ZSBh
IHRlc3QgY2FzZSB0aGF0IGV4ZXJjaXNlcyB0aGlzIGJlaGF2aW91cg0KPiB3aXRoIGdkYj8gSSdt
IGd1ZXNzaW5nIGl0IHdpbGwgYmUgdHJpY2t5IHRvIGV4ZXJjaXNlIGFueXdheSBiZWNhdXNlIHdl
J2QNCj4gbmVlZCB0byB0cmlnZ2VyIGEgdm0gc3RhdGUgY2hhbmdlLg0KDQpIbW0sIEkgdGhpbmsg
d2UgY2FuIHRlc3QgaXQgYnkgZW5hYmxpbmcgZGVidWcgaW5mb3JtYXRpb24gb24gZ2RiDQooYHNl
dCBkZWJ1ZyByZW1vdGUgMWApIGFuZCB0aGVuIGNoZWNraW5nIHN0ZGVyciBmb3IgYSAiaW52YWxp
ZCByZXBseSINCm1lc3NhZ2UuIFNpbXBseSBhdHRhY2hpbmcgdG8gUUVNVSB3b3VsZCB0cmlnZ2Vy
IHRoZSB2bSBzdGF0ZQ0KY2hhbmdlLCBJIHRoaW5rLiBJIHdpbGwgdHJ5IGl0IG91dCBhbmQgc2Vu
ZCBhIHJlcm9sbCB3aXRoIHRoYXQgc29vbi1pc2guDQoNCj4gPiBUaGVyZSBhcmUgdGhyZWUgYWRk
aXRpb25hbCBwbGFjZXMgdGhhdCBJIHRoaW5rIG1heSBzZW5kIHN0b3AtcmVwbHkNCj4gPiBwYWNr
YWdlcyBhc3luY2hyb25vdXNseSwgYnV0IEkgaGF2ZW4ndCB0b3VjaGVkIHRob3NlIGFzIEknbSBu
b3Qgc3VyZSBpZg0KPiA+IHRoYXQgaXMgcmVhbGx5IG5lZWRlZDoNCj4gPg0KPiA+IC0gZ2RiX2V4
aXQoKSBzZW5kcyBhICJXIiByZXBseS4NCj4gPiAtIGdkYl9zaWduYWxsZWQoKSBzZW5kcyAiWCIu
DQo+ID4gLSBnZGJfaGFuZGxlc2lnKCkgc2VuZHMgIlQiLg0KPiA+DQo+ID4gU2hvdWxkIHdlIGFs
c28gcmVzdHJpY3QgdGhlIG1lc3NhZ2Ugc2VuZGluZyBhdCB0aGVzZSBmdW5jdGlvbnMgd2l0aCB0
aGUNCj4gPiBzYW1lIHJ1bGVzIGFkZGVkIHRvIGdkYl92bV9zdGF0ZV9jaGFuZ2UoKT8NCj4gDQo+
IEhtbSBwcm9iYWJseSAtIHRoYXQgaXMgY2VydGFpbmx5IHRoZSBpbXBsaWNhdGlvbiBvZjoNCj4g
DQo+ICAgaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9nZGIvb25saW5lZG9jcy9nZGIvU3RvcC1SZXBs
eS1QYWNrZXRzLmh0bWwjU3RvcC0NCj4gUmVwbHktUGFja2V0cw0KDQpPSywgd2lsbCBkby4NCg0K
PiA+ICBnZGJzdHViLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9nZGJzdHViLmMgYi9nZGJzdHViLmMNCj4gPiBpbmRleCBjZjg2OWIxMGUz
Li4yMzUwN2YyMWNhIDEwMDY0NA0KPiA+IC0tLSBhL2dkYnN0dWIuYw0KPiA+ICsrKyBiL2dkYnN0
dWIuYw0KPiA+IEBAIC0zNTAsNiArMzUwLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgR0RCU3RhdGUgew0K
PiA+ICAgICAgaW50IGxpbmVfYnVmX2luZGU7DQo+ID4gICAgICBpbnQgbGluZV9zdW07IC8qIHJ1
bm5pbmcgY2hlY2tzdW0gKi8NCj4gPiAgICAgIGludCBsaW5lX2NzdW07IC8qIGNoZWNrc3VtIGF0
IHRoZSBlbmQgb2YgdGhlIHBhY2tldCAqLw0KPiA+ICsgICAgY2hhciBsYXN0X2NtZFtNQVhfUEFD
S0VUX0xFTkdUSF07DQo+ID4gICAgICBHQnl0ZUFycmF5ICpsYXN0X3BhY2tldDsNCj4gPiAgICAg
IGludCBzaWduYWw7DQo+ID4gICNpZmRlZiBDT05GSUdfVVNFUl9PTkxZDQo+ID4gQEAgLTQxMiw2
ICs0MTMsNyBAQCBzdGF0aWMgdm9pZCByZXNldF9nZGJzZXJ2ZXJfc3RhdGUodm9pZCkNCj4gPiAg
ICAgIGdfZnJlZShnZGJzZXJ2ZXJfc3RhdGUucHJvY2Vzc2VzKTsNCj4gPiAgICAgIGdkYnNlcnZl
cl9zdGF0ZS5wcm9jZXNzZXMgPSBOVUxMOw0KPiA+ICAgICAgZ2Ric2VydmVyX3N0YXRlLnByb2Nl
c3NfbnVtID0gMDsNCj4gPiArICAgIGdkYnNlcnZlcl9zdGF0ZS5sYXN0X2NtZFswXSA9ICdcMCc7
DQo+IA0KPiBJJ20gbm90IHN1cGVyIGtlZW4gb24gYWRkaW5nIGFub3RoZXIgc3RhdGljIGJ1ZmZl
ciB0byB0aGUgZ2RiIHN0YXRlDQo+IGVzcGVjaWFsbHkgYXMgd2UndmUgYmVlbiBzbG93bHkgcmVt
b3ZpbmcgdGhlIG90aGVycyBpbiBmYXZvdXIgb2YNCj4gR1N0cmluZydzIHdoZXJlIGFwcHJvcHJp
YXRlLiBNb3JlIG92ZXIgaXNuJ3QgdGhpcyByZWFsbHkgYSBib29sZWFuIHN0YXRlDQo+IHdlIHdh
bnQsIG1heWJlIC5hbGxvd19zdG9wX3JlcGx5Pw0KDQpZZWFoLCBtYWtlcyBzZW5zZS4NCg0KPiA+
ICB9DQo+ID4gICNlbmRpZg0KPiA+DQo+ID4gQEAgLTI1NTgsNyArMjU2MCw3IEBAIHN0YXRpYyB2
b2lkIGhhbmRsZV90YXJnZXRfaGFsdChHQXJyYXkgKnBhcmFtcywgdm9pZA0KPiAqdXNlcl9jdHgp
DQo+ID4gICAgICBnZGJfYnJlYWtwb2ludF9yZW1vdmVfYWxsKCk7DQo+ID4gIH0NCj4gPg0KPiA+
IC1zdGF0aWMgaW50IGdkYl9oYW5kbGVfcGFja2V0KGNvbnN0IGNoYXIgKmxpbmVfYnVmKQ0KPiA+
ICtzdGF0aWMgdm9pZCBnZGJfaGFuZGxlX3BhY2tldChjb25zdCBjaGFyICpsaW5lX2J1ZikNCj4g
PiAgew0KPiA+ICAgICAgY29uc3QgR2RiQ21kUGFyc2VFbnRyeSAqY21kX3BhcnNlciA9IE5VTEw7
DQo+ID4NCj4gPiBAQCAtMjgwMCw4ICsyODAyLDYgQEAgc3RhdGljIGludCBnZGJfaGFuZGxlX3Bh
Y2tldChjb25zdCBjaGFyICpsaW5lX2J1ZikNCj4gPiAgICAgIGlmIChjbWRfcGFyc2VyKSB7DQo+
ID4gICAgICAgICAgcnVuX2NtZF9wYXJzZXIobGluZV9idWYsIGNtZF9wYXJzZXIpOw0KPiA+ICAg
ICAgfQ0KPiA+IC0NCj4gPiAtICAgIHJldHVybiBSU19JRExFOw0KPiA+ICB9DQo+IA0KPiBJIGd1
ZXNzIHRoaXMgaXMgY2hhbmdlZCB0byBhbGxvdyB0aGUgbGF0ZXIgY2hlY2sgYWdhaW5zdCBSU19J
RExFLiBNYXkgSQ0KPiBzdWdnZXN0IGEgYmV0dGVyIHBsYWNlIHdvdWxkIGJlIHRvIGV4dGVuZCBH
ZGJDbWRQYXJzZUVudHJ5IHRvIGNvbnRhaW4NCj4gdGhlIHZhbHVlIG9mIC5hbGxvd19zdG9wX3Jl
cGx5IHdoaWNoIHdlIGNvdWxkIHNldCBvbiBzdWNjZXNzZnVsIGhhbmRsaW5nDQo+IG9mIGEgcGFj
a2V0IGluIHByb2Nlc3Nfc3RyaW5nX2NtZCwgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiAgICAgICAg
IGNtZC0+aGFuZGxlcihwYXJhbXMsIHVzZXJfY3R4KTsNCj4gICAgICAgICBnZGJzZXJ2ZXJfc3Rh
dGUuYWxsb3dfc3RvcF9yZXBseSA9IGNtZC5hbGxvd19zdG9wX3JlcGx5Ow0KPiAgICAgICAgIHJl
dHVybiAwOw0KPiANCj4gQW5kIHRoZW4ganVzdCBhbm5vdGF0ZSB0aGUgY29tbWFuZCB0YWJsZSBl
bnRyaWVzIGZvciBjb21tYW5kcyB0aGF0DQo+IGV4cGxpY2l0bHkgYWxsb3cgaXQuDQoNCkdvb2Qg
Y2FsbCwgd2lsbCBkby4NCg0KPiBQbGVhc2UgcG9zdCB0aGUgbmV4dCByZXZpc2lvbiBhcyBhIHN0
YW5kYWxvbmUgcGF0Y2ggcmF0aGVyIHRoYW4gYSByZXBseQ0KPiB0byBwcmV2aW91cyB2ZXJzaW9u
cy4gSXQgdGVuZHMgdG8gY29uZnVzZSB0b29saW5nLg0KDQpPaCwgSSBzZWUuIFRoYW5rcyBmb3Ig
dGhlIHRpcCBhbmQgdGhlIGNvbW1lbnRzIGFib3ZlIQ0KDQpCZXN0LA0KTWF0aGV1cw0KDQo=

