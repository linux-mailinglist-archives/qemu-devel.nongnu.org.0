Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F543485C2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 01:12:49 +0100 (CET)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPDcF-0001Ut-KC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 20:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lPDal-00013Z-74
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 20:11:15 -0400
Received: from mail-bn7nam10on2083.outbound.protection.outlook.com
 ([40.107.92.83]:18401 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lPDai-0003Y8-QL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 20:11:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeWsr2getMq31xDOhVZiCYM3tDBYfLDvkm1c6dff10dq1uqzDVGbOb0r499QAXN+49I9Nu8rtHo4guZ8lEm66+pG9Ket2utRGH0qcN+XP7X4GWNnfL82mNexOh0NS4aCJMYDutFyeF4WitvNVSAd9G0BXuMqqvGEviBILfMAKZ5KuLInxeS2ZWS68aEonGz75P6VeWNk7kGIFtCElqgwbBdTcux27b9V75KWqYeMQIh9W0rA82mWiCJS1ab9p1bTf8oUEUGe/fZEQLZZ9ZXgguDbYcMI0D53KbOrr+zmuqKvgU7xM8MjauVAFldOn9aLCsXsowyArhR4mX3XKjIWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5etjaPNrNHxTKqawsy5kVBRJTuvha498Wx8l5op+l6E=;
 b=evv1PZIXR7zEElCdFod8jjR/GA3GKOzGsTjKNOTyanhdMEYsOrKhhLaSmVXvj8OKW7ggg8c4taIxPoYcoEheywxW59FeY1qQJd/2fmxZgtjIO0jvdix8SS9XT2fB4MJgRx/NbKf3P5Bars9gkReayFmUZUBVjRb3bPVHyDXv7YcdqtzC9f4/LP8a3sNw+gcgQWjvO4BsPOvQy5rnefGxHbYnk/GXogHGyMSojTCCoNJbDonah8Zzgexu5adtrZZ6BkYIxFA/xQ0QCU5w0ILmJHmkdNwSOgPbcEm6SjoDMatTo+lGkAF8h3/Tnn1WLTB+1blBVYj8FRDgB2sWK1L87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5etjaPNrNHxTKqawsy5kVBRJTuvha498Wx8l5op+l6E=;
 b=p2T9F3otN5pfPQIQi7LB2BfHWKAbDLOyAuW955JVpqkauWq5bS0pv2ugV4giUE8c2sSWYmPX/6atRg4DUJdF+6YeTBrvu3Zr7HwOmNz+Rh0OdxhsjCyQ2CmIPwdQsPZ2lpT8+qt2HLVzTqfyqd0xI7FGr/1pGOnWZkCeqone2Fs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4907.namprd12.prod.outlook.com (2603:10b6:610:68::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 23:56:02 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 23:56:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0-rc0 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Mar 2021 18:55:48 -0500
Message-ID: <161663014887.1937077.15008016837625891524@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:408:e8::32) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN0PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:e8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 23:56:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e538f03a-1b38-4fa0-491b-08d8ef2060f4
X-MS-TrafficTypeDiagnostic: CH2PR12MB4907:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49073F49A161407AE500C44F95639@CH2PR12MB4907.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhAfCNW2rwC46YjxkoO6m00cXv/4bS7/e2OxDLha+A3ItDhuOwaeb0EFmgSL4KEvgRm18KVtyLtLTaWH0ZOUixxsuFWO9BiUUyIZeTJ71sgH/GGri3euvztpB8mavEyRnYQVMAbJTKBbbfzgxvtKOw3V7es3fLRoDvX6E6sLujtv253m9c+NvAVdrm/c6TrNomp9VxacrXVW0ZZfZy40iL/OB+ar/Ayww5u5uZjrKCc7Qk/+xsdrd45rNO6YAQVDXCNtH4djdXPiqjd3W2gz6tL2QwRiZt8bA6entOppcEC7EgNUmoTyKRaTEtZSXASQaJ5dxYBAOkzLh3pesfFCRtutd0Tyb+3rEcPhMjiyUIQi1xCDWaBpIdK9nt9JZE4YKeBY7lh72hzdY+erK0M2fMBZc1ewCja8YMRd4yJVI1aFmsgLy4TKa3XqbHBGwVx6PMVlwywa5ZwlUh6o6GXyof4pbQHIxCzR7r3HaTriKgfFlz5aTjgbqfcBVE/mY5QgKuquyaIgbrz5a4L6Bo9uneW6ITrDoNyOces5lqKNPV8nBJ/FS7ou9ZnWH+C+hh7VeuITChtQKC0sHzBmsQkG2zV9qOn5kgd4BNd9EhO5WfTI8HXtALFOwuJ3xpkqIL0iLpbZfp2bVSHpx6Tbz1vPbM3+5KKbMI4jjrdjt+DEjnMxAAqwUmV2IAm9/httVXmmYnVRv19O2p61AikEtlGIAmsDMgxFtmwZ1rY9EsCJO5knkh99sMJpL81Hu/Gt+4STeoogVuf+DI2n+cR6FZTeer0nNc+kbkBpuMDfxxS4CmbhB6wtA/X8ONX4Jg/XjcYp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(86362001)(16526019)(6486002)(36756003)(4744005)(66476007)(66556008)(6496006)(52116002)(83380400001)(66946007)(4326008)(5660300002)(8936002)(2906002)(38100700001)(6666004)(26005)(6916009)(186003)(44832011)(8676002)(2616005)(956004)(316002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHdYc2VPa0xWWWZaR0xDb2dNaldkZW5qR1FiU2NiY1RIbEUrQ1dHbzBXK01M?=
 =?utf-8?B?dUlyL1hWMHJyelFTYnB4Ti9ka1Q1d1I0QVRSZWtld2FMTWFBVFpYby95bkJv?=
 =?utf-8?B?WmRKcWhraUxEdWdla2Fqb1N0ZmhmZlZRMEZvUWVUNTJRMnB3b2RuUWYxMHN1?=
 =?utf-8?B?MkREZ1FGZzV0Vmp1SWhIVFl3d2RISlZwUWl3QUhoeTVFU0c0UkZLMCtpRVUw?=
 =?utf-8?B?TXdsd3MrVHBzbCtJemZ6cXJJZ0hWRUcydzljbk1hSGNocE5NZ1dobE1iMm1h?=
 =?utf-8?B?UEduTVlId202VzU1dmNvaFBaQ0tKdGZCaWtTSDZIRUw1czhtenRXcW4rdkFQ?=
 =?utf-8?B?RXc3WmNjSjhmQkRyajZRcWxOTFM2MnBmY1p2ZURUTVEwUjZvdmExRG8wYUZp?=
 =?utf-8?B?Y0pYVXV6bmNyb1R0NW1JTFVlWGd1bmMxdm4rWmZQc3J1Wlc5bzEvSS9Zd3JV?=
 =?utf-8?B?UGl5SVV6Rmo3OUxVZUFiM1pSZDVvTVl0a0t0ZVdTKzI5WDU1alpKMFJtZ3dn?=
 =?utf-8?B?MFhmVkttR292Y3JaajdkNGo0eDZOUmROeiszYi8xZDFLeG5JcG9Db3E2cmsw?=
 =?utf-8?B?bGxYUEt4YTI5QVFTdWE2cytML25jL3ZFcTZINmJZdEVYUXlkMHRZVDFoNnZi?=
 =?utf-8?B?eE1JV1FwU0VneFBuNlV2YjlCNjBZOXUwdTNGb2ZZRW8zNUNGRDN5Z2ZtcGY1?=
 =?utf-8?B?UTVSekZkMFN6MWNtQUxFa21wZTQwdGFaSGtBbUpIa29yZjVEV0lYNWZMSlpP?=
 =?utf-8?B?eDNkcXdlVGJpTW1talhtLzZ5K0dNTkRhaDM5OXFFaldLNVVoenVDd014YUZ4?=
 =?utf-8?B?WHlOTmsraEFTRERMUmgrMXFxZnF3dWEzZGt1N0drNWtBcis3M1V2QTZjVnZz?=
 =?utf-8?B?emtuM2V5alBQUksvaU1uNlJSZURQc2pVMWxRTHV4R2NsVzRvWG9BWi9nRllO?=
 =?utf-8?B?U3ZLZXVtSERtWjQ0RjhMQm8zbUVLbXFTNG5RdUo5K3VHZ3dpRTRBcmVlSzJK?=
 =?utf-8?B?QkZiK3pidWxsam1FWXdMQkxES1BHbjRkMXE3eEVzWEVqdFpHeExIeStURzNt?=
 =?utf-8?B?ZFhtWGszZjd0Yi9iaTN1NjlWNjgva3lYSUNnSWNNS25yVUxrQ0dmbDZVSUx2?=
 =?utf-8?B?NGhJdGRtUnlueWtYclNxMGVGSzJHUzYxT1JjQ2VOWU52U2tLMEJKakYyUk9Z?=
 =?utf-8?B?WUZ2RzNtUWVVaXR0SEw3eEZYWXBCLzBxcWdTK29wei85ZWVFR1BRUGEySk5Z?=
 =?utf-8?B?YzZOZ3BJNTk3eEk1TDIxQllvaVltbHBhOW80SFNieEw3U1RSUzh6ZU9RS001?=
 =?utf-8?B?SGZmQ0UzUmcwb2lNOWUzRnc2QzJUcWhsYzRFK000Yjl1amdmWGdQb0t5VElK?=
 =?utf-8?B?Y2dtSC9yQlpuZEV0dThxQ2RpVHJ5QStOc0dtSkNBQ1FoNElEY3hHS1RDQWVk?=
 =?utf-8?B?ZVNlL0FXZTJ5RkpGYUhnSU1rcHdlSzdJSDUrT2YwRXJrdExsQjF6TWd2NjBq?=
 =?utf-8?B?SlhyYWw3MEV1YlVrTWRCcElJZFppZ0ZhalAyelhkSmx3OHBvQTFDMlVxV2ph?=
 =?utf-8?B?ZzhFMkZWRGpGcTZnbXhNUFNiYnpDcHcrWmZKRFVyZ05QUnBldVhiSUhrSFN2?=
 =?utf-8?B?cmJuV1dGWUYyK3d0VGlDRWJTeGY3ZTVWanV0VFo5VFo0bjBmTC9HMGlRK0hh?=
 =?utf-8?B?dkpCa2d4djJpUzZlVUxqTDBWRzArQUhibE82aERaVjJ6aVh3VE1xR0hoSWZN?=
 =?utf-8?Q?75oKpnvXcIrrcRzHBvmy3d6sCCn4kAtFCKYREhP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e538f03a-1b38-4fa0-491b-08d8ef2060f4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 23:56:01.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gkrW+1I+KpwgcWzO4MGfg+4yjCFlK7u9hUOmVS39IQKRRhHCTgvTFteLJVSXMaaUoQevfGP2BHGT07UPRtHNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4907
Received-SPF: softfail client-ip=40.107.92.83;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
first release candidate for the QEMU 6.0 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.0.0-rc0.tar.xz
  http://download.qemu-project.org/qemu-6.0.0-rc0.tar.xz.sig

You can help improve the quality of the QEMU 6.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.0

Please add entries to the ChangeLog for the 6.0 release below:

  http://wiki.qemu.org/ChangeLog/6.0

Thank you to everyone involved!

