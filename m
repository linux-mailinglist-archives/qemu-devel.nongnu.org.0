Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B02501C2C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 21:45:59 +0200 (CEST)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf5Pi-0007EY-Lv
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 15:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1103cfd43b=guohuai.shi@windriver.com>)
 id 1nf3Dp-0002Od-Bp
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:25:33 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:58944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1103cfd43b=guohuai.shi@windriver.com>)
 id 1nf3Dl-0000xm-SW
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:25:32 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23EFSfFd001967;
 Thu, 14 Apr 2022 17:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nx5y0ar7Ow+KIawRiUvBEt6EpcktvOp6CUafTm8d/SI=;
 b=qPu/yvAI661X2xbTf26fmvdn209ZvxzAlTIhR+lb8lmH49n+sU3EEttHawOPur2IBsF3
 CH9LwRpSyqhTVSGuXQ4VQ8Y1HVEapI7mRpNXG/pSMDftpYI0vE5QJSQIJ0u//H/mpqLw
 tM3bQK6iYfSlPwV5/5bQLAhq86M+0Awh+MPvlql6muJwYpNNNNMrR9RdsnPyT1XLlcAz
 Y2hxfJ/HQwnxsc/vGv2iIz4MmH+ygO+x7XlmN7aAXkNLcyjA9F8+YnsPAx6a/OmwKHkQ
 1WXQITBJPlqpEv1lcognTgzZj+3rUxDqyRDoisDUDA17o0V6jhIkmHNqwNLsqwlMp0Fw fw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb6fwc5dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 17:25:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3+gtiD+OuwqqS/iVdY0sZZQchsKVxA7FePH6Z1AxPP4IiUmr/D9mrzrTbmpvlJ4Z6SRRJH9vgI8QzwBsllRE4frT+p6z7bBUkBsoVTslgC/Dmhx/UH4iZf56KwgeiOITIipCNa9Zs8vVjtojAG2tfRgi0QuYodTgobcF6GCA4cb85/d/tp/ZLvBXm+WF9Y/yvfsIfo2IyWCPM2Y+hdv+o1EGUu7jA3ZL665rb+HTL8IjIdEzmsqn/1P7NtjwA7/wSwbeVxirF9IkH7bvjxHXCt1hlLDPve5A92cUiL7iTkL+a5SlF0/BBUnD7wDQ/UXyghW0+2lMPmdYDWXhsEPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nx5y0ar7Ow+KIawRiUvBEt6EpcktvOp6CUafTm8d/SI=;
 b=RL+2Iyv+DsRnXFyfvRW2EdVZoQb60gZXo8N5C8Zj1+6ey3tEOe8G8IjOtCIl4LOHbHlBJ1aPQxWJRgDDtRTshFGS7rxbv0EXvvv0a2plx0MapO6LxzYWINWmI5uL9oQjAuQZqrLTVepFH6eU8LJGNmoK+Ox1yf62i3pG31cp/tnP6rdW6j1c15lF8h4NGGBUoqClCH2tMaPi8qobHSpx7D/u6tid5ZUN8mKWo1aCZMMBur3NOLU/XG7yJQRcTQxRWFqIMXMfYNJ9RyQmOIYlhW/EJUAbgXuAhl5QAN6Fu5u2Dr0tLFB7k+Aiqmk1g/S6YMWTndWmb9ORqus9g0YW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4454.namprd11.prod.outlook.com (2603:10b6:610:45::22)
 by CY4PR11MB2055.namprd11.prod.outlook.com (2603:10b6:903:23::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 17:25:04 +0000
Received: from CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::21e2:284a:923a:3f86]) by CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::21e2:284a:923a:3f86%7]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 17:25:04 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Thread-Topic: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Thread-Index: AQHYTuVGJPFOJ1jeRUu3ZU7S5uI6O6ztLTWwgAIZLACAAFSBAA==
Date: Thu, 14 Apr 2022 17:25:04 +0000
Message-ID: <CH2PR11MB445407B4D35ECD8B77AD53F7EFEF9@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <CAEUhbmVVnz7iFZ6RpW7V45b6xAVv-YxXWv2Esxu4YBZf4yA0LA@mail.gmail.com>
 <CH2PR11MB445450AE2D1666B623ABD1BAEFEC9@CH2PR11MB4454.namprd11.prod.outlook.com>
 <9940864.osJUfx695o@silver>
