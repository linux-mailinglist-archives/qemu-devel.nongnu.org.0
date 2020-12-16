Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC972DC162
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:37:04 +0100 (CET)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWzI-0004p1-0Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kpWxh-0004B3-QX; Wed, 16 Dec 2020 08:35:27 -0500
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com
 ([40.107.236.75]:46052 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kpWxX-0002L6-SL; Wed, 16 Dec 2020 08:35:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRoVNQtnplidRUGgarHNUTwzqdqTgVToV1pT1y8+Qw5gGNZblnr5wQb5XGJR/1suRlX/GV6/lfqUPWSeeW+IjS6VEfQ7l9vs2r6E2sjx6qhx3ypsMkF+jsscBaRSTwlehBteL35rpUkwcbax0AwSL6cLXL0lVJ0qOk0EJfKf8oQXbU/q5wwMjfVXqVSHslBEhdLkyiUpW+fFGirh74qCaZGiaDQ1gTqA/42DeinIFD0Gp6jV7K+AYRnF9C3/mnieWBZOhvgjoN1sJpQOEoA8TWN2vqAKhe0kiz6pGfJ+VsDANbiHcKperThGOU+EbqYevvJWCas7mldzaoaHg2HZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tInvJe63hK9hH8pC1FJA+Co2clSBChBQu1wQ8qRaY7k=;
 b=H15djN9ZetfLx+f7qDsz74m1UENF/aU7hUmufasMcqi7/Ka77NaGbixSCHyufvHato5C7ly9MNZPq2trJFdOS+ShxE+F6dc6tODUddfiiPrRUMtscbNQLDSuBht3SawGshSaqmGMXhDO5YKMlJmT7HL+RMK2OQY7gIAqZ7Y+R/ZWIonOMwLvgka8EEz7rDlYI40lsuhurMUzhAUD4LR73qhrOjVJsBcYAOJcWadInkA+ExZTwv6qKPa0UOZZddw0IZz5rgu2hrIv2fQZDCnBJ6IkolCnrlVJQ1f+B/gY+0FOrM83RCQZScqFg/E+ZdfCFxps8ow6DmXqNWqyiFRCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tInvJe63hK9hH8pC1FJA+Co2clSBChBQu1wQ8qRaY7k=;
 b=XGI+YVwB0n2MDfUQ92IEjZKmvCPRcsjz884oRgALCUv0PQECLORQSpYrqJw+IX9I5USVcPplj+hQQRo9jQF5mTNIitm0HYL+Ql6lxTGoLQ4mKw/XpvwXp/D5Vsfc7MakrHXpvKOCwg0pXt40iioWbt4uDN52pKyUPrwAhOo/f6E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3846.namprd12.prod.outlook.com (2603:10b6:610:24::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Wed, 16 Dec
 2020 13:35:06 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e%6]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 13:35:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201127082353.448251-1-thuth@redhat.com>
References: <20201127082353.448251-1-thuth@redhat.com>
Subject: Re: [PATCH v2] qga/commands-posix: Send CCW address on s390x with the
 fsinfo data
From: Michael Roth <michael.roth@amd.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 16 Dec 2020 07:34:11 -0600
Message-ID: <160812565115.1486997.12184190740508753604@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.11.250]
X-ClientProxiedBy: MN2PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:208:134::28) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.11.250) by
 MN2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:208:134::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 13:35:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51cee843-83b9-4540-b923-08d8a1c76691
