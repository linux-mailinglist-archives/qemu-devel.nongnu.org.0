Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4634765F5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:33:02 +0100 (CET)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcpZ-0005uV-Dp
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmZ-0003Av-Hy
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:55 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:15540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmX-0006G0-4B
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:55 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFIkLd7030328;
 Wed, 15 Dec 2021 14:29:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=1VmkOxsPhTK55LLCrgGy6TKoNU9w+vg3jpIJMx8uoYk=;
 b=khxqMc0EcdS9//mXNpHdC7B7tBEqzbwT6sdQmlAzMGjBMgqR6fID95xao2siFm6aayNC
 APYlHFGs5M3wKNomdhAfrm9CXiY/V0cIpJ/M1BPH/wDdkqnWa6TMrNbt53LRV82SGw7B
 7KOMkSmQoVS+Y2XvBgZbWK8Ys62jpbrRO7YyLHXt2ZdG5VJdLfEGJI/YKWMPMqwidFi6
 mj/HNJlZDYT73W5lysdKT/OJoibso+XvZWM/jnreMYAabuX7tRsAxA/erHS+YOE7wO8B
 CDA9S3yy3dRby0XKvhuseawv70savmQIze/zhOxZu++m2pkdI2rUYQrouGAu6EgD6xu5 SQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3cy7vej3qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 14:29:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyBgx/bW/3/kojFJpO2X3kjpAeqx9hkw4Q3Lm4J+4AIGQSucExBssmsXNMuHuBej4e68pgKaKDV6JA4NYab+ZNFcEJwkSCRXqtOZKw5UDJofCh/WB2Qg2ASFJlyggg4dDf65W5j+nJKvz3IHQOUaito1XNLeGWyCivOd5/nJXdOwDyvAie0BX/26greqqbn63EH/jdnvlemvjE4q7ulJ1ZgoozbbxFuyURYkApAAjuv7fesKquTrkxgOP5QC040hunex9K7wzCw/4Cp8D8AqMRO8109Au8kkZxqGXdTl8YiL13ap4byxJG/w9xfKHv1i2+QTgzEmT3Sc2igfomNtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VmkOxsPhTK55LLCrgGy6TKoNU9w+vg3jpIJMx8uoYk=;
 b=Xk1MzkCLC8gi1nzJJm1Wh5audSMEjjOwFfraSCVfcEWC9YP5KVd64CNzvk/DUI9afrHUjyoSuIFZ+tP9SAG2E7C+eZlCnzDvkzIXvgnkHb6n47Ouf/cjvwCXG9ZjvZnrCtrJ2cp5BvwdrmCOPsZ/hdmFnOA6gY5EsjqD1b6st+6tDGx4StbI2j/eTRYkHBF89NMJvemiqwB87h2zO/qQY3ZwVjr2RH8/kor4yIh+hTve0eBvV5AHdIMULQvZSnC3hh4ltaUBjwC7JsPJXi0LApufGx77y72vNwcSGpnaQOxcAHuYC5qbv8XOfgtNr8io78Ki31Ma7brPf5Qc/0AJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5457.namprd02.prod.outlook.com (2603:10b6:208:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 22:29:46 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%8]) with mapi id 15.20.4778.016; Wed, 15 Dec 2021
 22:29:46 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [RFC 0/5] Clean up error handling in libvhost-user memory mapping