In-Reply-To: <9940864.osJUfx695o@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0beb2931-32ff-4fae-0b3e-08da1e3bb6bd
x-ms-traffictypediagnostic: CY4PR11MB2055:EE_
x-microsoft-antispam-prvs: <CY4PR11MB2055D388F3CA88335D1B0721EFEF9@CY4PR11MB2055.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NhqCx8AE8d8ZDH5nfn/QnLeoq9cI+rEhqQNyhRBvs5IYCoP52gxxoVx7/oioLP+DSoWn8ydBKLYq4tslmxEFlBdyitEXhoBa7Md+gJ7JpYZHZWaVX/5UGXzP5+CseAkYXTkLUWJqVMEphIGzBG3i+NgneCJHjp7kIC41uSd+ruforpbrCOTUA7nm/GLRxFPnfjZ3iLaROQvfotqwyDwIeKY7VOT/xMNsxILOXHGUdjm4mzZibeQbV8nsP/MijtiiUvkW7ZW5oI9AlSkFlG10miYBXwqh9NAt9u1LUzXoUzQ7eye0NrFAZBaUj78AkDXYDHzplsEW4b0g3hw3y64qfRSo2EXVNqpx6twingpoFuYxNmbH83aXABuFZnyqt+HPuwQNx6+jUH10+6i8JDEz8fmpn50iYA7CruAhYM2kIo6rJdQlpRwu7uorABRHZyW4cthxJjCYQ5c9wFaG58G7LRgzLHEb4L3Z/tViQ5IrQ+1WzeI6rRYvpAUSR/O0AEu2SD1nR+ae4Hf3d3G5FKjsEtaQNRql8NlltEzjH/K1ecSd+ObRl3o1jTcR/XDWmdoObB28KrUiBJArZ73IQdbyMYAe96fwPOtISmgDBsw7SmellJcCPwmpxWgxPHtHKWaCcbJUkNrjvu1/j+sEKorlsvSFhamOg7dZ0JWEwlIImOOeFNLLP7JOo/e3IFp6gK01/rzVQjUeft9laAqgkEliH3muAIHYurps/wclhGpog6vwy2b5FqJVbVsHXOsji1yeO+mUMNhe/cXrhMUmX1zzXzAZKeWVojldK+NGmB+TKGNg8SrZokYqdaLrnToKE3zi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4454.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(26005)(186003)(71200400001)(38070700005)(8676002)(83380400001)(33656002)(9686003)(2906002)(7696005)(38100700002)(55016003)(6506007)(86362001)(110136005)(54906003)(316002)(5660300002)(508600001)(966005)(8936002)(66946007)(52536014)(66556008)(64756008)(66476007)(76116006)(122000001)(66446008)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?eU9WVDFWM3ZuRzhmaElmWm43NlpCczlPVDF4YWdkKzcrV1Z0U2ZkSlE1RXhY?=
 =?gb2312?B?NUVaMHE3WTJqS2hpSkpCbDdheEpjZC9lYUJ3cW9NOFVwU01aY2VaV0ZOSEMy?=
 =?gb2312?B?cnVzenphb2FwSkJ2cDFaaVk3QXlUblNSR0ZNbkpUUnFEYzhQMmk4SW5UUTAy?=
 =?gb2312?B?czg4VFArSEtZOUhOT0svMys3Z0lsTjVKa2ZlUU8vZzd4alltK2dhS3hTcmZo?=
 =?gb2312?B?TGEyUkMvRDlycDNzL1lkTE54bG9ZaVNXc1FVMlVNY0pjdmR3QTJUY3lVRGxL?=
 =?gb2312?B?V2ZDRnpsN2VwcXUxRTdZaWJRRFNNYnhQRVQ2YVNaVG9ZMEF0b0RsdEs5OFFx?=
 =?gb2312?B?T1BaVS9HR250ODNRN0ExRmEyczVPSjF1SytYMklYY21CZmd3MzE4WkNUVjhX?=
 =?gb2312?B?MFB2b0F4SlAvOEhQWkNIWVlSaDB6bm8zR1FvWDhZMmE1TkF4Q1d4MXE2a2JP?=
 =?gb2312?B?WVhXLzRPbGhQUE9kQWZuYS9FU1VhVm1BSzRqa0lDT3p6d3QvRi8rVGdqRmx0?=
 =?gb2312?B?dmFsQTJxL2pUaXZtRDBlbzNoRnpUMmxBK2kxSkk1OTJFNzVBK3J3VDdyRHRp?=
 =?gb2312?B?cU5xR2lhcHF2ZTBTTlhKd1FpM0l3cGNSVVZ0ZkZsa2JmR3JvbEZ6RVZHSlhP?=
 =?gb2312?B?cEtKVm1uTUFQbFlXMFEwQTdWeldVVDhDcy9FTjFrQVltU2w2Z05tYW5NUXF4?=
 =?gb2312?B?SDVsZndyOTJyNlJ2MEVBeURjSStjZHdZeDJjWEt4Zkk1MFRwTkxRSUt5dVhr?=
 =?gb2312?B?Q25kcS9NcnhweUppbnovR1kweWtCRHJBaGRCL1hDZlE1eGlwTk4wd1lVNUNp?=
 =?gb2312?B?TWw5L1MvcGZ4R3A4aElRVThSRlowUEJPWWx1NlM5RGNYYWg5ekYxamdnWFpa?=
 =?gb2312?B?US8xWHRMMXdtK3g2TXp5c1FuKzRYZVVtMzcxTVJNT2t4bnpSbitSV2c3TzFa?=
 =?gb2312?B?VmZoTU96MEdIS0Z4UEFpQ2FmU0xhUE8ydTJ3S3VhRzF6VEtIWGZwbnVwa1pr?=
 =?gb2312?B?NUppbmNUaGVsakFONEZST25xSVdmdXdUZ0lvQ3VzQmtUVmN0aCtjNE85T3Rl?=
 =?gb2312?B?dDZFNW05aHlHd3BHc3luM3VySWRTaFlPcEFBSXFpbG9nejZtRm1uN3k0VkhU?=
 =?gb2312?B?MzZERExKZFJhcE5TR2h4VmhuWUlwZGZIREdGNTJqNDlUYlJra0VJKzZrM1JE?=
 =?gb2312?B?bzRJQ3dhdCt4bWRTTnluMUh0YmxQUTlTTnM1SXdudkZLc1hLYktydXZDeDlX?=
 =?gb2312?B?bEdUaWU3VkdHSmtkZXZjUWRBZklLSFRsQ3hQUnNKQlpacEJoZFZubUJQd09Q?=
 =?gb2312?B?RzFjYVFHTHpqeFU2eHRFS0hyejNiWDdjNmhGNi9QZ1cwaEJOSTZ2M0ZTelNt?=
 =?gb2312?B?Ym81WUFnUUhrRlZyYk5WLys2Mk9GOVNDcjdiNkxrMVl5ZktqMk91WksrL3Jj?=
 =?gb2312?B?N29SR0VGc2pVTm4vS1FZRmtoYnJVN3pmRGxldDFqWk5kN3VvSjBXNHE4OFdS?=
 =?gb2312?B?WmxhM3NKaVFWU3J4NStqVHBYNi9ORGxDVFdVclRWeDkva3VYaXVaMmliY1Bo?=
 =?gb2312?B?UmhtMCtzVSt1SUx3WUpFMlNPaFNtclBiU3FySHRVZ3NmWDRYWkhvTVV2ZHZr?=
 =?gb2312?B?RWFtejlUTjJJOVdIVjhNcDY3djVkSENNb2ZkOVErZ0lUU2xuQXY1anJLNFdx?=
 =?gb2312?B?QmtLQ1Y4LzlScFpIcGJZL0QvdmdhR2ZGa3I3TG52Vi96NHRjd0piOHVwdHEr?=
 =?gb2312?B?QTh5RmFMMjNtUUpTaXE0M3pSdEdueVJvOTN2RUdRdFlTKzMyY0xKVndaYjdv?=
 =?gb2312?B?Qkh6NEJ5WHlPVEllSEVQNVVUTkdWb3JjWlJMVnJ5dzBhMTRVWmg4NFpTamNl?=
 =?gb2312?B?eDFsS3RlNjJxV1RGbkM4K3hjSkJsODAvQVVxSGkzTCtwVUdPMVdVWlZGb1Zl?=
 =?gb2312?B?RXc5UVVYYU00b1cvRC9KY3FFVktWemEraVBVZHdwR09NQWJqNmRLOXE4RC9a?=
 =?gb2312?B?R2JsaWp2T2VPWjFaQjJPblBJM1dOdG1EVE52OWpvdTg2SWJMRDlKSVQ1THVw?=
 =?gb2312?B?b0hrdFQxUTR5eXRuV2pMR1owekpoNjBWT3ZqSlVsbkpDY0hZNVJWdEV5WGhL?=
 =?gb2312?B?N1FjVGFXYys1UWU3N2wyQndRUitYWDFSY2trVllsZmVJNUtDS2FhejZ0ZC9P?=
 =?gb2312?B?WUtNMmhmRisvclptaktxcGpoSXVKMkVqb21SZEF5aXh1ZUpzc1RyMlQxMngz?=
 =?gb2312?B?bDV1RTNhTHpNUCtSdmh1UzhJZGRXK3FyTXk1K0FWRDNVd1hBSEdTaDJ2dlhi?=
 =?gb2312?B?SFZKTlhnSFYzOSszYkdBeGEybUowdFVjdFdnMnc3NlhISE9pSmNDZmJWazV5?=
 =?gb2312?Q?f1mQXVHkWazLuE7w=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4454.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb2931-32ff-4fae-0b3e-08da1e3bb6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 17:25:04.2217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tY1TfwreVQmzA3TAJAYjI9dkI+azy+X3NGV2foBbEzd1nnW4FAuKOArnlofwRIrXn/AvxrPBc7Xyl93tFW3W4VB1SbW5/eHyaz40X4z2Wj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2055
