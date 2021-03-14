Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0733A21A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 01:45:13 +0100 (CET)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLEsa-0001vJ-4j
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 19:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEog-0007Ed-2H
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:41:10 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:22253)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEod-0004qG-2Q
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615682466; x=1647218466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZCvnIK8xiZcyTp+EgXbcjPRUpcNj4GpAs9YQrhCKAuw=;
 b=oxrJnXtypBdBxd5fN0VCWMwDBJiUACLKBhjhVINGPfB0JcaB/U52Pah6
 P2S+pcgSwSzesfIpkVHKk2LUyLjMeDer8dBBbnfYeeZrxK1Z7Q4bXBt76
 EyUGnSuIU1KVs2K2LLpgLW76OX8FpVtoyJLN9UMpbL0egw58Y3tqfa8Uc E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Mar 2021 16:41:05 -0800
X-QCInternal: smtphost
Received: from nasanexm03h.na.qualcomm.com ([10.85.0.50])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 13 Mar 2021 16:41:05 -0800
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 16:41:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 13 Mar 2021 16:41:05 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4263.namprd02.prod.outlook.com (2603:10b6:a03:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 00:41:04 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 00:41:04 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 27/35] Hexagon (target/hexagon) TCG for instructions
 with multiple definitions
Thread-Topic: [PATCH v8 27/35] Hexagon (target/hexagon) TCG for instructions
 with multiple definitions
Thread-Index: AQHW/d3PFfddo1cG80O41eolcsYrP6pYaKqAgCb8gQA=
Date: Sun, 14 Mar 2021 00:41:03 +0000
Message-ID: <BYAPR02MB48866F4E9721399EEE58AE73DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-28-git-send-email-tsimpson@quicinc.com>
 <d08c59c0-4cc5-0ffd-a1fe-11fe919a3394@linaro.org>