X-MS-TrafficTypeDiagnostic: CH2PR12MB3846:
X-Microsoft-Antispam-PRVS: <CH2PR12MB384601FA560976323051FBC895C50@CH2PR12MB3846.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHoIHzfoEOvN5AuH0lSYZbwnN0rUgcOlHBoR3Byj5fM5AVAxcS0FOK2Px1ecgUfye6TQIGuPJEDD6jHrjCCNStc/tuYxLGfn7UO2m9bh99IZPRpnNKqB35XCQqUAzL4Dgc+3xwVJPMsU1b9XsgvRrTH5QQLA0W4RbE0o9Y83Mn4GKdqZ7jMunJtZehs3S6LxLEbbTKx0cv/OYLQjxLHAjn11n3fNBMnLxsb0lE7pOnm2fQbo19EjApkcGYF5PvYAyysrin2WV+JW3EQ98Fo7SXY3gRExwmTw1ZhsVYRCXUDf1WFXVVYawDELHJicsLwK2XPR5MNUxs2qf3S1haHCTKazENUvykyMEJyNHRQyoKJeCTMwVjSEQ8OjdWzwL6LJ3NPS+GglrvaCbJ233406/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(66946007)(8936002)(2906002)(33716001)(4744005)(186003)(16526019)(956004)(44832011)(4001150100001)(8676002)(6666004)(52116002)(4326008)(316002)(5660300002)(9686003)(6486002)(86362001)(66476007)(966005)(6496006)(66556008)(26005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R3p0NnJhM2V4NEM5Q0o1YndxYnZFdVJnaUpLVnp0NTlNNHBTN2ZRYzlPVlhk?=
 =?utf-8?B?MVZtM01KOGtYSG90cTUzK3J3bVh2ZFV4aWZab2U0M0syTUxRRnlUTTcrWHV0?=
 =?utf-8?B?djRIOTdLaXJjVmNFOU51czVFbjc0c3V2cWRSZFNiZ1E1SVhiNFVnakkrNm5G?=
 =?utf-8?B?cG0vZXkrL1Q2bWllSW0wNkdORGlCS3Y0YmV5cVdUYnJyUjB1SEV2NzlrVTJD?=
 =?utf-8?B?SWdWZnFuUFFxMWRXVGJ6ZnlFMnl4ZW5YdFFWb25OT1cxRTIrQm9SMVpPRFd0?=
 =?utf-8?B?aUJBVWh4WkJiNWxrV2ZpLzcxN3ZzM0Z4RHhjY29BK2FwcDZOK1lvMXpmZWF2?=
 =?utf-8?B?SEV2WlpOa0xnQk8vQ3FFK0tZZGhkUVFya3pZSWZZYUZkWVo0aUJ3Qnd2ZWgx?=
 =?utf-8?B?aFR0NDBLRjZPWDgyNW9kbFpleVZPeHRIRzJISWtDL012NXFIQmsyYWhueE5O?=
 =?utf-8?B?dUZUZ0FjYVk2Wk5hUHpTUEpKb0ZySU9PRi9YeldlMWNBWVhHYkNOTkJhRzhr?=
 =?utf-8?B?YWRsWUUzZXU5T2tqYWZ2eG5qUm82eUlkTXdlY2lIMVdVUlRVd2l2UGdpYjl3?=
 =?utf-8?B?eXhFd2dSd3VrUGZnR2VGWGFDTGY1MzArZ1VXcGdrd04vQWdOdGplQ1Z4dzJX?=
 =?utf-8?B?bkN4S3BiekJMSkh6c0x0aEFnZ3FOR29pTUVPOFlvUlZGcVNkd2VTU3d1SjRh?=
 =?utf-8?B?cXJpT1RucjlwOFJoODk5SmdrR1luN2hLOXd5QXFMcmxvaHFYeFo4b3pHck5o?=
 =?utf-8?B?Tm5haVdnK0FCemUyR3dkL3E0SVU4RTNKYU85YjBsMVZLR3RtOVRVYU9lS1g1?=
 =?utf-8?B?ZkRmRFVwR3BZODRLVEs4dUtDRCthWjFSTjNyQnhYbFljeC91ZHJGdkZlei8z?=
 =?utf-8?B?VzlPS1JzTDlkZ2p0ZVVjOVk2K29tMFpodkp1R3VNTW0zazNWM2tNTURBaVAx?=
 =?utf-8?B?YTBoaWJHNFlpVHN2UE5ocTJoMjFPcjhpUS96TTUxYTZNWnZxMmVjVngyRzVL?=
 =?utf-8?B?ZE8yQmROOHllcURBb2hUTmRwSjNaSWU2eTJhenpObjh6UFUwV3ZqTmxkb3Vr?=
 =?utf-8?B?ZTY1NFIwWE5BZ1F2LzVQN2VseHE0QUtuVHdGZjlYQmk5R2xPUXpONUJ1aWZx?=
 =?utf-8?B?a3Yvbk9ick9mVVpOYUR6VERJR0JHdDFhZGtEZXZnQnlpNWNScGNLbHBxcGtl?=
 =?utf-8?B?ODFHZW0yZXZmVlpsWDI2R09DdGNlZFlQVVoySUJSRnhTdTVsZmxhSEpnTG5u?=
 =?utf-8?B?QUhFcUY0UEw1U01qc3ladUJnN3kxYnZFNytNSElGWkRnVkRJN3lQS211ZlNk?=
 =?utf-8?Q?mjqwIPn4netLWNOw4c+p2k8XuFMmmNTDQT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 13:35:06.1587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cee843-83b9-4540-b923-08d8a1c76691
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLfoKnE30Z++PiG29nWzkBGyKDBrPi2ki9azbFHfEryg/qeJJLNCaUvkTv9qMLI6Bij6z3Uz9XA6muTZTkpo8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3846
Received-SPF: softfail client-ip=40.107.236.75;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Thomas Huth (2020-11-27 02:23:53)
> We need the CCW address on the libvirt side to correctly identify
> the disk, so add this information to the GuestDiskAddress on s390x.
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1755075
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Add missing comment about "subchno" (thanks to Cornelia for spotting=
 this)
>=20

Reviewed-by: Michael Roth <michael.roth@amd.com>