X-Proofpoint-ORIG-GUID: -hucSvjNBfrlCmN2Z0qC7NOscorZ6JiH
X-Proofpoint-GUID: -hucSvjNBfrlCmN2Z0qC7NOscorZ6JiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140092
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1103cfd43b=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Apr 2022 15:44:28 -0400
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIFNjaG9l
bmViZWNrIDxxZW11X29zc0BjcnVkZWJ5dGUuY29tPg0KPiBTZW50OiAyMDIyxOo01MIxNMjVIDE5
OjI0DQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IFNoaSwgR3VvaHVhaSA8R3VvaHVhaS5T
aGlAd2luZHJpdmVyLmNvbT4NCj4gQ2M6IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+OyBH
cmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwLzRd
IDlwZnM6IEFkZCA5cGZzIHN1cHBvcnQgZm9yIFdpbmRvd3MgaG9zdA0KPiANCj4gW1BsZWFzZSBu
b3RlOiBUaGlzIGUtbWFpbCBpcyBmcm9tIGFuIEVYVEVSTkFMIGUtbWFpbCBhZGRyZXNzXQ0KPiAN
Cj4gT24gTWl0dHdvY2gsIDEzLiBBcHJpbCAyMDIyIDA1OjMwOjU3IENFU1QgU2hpLCBHdW9odWFp
IHdyb3RlOg0KPiA+ID4gV2UgaGF2ZSAzIGZzIGRyaXZlcnM6IGxvY2FsLCBzeW50aCwgcHJveHku
IEkgZG9uJ3QgbWluZCBhYm91dCBwcm94eSwNCj4gPiA+IGl0IGlzIGluICBiYWQgc2hhcGUgYW5k
IHdlIHdpbGwgcHJvYmFibHkgZGVwcmVjYXRlIGl0IGluIG5lYXIgZnV0dXJlIGFueXdheS4NCj4g
PiA+IEJ1dCBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgc3VwcG9ydCBmb3IgdGhlIHN5bnRoIGRy
aXZlciwgYmVjYXVzZQ0KPiA+ID4gd2UgYXJlIHVzaW5nIGl0IGZvciBydW5uaW5nIHRlc3QgY2Fz
ZXMgYW5kIGZ1enppbmcgdGVzdHMgKFFBKS4NCj4gPg0KPiA+IHN5bnRoIGRyaXZlciBjYW4gbm90
IGJlIGJ1aWx0IG9uIFdpbmRvd3MgcGxhdGZvcm0gKG9yIGNyb3NzIGJ1aWxkIG9uDQo+ID4gTGlu
dXgpLiBTbyB0aGUgdGVzdCBjYXNlcyBjYW4gbm90IHdvcmsgb24gV2luZG93cy4NCj4gDQo+IENv
dWxkIHlvdSBwbGVhc2UgYmUgbW9yZSBzcGVjaWZpYyB3aGF0IGtpbmQgb2YgY2hhbGxlbmdlIHlv
dSBzZWUgZm9yIG1ha2luZyB0aGUNCj4gc3ludGggZHJpdmVyIHdvcmtpbmcgb24gV2luZG93cz8g
VGhlIHN5bnRoIGRyaXZlciBpcyBqdXN0IGEgc2ltcGxlIG1vY2t1cCBkcml2ZXINCj4gWzFdIHRo
YXQgc2ltdWxhdGVzIGluLVJBTS1vbmx5IGEgZmlsZXN5c3RlbSB3aXRoIGEgYnVuY2ggb2YgaGFy
ZCBjb2RlZCBkaXJzIGFuZA0KPiBmaWxlcywgc29sZWx5IGZvciB0aGUgcHVycG9zZSB0byBydW4g
dGVzdCBjYXNlcy4gU28gdGhlIHN5bnRoIGRyaXZlciBkb2VzIG5vdCBpbnRlcmFjdA0KPiB3aXRo
IGFueSByZWFsIGZpbGVzeXN0ZW0gb24gaG9zdCBhdCBhbGwuIE15IGV4cGVjdGF0aW9uIHRoZXJl
Zm9yZSB3b3VsZCBiZSB0aGF0DQo+IGl0IGp1c3QgbmVlZHMgdG8gdHdlYWsgc29tZSBoZWFkZXIg
aW5jbHVkZXMgYW5kIG1heWJlIGRlY2xhcmluZyBtaXNzaW5nIFBPU0lYIGRhdGENCj4gdHlwZXMs
IHdoaWNoIHlvdSBoYXZlIGRvbmUgZm9yIHRoZSBsb2NhbCBkcml2ZXIgYWxyZWFkeSBhbnl3YXku
DQo+IA0KDQpGb3IgOXAtc3ludGg6DQoNCkkgaGFkIGVuYWJsZWQgOXAtc3ludGguYyBhbmQgYnVp
bHQgaXQgc3VjY2Vzc2Z1bGx5IG9uIFdpbmRvd3MgcGxhdGZvcm0uDQpIb3dldmVyLCB0ZXN0IGNh
c2VzIGNvZGUgYXJlIG5vdCBidWlsdCBvbiBXaW5kb3dzIGhvc3QuDQpTbyBJIHRoaW5rIGl0IGlz
IHVzZWxlc3MgdGhhdCBlbmFibGUgc3ludGggb24gV2luZG93cyBob3N0IChubyB3YXkgdG8gcnVu
IGl0KS4NCg0KPiBCVFcgc3VwcG9ydCBmb3IgbWFjT1MgaG9zdHMgaGFzIGp1c3QgYmVlbiByZWNl
bnRseSBhZGRlZCBmb3IgOXAsIEkga25vdyBpdCBpcw0KPiBkaWZmZXJlbnQgYXMgaXRzIGEgUE9T
SVggT1MsIGJ1dCBtYXliZSB5b3UgbWlnaHQgc3RpbGwgZmluZCB0aGUgZGlmZiBbMl0gaGVscGZ1
bC4NCj4gDQo+IFsxXSBodHRwczovL3dpa2kucWVtdS5vcmcvRG9jdW1lbnRhdGlvbi85cCM5cF9G
aWxlc3lzdGVtX0RyaXZlcnMNCj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qv
cWVtdS8tL2NvbW1pdC9mNDVjYzgxOTExYWRjNzcyDQo+IA0KPiA+ID4gV2hhdCBhcmUgdGhlIGxp
bWl0YXRpb25zIGFnYWluc3Qgc2VjdXJpdHlfbW9kZWw9bWFwcGVkIG9uIFdpbmRvd3M/DQo+ID4g
PiBLZWVwIGluICBtaW5kIHRoYXQgd2l0aCBzZWN1cml0eV9tb2RlbD1ub25lIHlvdSBhcmUgdmVy
eSBsaW1pdGVkIGluDQo+ID4gPiB3aGF0IHlvdSBjYW4gZG8gd2l0aCA5cC4NCj4gPg0KPiA+IE1T
WVMgbGlicmFyeSBkb2VzIG5vdCBzdXBwb3J0IGV4dGVuZCBhdHRyaWJ1dGUgKGUuZy4gZ2V0eGF0
dHIpLCBBbmQNCj4gPiBkb2VzIG5vdCBzdXBwb3J0IFBPU0lYIHBlcm1pc3Npb24gQVBJcyAoZS5n
LiBjaG1vZCwgY2hvd24pLg0KPiA+IFNlY3VyaXR5IG1vZGVsIGlzIHVzZWxlc3Mgb24gV2luZG93
cyBob3N0Lg0KPiANCj4gVGhhdCB3b3VsZCBiZSBzZWN1cml0eV9tb2RlbD1wYXNzdGhyb3VnaCwg
eWVzLCB0aGF0J3Mgbm90IHBvc3NpYmxlIHdpdGggbXN5cy4NCj4gVGhlIHJlY29tbWVuZGVkIHdh
eSBpbiBwcmFjdGljZSB0aG91Z2ggaXMgdXNpbmcgc2VjdXJpdHlfbW9kZWw9bWFwcGVkIFszXSBm
b3IgYWxsDQo+IHN5c3RlbXMsIHdoaWNoIHNob3VsZCBiZSBwb3NzaWJsZSB0byBhY2hpZXZlIHdp
dGggbXN5cyBhcyB3ZWxsIC4uLg0KPiANCj4gWzNdIGh0dHBzOi8vd2lraS5xZW11Lm9yZy9Eb2N1
bWVudGF0aW9uLzlwc2V0dXAjU3RhcnRpbmdfdGhlX0d1ZXN0X2RpcmVjdGx5DQo+IA0KPiA+IEl0
IGlzIHBvc3NpYmxlIHRoYXQgdG8gIm1hcCIgZXh0ZW5kIGF0dHJpYnV0ZSB0byBOVEZTIHN0cmVh
bSBkYXRhLg0KPiA+IEhvd2V2ZXIsIGlmIFdpbmRvd3MgaG9zdCBtZWRpYSBpcyBub3QgTlRGUyAo
ZS5nLiBGQVQpIHdoaWNoIGRvZXMgbm90DQo+ID4gc3VwcG9ydCBzdHJlYW0gZGF0YSwgdGhlbiB0
aGUgIm1hcCIgY2FuIG5vdCB3b3JrLg0KPiANCj4gLi4uIHllcyBleGFjdGx5LCBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIHVzZSBBRFMgWzRdIGluc3RlYWQgb2YgeGF0dHIgb24gV2luZG93cy4NCj4g
QURTIGFyZSBhdmFpbGFibGUgd2l0aCBOVEZTIGFuZCBSZUZTIGFuZCBtYXliZSBhbHNvIHdpdGgg
ZXhGQVQgbm93YWRheXMgKD8pLCBub3QNCj4gc3VyZSBhYm91dCB0aGUgbGF0dGVyIHRob3VnaC4g
QnV0IEkgdGhpbmsgaXQgaXMgZmFpciBlbm91Z2ggdG8gYXNzdW1lIFdpbmRvd3MgdXNlcnMNCj4g
dG8gZWl0aGVyIHVzZSBOVEZTIG9yIFJlRlMuIEFuZCBpZiB0aGV5IGRvbid0LCB5b3UgY2FuIHN0
aWxsIGNhbGwgZXJyb3JfcmVwb3J0X29uY2UoKQ0KPiB0byBtYWtlIHVzZXIgYXdhcmUgdGhhdA0K
PiBzZXVjcml0eV9tb2RlbD1tYXBwZWQoLXhhdHRyKSByZXF1aXJlcyBhIGZpbGV5c3RlbSBvbiBX
aW5kb3dzIHRoYXQgc3VwcG9ydHMgQURTLg0KPiANCj4gWzRdIGh0dHBzOi8vZW4ud2lraXBlZGlh
Lm9yZy93aWtpL05URlMjQWx0ZXJuYXRlX2RhdGFfc3RyZWFtXyhBRFMpDQo+IA0KDQpXaW5kb3dz
IGRvZXMgbm90IHN1cHBvcnQgUE9TSVggcGVybWlzc2lvbi4gDQpTbyBJIHRoaW5rIHRoYXQgb25s
eSBhbGxvdyB1c2VyIHRvIHVzZSBzZWN1cml0eV9tb2RlbD1ub25lIGlzIHJlYXNvbmFibGUgb24g
V2luZG93cyBob3N0Lg0KDQpUaGVyZSBpcyBhIGRpZmZpY3VsdHkgdG8gc3VwcG9ydCAibWFwcGVk
IiBvciAibWFwcGVkLWZpbGUiIG9uIFdpbmRvd3MgaG9zdDoNClRoZXJlIGFyZSBtYW55IGZ1bmN0
aW9ucyBpbiA5cC1jb2RlIHVzaW5nIEFQSXMgbGlrZSAib3BlbmF0IiwgIm1rZGlyYXQiLCBldGMu
DQpNU1lTIGRvZXMgbm90IHN1cHBvcnQgdGhhdCAob3BlbmF0IGlzIG5vdCB2YWxpZCBvbiBXaW5k
b3dzIGhvc3QpLg0KSSByZW1lbWJlciB0aGF0IDlwIHJlcGxhY2VkICJvcGVuIiBieSAib3BlbmF0
IiBmb3IgYSBsb25nIHRpbWUuDQpUbyBmdWxseSBzdXBwb3J0ICJzZWN1cml0eV9tb2RlbD1tYXBw
ZWQiLCA5cCBmb3IgV2luZG93cyBuZWVkIHRvIHJlcGxhY2UgIm9wZW5hdCIgYnkgIm9wZW4iLg0K
VGhpcyBtYXkgaW1wYWN0IHRvbyBtYW55IGZ1bmN0aW9ucy4NCg0KSSB3b3VsZCBoYXZlIGEgdHJ5
IHRvIGVuYWJsZSAibWFwcGVkIiBieSB1c2luZyBBRFMsIGJ1dCBpdCBsb29rcyBsaWtlIGEgYmln
IHJlZmFjdG9yIGZvciA5cC1sb2NhbC5jDQoNCkJlc3QgUmVnYXJkcywNCkd1b2h1YWkgDQoNCg==