In-Reply-To: <d08c59c0-4cc5-0ffd-a1fe-11fe919a3394@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ea86a72-b4ea-4d00-df31-08d8e681d922
x-ms-traffictypediagnostic: BYAPR02MB4263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4263C1BC6C4C2D34233245D5DE6D9@BYAPR02MB4263.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xi8kg8jbPTaXX6YUHl60VgwbPn5sJBLQsxp7iVd5u4lRcbHT9x7RnzYv6+8gew+u1u+6axZOPjuJQHeEmadHGZKa2dU9a6hxnpX3pPrSopMQDUmOjnQAuHefvD6WppybpfBcVd90oxDARcBusLuTU2YGf1b9Yc1lpQTNkGAowauT4uQK69y6CFJe0emxeNRbR/LIWFO/GiK0xpywKjqu47zPMwbCcRKxRIvoWYCljUfAtWMHID0KQeVkU59VXUyjqOjnhQa+aip/1vLXWuCH/6b+LzRHIulj43P/Ok1IkVXmBqjtz8l/+H4/KHkjbIJS7S/t3TR1glM/+FZGyNyC49KV580hSWGa7H+AhzTH/unmCl7XlGd53mN4SFs17ZtzRR7/Dkig70qwynslZ2PV22mNHMLlbivTWFKaYUnhjoTgb+rD409p157lCyyajpJS5cT3jAyYyRdKSfVLOq9NMCysy+shqf73F+GJROaZNS6kfFGp6Hs/YS/mXiG20cO82LLJ30B0Mx5SbTLLTc/LpFLGjY8fnVdDUeBP6ha9xcL6JzeeQ3cnoZZcBs4T0lFo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(76116006)(52536014)(55016002)(4326008)(64756008)(66476007)(478600001)(9686003)(66946007)(66446008)(8676002)(316002)(8936002)(66556008)(54906003)(26005)(83380400001)(71200400001)(5660300002)(86362001)(6506007)(53546011)(7696005)(33656002)(186003)(110136005)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SmRrdHR2cUtDY0VTWFJUSXd6Y2NkcnYxOEwvQnJKVCtDeFlZcjBNVHZpdXM2?=
 =?utf-8?B?UWdxL0ZZYVZndVlhL3l6ZHNudnRUYy96Ky92LzhIcjBtUXVOSXRVTUZNaHBv?=
 =?utf-8?B?S01MRHpjUC95eHBvM0pYbFhjSmdQaFljVjgycW5xY2hGMWdEbERJNUcvUEpm?=
 =?utf-8?B?U0tXTCs5YlFiaFBvcGFoaFpNTE13UkNRSWhVbmQ1QUJoTElldWpHOE1oNE9I?=
 =?utf-8?B?WXZ6NHJMRFNtcVRhNDVYOGZ6TGRjZUt3OFpUckFBMWtHR3JMN1BOK3lycWlO?=
 =?utf-8?B?eFFzb2NPdDVaSXJmZTcvTWJ5R1k5eDdGa1MwRnBnMHRCMzM1Ly9GOTJRaEY4?=
 =?utf-8?B?SzRYejBvRG5QNXRQQmFwa3RwVnhEcGx3aWdRWmVZUklMMUk4WVo4NVdxUUhU?=
 =?utf-8?B?VmNUTkc3Zk5hdkk5Z2NDWmNhMkZoMmhVQUNNTnJNcDA1amZxL2R2S0tzbVdM?=
 =?utf-8?B?WWloUWk4MXdxVG1JcDFsN1p6NEtzR0NmZkR5RXlPZWM4NE93WXUxK1RUcW84?=
 =?utf-8?B?V2hkWFpZNDhEMTVFOS9rejRmKzhPa0J0UFFEaFg3QWhCcHU1dHRJb1R5eWFU?=
 =?utf-8?B?ODVUb0xvWDQ3aWFVV2VXaVdaT3hsNmhENzZHSGIrTkYySjdEUG1YRDNyS0ZI?=
 =?utf-8?B?bDhOeGxOU2VDbHVhc3Y2WDRrUlVaamRtanByVjdqeUk5M0Z1TTd4d0prbjZR?=
 =?utf-8?B?dHpkQnRramxSTktjZUJlSi9CUEF3OFdDWlR3eGw1YU5peVBEczRkY0tkSWVX?=
 =?utf-8?B?Ynl6OHM5SUJ5OGJkejd0ZTJvQjRVbkVkTWNkRzJkOVdJUGR1TDNLM1hoNzE1?=
 =?utf-8?B?NWsrRHVPK25jWXlsdGt0QTFCdnZpeDZjMTFhRkQ3RkVKd0krb3paY0IzVThS?=
 =?utf-8?B?NmVIaExHTVhxcTQ4bThLZ2ZPaWlaSTlQTDJQNVo5YUxSNkM1R3VNMmVvTHZn?=
 =?utf-8?B?a01LdmVpZDlyb3NCOE5Bd2xtRDJ4NmgrWlFEQXRQS3orT1FQM251NFlxZmc5?=
 =?utf-8?B?bFFJbXc2bWVrajJnTjdhZ1M0ck9TRGVDNEVLQjRwQTJwN21ieVovQklCNHdB?=
 =?utf-8?B?cHpFQmdJWjM4K1owSUowWkFjVVpVVnRGUjFEMEhCV2xEMldxT292WHZTeFBs?=
 =?utf-8?B?QjIwNEIrcWFzQkNyOFlpZGlDOGlCcmhyVWxvWE9oMDF4Nmc2d3RLZm5CVSsv?=
 =?utf-8?B?eTJDQkhpMEdoUmVSMVRWeFhoS1ppeDdRUEhEWkg0MnRIRWI2NVZVMmFSNCs3?=
 =?utf-8?B?aE82SFdOcW5BTHpPbWZZWXBaUkpMeDJXMGtpcDh3aEhrYWNtanF3MWVFVW5k?=
 =?utf-8?B?b2ROeDEzcGFLdlNydUdYMjZVSkpDQjU3WXoySVFaaWJBR25XOHNzdmNEcUFh?=
 =?utf-8?B?Wk44c0owMDZzOUFPdkFUUnEzOVdHdDMwTHN4ektTYktQNGErQXBOTnhYWmFN?=
 =?utf-8?B?cUMxa0RWNXpmOEl1SGtlZjlMUnVtZUhSR2YyVWI1bEduR2c5YU5Ua2Z5dUVY?=
 =?utf-8?B?NzduTGRwa09zeS8xdlM2TmozTUpJRjdCdDV0NHVXUHRmNXZuT2IwbHVySXoy?=
 =?utf-8?B?S3BsY2JKZzRIT2NrVldsYldtZDNBUmJZWk9iRTZweTFDNzR4UmtOMit3cUtY?=
 =?utf-8?B?cVYvQzI0SkdlalJmM2t1a1BTNldkUm1JSXB0MzUxQTYzYzc2Sno1RzRMRzh1?=
 =?utf-8?B?ZFU2TERkVHV2MEQvd0RHU0N5dzRnbnZ5WENYcHF1WVNmWUxydldSQS9CR3hC?=
 =?utf-8?Q?8I7xPzF7u6onYf4ZHvL9M6d+DhewW4NEZMIKHZa?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GybDXMoIC2BdVsXY/2HvZ0K0fgZeokQo2KabvFhmQXViSuN6WCDdzLAduHm9R+BKDnZLFiOA8l0Nf/g5nqTF4lS49EBglNGILpgcSsJWlBWuUBWFToo1BNDifgWct90/i08tAiyeen00AYP0VTzxKiKKGxUfjwhUAbedu8Wnhw30YlK1bRcbeApGPVQGwV6VYANI4Qf8V0m/a6lTusd/eEWX62kzPrITKufSfj7xT3HkqgFXC+hATMeXovZFtA8wz8ShCacZEmdET7VY2WSGydjsc5oQhIUeu28ucoAeG2V2JIbM8Ojpn5yaHzNfwluoGHeF8y284JgGRuw9eXnteA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2m2bfvAR+fTUVVdqbL2TTFncKvAzIr6vXEa5OqoV3U=;
 b=XvJJcrtWGPyC7lsUsbNHjB9091mx4LgfHQAa3Cnvhwglt18tN896j/9g1uxxNqvQVOl0/i9ShVNSWnoU0JHw12yVDf7JuBXNqGHUtM2YSJId2DrONkHlRZzbo8pxBnZ+5JtLgfxdn7XZdKDgangqGecZ0gGDoqd4tAXbgc5Ra6L9WA1qZUJMqeGtM/f0C+952hIk1njPw4EjjsE2uXOi4PZmqhvv3VTbDrM/Iz+0kVHWQ1xBuRoZDwl4cBP9YLHy+jwxG7JY/pA4/ygRGDqC55CqHZX04i1Wu+CdbxcJM4odgaIzh3DTHvb8kvOlwtywI/JaW5/C+gNA31k6C9cYaA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 7ea86a72-b4ea-4d00-df31-08d8e681d922
