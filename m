Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545DE4EBE08
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:48:08 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUvv-0003Yc-2O
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:48:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nZUp4-0001Hx-3P
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:41:02 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:64144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nZUp0-0005Dj-Tv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:41:01 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U5TAEK023576;
 Wed, 30 Mar 2022 02:40:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=gPxPmQ+G/tesixAGNpsSTU93pYjeDuYZ1ym2n+gg6iI=;
 b=bned4eQcMuviNEgAol+zOjRk1wrWpzA+8ZoPHz0TiH108uk6PM+i65p4kQAdpOzciMDl
 yuH2ycOEZjkCyiCgubSgqFGkBWxLbLwtheGION7BcsEdXiiO0SEkR+ktvAh3ipQk4rP+
 ninl+i2c5U0nvrVStSLJdZHO8JbK43D2ECq8dXbin9C275jdYxi9ZosKlQTBDhC60/57
 tyLDAIkhTDQhIsqaXBIw7GbRIgo3g/SQfq+hxiXQWP+MNfj0AY+l/tIbVEDMIWqpTWBa
 bMUdvd+byOIX7pZQIit3VsA49g0F2V09UAkJHre7AE+z/OqPSmnzgaKqgx4r/GbVkMni nA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f1xr8ga83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 02:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5w3lcD4gGBCtJzuqQunTczic36NREvnPYxQ0blDXwmOBMtr+VBQ03Pu39h+ErwjHkIoISwc5vqkdpj2B+Y/1XwM+w1mQCtSmn821xytBYYeFVUQZwSBAmNuDFpva4wiPxz/BInPWoHWDjQKSs3sMZMHv1b8QzmFtrRLCQEI6IPw6tcQ3ONnM0s5zPtpVr8LmQcKt4Ll7MDlIZrE3dAdgfW5TQl0kfKxwK6mDcbwWwe5gdUPp8+Q8mUfdf/TI5B0nrn1b/QruypTDvWtc9ilM/1m3kfG3q7X/kD4V6H4Npr/u0tVFXO4xXETI5t8uiuhiYl1nSWfS0/34wT0ZZSqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPxPmQ+G/tesixAGNpsSTU93pYjeDuYZ1ym2n+gg6iI=;
 b=RcWAYG8nP1WAojOFiBfc6iFV4/x1gupaBFaRxCGrNxpX4lUrEsY9vfqlP96PR9zUKQTLDAY5zSOMBxt5wOx9F8Pm5U/TxM3fT7L1bGi05+xVrXoy9+BL7HncVIKYJkK7+f0v8Od6dcs9umRdJZqdN8lVN6OwVX8c9Nm4fHrAWkhoAd3JW0v0bAy2tvIuo2RwbC/h/Ik8avcFbwwqA+PK0HgX876ahWYplXJYojOY+1KeIOOqCtYBi2ovvETfI22yPDdxfA4Br6d9LHkIi6DMmv4mEWOhVF77BqggWKZH2BrBKx8dkG2humYOITFfsk48De5yhMtJAi65iXUGAQ89HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8005.namprd02.prod.outlook.com (2603:10b6:8:16::16) by
 DM5PR02MB2524.namprd02.prod.outlook.com (2603:10b6:3:3a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.22; Wed, 30 Mar 2022 09:40:42 +0000
Received: from DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::51bf:8780:a83b:85df]) by DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::51bf:8780:a83b:85df%5]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 09:40:42 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH v6 15/19] vfio-user: handle device interrupts
Thread-Topic: [PATCH v6 15/19] vfio-user: handle device interrupts
Thread-Index: AQHYI9L9X+6fb/hVx0GRk09KmJr6nqyz01mAgB68vgCABBm1gIAATtMAgADyO5A=
Date: Wed, 30 Mar 2022 09:40:42 +0000
Message-ID: <DM8PR02MB8005F9B087645AFDE4FB94A58B1F9@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
 <YiXdUbz3r1xORJKD@stefanha-x1.localdomain>
 <67EFF59D-E1DB-4830-B5C2-B58CCA9A35E6@oracle.com>
 <YkMWp0lUJAHhivJA@stefanha-x1.localdomain>
 <9B3B2C94-14B6-4415-9C15-E8738EB52013@oracle.com>
