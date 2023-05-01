Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07816F336C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 18:06:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptW2f-0003uq-ID; Mon, 01 May 2023 12:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptW2e-0003ue-4Q
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:06:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptW2b-0003uW-DE
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:06:19 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 341FohpX002666; Mon, 1 May 2023 16:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=1GU1M0Li4yJUot4grQ1ZDRmud63n1q2joNiev/Joi0U=;
 b=jThemrLt4czY9MTpSI/tQ7gsApSt1Vs5acm2lAehvfbSs/HG1KVRq8evDTloPkIXJ4RH
 vY8d60PvJ4gUvyHYJf2x5IyJUOKHVmRjM5M4lS7T6LMgBayx1NGyo+Q0MbUpDSqQ5Lmf
 M3nX42xPT3s4h4hC3dewJlDuRhvCaHKvF5i/ApLmORVDwx3iY4nusyZh01Hd0u/0bDa2
 lQmwxERBmSHbwNn1nOOZaveJBdhOPi50mPR+ISPrZ3qUDfe/gjyjAtznZemowq17p7kq
 IPRPzedWOF37jELbJQ7zKx1b8BszFGssLwQ8mbw5kuVlV9YjPaU74q6T8prxru6aafP/ 8g== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8umg3w58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 May 2023 16:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewebcBwnhBbA9Dqm0Wq95RF48yeLlEhGWQsA7nOKKX1DiyC5vJDFKw/NIeUwgCdeg4IEDBbY9q/UFTMrDmg6p8dkTxTlHSbe5O0QE7ya4fONKKxp+qoV9OvIHgCh7T+jE6tt9LnR3nHvA1rlhIumq5PA9tYsMnPq92Ve3jkgkVwzH5nRWOMig6QVvGG2px9VTpoUsoiTWDFM1AOHCY8g1Y2EzKqxLprczgsPfJkfTnJeTRtb+G6FFHuZhRK25aoFEUroP20ttbPMbncn/uV7nBbxjtGDMnSMyIYf02YknpVzTN6ExlV3oisUpOA5vwMiMX/sfl2iuTia8SPqPZFF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GU1M0Li4yJUot4grQ1ZDRmud63n1q2joNiev/Joi0U=;
 b=GlqmIHOyH+5SHExSqImhUhzbF00jzY6TPI6ziAiMcFTMzgfWr0koTxzMQECm58NybeDUJVTc1No0vQyZEA9qZVfFA7atBIOwYNT69iO3S4c3TV++srNi2zYTGgBVcdVRmgbqnruIU0ruWI48eH1/vUxXtWBII+MFMtPYkyK6u1L+vybijIH/Y/FvPGBAry1Vt/cP9Mxob/xW/WHYuNE1YUmVhbyebRjkSpnq4Jscd5tr6TrN9MT6hPrr/dmn5GJ59Yg9P7tgGteYj3VVi+dAq/N0sbDeQC55tehTfRElYzFmRYwkYNud7QUb+5oPuiE/xgSij7HQyd2hxd1cEmrwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6542.namprd02.prod.outlook.com
 (2603:10b6:5:1bf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 16:06:07 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 16:06:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
Thread-Index: AQHZeGUgUY3CJga+3UirbMZCKDagh69A60AAgABKjbCABGU4cA==
Date: Mon, 1 May 2023 16:06:07 +0000
Message-ID: <SN4PR0201MB8808D9DD71783F072965CF0BDE6E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230426173232.2227787-1-tsimpson@quicinc.com>
 <1e46223e-072b-9180-51aa-49a203ce6de3@rev.ng>
 <SN4PR0201MB8808AFCFCAAC1302B70A7966DE6B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808AFCFCAAC1302B70A7966DE6B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB6542:EE_
x-ms-office365-filtering-correlation-id: e154a04f-ed91-4685-0781-08db4a5df940
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miALUaC+UjahI15UIQN2BOigTozEn1xfFeIIqQVvYfLlVAheGed5vtHYzkoH8+SRMvp/otZ8DIZCwmk4h2aCF0vetj/dxlo+LrMxJgJdLrXEOTH7Yr9AclWwP+lBFjp+LenKXVJRp2d6oN4qMdW8BSaVDJZClc964xtUGA2y4yzVAOH3e3/7dwK3ycIfc1ChCAdd41U/s/qT7IFbbF+cGvR4FZtxr8FlAv1hSH538hg5KRUgfDg2OKVu5u90H7EZ14c8hvjv8z6qPXHq9aF/TpNl8JkIrAXRrjC5Hfe7qK/iQaTPU5/9kAuzFfTM9P9dpPmn/CU3/vZF84up3cdf19cCI+qD/o3dMMaVdw+CRBD9UOvTisNTfkMgAHBDZfS1kZupxFg7EmAZNjkKKdjFd5mmcsDVg/i08keRqorklxrV0icFB+miQEYRFsvydz7VeipQdEfI4eUJAgkxTMEuaUzZySc9ZK+VBNk4eObuIRkI1sPwREokzpiuI18nD8fNol9Xtb6TUSaXQF5LqpiJitm9YbNXymSV0lEa1OleXcPt7WR++xJZ/b2JU0RI7wToYFhl2nojLGpoHuwSrLRP2RaJKsGDpMFQmoN2g6/B1HY3YOIZ9wsLOj1G/sl/8hDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(122000001)(38100700002)(38070700005)(83380400001)(9686003)(186003)(7696005)(26005)(53546011)(6506007)(33656002)(107886003)(55016003)(19627235002)(110136005)(54906003)(478600001)(71200400001)(66946007)(76116006)(8936002)(4326008)(66476007)(66556008)(8676002)(41300700001)(86362001)(64756008)(52536014)(2906002)(316002)(66446008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnNHbU5LYmd6UUhmL0ovMGh5L1FzYndUVHNpc29IckpjL0t6LzR4L3ZxRmMv?=
 =?utf-8?B?THE1bmUzQmZMdjcxNEo4c3ZBTVR3OXdSbUVTSnoxSG1tRVhHUHl5L29aS25B?=
 =?utf-8?B?am1JeHI5SUloOVVGdE83STN3RXBBVWlEa1AvdGo5MWtnWENINlR6R2NRVjVp?=
 =?utf-8?B?bngvVExvTnFJd2ozdGZJUGgvYjZCUWJPanRhZE8wb1h3U1BrZ2JxbWRpRG5x?=
 =?utf-8?B?ZjNDYmsvalVRT2FDNC9lUE1Qa1Y5cHFjb1lEbzBIdjZUUUltSjhjeVVTY2Er?=
 =?utf-8?B?ZnhVakNPT1Y4QUdVVFA3RjIzdkk5N1ZjYXFJRVprOEVPSVZUaE9WRlAwZklE?=
 =?utf-8?B?VnhzRklhNDJCN1RXUWorN2VPWUVWTmRORjROQzNpZEZZT01rWExCaEd5blZN?=
 =?utf-8?B?bkxrU0hMMFlkMTlWb1VRaGVuNkk0RDZRcGFzbjhoTDNkZkhwN3haelJWcVZz?=
 =?utf-8?B?bzhtWit5K0JqelJLRk80bC9iU2hoTlhack1zQk16ak5yQ0N1UzBJTVo2RXdW?=
 =?utf-8?B?RUhkNHZNbWc0TDNORThJWTRuRmI5ZlVaZkRJeWNQTUV5TExNT00zKzdRNnRk?=
 =?utf-8?B?L2czTGZjUzJpR1NlWmRVVDB0eHNmUmNtSEJBZ1JRZ21iQk5aM21PNmpTeGFw?=
 =?utf-8?B?QSttUTg5bVlOWjZwaVdwN01VaE5hYk9TSkUwc3NZbUlWSEp4di9vbkFIMWcz?=
 =?utf-8?B?ZlpZKytLck1tSUpwWi80VkJtK3VZRlM4aFZGV0RBNmxsaGZkWlFwNHJKVHht?=
 =?utf-8?B?d2JmelI3bFRiSzl2bVB4enV0ZzNJWnJQc1BJWE91VmRPcFBBRC9wVFZLSUU3?=
 =?utf-8?B?dFBSOFpQdnZvU3ZXS1FaVVBSSG1xTVhXYVpaMDQwcWVkck1lcUExMGEwakhH?=
 =?utf-8?B?YzYrK1JNeXZjUWFNSkVrTG4xUG9wN0UyQ2pKODJFZGpXN0VZUk1KbXhXc2R1?=
 =?utf-8?B?QnVJUkFPQnFuSk1OQUtxL2ZmamRJbXBzblNhV3k0T25DcHpKcGExYkdQaXlG?=
 =?utf-8?B?SithTmh4dUUxcGlqbm1ldVltL25ucGtSZzQ1VGRad3hqQlNoYXB4M2NTVzUy?=
 =?utf-8?B?dW42dTYyOFBiR2xvdzBlMXk0WWNEVlpyaDdkRkVETU12WjBMZ0FTSEpTcDZj?=
 =?utf-8?B?UkdaNXVtUkVsUWNzeVA3NnVyMTl2eURMNEVSaDQ4VUIrR2RCUXZOa2lSZEg1?=
 =?utf-8?B?THdkYlg2R3NWSm9TdGZUU3pNTGxyNExoM1Z0NHZLUzZUNldBN1ZqaEtXeVl3?=
 =?utf-8?B?WFg1bWZ6QXhZZC9oM1FJMmpOdHZiNWpBK2pIMk4wRHpyVFEyNGhZTXJTOVZ0?=
 =?utf-8?B?eWU5WDYwam9NNkp4VldLMk9qaTlSWElDRVpBdjV1N3dFanZtalNBTExYWGQx?=
 =?utf-8?B?KzFYRDJkVzQxU0xkdEluSDdhMHJSUjFnZ3o4amw5RzBmWHRoOVBoWDhrT1Rm?=
 =?utf-8?B?TGc4dGJza3JhMTVzeUhnS2Zrc1BYUUlEODcwakN2VCs4ME92cDRGTHdtamU5?=
 =?utf-8?B?VTFlaldBSC9RRnVkWXNWdFgwdFJuTG5hMytZRnlQMlk4OVdqZndkWlRFc2xh?=
 =?utf-8?B?elEveGh6bUJqMm1RdWFScFlxakJkdUtTejY1UUp0K0JqMjhuSXd4VXplT3FS?=
 =?utf-8?B?SDFkaG9LbkJJejI2Q3dJNmtPRVFBSzhoQUVVL2l0ZXMzZ0tLMzV4MGRGVVZS?=
 =?utf-8?B?K24zK1hZTG9rckdYVmxRNXRLMmgvYU05Vk8zQ3dSeFlzVTV0cU1BZlB5a0ls?=
 =?utf-8?B?b2J4SVJ6VTJqQUh0ekd6UjIzbytmS0xkNThyNEhxV2RROG9sUVBYVXM3UERP?=
 =?utf-8?B?bmY0dnV4RFBDOE5IeGlpS0lMR0thdk54RVNXam9nZDZIYldEbGhoRDM4YnlH?=
 =?utf-8?B?NnRtT3o3YXV0eFlPT0tVdXJ6a0lEUjYrbEIzZE1IWXB5UGk0am1Qb3hIcGNN?=
 =?utf-8?B?cUU0SkpUZDJVOWNLU3hxM1Z4RzUrRkhQSDJZaHFJZ09qY0tmNFpvT1lxNkJH?=
 =?utf-8?B?ZW1hZU9TVFFaaU1jTFZ5LzF1Z0QyN0lza0ZIRE5VemM4ZTlXclFHbllSRjJF?=
 =?utf-8?B?L3Jkb2hHbTZ0QndtQjVsb0gwUzVnMUNuRnlKOW95cG9sbjdSSTN1QmVEbHdt?=
 =?utf-8?Q?JAs9WHF9rNrJUPTtZCAqNLOMb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pQ82EBgW8hZgJuncNKPHGFRn4NBb2ppjExAtUnX0shA38xALgFVfakhfF5fJN+6LscsFsqDS9yi3hqV5iVrIF1nCJvgaDPOBd5oKSioBtvcWSVMA+HM3O2fMImphe9F3FptodaxxVUSHdiAM/lFodDlaHP3KeBH/zabcMH91r8nG7lGodNtRwGsI0oZ8BEepyhvr93rWhboX1lRMghScwxsVISHhTHORkTpUyBs/Ywt7KipZgtuQh6kq4hs+vE2I6JfgTZYDUk2Q9+smTUvU8xFccYrh4TchA8CdFbgMkXSszD6h8gw/gl72F0uAdQVSR9M+zMsBexukhix62JOY9UzGF8YVw0xqbUfH3WiiH4kq0glxgCtIIawU0C1XtmG08od0XPG3MT7CXcT/A5xWjTyLeTmYZeAJ5EP8HpFCmYJ6wMZfpxoh7bThJjmWG6PqeIeLHPA5aBzPR9fT/l0lMNRv35zDx29OjyYS5DqO4cIygIxgae7F9stlrTlh+FxaTekLu2+EprzeWR5KCwLr0qeF/BZ1XIsxdFdarIwawlzMdL+BYlGSmqvMUqZM76y5LLdZd0SZITXquYG7DoTao6+K4vBeqd1dLoO7BppoQ7uuDavlcrA8UEUGIo2t45Xx/mEot9VCCvA61F/pLmo9LMRsQlkDtKSXYO7QfRTn3D3p9lzUSywhiuTDqHzpLmSsVFqYxPCAlaK6EWnkUaDRS9qD34fKhK9/N5ut9Hnzs8I5SbtMFRZ42/XRnltSHfpMr+yaaiGNL+GmUOYdpb8x7xQo5glAalUVD8AkbbrUDfYpbT9QK+xKCn/PHVbNMTUV
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e154a04f-ed91-4685-0781-08db4a5df940
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2023 16:06:07.7109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6MqVm5ZHzWUnkHpf0Kq4Cu8M1WEw8FZe1UiE/AUdaF3tJ5YB/0BquAV3GiRlOpsC9G9+GbSR6e8ZeN38i3Y9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6542
X-Proofpoint-GUID: nlakASBPGfdFcPQX7axyvKXIQ2CUVU4t
X-Proofpoint-ORIG-GUID: nlakASBPGfdFcPQX7axyvKXIQ2CUVU4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305010129
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF5bG9yIFNpbXBzb24N
Cj4gU2VudDogRnJpZGF5LCBBcHJpbCAyOCwgMjAyMyAzOjUzIFBNDQo+IFRvOiBhbmpvQHJldi5u
ZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnOyBwaGlsbWRAbGluYXJvLm9yZzsgYWxlQHJldi5uZzsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5A
cXVpY2luYy5jb20+OyBNYXRoZXVzIEJlcm5hcmRpbm8gKFFVSUMpDQo+IDxxdWljX21hdGhiZXJu
QHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYyXSBIZXhhZ29uICh0YXJnZXQv
aGV4YWdvbikgQWRkaXRpb25hbCBpbnN0cnVjdGlvbnMNCj4gaGFuZGxlZCBieSBpZGVmLXBhcnNl
cg0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
QW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4NCj4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDI4
LCAyMDIzIDExOjI1IEFNDQo+ID4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5j
LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiA+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnOyBwaGlsbWRAbGluYXJvLm9yZzsgYWxlQHJldi5uZzsgQnJpYW4NCj4gQ2Fpbg0K
PiA+IDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPiA8
cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBI
ZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkaXRpb25hbCBpbnN0cnVjdGlvbnMNCj4gPiBoYW5k
bGVkIGJ5IGlkZWYtcGFyc2VyDQo+ID4NCj4gPiBPbiA0LzI2LzIzIDE5OjMyLCBUYXlsb3IgU2lt
cHNvbiB3cm90ZToNCj4gPiA+ICoqKiogQ2hhbmdlcyBpbiB2MiAqKioqDQo+ID4gPiBGaXggYnVn
IGluIGltbV9wcmludCBpZGVudGlmaWVkIGluIGNsYW5nIGJ1aWxkDQo+ID4gPg0KPiA+ID4gQ3Vy
cmVudGx5LCBpZGVmLXBhcnNlciBza2lwcyBhbGwgZmxvYXRpbmcgcG9pbnQgaW5zdHJ1Y3Rpb25z
Lg0KPiA+ID4gSG93ZXZlciwgdGhlcmUgYXJlIHNvbWUgZmxvYXRpbmcgcG9pbnQgaW5zdHJ1Y3Rp
b25zIHRoYXQgY2FuIGJlIGhhbmRsZWQuDQo+ID4gPg0KPiA+ID4gVGhlIGZvbGxvd2luZyBpbnN0
cnVjdGlvbnMgYXJlIG5vdyBwYXJzZWQNCj4gPiA+ICAgICAgRjJfc2ZpbW1fcA0KPiA+ID4gICAg
ICBGMl9zZmltbV9uDQo+ID4gPiAgICAgIEYyX2RmaW1tX3ANCj4gPiA+ICAgICAgRjJfZGZpbW1f
bg0KPiA+ID4gICAgICBGMl9kZm1weWxsDQo+ID4gPiAgICAgIEYyX2RmbXB5bGgNCj4gPiA+DQo+
ID4gPiBUbyBtYWtlIHRoZXNlIGluc3RydWN0aW9ucyB3b3JrLCB3ZSBmaXggc29tZSBidWdzIGlu
IHBhcnNlci1oZWxwZXJzLmMNCj4gPiA+ICAgICAgZ2VuX3J2YWx1ZV9leHRlbmQNCj4gPiA+ICAg
ICAgZ2VuX2Nhc3Rfb3ANCj4gPiA+ICAgICAgaW1tX3ByaW50DQo+ID4gPg0KPiA+ID4gVGVzdCBj
YXNlcyBhZGRlZCB0byB0ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMNCj4gPiA+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICAgdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMu
aCB8ICAyICstDQo+ID4gPiAgIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxw
ZXJzLmMgfCAzNyArKysrKysrKysrLS0tLQ0KPiA+ID4gICB0ZXN0cy90Y2cvaGV4YWdvbi9mcHN0
dWZmLmMgICAgICAgICAgICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAg
IHRhcmdldC9oZXhhZ29uL2dlbl9pZGVmX3BhcnNlcl9mdW5jcy5weSAgICAgfCAxMCArKystDQo+
ID4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBJJ20gZ2V0dGluZyBhIGhhcm5lc3MgZmFpbHVyZSBvbg0KPiA+DQo+ID4gICAg
ICB2NjVfUTZfUl9tcHlfUlJfcm5kLmMNCj4gPg0KPiA+IEknbGwgdGFrZSBhIGRlZXBlciBsb29r
IGF0IHRoaXMgbmV4dCB3ZWVrLg0KPiANCj4gSSdtIHNlZWluZyB0aGF0IGZhaWx1cmUgdG9vLiAg
VGhhbmtzIGZvciBsb29raW5nIGludG8gaXQuDQoNCkl0J3MgdGhpcyBpbnN0cnVjdGlvbg0Kdm9p
ZCBlbWl0X00yX2RwbXB5c3Nfcm5kX3MwKERpc2FzQ29udGV4dCAqIGN0eCwgSW5zbiAqIGluc24s
IFBhY2tldCAqIHBrdCwNCgkJCSAgICBUQ0d2X2kzMiBSZFYsIFRDR3ZfaTMyIFJzViwgVENHdl9p
MzIgUnRWKQ0KLyoge1JkVj0oZk1QWTMyU1MoUnNWLFJ0VikrZkNPTlNUTEwoMHg4MDAwMDAwMCkp
Pj4zMjt9ICovIHsNCglUQ0d2X2k2NCB0bXBfMCA9IHRjZ190ZW1wX25ld19pNjQoKTsNCgl0Y2df
Z2VuX2V4dF9pMzJfaTY0KHRtcF8wLCBSc1YpOw0KCVRDR3ZfaTY0IHRtcF8xID0gdGNnX3RlbXBf
bmV3X2k2NCgpOw0KCXRjZ19nZW5fZXh0X2kzMl9pNjQodG1wXzEsIFJ0Vik7DQoJVENHdl9pNjQg
dG1wXzIgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7DQoJdGNnX2dlbl9tdWxfaTY0KHRtcF8yLCB0bXBf
MCwgdG1wXzEpOw0KCWludDY0X3QgcWVtdV90bXBfMCA9IChpbnQ2NF90KSAoKGludDMyX3QpIC0g
MjE0NzQ4MzY0OCk7DQoJVENHdl9pNjQgdG1wXzMgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7DQoJdGNn
X2dlbl9hZGRpX2k2NCh0bXBfMywgdG1wXzIsIHFlbXVfdG1wXzApOw0KCWludDY0X3QgcWVtdV90
bXBfMSA9IChpbnQ2NF90KSAoKGludDMyX3QpIDMyKTsNCglUQ0d2X2k2NCB0bXBfNCA9IHRjZ190
ZW1wX25ld19pNjQoKTsNCgl7DQoJCWludDY0X3Qgc2hpZnQgPSBxZW11X3RtcF8xOw0KCQlpZiAo
cWVtdV90bXBfMSA+PSA2NCkgew0KCQkJc2hpZnQgPSA2NCAtIDE7DQoJCX0NCgkJdGNnX2dlbl9z
YXJpX2k2NCh0bXBfNCwgdG1wXzMsIHNoaWZ0KTsNCgl9DQoJVENHdl9pMzIgdG1wXzUgPSB0Y2df
dGVtcF9uZXdfaTMyKCk7DQoJdGNnX2dlbl90cnVuY19pNjRfdGwodG1wXzUsIHRtcF80KTsNCgl0
Y2dfZ2VuX21vdl9pMzIoUmRWLCB0bXBfNSk7DQp9DQoNClRoZSBwcm9ibGVtIGlzIGhvdyB3ZSBo
YW5kbGUgZkNPTlNUTEwoMHg4MDAwMDAwMCkuICBJbiBtYWNyb3MuaCwgaXQncw0KICAgICNkZWZp
bmUgZkNPTlNUTEwoQSkgQSMjTEwNCg0KVGhlIHBhcnNlciBpcyB0cmVhdGluZyBpdCBhcyBhIGNh
c3QgdG8gaW50NjRfdC4gIEhvd2V2ZXIsDQogICAgIDB4ODAwMDAwMDBMTCAhPSAoaW50NjRfdCkg
MHg4MDAwMDAwMA0KDQpJJ2xsIGNoYW5nZSBmQ09OU1RMTCBmcm9tIGEgY2FzdCB0byBzaW1wbHkg
Y2hhbmdpbmcgdGhlIGJpdF93aWR0aCB0byA2NCBhbmQgc2lnbmVkbmVzcyB0byBTSUdORUQuDQoN
ClN0YXkgdHVuZWQgZm9yIHYzIG9mIHRoZSBwYXRjaC4NCg0KVGhhbmtzLA0KVGF5bG9yDQoNCg==

