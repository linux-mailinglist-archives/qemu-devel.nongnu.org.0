Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8A6B1220
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 20:37:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZza6-000606-DN; Wed, 08 Mar 2023 14:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pZza4-0005up-Hp
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 14:36:08 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pZza2-0006a1-2d
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 14:36:08 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328ENT3k026808; Wed, 8 Mar 2023 19:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=ttCy18ikjr8ORAkQRgNG0dpuI0EH1hT6gMA9j50r2Sk=;
 b=a8NoHLu/pfBcv4IbSw4GyFJfNlk2Mq6bICrDPs0THxDrK9W+3TysAVw5j8tRHYHQLu7N
 2CBG37UgQk4sttcL4IdCmBx0JtUWzWoZ/j71OiqQYFEep/tqtPTvZVlfpHZV4T1MaPYo
 WdAxsIhsCP1Bu2nb8EQx4aNQd8Y/fZoYCWqY0IleruuoJKnGU+rT5gHaBGMxfQlhV3cp
 bpwFRS3vEnQ7v0MTln/hTib8u+JKqUc81TQ/wjoM07uNZbUG4hbKepg1ZvRQyLP5jr8X
 ROL9GnJaY9xYqUAQGJjCXA90cRoppd6HKJN9N5nr3DVqw5y0q865YYlNHv0ZNiqyHmyM QQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6v2drs7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 19:36:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1gTT2otgtFHrLrOSjiIIKuPAJaOfV0jqbnmFaU6yLJqWzfLYjNYwLnA1WM7419o28heHJQ+xPwjR8uXezByy2TNz9fCjkGfGNAH3OrCBwdEiGA7HfFYftC/zUp7NRoZ6CTlrF3tET6PgMVAE8w7d0sYX1eaCFRrKeq8kbqmfOQZ43Fi3LuamRNJWBOR7O+KInL7FnsZhqBg0nh42M7iErI7REQUnEjO+S5lqJsAnIuMmk3hgXMNoVc5HCkYpBQAn3A5DLTnnHaRvpvXYXwwBSsPkMJwIG2aIPLcsAub5WsbqGOB3jBjfDG9CJnB4HZ6D9HfaBRk6KXVNLszQkFcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttCy18ikjr8ORAkQRgNG0dpuI0EH1hT6gMA9j50r2Sk=;
 b=kenroBJAZCkXbFJ8Eo70oljCoAelmck/zGQ/ef9HcXE+/uvkL8bkewJF5kUlaztXVIuhXSVeulu3ZPzeTktrLhFDpQXBU0MM75S/R6JeoFo2p6hZ1qwNX04Oe2jJKleMYY57a9SH7cDctqJI0ieQhuI3XnbhSU/0xj0I6PJ2Zo+BOpRv6Q60IN7tv3n5djrTXrVlaw5Z++14TAuvDLt6MMvKA8kVSQqzbCliXyR8hMFAonjDM9xKp8bX8qCrXGz+pWSS0nZDukzYamGzXIKDlvjDkKkunJKICULlk9sje+4VecS2/noAiXwQtEKsAD0VO464AxhkKdY7GAFHYxJ7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by IA1PR02MB9208.namprd02.prod.outlook.com
 (2603:10b6:208:424::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 19:35:55 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 19:35:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>,
 "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng" <anjo@rev.ng>
Subject: RE: [PULL 00/17] Hexagon (target/hexagon) updates
Thread-Topic: [PULL 00/17] Hexagon (target/hexagon) updates
Thread-Index: AQHZULaJdCz5xTphXUeLIi3JPKke767xSNpg
Date: Wed, 8 Mar 2023 19:35:55 +0000
Message-ID: <SN4PR0201MB8808E9A0E003B8176A8977C0DEB49@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
In-Reply-To: <20230307053438.2416629-1-tsimpson@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|IA1PR02MB9208:EE_
x-ms-office365-filtering-correlation-id: 1c57b798-7f9e-4755-9348-08db200c55d5
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xRFGLC3TRBLojDpiq9Jw5xj+ux4JHI9a9NvQEBQo+8CfVNA/07w24dC2AtHJq06PPmkX4Fm1XryDlyCyzqA88QE2zNgzv6Sthhby0ZNQD9AgP1WEjCHuMcbQ8vyx92tWWCsdPk/lm/XLyK9KaWgNJdXZGGnbf72uIsg4JzEnFVeXxfMe5DlIf64AsAS3pgnqyo6qPFKodez3LatfMkgkmeJDcPtLZwWDBwf6n9XaVH1oLRsQENGtS/EgqmnKmyHD1Tlo2gIN4qSyJoZjAeMk0+vT90ZLuomvjdInC3ZoONUdJzQAKj5jWZ9DIL0oZYW48pizXVJGIjarH6gnx0K1iWJkDl0AQ4pjJzeqGK8QSemTgYXvGhP6oQlriRk0rzgbxlL35tImpWbwoxscATJHXPQrnJ7f3Ozq88brmwIcjIFeIL+/l+Duc20CmyIoIqdg+dWhip8qMN6za4zdnUJdy/S8ISazdZTeCBbDhwxzXzHBA9RXj39w0UAKiET5OvKWIjGmxNQXLVx6sKJvEec0j73FK8CWEeHW+6R3tsm5dAJ4IV52pEzFy7mPabyfORR5Y5KpwdWA8cl+w+ojYCsvrxTqebKs2A5Ms/tPTg7asQzBkwaPf4DF0NyeBbIWJLlZAh7DWMhM9rEyy6Mx6idrfrDtLy5y6vNdSfHmc8W+F53QJQ8GpZQHIHArzuWC9g92skoFwvEMnGlTwaR5MowBB6IeVnGhb45rmqNTQMfoJwI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(83380400001)(66476007)(66446008)(66946007)(66556008)(76116006)(64756008)(4326008)(86362001)(55016003)(9686003)(186003)(122000001)(38070700005)(38100700002)(110136005)(54906003)(26005)(966005)(33656002)(478600001)(6506007)(316002)(53546011)(8676002)(71200400001)(7696005)(2906002)(8936002)(66899018)(5660300002)(15650500001)(52536014)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVFuY081YUJlaWZXODVRVUpPNEVOL1NROG8vTDV1dXhCU0kxRGlOcjhpb0tF?=
 =?utf-8?B?ZjArZllKN2pzbE95UnY3NDY3MGRVL0NLOU9RbE5pN3FUdjduOFl4N2oyVity?=
 =?utf-8?B?Y0hpV2dMeHlQVkF6SEVJOUpPMGJmWnZTbFZkQ0lKT3VDb21SRXZjOWRxdG1G?=
 =?utf-8?B?OCsybStsdmkwY0hjMU13eUdydHBJN0hvdnlCVldTb0pKSWtZZ3M2eHpvL3Na?=
 =?utf-8?B?dUhrWjI1MmVOOGQ2T240MUE2dnRPWFhBT2V0TXU3ekVPb01aUmVyUnRkZEtu?=
 =?utf-8?B?UW5wZmhLZWxUcGFNU01udXhoTWRXTVJWWjBTZXMvVFU2Z0RVbHFaVWVkNXlI?=
 =?utf-8?B?TlVZWDNpd2lzWGhaQm1MODR2VXJMWHQzb2FWUitRajFKSHlBNDJUVkFndTlm?=
 =?utf-8?B?ai93SHlBdy9sUHo5T0hKdThnQ2d0blJxWTNBcWJPcGpGbFA5R3dnT1RrbFZa?=
 =?utf-8?B?RjFJODRzc29oZE8vNzUxQ2NidVUydEdGeXVxNHBFYmdNQ2JYRFNhZ1RRRFRv?=
 =?utf-8?B?RWdVOGNjQVZMMDRucWoyc2NDQno0VTlXeFNpYkNYaUdCSUZpTElzYjdzQ1pL?=
 =?utf-8?B?djc2c0FSd0lWSGhuR2o5WTBiUlRSOEw2YWFQTnlwTHFpakVEM0k1WUd2MEps?=
 =?utf-8?B?a2RHRlc5REJMcE1WTTg5b05Vb1R3QmQ4Y2pBSnFpd0ZKUyswNWd0eXNQVWcv?=
 =?utf-8?B?cll4VUZidElWN05JMHdJeVQrb2kxOGhic3ltelZWc1czNUVqUWtTWFpFamEz?=
 =?utf-8?B?WnhtUkpMUW4xcytVRlNZL0s4c25TS0JtM3JDbG0yY25JZ0YyNGl0dVZPT1R4?=
 =?utf-8?B?RnZGakVxdkNSSzViOHFwdTI4elRib1Q1MGhlcTBYQkpBMlpiMlVSKzF3bmJ1?=
 =?utf-8?B?ZUQrTDd1bDA4eURWUUZjWWdnZGpiczFwZ2dKM1Q4cm8zVUhCZ2F0STFQVmI2?=
 =?utf-8?B?RWFVdDZCMmJKQk1OZ0VPOVN0Y01Tc2ZqQ1duTnJRZmhLeW5Zd1J0WnA2dWRB?=
 =?utf-8?B?T0QwSkxwUlkrOXZpYXN1T2ZuQlVqd3lNcVpKZ2xTZ1QvdTZOeUtHSXRVN0Zs?=
 =?utf-8?B?S1JIVm1FN1l2WW8yWjdUSldtNVUzZ2hQVUU3bnhEVDAvQ0N0U1plV1hnUHF0?=
 =?utf-8?B?WCs3R3hmTUs5WGI2aytjVitGb1JkOGYvbktSbEd4RW1MSWhnMVoySEdiN1Ry?=
 =?utf-8?B?Sk1kd2R1a1FVbXNWbVZQc0JOYUlGNi9HM1JyWVFhVmMwbGx3bUVlaVFNOEtn?=
 =?utf-8?B?ejJrMFZGcVprUUQ4ams1MERReEhZT3BLSXNlald0MWVPblU5UEY0YnM5b21h?=
 =?utf-8?B?QVdqL2J3Y1lxd1JYN0puRC9XeGFlci8xS0lsSzEyL0ViekhLakUrM0NOTnRB?=
 =?utf-8?B?cHJCNmJpMDUxeEhsOEJHNWUxNnRRS2RmcVQ2ZXFYWHRYWVhXMVlmZU1iWHZZ?=
 =?utf-8?B?V1ZWdHY4VTVqRHpuc1pwb28zdFNXM1dvV2N3VEwreHZaaG9IeElEcE43NENr?=
 =?utf-8?B?MkJmSTdTS1hGT2VldFA2cVAvL2JhRU1HanFGVG1VVWV4R0thLzN4TGZzVjRu?=
 =?utf-8?B?U0RaRWVMTTdJendtWnM0UnhCOW1XM1dpTS96WTVlVncrVEd4SVJOV080UkNS?=
 =?utf-8?B?N3BYQ0x0aWpmenM4Q29zVlovZ1JaSHdBejNOOStzdkJJbDd1VUpUN1dodEQy?=
 =?utf-8?B?d1Z4WitoMXFHTmRGUkVocWpLQUhaQWxxSUlyb1dYYkVGN0NiejdCbmJSU0RJ?=
 =?utf-8?B?TFI1YUtBeG05NFpzV2w2aDZOMmhYUzF5RDEvamJ3cU10TEpWQ05LVkRwRHVX?=
 =?utf-8?B?a01tWm1CMGRaeFV3bDBmRGJRRStzTkxZeTdKejZEQXdlRk9Cc2I5SlR5dGY3?=
 =?utf-8?B?OEFDL1FINkpUSkI4U29Id3R5bkpxRWw0ZW9ncjhSM2ZSOG5BN0wzYWt4Q0s0?=
 =?utf-8?B?ZlpDbnNSNnBNczZWVUt2aWVYTmZzNmFHMXIrUCtWV2crZ25zNXFkVWNpSTli?=
 =?utf-8?B?MXZnMWx5NXF2bUVSNlg4Q1VyWWJpajA0WXFwT1ArREhuSTJjRkc0TnJ0dWda?=
 =?utf-8?B?YkYya1Q5NmwzTUNWYWx4QWpkV212UDdSc3NmSmltVzJERzBlZXdGMytETURn?=
 =?utf-8?Q?7SZuRPW3ZzPqAPZjA/UvWpfY8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nj3eetN1FE45MXkLL81Kxb7rxDOjKAC/xV6epp9vJZ1frl5W+yAuG0iNO2lN4R6QE3hPmkS0R9YtWwnNuYHvPppSi3NTC9sL3X5aKNc5PmYspXnEYZ0z1xCxfs3ZSnDvPsKjN4qVNPA1NEk2w+zEsLEmkI/P+f3wIxYiz4aMPOGuO5z1BepLfiCoMJL3ULPT8M/7b7XUNe6YnDYX+GoUyykjHl9jiir3JVNVRKfVplUouypneRlLrGgq39VAFata/D5sje3h7JF/G6S2gRIUuJlXbiypHJfHcnIlad0lCKujsxoBRE8ZgdZ2RqE+c0rSFzbzwIjS74mzvbcB9OhqcT4Dm09JZLRoZqZBnTL2tAoe0Tp3chAWBMcs4FyC1tO3DmairnPI85KnOTNbRj+9Mb6DmJudSm+8wk1893w3OPpGyRFCUjbFSGyJSfVXta27JAhjEhTJgoRBzhU/GL7o8VAbR/kztsnwF9gDe+ukjB27UB2PRZ2kb3i3Xpj/4Br9wXKcl5aTrF7U6KqfjpAVTN1fiXbXDSRFlRTJKEpPMREniCudV1MIMvXdkowiDqmlSXgOl8iIJ1ROU0I4lDp8ywOKEIedOghnrJGxJiWdXhhFE4BuMHxbsI6ruyuqcqp6bO9fQAdrGK9wCxhk2HFnHa6Hxsm6eP7eCzLmnkK3oGAey36fZq/tnUaAY4b3JHmMwphBkSWNtcUrg1Oc3se8ByXjF7kUI6IN8P3TJa0DW3i25CkpJlELOjzNK1+u1GxxLESgiiaa4mZCsAP4SOOJ7HjYYlvpoOpvIY9pnXJpGxTS6rm/0eIj3miPqSQEpStKDbMUNU1tzulXawcsGPrx7g==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c57b798-7f9e-4755-9348-08db200c55d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 19:35:55.4188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vdMYS8L/JqXDzC7b0fjRHEHcqrW/ie65tWa7Q7Yun84ySXrfNLOlzyjtFclgYor8nv20+UuP8yufo7FqmDX8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9208
X-Proofpoint-GUID: CTGMKZPePGQgmHodIPm7rqA3dSzox02b
X-Proofpoint-ORIG-GUID: CTGMKZPePGQgmHodIPm7rqA3dSzox02b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_14,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=697 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303080166
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SnVzdCBjaGVja2luZyBpZiB0aGlzIGlzIG9uIHRoZSByYWRhciB0byBiZSBtZXJnZWQgLi4uDQoN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggNiwgMjAyMyAxMDoz
NCBQTQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+OyByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOw0KPiBw
aGlsbWRAbGluYXJvLm9yZzsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBCcmlhbiBDYWluDQo+
IDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNf
bWF0aGJlcm5AcXVpY2luYy5jb20+OyBzdGVmYW5oYUByZWRoYXQuY29tOyBhbGVAcmV2Lm5nOw0K
PiBhbmpvQHJldi5uZw0KPiBTdWJqZWN0OiBbUFVMTCAwMC8xN10gSGV4YWdvbiAodGFyZ2V0L2hl
eGFnb24pIHVwZGF0ZXMNCj4gDQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQN
Cj4gZjAwM2RkOGQ4MWY3ZDg4ZjRiMWY4ODAyMzA5ZWFhNzZmNmViMjIzYToNCj4gDQo+ICAgTWVy
Z2UgdGFnICdwdWxsLXRjZy0yMDIzMDMwNScgb2YgaHR0cHM6Ly9naXRsYWIuY29tL3J0aDc2ODAv
cWVtdSBpbnRvDQo+IHN0YWdpbmcgKDIwMjMtMDMtMDYgMTA6MjA6MDQgKzAwMDApDQo+IA0KPiBh
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gDQo+ICAgaHR0cHM6Ly9n
aXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4LTIwMjMwMzA2DQo+IA0KPiBmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCj4gYzJiMzNkMGJlOTk4YmY1Mzk5NTNmMWRhZDBhYTBk
MWNjOGQ5ZDA2OToNCj4gDQo+ICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEltcHJvdmUgY29k
ZSBnZW4gZm9yIHByZWRpY2F0ZWQgSFZYDQo+IGluc3RydWN0aW9ucyAoMjAyMy0wMy0wNiAyMDo0
NzoxMiAtMDgwMCkNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHVw
ZGF0ZXMNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gQW50b24gSm9oYW5zc29uICgxKToNCj4gICAgICAgdGFy
Z2V0L2hleGFnb24vaWRlZi1wYXJzZXI6IFJlbW92ZSB1bnVzZWQgY29kZSBwYXRocw0KPiANCj4g
UmljaGFyZCBIZW5kZXJzb24gKDEpOg0KPiAgICAgICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNl
cjogRWxpZGUgbW92IGluIGdlbl9wcmVkX2Fzc2lnbg0KPiANCj4gVGF5bG9yIFNpbXBzb24gKDE1
KToNCj4gICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlc3RvcmUgLS1kaXNhYmxlLWhl
eGFnb24taWRlZi1wYXJzZXIgYnVpbGQNCj4gICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24p
IEFkZCBvdmVycmlkZXMgZm9yIGp1bXByMzEgaW5zdHJ1Y3Rpb25zDQo+ICAgICAgIEhleGFnb24g
KHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBjYWxscg0KPiAgICAgICBIZXhhZ29u
ICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgZW5kbG9vcDEvZW5kbG9vcDAxDQo+
ICAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBkZWFsbG9j
LXJldHVybiBpbnN0cnVjdGlvbnMNCj4gICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFu
YWx5emUgcGFja2V0IGJlZm9yZSBnZW5lcmF0aW5nIFRDRw0KPiAgICAgICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgRG9uJ3Qgc2V0IHBrdF9oYXNfc3RvcmVfczEgd2hlbiBub3QgbmVlZGVkDQo+
ICAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBbmFseXplIHBhY2tldCBmb3IgSFZYDQo+
ICAgICAgIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBVcGRhdGUgcHJlZ19hbGlhcy5jDQo+
ICAgICAgIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBSZW1vdmUgX19idWlsdGluIGZyb20g
c2NhdHRlcl9nYXRoZXINCj4gICAgICAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIEVuYWJs
ZSBIVlggdGVzdHMNCj4gICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIENoYW5nZSBzdWJ0
cmFjdCBmcm9tIHplcm8gdG8gY2hhbmdlIHNpZ24NCj4gICAgICAgSGV4YWdvbiAodGFyZ2V0L2hl
eGFnb24pIFJlbW92ZSBnZW5fbG9nX3ByZWRpY2F0ZWRfcmVnX3dyaXRlW19wYWlyXQ0KPiAgICAg
ICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVkdWNlIG1hbmlwdWxhdGlvbiBvZiBzbG90X2Nh
bmNlbGxlZA0KPiAgICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgSW1wcm92ZSBjb2RlIGdl
biBmb3IgcHJlZGljYXRlZCBIVlgNCj4gaW5zdHJ1Y3Rpb25zDQo+IA0KPiAgdGFyZ2V0L2hleGFn
b24vY3B1LmggICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQ0KPiAgdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZy5oICAgICAgICAgICAgICAgICAgICB8ICA5MCArKysrLQ0KPiAgdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZ19odnguaCAgICAgICAgICAgICAgICB8ICAxNyArLQ0KPiAgdGFyZ2V0L2hl
eGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIuaCAgICB8ICAgMSAtDQo+ICB0YXJnZXQvaGV4
YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICAgICAgICAgIHwgIDI5ICstDQo+ICB0YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgIHwgICAzICstDQo+ICB0YXJnZXQvaGV4
YWdvbi90cmFuc2xhdGUuaCAgICAgICAgICAgICAgICAgIHwgIDg2ICsrKy0tDQo+ICB0YXJnZXQv
aGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyAgICAgICAgICAgIHwgICAxICsNCj4gIHRhcmdldC9o
ZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgICAgICAgICAgfCAyOTYgKysrKysrKysrKy0tLS0t
LQ0KPiAgdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYyB8ICAxOSAr
LQ0KPiAgdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgICAgICAgICAgICAgICAgICB8ICA2MCAr
Ky0tDQo+ICB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgIHwgMjg4
ICsrKysrKysrKy0tLS0tLS0NCj4gIHRlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYyAgICAgICAg
ICAgICAgICAgfCAgMzEgKy0NCj4gIHRlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyAgICAg
ICAgICAgICAgfCAgMTAgKy0NCj4gIHRlc3RzL3RjZy9oZXhhZ29uL3NjYXR0ZXJfZ2F0aGVyLmMg
ICAgICAgICAgfCA1MTMgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+IC0NCj4gIHRhcmdl
dC9oZXhhZ29uL1JFQURNRSAgICAgICAgICAgICAgICAgICAgICAgfCAgMzEgKy0NCj4gIHRhcmdl
dC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5ICAgICAgICAgfCAyNTIgKysrKysrKysrKysr
KysNCj4gIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkgICAgICAgICAgfCAgMTkg
Ky0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfcHJvdG9zLnB5ICAgICAgICAgfCAgMTIg
Ky0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkgICAgICAgICAgICAgfCAxNTIg
KysrLS0tLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICAgICAgICAg
IHwgIDEwICstDQo+ICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci5sZXgg
IHwgIDMxICstDQo+ICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55ICAg
IHwgIDQ5ICstLQ0KPiAgdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvbWFjcm9zLmluYyAgICAg
ICB8ICAgOSAtDQo+ICB0YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAg
IHwgIDExICstDQo+ICB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgICAgICAgICAg
IHwgIDEzICstDQo+ICAyNiBmaWxlcyBjaGFuZ2VkLCAxMjA5IGluc2VydGlvbnMoKyksIDgyOSBk
ZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDc1NQ0KPiB0YXJnZXQvaGV4YWdvbi9nZW5fYW5h
bHl6ZV9mdW5jcy5weQ0K

