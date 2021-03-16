Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578433D598
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:17:32 +0100 (CET)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAVn-0005JB-25
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lMAU8-0004sX-5V
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:15:48 -0400
Received: from mail-eopbgr750093.outbound.protection.outlook.com
 ([40.107.75.93]:65320 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lMAU6-00051p-QG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:15:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+gDrZQJ5aqNtxieIuH/sF7ZZputrp36zIViTenvU5EGammLEacqLxXFQUQaye7p/W2B3e9L7D/KYkpaNIZRx+jY8cs7VvrTvKTyWoaNBBL45exfR3Ef9gFS8C0u1pOZ05iTMGaDCZkvVWXlb7DT0Ig4VsRVVGc25Wl6K2vxQULQ8z3TrdFZhwS6QbwDZfVrUF5gioPESS2BG/JvA6VZb6sCwg+HIe+AR3H1sLtPAR7/H99/zp6FefBtddqpLbh01/WXZOLCNRpiT64fVjauov7Ha+FCv4mgqxhYKTK4pfg7yHlFY6eBAHUWxNNxf4Ntboipx2GA+srB1tbRqTYyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd/osmFqjO1H6naWqo/6kR3ZLfJJUu5SzDoIUw738oM=;
 b=YbyJDicRnwO5CTWL4PXJQtRJV1rWWU2gSGt+CjkGE9gMzkLUY3Ap3UdO0xhBu6yv2nqcW7BOal4DmGhNey3KcCaJXM6z3VVhV3Pi8A3qEXY7bTmPcLysgxpJiRzbhX8cop41kfWUJS1KNYUtc16oH21KClALXzKbdV6WTh/RqTQDQz3phEIruUPpwtA5od59Kv6xHjrf7LcAjOyL8vVWMbknM+HGmZoCanpuHQmlaxl+5jUI519pyCrwPphmQdYI/wFT3IlGmh885ebGPjwlGiMO93i/3b4dRNuhHkCDvK84df1x+qpRrmscR3ILud9X0AqQrReJZSCtBRb5HZBFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd/osmFqjO1H6naWqo/6kR3ZLfJJUu5SzDoIUw738oM=;
 b=jvMQCpZ0qzToZmAe5zYCm+rmayNpkv0SLwr3jx16AYmTNpQyeCmoF11vXNLPVXBZwwCfgmVHHUJhj2oKIAe+5QbCm26Uc1eem4Fh7sAtHOlUaUHRlsALEvIp6wNN8JWDpcLzLWemXECxHV4WCab3ssYTUrRfawWZJbvuJrzshMM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN2PR01MB2063.prod.exchangelabs.com (2603:10b6:804:a::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Tue, 16 Mar 2021 14:00:40 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 14:00:40 +0000
Date: Tue, 16 Mar 2021 10:00:32 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 11/14] plugins: expand kernel-doc for instruction
 query and instrumentation
Message-ID: <YFC6AACF5jBSPaDk@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-12-alex.bennee@linaro.org>
 <YEu0yfHSph9x33/T@strawberry.localdomain>
 <878s6n8az9.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878s6n8az9.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0367.namprd13.prod.outlook.com (2603:10b6:208:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend
 Transport; Tue, 16 Mar 2021 14:00:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b286c44-174a-4a75-5471-08d8e883e075
X-MS-TrafficTypeDiagnostic: SN2PR01MB2063:
X-Microsoft-Antispam-PRVS: <SN2PR01MB2063FC470904C83A3C43754D8A6B9@SN2PR01MB2063.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZsC6tVdkGCOjELxoJIA4QtQcQgrO3kpKXQxeO0bH6bLc45eS1fIDQDlMIS1tQOS6PvEEJHVOrXXFE0o0gMpxoSXRd3QZ2clH6+H7KLZksD1vA8Pinb68ipff7xpxh5tlyTq4XYu3sxd3TgxhVvNGCbIucvUay8dRzLHOg15diO1YBz3HVQAgSWBjg0WX9797Nr3c8+HScgqaflfcxIFXuBRqlJriXh557IvtrPDZqWfeW4WrVVEnXMQMQ3WoYcHaKcyma0nFXtnVx4UJUmJ06NYxAAhFOvudU9zO9IO7nhYsGd6RASsNwUmzWdjySk7mnDNTb9z/EFmcHHb33jXezbI1IKu8Zs/RRALs2ZpJNHg+oNUZvWXo0gjKnETZs3Crokxc2ha4Fmi3mUqYcq0XSoUqG+bsyR7Cboqnz2rnMPdXVpvadHgBZgHiCaF1+TqYoUuwleWUo8dLFj+jsqKJDCE7Wmkioh75uTKQI+wsqe73wxCw+VkLBpVVtc3IhWqNI7fZjYdTF/OMbtKX+VI6po4SlRXJjr5I+mJ73AYg48ZetJDht+dfW7wk2LFseRRi69/maL6NxnfyCIFZBu0rdzBteIQ+L1MN277Aq50bjTOyK2T4hud/kmJtvSW+MMs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(136003)(396003)(346002)(366004)(86362001)(7696005)(16526019)(478600001)(83380400001)(66946007)(52116002)(66556008)(8676002)(6666004)(6916009)(6506007)(8936002)(5660300002)(66476007)(4744005)(2906002)(26005)(4326008)(55016002)(9686003)(956004)(186003)(316002)(34580700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?sMf5Uv50ebDFChV0pMuZtxzS84UDKK1afJiSMa4DuN+mAj3cTKtSccbjYa?=
 =?iso-8859-1?Q?R2cxaG7165s4tq9nCm6y4rgrzr/6vi9ufWqDRrUXguCDgSyGwyUddt4hv0?=
 =?iso-8859-1?Q?oStkTEVkYUZNv0ovYZ+gHT2k3i9eA11CHp081RNyHsUyvA/PywU+2aqQy1?=
 =?iso-8859-1?Q?cGv1llXbl0COwoXkvg+MzXzbXx5LA3OmSC+WyocompXds/2tzrvG74/683?=
 =?iso-8859-1?Q?Y4KVNepCyjcRqiwTywL9MekqwbmQ4m/Hrq0LifWSX5c/HzMruXvOUPtRMU?=
 =?iso-8859-1?Q?Ntv1/StYmZ9vPWkeXknoRfPl5H80tY3DRCdfgTSyBLVOVeEv1AEelGEHVQ?=
 =?iso-8859-1?Q?sJsS9QMNjxyNAEda0+dTtxZJuBhVnweRH5kW60okdVvyoBf4hwj9/IApUk?=
 =?iso-8859-1?Q?tF5jgBOvNo4WJEHoVI9tChf+/dUAYXslrXYKXq2YwfovfzufWQf6TQ2W+s?=
 =?iso-8859-1?Q?nEhpGLipFBLDCZK3PLV1iVUB50Pmz7ivnnmegIJdYUkQJnL8ptgFpPo2WP?=
 =?iso-8859-1?Q?YxlRzAkCO40XvlIDXtZJa+tjcvkhVeGS8O0bNU/pLleR5Y6sffHGOE5QeR?=
 =?iso-8859-1?Q?wlt9ThL85T/AUD4mWrM5YCct64Z4Jq5qy5AKj+N4Tq0cam3fy1mT+MVVzI?=
 =?iso-8859-1?Q?86EPBLI+dnPGZlJTmX5NzAXaVxPIoBUbSksH1XbeTNqVtjR8Kp3lbhJ1U3?=
 =?iso-8859-1?Q?IGwzVIr92DakTLtQngunnLUHj1pjmoyFa0CN+JtvN7Q9+smdG9/EkiGkNE?=
 =?iso-8859-1?Q?G4dzE7AU8s/P3HmGUMSTKQXUtOP1nJ6j116zUkcLrPS96zTWP0sOhYjGPa?=
 =?iso-8859-1?Q?zJxVrcauYZFQ+mW/kZ4I7Ieo7K31jVBB8wNlQmr0V0QwmXgJx1vXal1SMh?=
 =?iso-8859-1?Q?3mrCRxYEYpNnZIHrRdZxcX18LSsLYdpzY9d7L+eeCA9zp/DUJJM2gqQPxE?=
 =?iso-8859-1?Q?wJ5QAkDG1SNfB70C/G8hJ57wmYoWODSnMldFpPXYi2hnnjzyv38KMcQsDy?=
 =?iso-8859-1?Q?95ysu0zzakHuaDMA8kLapBzh0L5Vs8oPqdwd5MrjIdVdRGPVSuUt/ZfKev?=
 =?iso-8859-1?Q?lMNeiZYuQsbDzsngQMEyxhtEkG7/GqQFLUD7wSLuIrMoXPCg366SRp9qnK?=
 =?iso-8859-1?Q?rz57W1OZz3y6fRHMmAJb2PTHDtvbNm5rXTkWtFfkNXcNoAQ0j1VgNDrYJM?=
 =?iso-8859-1?Q?Y3JzSBssJKg/GjDK0kKs0iu5HBbOgct1N3efadmPKaqUFIX5t2nTj15wxj?=
 =?iso-8859-1?Q?W8DiA/MM2irtKUl3+m/dolO6qdQAKbBBj2gs59Gv8/FYSaE4Iw5ICiKfRf?=
 =?iso-8859-1?Q?CR/Vldk0sMT28B1ia8mxdMW1hPMKO75g8ufwE97D4xex6Hde0/4RqEl6Tc?=
 =?iso-8859-1?Q?2NG/YNsPXM?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b286c44-174a-4a75-5471-08d8e883e075
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 14:00:40.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMxQKdjy9JSTbLIhoflMkXa50MXznH8kIshAkyg/JxoCmwHQHlcLo/i1t9V6ScWgROrJmhVC7bOFKxIX1CTh1Fd+BrlAFCVf8JlyYDIFp/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR01MB2063
Received-SPF: pass client-ip=40.107.75.93;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Mar 16 13:48, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Mar 12 17:28, Alex Bennée wrote:
> >> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
> >> + *
> >> + * Returns: hardware (physical) address of instruction
> >> + */
> >>  void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
> >
> > Is this the physical address of the instruction on the host or target?
> 
> target.

An observation: We're exposing a target physical address here as a void
* and for memory accesses (qemu_plugin_hwaddr_phys_addr) as a uint64_t.

-Aaron