In-Reply-To: <9B3B2C94-14B6-4415-9C15-E8738EB52013@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29ea75ec-8bae-4668-6ce8-08da12315bad
x-ms-traffictypediagnostic: DM5PR02MB2524:EE_
x-microsoft-antispam-prvs: <DM5PR02MB25244A33B26055E3DE0F95238B1F9@DM5PR02MB2524.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qE7UWeuyoed0VGYjONg81qzto4EJjmaFN24SvcqIqhLRECzugNB/vsgLKsJnxMbuF0PfjKTto1iB2gQTbMh28QmdMoribjNF2nRIctVBCJRuJBL4/jPTv8u0eXOJaoaIn6LqtDjt3wbGmaQUG6rjMvg5/mZp01kLVL0FZ8XEXpTzC5budhFvmwnPIWImOxEMkg5h5hO/35vCQ15ikTz6d/8nmCP3BVIr/WgxX+FzGX6D3Ed+9InkAO5EVbJnckdi6gxEL/7xEAogOlgIHx5nAVe4eedRiJRju8h8yNIPR9RaGeEvvJ7RBOFoyy5FAY00f9C/+cDipoAJBXE5o+xa45YIWAtLkPfJeL3GcPzQz+E/FAYNzpe+bEbvv6Ztvuh4SsIXLg5y4riesmyER6rJ0nmuMADFfxIiDaVO3r7hYmQjRIhYyI+p2BccaXGTwmZg1Bi4fMmXTEB3L2AfAx/rcnz70eJcPm7NgHTLWNDbfUW2ewoAhoCjEf0bdm6xhzLfTfoOvsEHicEqqtWkkSQaymLV1MJnU4GhCW3w4BHb0zlxwlVfjte+AjhT7v+Gy0qvRZn0LIQsN4gzHmhAz/4UP1I000PT11OP7lRhjyUDVSDBk6SXygr+/E7YeWouN51nLqCbeAz33iz/DAV21CsHrJlOjGowYzIc3lkLftJlSxlGXISDmGV56jBeNStysw7tRYPAkOc1miFkN5GD2sAX9aYydRPxb+xPPGlkjuXim5ny7vu8zFonTcO7xua5qnRTUfr9DzUtJSBHQrFs0DkJ9wrCeeRuMC7K414F6D9XGQA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8005.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(54906003)(186003)(55016003)(110136005)(26005)(7416002)(508600001)(966005)(44832011)(55236004)(6506007)(7696005)(8936002)(53546011)(316002)(38100700002)(52536014)(9686003)(86362001)(38070700005)(122000001)(2906002)(64756008)(4326008)(33656002)(66446008)(66946007)(83380400001)(8676002)(66476007)(66556008)(71200400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0ZJT254S1NZRkhVUEVsYWZpdWZQWkJqUU5vSTZGT2QrdFk4SC84eXdHZ2hF?=
 =?utf-8?B?SjNJTDIvcWJpQ3RZZ05NZitxSFZmTDNkSXA3TnlrdUx5ZVJ1WUw5TDdGS0VE?=
 =?utf-8?B?Qisxb2l1WXlTOExONTNtdDJvWDlrQnJGRnVYOFhPSHVNSXNROVIzQTlZcVBm?=
 =?utf-8?B?UG84N3poRFVxaTZsZWdIdG1XZDBra2J5cFBKZXVPTGtJMnVyQXZ0M0lETW80?=
 =?utf-8?B?UUplUk5yK3d1UFVuZ0xMYjNSdGZtRDVzaHpRb2hhN0hJeE1NUkJwM3NpdGFt?=
 =?utf-8?B?WmRUaFNyRElqTHFOUE9vbHlPTjlEb3U2MU84bzJlUStLQllCOWJ6OXVUbnB1?=
 =?utf-8?B?b0U3SXQ1bkM5UDdsdTdoTzlQaWcxTzdaa3pKOE12WWpQRlM2WGgvd2xlNTBa?=
 =?utf-8?B?VW52ekFlN0ZMRUhNN3BzWTlGWFlraGg0WjkzS0QvdmY5RWZIMTJRNTE1bWty?=
 =?utf-8?B?bHNTNzRiSk5XQzF0SWMvM2kzMHNPUlpMbndxR2dndGJPQmlpcGV6MzNKTWEr?=
 =?utf-8?B?cnJ5RFpNbXZTcUtWQnBQME5xOGFzb2IvZ3BHWU55NVk4azVFc09IY0tuaEhR?=
 =?utf-8?B?aldoWitDMVgwNDlZS0J3aC8zSmtocDdrOXlaMEpQVVNDWWY3Z1dXaVQvQ3Yw?=
 =?utf-8?B?eGVxSWxNNWFxNVRFWVZqVlZqRGJXRWJ5V1lnWHNENlJ4OEMyS1FXVGtKTEtM?=
 =?utf-8?B?YjBZaFR5djlITitYU3Jvc3RUdWtjYzB2QmtXVk9vMC95ME55UGE0a2ZZSUIz?=
 =?utf-8?B?bUQwT043L0VNakduakNxVVp4ZU9RbWVzVVBBcTNKVmdxbDAyZjFZeUl3WGJV?=
 =?utf-8?B?QWNHTEswZjhBdWtOZzE3U04vLzBnbVA5MGRVSHplQkduL3MxdGMxWjMyYXlF?=
 =?utf-8?B?SFR3Mi91VG9VRktoTzBaMENKUGJvbHV0VjRiQmVhdjdmcDAvWGR1Y3ZKeHNJ?=
 =?utf-8?B?TnF1Y3FSNVlIMFVJSHBHRkhvNFJySTMvNnNBYlhIUmpDZStrM0loU1ZQRlVr?=
 =?utf-8?B?d2loTGFJSGVnYXAxcmcwRUV6RENWUlVZUnhVajlHbTB0VjlqenZhTWl4TGxt?=
 =?utf-8?B?dGcwUGdHNFRpR2tMb04vMngxRzA4UlJSRWIwWW9oQ21yS1B4RHdyUURPalYw?=
 =?utf-8?B?TTQvZHBnbE1Na0V0bG9XcjQzaGlvbWszenhpQjRSWE80TnE5SVc5eFVUSisx?=
 =?utf-8?B?c2RlTi81MlpCb2g2WjFYMTUwTzVOcTA5cmh1VHRocXVqc1NmVkZzWkZjQlBT?=
 =?utf-8?B?Y1ZFb21FZ0gwWUZmMitZNHNJWXJiRUd0bmdLNlpIMU0zRFo3M3ZIOUJybk1z?=
 =?utf-8?B?QUtEL3gwUnVwajRubW9hOHMzN3VUdGdTZDYxY0U0NWpJbCtzUTlXblpyOFNl?=
 =?utf-8?B?ejZCWE1TVWd1MHZ1U2MvQ1NZWDJCU2dCKzR5STFvWnJqOTAyeEdZY1pxeWlr?=
 =?utf-8?B?U3FNKy8wMGZnZmtVTmV4c3dXYzcxTGZzZElYYnRmWlJWSjRvYnZwYmRlMDE5?=
 =?utf-8?B?Y2RISGxYdTc5NW9WdDNDZGIwNy9UMllJd1VxclIxVjU0STY3alQ2TktSYUZG?=
 =?utf-8?B?REhJeE1nS2pzTGc4V3BZZVI4dUtzdzJaQjBZZlNldEJTTDdBT2x3TkZPakwv?=
 =?utf-8?B?bjE3UGRVT1ZFN2FLR0E1OVpGaDdta2sxRFZCUXdLM0h3WHdXOEl3RjhZK0RR?=
 =?utf-8?B?MW8vQzdBZi9PZm8ydHZNYmd6N1BiSnh0QUl4VktSKzJaamVhQ2kzU1NNMitB?=
 =?utf-8?B?RFB1Q2pBZWlTeisydkpzaHBjbm1SOWY1cUdsK1BMNDF5K0hSa3R4T2dGT1dz?=
 =?utf-8?B?ckhGbmJjVHZjQXg5U3YyR21HQnBHR2dZODBVdU91b3MzM1pVdUViV0kxQngx?=
 =?utf-8?B?Q25OUndOLzcrSktyYmVzUmwreHNCUStReE9odWlPTU5QKzdRR2UwSXNvUEJY?=
 =?utf-8?B?Zi9kc3U2OFRjdmNocDhNd0J1V2VvWmFlNnJxc3U3M1RTOThEWWR5UEg2Nk9v?=
 =?utf-8?B?NGtPdTNWNG0zcEhnYlJUK2NBdTlRSUowRUF5Q0lzem0zMmp1MDNPeGRRZkFj?=
 =?utf-8?B?R0YrOVAxVWVpZTNaWG1YTS9OY01KVzhvU0c3cU5XajRaUEEyN1ZhMWdIeU1H?=
 =?utf-8?B?elUvK0w3UDNuWFRxOTZ2emhrUWRwcWtQdnN1RTR5dS9IMU5LMXZ4K1l6UWln?=
 =?utf-8?B?TjZMcUNVY1pKL0xSUTEzN1I1R2RQYWg3OGZhK2c5V3FVR1l3WHN1ZnQyRDl2?=
 =?utf-8?B?Q01EaHRiYUlvekVkQjBhNGZhdjQzWGFEQVpQOHVJSXVVN09xR3kyVkJkNEM0?=
 =?utf-8?B?cEJvTzBjMWw3LzhwczJGNEhiSU5FK2lUSHpINFJPNHV4NllFZnlndz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8005.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ea75ec-8bae-4668-6ce8-08da12315bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 09:40:42.6667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuYYyb6VZr/fDT08M0umU7H7rnz0aAkMIH42CNffcvcD6BiNpGvjx+sMP38Ym2NqUxh5dWGrJBdp74aGqGSUV44k832JT2g9WV/nXCiflHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2524
X-Proofpoint-GUID: edQcbyl3YopJTH4ZwdMRHnpq99hyE3Uu
X-Proofpoint-ORIG-GUID: edQcbyl3YopJTH4ZwdMRHnpq99hyE3Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_03,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWcgUmFtYW4gPGphZy5yYW1h
bkBvcmFjbGUuY29tPg0KPiBTZW50OiAyOSBNYXJjaCAyMDIyIDIwOjA3DQo+IFRvOiBTdGVmYW4g
SGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+IENjOiBBbGV4IFdpbGxpYW1zb24gPGFs
ZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPjsgcWVtdS1kZXZlbCA8cWVtdS0NCj4gZGV2ZWxAbm9u
Z251Lm9yZz47IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+OyBQaGlsaXBwZSBN
YXRoaWV1LQ0KPiBEYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz47IFBhb2xvIEJvbnppbmkgPHBib256
aW5pQHJlZGhhdC5jb20+OyBCZXJhbGRvDQo+IExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBEYW5p
ZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPjsNCj4gZWR1YXJkb0BoYWJrb3N0
Lm5ldDsgTWFyY2VsIEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+Ow0KPiBF
cmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT47IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVA
cmVkaGF0LmNvbT47DQo+IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+OyBkZ2ls
YmVydEByZWRoYXQuY29tOyBKb2huIExldm9uDQo+IDxqb2huLmxldm9uQG51dGFuaXguY29tPjsg
VGhhbm9zIE1ha2F0b3MgPHRoYW5vcy5tYWthdG9zQG51dGFuaXguY29tPjsNCj4gRWxlbmEgVWZp
bXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT47IEpvaG4gSm9obnNvbg0KPiA8am9o
bi5nLmpvaG5zb25Ab3JhY2xlLmNvbT47IEthbnRoIEdoYXRyYWp1IDxrYW50aC5naGF0cmFqdUBv
cmFjbGUuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDE1LzE5XSB2ZmlvLXVzZXI6IGhh
bmRsZSBkZXZpY2UgaW50ZXJydXB0cw0KPiANCj4gDQo+IA0KPiA+IE9uIE1hciAyOSwgMjAyMiwg
YXQgMTA6MjQgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiBPbiBTYXQsIE1hciAyNiwgMjAyMiBhdCAxMTo0NzozNlBNICswMDAwLCBK
YWcgUmFtYW4gd3JvdGU6DQo+ID4+DQo+ID4+DQo+ID4+PiBPbiBNYXIgNywgMjAyMiwgYXQgNToy
NCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KPiB3cm90ZToNCj4g
Pj4+DQo+ID4+PiBPbiBUaHUsIEZlYiAxNywgMjAyMiBhdCAwMjo0OTowMkFNIC0wNTAwLCBKYWdh
bm5hdGhhbiBSYW1hbiB3cm90ZToNCj4gPj4+PiBGb3J3YXJkIHJlbW90ZSBkZXZpY2UncyBpbnRl
cnJ1cHRzIHRvIHRoZSBndWVzdA0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRWxlbmEg
VWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4gPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+
ID4+Pj4gLS0tDQo+ID4+Pj4gaW5jbHVkZS9ody9wY2kvcGNpLmggICAgICAgICAgICAgIHwgICA2
ICsrDQo+ID4+Pj4gaW5jbHVkZS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5oIHwgICA2ICsrDQo+
ID4+Pj4gaHcvcGNpL21zaS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICsrKy0NCj4gPj4+
PiBody9wY2kvbXNpeC5jICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKysrLQ0KPiA+Pj4+IGh3
L3JlbW90ZS9tYWNoaW5lLmMgICAgICAgICAgICAgICB8ICAxMSArLS0NCj4gPj4+PiBody9yZW1v
dGUvdmZpby11c2VyLW9iai5jICAgICAgICAgfCAxMDcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4+Pj4gc3R1YnMvdmZpby11c2VyLW9iai5jICAgICAgICAgICAgIHwgICA2ICsr
DQo+ID4+Pj4gTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gPj4+
PiBody9yZW1vdGUvdHJhY2UtZXZlbnRzICAgICAgICAgICAgfCAgIDEgKw0KPiA+Pj4+IHN0dWJz
L21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4+Pj4gMTAgZmlsZXMgY2hh
bmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4+Pj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouaA0KPiA+Pj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBzdHVicy92ZmlvLXVzZXItb2JqLmMNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2h3L3BjaS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+ID4+
Pj4gaW5kZXggYzNmM2M5MDQ3My4uZDQyZDUyNmE0OCAxMDA2NDQNCj4gPj4+PiAtLS0gYS9pbmNs
dWRlL2h3L3BjaS9wY2kuaA0KPiA+Pj4+ICsrKyBiL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+ID4+
Pj4gQEAgLTEyOSw2ICsxMjksOCBAQCB0eXBlZGVmIHVpbnQzMl90IFBDSUNvbmZpZ1JlYWRGdW5j
KFBDSURldmljZQ0KPiAqcGNpX2RldiwNCj4gPj4+PiB0eXBlZGVmIHZvaWQgUENJTWFwSU9SZWdp
b25GdW5jKFBDSURldmljZSAqcGNpX2RldiwgaW50IHJlZ2lvbl9udW0sDQo+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWJ1c190IGFkZHIsIHBjaWJ1c190IHNpemUsIGlu
dCB0eXBlKTsNCj4gPj4+PiB0eXBlZGVmIHZvaWQgUENJVW5yZWdpc3RlckZ1bmMoUENJRGV2aWNl
ICpwY2lfZGV2KTsNCj4gPj4+PiArdHlwZWRlZiB2b2lkIFBDSU1TSU5vdGlmeShQQ0lEZXZpY2Ug
KnBjaV9kZXYsIHVuc2lnbmVkIHZlY3Rvcik7DQo+ID4+Pj4gK3R5cGVkZWYgdm9pZCBQQ0lNU0l4
Tm90aWZ5KFBDSURldmljZSAqcGNpX2RldiwgdW5zaWduZWQgdmVjdG9yKTsNCj4gPj4+Pg0KPiA+
Pj4+IHR5cGVkZWYgc3RydWN0IFBDSUlPUmVnaW9uIHsNCj4gPj4+PiAgICBwY2lidXNfdCBhZGRy
OyAvKiBjdXJyZW50IFBDSSBtYXBwaW5nIGFkZHJlc3MuIC0xIG1lYW5zIG5vdCBtYXBwZWQgKi8N
Cj4gPj4+PiBAQCAtMzIzLDYgKzMyNSwxMCBAQCBzdHJ1Y3QgUENJRGV2aWNlIHsNCj4gPj4+PiAg
ICAvKiBTcGFjZSB0byBzdG9yZSBNU0lYIHRhYmxlICYgcGVuZGluZyBiaXQgYXJyYXkgKi8NCj4g
Pj4+PiAgICB1aW50OF90ICptc2l4X3RhYmxlOw0KPiA+Pj4+ICAgIHVpbnQ4X3QgKm1zaXhfcGJh
Ow0KPiA+Pj4+ICsNCj4gPj4+PiArICAgIFBDSU1TSU5vdGlmeSAqbXNpX25vdGlmeTsNCj4gPj4+
PiArICAgIFBDSU1TSXhOb3RpZnkgKm1zaXhfbm90aWZ5Ow0KPiA+Pj4+ICsNCj4gPj4+PiAgICAv
KiBNZW1vcnlSZWdpb24gY29udGFpbmVyIGZvciBtc2l4IGV4Y2x1c2l2ZSBCQVIgc2V0dXAgKi8N
Cj4gPj4+PiAgICBNZW1vcnlSZWdpb24gbXNpeF9leGNsdXNpdmVfYmFyOw0KPiA+Pj4+ICAgIC8q
IE1lbW9yeSBSZWdpb25zIGZvciBNU0lYIHRhYmxlIGFuZCBwZW5kaW5nIGJpdCBlbnRyaWVzLiAq
Lw0KPiA+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmgg
Yi9pbmNsdWRlL2h3L3JlbW90ZS92ZmlvLQ0KPiB1c2VyLW9iai5oDQo+ID4+Pj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gPj4+PiBpbmRleCAwMDAwMDAwMDAwLi44N2FiNzhiODc1DQo+ID4+Pj4g
LS0tIC9kZXYvbnVsbA0KPiA+Pj4+ICsrKyBiL2luY2x1ZGUvaHcvcmVtb3RlL3ZmaW8tdXNlci1v
YmouaA0KPiA+Pj4+IEBAIC0wLDAgKzEsNiBAQA0KPiA+Pj4+ICsjaWZuZGVmIFZGSU9fVVNFUl9P
QkpfSA0KPiA+Pj4+ICsjZGVmaW5lIFZGSU9fVVNFUl9PQkpfSA0KPiA+Pj4+ICsNCj4gPj4+PiAr
dm9pZCB2ZnVfb2JqZWN0X3NldF9idXNfaXJxKFBDSUJ1cyAqcGNpX2J1cyk7DQo+ID4+Pj4gKw0K
PiA+Pj4+ICsjZW5kaWYNCj4gPj4+PiBkaWZmIC0tZ2l0IGEvaHcvcGNpL21zaS5jIGIvaHcvcGNp
L21zaS5jDQo+ID4+Pj4gaW5kZXggNDdkMmIwZjMzYy4uOTNmNWU0MDBjYyAxMDA2NDQNCj4gPj4+
PiAtLS0gYS9ody9wY2kvbXNpLmMNCj4gPj4+PiArKysgYi9ody9wY2kvbXNpLmMNCj4gPj4+PiBA
QCAtNTEsNiArNTEsOCBAQA0KPiA+Pj4+ICovDQo+ID4+Pj4gYm9vbCBtc2lfbm9uYnJva2VuOw0K
PiA+Pj4+DQo+ID4+Pj4gK3N0YXRpYyB2b2lkIHBjaV9tc2lfbm90aWZ5KFBDSURldmljZSAqZGV2
LCB1bnNpZ25lZCBpbnQgdmVjdG9yKTsNCj4gPj4+PiArDQo+ID4+Pj4gLyogSWYgd2UgZ2V0IHJp
ZCBvZiBjYXAgYWxsb2NhdG9yLCB3ZSB3b24ndCBuZWVkIHRoaXMuICovDQo+ID4+Pj4gc3RhdGlj
IGlubGluZSB1aW50OF90IG1zaV9jYXBfc2l6ZW9mKHVpbnQxNl90IGZsYWdzKQ0KPiA+Pj4+IHsN
Cj4gPj4+PiBAQCAtMjI1LDYgKzIyNyw4IEBAIGludCBtc2lfaW5pdChzdHJ1Y3QgUENJRGV2aWNl
ICpkZXYsIHVpbnQ4X3Qgb2Zmc2V0LA0KPiA+Pj4+ICAgIGRldi0+bXNpX2NhcCA9IGNvbmZpZ19v
ZmZzZXQ7DQo+ID4+Pj4gICAgZGV2LT5jYXBfcHJlc2VudCB8PSBRRU1VX1BDSV9DQVBfTVNJOw0K
PiA+Pj4+DQo+ID4+Pj4gKyAgICBkZXYtPm1zaV9ub3RpZnkgPSBwY2lfbXNpX25vdGlmeTsNCj4g
Pj4+DQo+ID4+PiBBcmUgeW91IHN1cmUgaXQncyBjb3JyZWN0IHRvIHNraXAgdGhlIG1zaV9pc19t
YXNrZWQoKSBsb2dpYz8gSSB0aGluayB0aGUNCj4gPj4+IGNhbGxiYWNrIGZ1bmN0aW9uIHNob3Vs
ZCBvbmx5IG92ZXJyaWRlIHRoZSBiZWhhdmlvciBvZg0KPiA+Pj4gbXNpX3NlbmRfbWVzc2FnZSgp
LCBub3QgdGhlIGVudGlyZSBtc2lfbm90aWZ5KCkgZnVuY3Rpb24uDQo+ID4+Pg0KPiA+Pj4gVGhl
IHNhbWUgYXBwbGllcyB0byBNU0ktWC4NCj4gPj4NCj4gPj4gSGkgU3RlZmFuLA0KPiA+Pg0KPiA+
PiBXZSBub3RpY2VkIHRoYXQgdGhlIGNsaWVudCBpcyBoYW5kbGluZyB0aGUgbWFza2luZyBhbmQg
dW5tYXNraW5nIG9mIE1TSXgNCj4gPj4gaW50ZXJydXB0cy4NCj4gPj4NCj4gPj4gQ29uY2Vybmlu
ZyBNU0l4LCB2ZmlvX21zaXhfdmVjdG9yX3VzZSgpIGhhbmRsZXMgdW5tYXNraW5nIGFuZA0KPiA+
PiB2ZmlvX21zaXhfdmVjdG9yX3JlbGVhc2UoKSBoYW5kbGVzIG1hc2tpbmcgb3BlcmF0aW9ucy4g
VGhlIHNlcnZlciB0cmlnZ2Vycw0KPiA+PiBhbiBNU0l4IGludGVycnVwdCBieSBzaWduYWxpbmcg
dGhlIGV2ZW50ZmQgYXNzb2NpYXRlZCB3aXRoIHRoZSB2ZWN0b3IuIElmIHRoZQ0KPiB2ZWN0b3IN
Cj4gPj4gaXMgdW5tYXNrZWQsIHRoZSBpbnRlcnJ1cHQgYnlwYXNzZXMgdGhlIGNsaWVudC9RRU1V
IGFuZCB0YWtlcyB0aGlzDQo+ID4+IHBhdGg6IOKAnHNlcnZlciAtPiBLVk0gLT4gZ3Vlc3TigJ0u
IFdoZXJlYXMsIGlmIHRoZSB2ZWN0b3IgaXMgbWFza2VkLCBpdCBsYW5kcyBvbg0KPiB0aGUNCj4g
Pj4gY2xpZW50IHZpYTog4oCcc2VydmVyIC0+IHZmaW9fbXNpX2ludGVycnVwdCgp4oCdLiB2Zmlv
X21zaV9pbnRlcnJ1cHQoKSBzdXBwcmVzc2VzDQo+IHRoZQ0KPiA+PiBpbnRlcnJ1cHQgaWYgdGhl
IHZlY3RvciBpcyBtYXNrZWQuIFRoZSB1c2UgYW5kIHJlbGVhc2UgZnVuY3Rpb25zIHN3aXRjaCB0
aGUNCj4gc2VydmVy4oCZcw0KPiA+PiBldmVudGZkIGJldHdlZW4gVkZJT1BDSURldmljZS0+VkZJ
T01TSVZlY3RvcltpXS0+a3ZtX2ludGVycnVwdCBhbmQNCj4gPj4gVkZJT1BDSURldmljZS0+VkZJ
T01TSVZlY3RvcltpXS0+aW50ZXJydXB0IHVzaW5nIHRoZQ0KPiA+PiBWRklPX0RFVklDRV9TRVRf
SVJRUyBtZXNzYWdlLg0KPiA+Pg0KPiA+PiBDb25jZXJuaW5nIE1TSSwgdGhlIHNlcnZlciBzaG91
bGQgY2hlY2sgaWYgdGhlIHZlY3RvciBpcyB1bm1hc2tlZCBiZWZvcmUNCj4gPj4gdHJpZ2dlcmlu
Zy4gVGhlIHNlcnZlciBpcyBub3QgZG9pbmcgaXQgcHJlc2VudGx5LCB3aWxsIHVwZGF0ZSBpdC4g
Rm9yIHNvbWUNCj4gcmVhc29uLA0KPiA+PiBJIGhhZCBhc3N1bWVkIHRoYXQgTVNJIGhhbmRsaW5n
IGlzIHNpbWlsYXIgdG8gTVNJeCBpbiB0ZXJtcyBvZiBtYXNraW5nIC0gc29ycnkNCj4gPj4gYWJv
dXQgdGhhdC4gVGhlIG1hc2tpbmcgYW5kIHVubWFza2luZyBpbmZvcm1hdGlvbiBmb3IgTVNJIGlz
IGluIHRoZSBjb25maWcNCj4gc3BhY2UNCj4gPj4gcmVnaXN0ZXJzLCBzbyB0aGUgc2VydmVyIHNo
b3VsZCBoYXZlIHRoaXMgaW5mb3JtYXRpb24uDQo+ID4+DQo+ID4+IFlvdSBoYWQgcHJldmlvdXNs
eSBzdWdnZXN0ZWQgdXNpbmcgY2FsbGJhY2tzIGZvciBtc2lfZ2V0X21lc3NhZ2UgJg0KPiA+PiBt
c2lfc2VuZF9tZXNzYWdlLCBjb25zaWRlcmluZyB0aGUgbWFza2luZyBpc3N1ZS4gR2l2ZW4gTVNJ
eCBtYXNraW5nDQo+ID4+IChpbmNsdWRpbmcgdGhlIE1TSXggdGFibGUgQkFSKSBpcyBoYW5kbGVk
IGF0IHRoZSBjbGllbnQsIHRoZSBtYXNraW5nDQo+IGluZm9ybWF0aW9uDQo+ID4+IGRvZXNu4oCZ
dCByZWFjaCB0aGUgc2VydmVyIC0gc28gbXNpeF9ub3RpZnkgd2lsbCBuZXZlciBpbnZva2UgdGhl
DQo+ID4+IG1zaV9zZW5kX21lc3NhZ2UgY2FsbGJhY2sgLSBhbGwgdGhlIHZlY3RvcnMgcmVtYWlu
IG1hc2tlZCBhdCB0aGUgc2VydmVyDQo+ID4+IGVuZCAobXNpeF9pbml0KCkgLT4gbXNpeF9tYXNr
X2FsbCgpKS4NCj4gPg0KPiA+IEkgd2FzIGV4cGVjdGluZyB2ZmlvLXVzZXIgZGV2aWNlcyB0byBi
ZSBpbnZvbHZlZCBpbiBNU0ktWCBtYXNraW5nIHNvDQoNCmxpYnZmaW8tdXNlciBjYW4ndCBiZSBp
bnZvbHZlZCBpbiB0aGUgZmlyc3QgcGxhY2Ugc2luY2UgUUVNVSBlbXVsYXRlcyBNU0kvWDoNCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIwMDEyMTEwMTkxMS42NDcwMWFmZEB3NTIwLmhv
bWUvVC8NCg0KPiA+IHRoZXkgY2FuIGltcGxlbWVudCB0aGUgUGVuZGluZyBiaXQgc2VtYW50aWNz
IGRlc2NyaWJlZCBpbiB0aGUgc3BlYzoNCj4gPg0KPiA+ICBJZiBhIG1hc2tlZCB2ZWN0b3IgaGFz
IGl0cyBQZW5kaW5nIGJpdCBTZXQsIGFuZCB0aGUgYXNzb2NpYXRlZA0KPiA+ICB1bmRlcmx5aW5n
IGludGVycnVwdCBldmVudHMgYXJlIHNvbWVob3cgc2F0aXNmaWVkICh1c3VhbGx5IGJ5IHNvZnR3
YXJlDQo+ID4gIHRob3VnaCB0aGUgZXhhY3QgbWFubmVyIGlzIEZ1bmN0aW9uLXNwZWNpZmljKSwg
dGhlIEZ1bmN0aW9uIG11c3QgQ2xlYXINCj4gPiAgdGhlIFBlbmRpbmcgYml0LCB0byBhdm9pZCBz
ZW5kaW5nIGEgc3B1cmlvdXMgaW50ZXJydXB0IG1lc3NhZ2UgbGF0ZXINCj4gPiAgd2hlbiBzb2Z0
d2FyZSB1bm1hc2tzIHRoZSB2ZWN0b3IuDQo+ID4NCj4gPiBEb2VzIFFFTVUgVkZJTyBzdXBwb3J0
IHRoaXM/DQo+IA0KPiBRRU1VIFZGSU8gZG9lc27igJl0IHNlZW0gdG8gc3VwcG9ydCBpdCAtIEkg
Y291bGRu4oCZdCBmaW5kIGEgcGxhY2Ugd2hlcmUNCj4gYW4gYXNzaWduZWQvcGFzc3RocnUgUENJ
IGRldmljZSBjbGVhcnMgdGhlIHBlbmRpbmcgYml0cyBpbiBRRU1VLg0KPiANCj4gPg0KPiA+IFdo
YXQgaGFwcGVucyB3aGVuIGEgaHcvbmV0L2UxMDAwZV9jb3JlLmMgdmZpby11c2VyIGRldmljZSB1
c2VzDQo+ID4gbXNpeF9jbHJfcGVuZGluZygpIGFuZCByZWxhdGVkIEFQSXM/DQo+ID4NCj4gPiBB
bHNvLCBoYXZpbmcgdGhlIHZmaW8tdXNlciBkYWVtb24gd3JpdGUgdG8gdGhlIGV2ZW50ZmQgd2hp
bGUgdGhlIHZlY3Rvcg0KPiA+IGlzIG1hc2tlZCBpcyBhIHdhc3RlIG9mIENQVSBjeWNsZXMuIFRo
ZSBQQ0llIHNwZWMgZGVzY3JpYmVzIHVzaW5nIE1TSS1YDQo+ID4gbWFza2luZyBmb3IgcG9sbCBt
b2RlIG9wZXJhdGlvbiBhbmQgZ29pbmcgdmlhIGV2ZW50ZmQgaXMgc3Vib3B0aW1hbDoNCj4gPg0K
PiA+ICBTb2Z0d2FyZSBpcyBwZXJtaXR0ZWQgdG8gbWFzayBvbmUgb3IgbW9yZSB2ZWN0b3JzIGlu
ZGVmaW5pdGVseSwgYW5kDQo+ID4gIHNlcnZpY2UgdGhlaXIgYXNzb2NpYXRlZCBpbnRlcnJ1cHQg
ZXZlbnRzIHN0cmljdGx5IGJhc2VkIG9uIHBvbGxpbmcNCj4gPiAgdGhlaXIgUGVuZGluZyBiaXRz
LiBBIEZ1bmN0aW9uIG11c3QgU2V0IGFuZCBDbGVhciBpdHMgUGVuZGluZyBiaXRzIGFzDQo+ID4g
IG5lY2Vzc2FyeSB0byBzdXBwb3J0IHRoaXMg4oCccHVyZSBwb2xsaW5n4oCdIG1vZGUgb2Ygb3Bl
cmF0aW9uLg0KPiA+DQo+ID4gTWF5YmUgdGhlIGFuc3dlciBpcyB0aGVzZSBpc3N1ZXMgZG9uJ3Qg
bWF0dGVyIGluIHByYWN0aWNlIGJlY2F1c2UgTVNJLVgNCj4gPiBtYXNraW5nIGlzIG5vdCB1c2Vk
IG11Y2g/DQo+IA0KPiBGcm9tIHdoYXQgSSBjYW4gdGVsbCwg4oCccHVyZSBwb2xsaW5n4oCdIGlz
IHVzZWQgYnkgaXZzaG1lbSBhbmQgdmlydGlvLXBjaSBkZXZpY2VzIGluDQo+IFFFTVUuDQo+IA0K
PiBlMTAwMGUgZG9lc27igJl0IHVzZSDigJxwdXJlIHBvbGxpbmfigJ0sIGJ1dCBpdCBkb2VzIGNs
ZWFyIHBlbmRpbmcgaW50ZXJydXB0cy4NCj4gDQo+IEpvaG4gSm9obnNvbiwgSm9obiBMZXZvbiAm
IFRoYW5vcywNCj4gDQo+ICAgICBBbnkgdGhvdWdodHM/DQoNCklmIFFFTVUgc3RvcHMgZW11bGF0
aW5nIE1TSS9YIHRoZW4gd2UgbGlidmZpby11c2VyIHdvdWxkIGhhdmUgdG8gZG8gaXQuDQo=