x-ms-exchange-crosstenant-originalarrivaltime: 14 Mar 2021 00:41:03.9476 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: YH3FKI7XPrfDIiak1fox+rEX6Sly4/+C8Eht8EofXV9u+BSgwAPqZ/Dr2ZYxqRQBIT3XnhjaJ+oKH6XgD4rQhw==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4263
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgNjozNCBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDI3LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVENHIGZvciBpbnN0cnVjdGlvbnMNCj4g
d2l0aCBtdWx0aXBsZSBkZWZpbml0aW9ucw0KPg0KPiBPbiAyLzcvMjEgOTo0NiBQTSwgVGF5bG9y
IFNpbXBzb24gd3JvdGU6DQo+ID4gKyNkZWZpbmUgZkdFTl9UQ0dfTDJfbG9hZHJ1Yl9wcihTSE9S
VENPREUpICAgICAgU0hPUlRDT0RFDQo+ID4gKyNkZWZpbmUgZkdFTl9UQ0dfTDJfbG9hZHJ1Yl9w
aShTSE9SVENPREUpICAgICAgU0hPUlRDT0RFDQo+ID4gKyNkZWZpbmUgZkdFTl9UQ0dfTDJfbG9h
ZHJiX3ByKFNIT1JUQ09ERSkgICAgICAgU0hPUlRDT0RFDQo+ID4gKyNkZWZpbmUgZkdFTl9UQ0df
TDJfbG9hZHJiX3BpKFNIT1JUQ09ERSkgICAgICAgU0hPUlRDT0RFOw0KPiA+ICsjZGVmaW5lIGZH
RU5fVENHX0wyX2xvYWRydWhfcHIoU0hPUlRDT0RFKSAgICAgIFNIT1JUQ09ERQ0KPiA+ICsjZGVm
aW5lIGZHRU5fVENHX0wyX2xvYWRydWhfcGkoU0hPUlRDT0RFKSAgICAgIFNIT1JUQ09ERTsNCj4N
Cj4gV2h5IGhhdmUgc29tZSBvZiB0aGVzZSA7IGJ1dCBub3QgYWxsPw0KDQpUaGUgaW5pdGlhbCBz
ZXJpZXMgb25seSBoYXMgb3ZlcnJpZGVzIHRoYXQgYXJlIHJlcXVpcmVkIGZvciBjb3JyZWN0IGV4
ZWN1dGlvbi4gIEkgZGlkIHRoYXQgdG8gbWluaW1pemUgdGhlIGFtb3VudCBvZiBjb2RlIHRvIHJl
dmlldy4gIEZvciBtb3N0IGxvYWRzLCB0aGUgaGVscGVyIHZlcnNpb24gd29ya3MgY29ycmVjdGx5
LiAgVGhlc2UgbmVlZCB0byBiZSBvdmVycmlkZGVuIGJlY2F1c2UgdGhleSBkZWZpbmUgdHdvIHJl
c3VsdHMgKHRoZSB2YWx1ZSBsb2FkZWQgYW5kIHRoZSB1cGRhdGVkIHBvaW50ZXIpLiAgSSBoYXZl
IHdyaXR0ZW4gdGhlIG92ZXJyaWRlcyBmb3IgYWxsIGFuZCB3aWxsIHVwc3RyZWFtIHRoZW0gaW4g
dGhlIGZ1dHVyZS4NCg0KSGVyZSBpcyBteSByb2FkbWFwIGZvciBIZXhhZ29uIHBhdGNoZXMNCi0g
QWRkcmVzcyB5b3VyIGZlZWRiYWNrIG9uIHRoZSB2OCBzZXJpZXMNCi0gQWRkIHRoZSByZW1haW5p
bmcgc2NhbGFyIGNvcmUgaW5zdHJ1Y3Rpb25zDQotIEFkZCB0aGUgSGV4YWdvbiBWZWN0b3IgZVh0
ZW5zaW9ucyAoSFZYKSBpbnN0cnVjdGlvbnMNCi0gQWRkaXRpb25hbCBvdmVycmlkZXMsIGluY2x1
ZGluZyB0aGVzZQ0KDQoNClRoYW5rcywNClRheWxvcg0KDQoNCg0K