Thread-Topic: [RFC 0/5] Clean up error handling in libvhost-user memory mapping
Thread-Index: AQHX8gNDpGtXsOkIkUmuyd0RrsddvQ==
Date: Wed, 15 Dec 2021 22:29:46 +0000
Message-ID: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce9dd605-3b6a-4858-c105-08d9c01a6607
x-ms-traffictypediagnostic: BL0PR02MB5457:EE_
x-microsoft-antispam-prvs: <BL0PR02MB54576543396678536FDE6601EA769@BL0PR02MB5457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ptRYwGtqT4bkerS2nMhzrq1YtgB6swdacC7W2J/IcX8YR3eY6VskL9HFbzqsFPmLINo8k6svRCBPlvWav6XhUWmlo9SgJ6bGzqsGjIl4d/ooKhbMkQeopjhcp9hXUTsRpziP3ihba3WKDA7DAUP0JiXrXOTZcIyt4Fhr7dfPS4QFFTMnmO2pL9ZbwnczUjibWVv2BgHzax2QB8MNIxpVj1bpXH8gQeiou5kHDvBZfrT0GCDt6lICByLL+ccl+1wHMYz6PmLuefCPb143JuQoWf0IpMF+LlONqRsUPCk8wCrwarb7NuZjUYu543mxCDtJ4oheuQxfEArouJ/ND+AkZBYHxGQtHb4cdRAO+jmUblwuVqA9ezeQhinbPmOLj54Yn6LzW6lGJA9Ka7nzTf0dKFlxmXRr0CXrStJyKHrVSAIZAc2FwW75bww+O/8gbqqXfoIiQH8XcmeayQrtkZSH465+34a2JK/bgTHlbBoKfakVRXwGqwaOWVrbYQ3dNynaCohZNAhh+2IAQartrYt7eVQoJdbyDkBPtt+kIp8Mv/TvnilwXNZJsqylLvprOiLpyWbsknuEemfTMwE61H30GPxB4VoM8FvN7fPcQeJVJ9H3/9JVOsDsRaVNIBn6GBuTHeC+bBTibFTfGqu3QBg3GFr/RaoRMtb9J67tqOhfV9yxfrlP1LgXlV/HJkVIz9r2fySdwwB8MtNEAYuAHOw7XFXzkL5DeK1kDVmR2/1gSQLDTWuoeG5Tn2M6YWLJgSxA6AXEZlnUeEmclTAz8HCHo8tc/xCyVzkFjKoab5pK7YDrLmr3pXCOOYeYauQyMrQ3zJzS4rTNhZdDo8g02x9Tkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(8936002)(6506007)(8676002)(26005)(1076003)(107886003)(2616005)(316002)(110136005)(122000001)(54906003)(5660300002)(38100700002)(86362001)(38070700005)(66946007)(186003)(44832011)(36756003)(66446008)(4326008)(64756008)(66476007)(76116006)(91956017)(6512007)(66556008)(966005)(71200400001)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnNNVnExclQyOThaYWt6WFpjd08zc0x0dlVVa09QQkZzVjJ4NlNrZEw4cWtF?=
 =?utf-8?B?YjFVUGNZRW1lLzlnWWNmSUhtSExRREdPZTMyZWZLUWN4VitxN2VESHRMK1E3?=
 =?utf-8?B?aVVPYThiSG1kaFRJYkkvd1YxdVovYUp3REs2eGRacGRFZmlTVnQzWEVJY0x2?=
 =?utf-8?B?SzRhQmpaMzBDK1hHaGdqeHNya1dJVE5UcjZsRkxVV3hYL1FCaEdyU29yZFFn?=
 =?utf-8?B?dGp2eS9vQXVPRm1DbEc4dE04OXN3NkJPd3BHTHRwdytYdnIwUW96OHdzNnBX?=
 =?utf-8?B?RjNUWjJ0VjMvYUtWeHlMUURJSndueXlLdHhEb1FYTStob09lMjVHNDVtcDFm?=
 =?utf-8?B?RWZ4TTgvWXg4eHdBOG4xUjlkRUU1d2dlQ1dGN0txTW41MlRkK0NsTVVlL0VM?=
 =?utf-8?B?clhvRjJRZzRaS3ZMY0VuZ2FCOFdRS1VxbHlOaHBKM2dRQmQzWTA3MnFmTUhs?=
 =?utf-8?B?Q2tvNllKMzVaeC9FSE03Z2RDL3hFR2p2OHNyVEZGUW94M0NUUjZ6VW5lMTJ0?=
 =?utf-8?B?Uy8rbG9uWlhjc1MxdG9EVTlMNVdvT3FzUFpMbHRtWFE4L0p3K01vdTRjNDA3?=
 =?utf-8?B?KzBvSUYzUWtnbHo5YXA0OThCM0RYMXJyUXpRc1RZc1ZEMkRMMUNwNTdQVmhl?=
 =?utf-8?B?VWtCQ2xwRFVJWEJjOGJaN1NyMnNTNWNnK0pPQTlqR09reTFUaVVSclZGSThU?=
 =?utf-8?B?WTBjM25OblcvN2RlKzJRUHNIS3ZjMEFYeGZjTkJYQ1JTNksvRkJSclZDM3cr?=
 =?utf-8?B?cEJuU1MxYlF4V0JUMTBrOW9oNDNyNWFyamRJY2tuZEw2Q1Z5ZkVGZXpwNWpa?=
 =?utf-8?B?YTUwdml1bmVMUTBxN1RNNjEzRVVvZm1FVDhyOWtlRzJlTmFpdUxBanovTXJk?=
 =?utf-8?B?Ujd3aml6SWU2WjhjTHE1U2FRbDFjK3NlZTR3Y1kyM2ZNUEpOQVpHd2hUcHRy?=
 =?utf-8?B?ZmFIY2pmNUZ3cGRWYlQxOERaMldkQldpOU9rRU5mUlRPT2FzbXBLUGgrNTFI?=
 =?utf-8?B?ZnE4Ni8vTFVVZnBlZlc3TFcxeXhIVkxWQ1pjR2pWTUk3eGtBKzRZck9na3BO?=
 =?utf-8?B?djN6aEFlVFdlUDdCc282Z0NFaTNZeUVCeWJ6K1pZQXJnYXhrV2dENW1ldStY?=
 =?utf-8?B?TDZuRkhSUmlUcFdyQnpTbGIwbHBJU0J5RzdPY0lPQnd1WEVRaDRsQXFxZEN4?=
 =?utf-8?B?eXhqWWNHVjF3eldkK003SmVTTmRHRmZGMzhjNVVManRCZ3kwbldzeTJSUkdk?=
 =?utf-8?B?LzUyTWM1NnNSS0dWYjlmTjN3anF2MnkvV3d5Sml0cUNWYmZEdTVJSUJxeUxK?=
 =?utf-8?B?MGFnYVE5cUlKM1pNdHJLSzE1bmhGM0VYOUo0YVM1WWE1Q2pQcW44YXovcHBp?=
 =?utf-8?B?NU9tdmtoZEdzY0dJVHRwWEtTekVSMlRZR0tTcExUZTh3MTBQc0U4ekFCSnY4?=
 =?utf-8?B?ZDd6T3NkaVFJazhRMjVwQVduRFZUWVdSaE14bGFLWk5uVS9uUm1IczZMSHFl?=
 =?utf-8?B?UWlqS3RoQ2Z3bkpxc0xBY3JLeXJ4MjJER2V3K2lnRG5iUWJpYnFvMzlZMldS?=
 =?utf-8?B?L3Z0Qms4ZjBSc1drNHpzN0hDM0xvc1dLUTN5T2I4eksvYU1QdnlSYnpmdVF4?=
 =?utf-8?B?cmVrUnJVZndkTXFHQXM4M0dPbmxkVEFaMnhsRGM3OS9VbzNuZnBybnR2Y2h4?=
 =?utf-8?B?OFExOXNzekVQd0NPaEdSeGdtMnRuVDVpUzd1b2U1dVBmOUpOVEUxU2dwWllt?=
 =?utf-8?B?anFkWTJJYVJjTU1uRCtUMm1yTStraVhZd1krWDlvQW0rS2UrVjU2Q3dXN3Fu?=
 =?utf-8?B?T3Zhc3Z0QytQNXgxT2pPVy9sT2RoRkx1RmRrUTZQMjRONHVvbXhFRi9uZFd3?=
 =?utf-8?B?WWorUjBIRitCYnk4OVBqSit4YXF6bm40dzNRNnBxY3FtV2Z3NUZWZkpoOFFZ?=
 =?utf-8?B?Z1lPYmdXZUxrQy9kTHdBZTUzL3hQaTVUVm5SZlRFVWRDZWZtNVFvZlpLM1BM?=
 =?utf-8?B?TnFpcTdQamxhTlh4UjlMUVZ3UTBQb2swT0VSUDZEU2sxeldqcTBZNFlIUW9I?=
 =?utf-8?B?WWtmOVZOUjBOOGp6aWhYcGlRRUplTnlreHNoaVpqbFVTcTM1UTlwUi96TDc3?=
 =?utf-8?B?dXRUaC83ZEQ2a2RqTHdIMXNZenZ4VXRtM2ZmbFF4dTYzSXBmVzFSd1dCSmFt?=
 =?utf-8?B?c0hDUjlNYVV3UWpFZ0NENWJkZkNlM3JLcnBIWGFiQlBzRmV0YXcvbEsrQUhr?=
 =?utf-8?Q?wEtncSJHlLjOilYYZs8Q9r3oYenl0CPtSuT2XBt5Ik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4ACA58A2B68364EAC64072BECB75F1C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9dd605-3b6a-4858-c105-08d9c01a6607
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 22:29:46.1250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVHedoTVktOoGLKuhxfQ+1IqWOWvUmE9sI4GoSX+351RD5a6BSt7vA7UmMrdcxQ+r87sLH/o3+ojsGqUHE7O8tmMHfYuIyiEEPzMo2CfvQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5457
X-Proofpoint-GUID: AdAWicViKtI_aagTrxYRF9elaSLMUwnA
X-Proofpoint-ORIG-GUID: AdAWicViKtI_aagTrxYRF9elaSLMUwnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGV5IFN0ZWZhbiwgTWFyYy1BbmRyZSwgTVNULCBEYXZpZCAtDQoNCkFzIHByb21pc2VkIGhlcmUg
aXMgYSBzZXJpZXMgY2xlYW5pbmcgdXAgZXJyb3IgaGFuZGxpbmcgaW4gdGhlDQpsaWJ2aG9zdC11
c2VyIG1lbW9yeSBtYXBwaW5nIHBhdGguIE1vc3Qgb2YgdGhlc2UgY2xlYW51cHMgYXJlDQpzdHJh
aWdodGZvcndhcmQgYW5kIGhhdmUgYmVlbiBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCBp
biB0aHJlYWRzDQpbMV0gYW5kIFsyXS4gSG9wZWZ1bGx5IHRoZXJlIGlzIG5vdGhpbmcgc3VwZXIg
Y29udHJvdmVyc2lhbCBpbiB0aGUgZmlyc3QNCjQgcGF0Y2hlcy4NCg0KSSBhbSBjb25jZXJuZWQg
YWJvdXQgaXMgcGF0Y2ggNSDigJxsaWJ2aG9zdC11c2VyOiBoYW5kbGUgcmVtb3ZhbCBvZg0KaWRl
bnRpY2FsIHJlZ2lvbnPigJ0uIEZyb20gbXkgcmVhZGluZyBvZiBTdGVmYW4ncyBjb21tZW50cyBp
biBbMV0sIHRoZQ0KcHJvcG9zYWwgc2VlbWVkIHRvIGJlIHRvIHJlbW92ZSBhbnkgZHVwbGljYXRl
IHJlZ2lvbnMuIEnigJlkIHByZWZlciB0bw0KcHJldmVudCBkdXBsaWNhdGUgcmVnaW9ucyBmcm9t
IGJlaW5nIGFkZGVkIGluIHRoZSBmaXJzdCBwbGFjZS4gVGhvdWdodHM/IA0KDQpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIxMTAxODE0MzMxOS5HQTExMDA2QHJhcGhh
ZWwtZGViaWFuLWRldi8NClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzkz
OTFmNTAwLTcwYmUtMjZjZi1iY2ZjLTU5MWQzZWU4NGQ0ZUByZWRoYXQuY29tLw0KDQpTb3JyeSBm
b3IgdGhlIGRlbGF5LA0KUmFwaGFlbA0KDQpEYXZpZCBIaWxkZW5icmFuZCAoMSk6DQogIGxpYnZo
b3N0LXVzZXI6IFNpbXBsaWZ5IFZIT1NUX1VTRVJfUkVNX01FTV9SRUcNCg0KUmFwaGFlbCBOb3J3
aXR6ICg0KToNCiAgbGlidmhvc3QtdXNlcjogQWRkIHZ1X3JlbV9tZW1fcmVnIGlucHV0IHZhbGlk
YXRpb24NCiAgbGlidmhvc3QtdXNlcjogQWRkIHZ1X2FkZF9tZW1fcmVnIGlucHV0IHZhbGlkYXRp
b24NCiAgbGlidmhvc3QtdXNlcjogcHJldmVudCBvdmVyLXJ1bm5pbmcgbWF4IFJBTSBzbG90cw0K
ICBsaWJ2aG9zdC11c2VyOiBoYW5kbGUgcmVtb3ZhbCBvZiBpZGVudGljYWwgcmVnaW9ucw0KDQog
c3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmMgfCA1MiArKysrKysrKysr
KysrKystLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkNCg0KLS0gDQoyLjIwLjENCg==

