Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27286918A8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:45:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN9M-0006iB-GN; Fri, 10 Feb 2023 01:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQN9H-0006hq-KM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:44:43 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQN9F-0001ED-LR
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:44:43 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319NAGeN002211; Thu, 9 Feb 2023 22:44:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=4k8VoGFOf4sGC9KQLs2RDB18fPrSKnoArvOWtMv7wsA=;
 b=BCWkfn/g3s4IrYIElE3D9cc6muG0C4S/n5BbTc+K/gXECMBO8cU9vRy64kPeknm/vUh7
 MV5P08lpY4Z6GdpZyROymrtfEiJgUIHBtH5ejvCrlOTebsptkNEa5HjxDi6MHVJs1UuB
 6MkxC5DE5TiXReummHaUHi9/ziOvsK5nkFITYZBCKlcK/SRPUnDDuz9lg3Veo1Hsk5IU
 VnIISUPDyiWHu9wwZgqOoxs9PNHbMJwA8eVz+kHm+pNf39PPxjTByqbJqtdmZYGfg4BE
 UPPSJmDK2Hw5TbsNKNlVEdJ4jD7Dq9aDSHo0gCIPA60HeFZoRXhaJCdr9QsvpgNL4lA6 Ow== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4syhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 22:44:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kykx/ezqIbYcBRkbcwlV57zjGO4xW/9ybAHPLTBqVYELcMAiH2bQHMEL7jhwMryWkWyFKe9JS9pyzR3+hy9w3R/wBCSwnzeZUuUUBJZu1QAUtrgvNWhzPD8ZQmUpaQyqjfNweJDTSXE9fL+i6VKwPTXSJ71JDllE1+s2sBafFF7VVPJDIA5FouT7FBD7ENzvNYd95FNCxW85uuMjcn5Jd37AjR44S4eOD3YGWSW3SX9hCNRulMFHXC/iSLQpp1i7kAvUyB72/xJ9NZBWbnXZdsZuDa2/vn3++iRJXXspG8G6WlJ4UnlYUSckiYIRWv0rzw84daeMwtBXepW5FjtffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k8VoGFOf4sGC9KQLs2RDB18fPrSKnoArvOWtMv7wsA=;
 b=b7F8mXM1Gje8PJnrGqoUd8vPffiWAC16eyvwMrKFhoSd1bp2YNxJ58HuYrU6Ow6tTbcX4U1hDTjaNZWcsRVDBWbYEGZ9YtTvgK4HDw7B4NBmMkTEeGh/aMhd/STrJ5spW/3giSunI2Wg68oyq6z16oGOsKKlED62wu/Z9O0+9gCN/QQoXSPErbdKVVEHV/zax1lGbdPHnQuqWf3iIgeJoHu1KR9tYqOqRmMzQNZC1k74ULT0HtkH6lr7JCFggyuS7twtvyRoP3Rn4fuE9ZikCiR5fFNNgETd4YEqXnPry3OaWDzvX/506uJdvJlb7iSQvnWY1FMnpPbcR9vjrHPPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k8VoGFOf4sGC9KQLs2RDB18fPrSKnoArvOWtMv7wsA=;
 b=Kngu0FNmIJPU7R2QuJgHu8pyKTHT3X38gcitWY40FHqdV9ywxe2ugR2trXZltauz3WBIhM3sbRwknxgq4Rq3pKmMElzCtfGacXF8UvTm4AwtSgAt5FRciOhHbnh1pwCoiQ17WN/O+M8Dbm/Y5Bzaov7GzzekRIHSv79Cet41dxXGUCjml/NzXObCJKMSDXprx0nZ2BMa/TH6RZLOXEQDQAHsaGXVTVHQR1KmjpybihSKCa2nhDw2o38G/RU0S5nut+h5M5CNV3lpAwosGBQGwQmFkRoAfncWsWS488VVqpR7/YJAuGgO4YNrL5V6NxQcnZGph7GTL7mt42MfzVGsQg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CY5PR02MB9039.namprd02.prod.outlook.com (2603:10b6:930:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 06:44:35 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Fri, 10 Feb 2023
 06:44:35 +0000
Message-ID: <e71fb95b-7fca-429a-872e-a8f48a3022d4@nutanix.com>
Date: Fri, 10 Feb 2023 12:14:21 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/6] migration: HMP side changes for modified 'migrate'
 QAPI design
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-4-het.gala@nutanix.com> <Y+ThkshD8G3ca7Lx@redhat.com>
 <3bf69a6e-f2e1-6335-392b-5e383f0c665b@nutanix.com>
 <Y+T8cGXoOvxYtipv@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+T8cGXoOvxYtipv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CY5PR02MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 7deb2365-5fa9-4b9a-518a-08db0b324614
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQl38n+KiT7KzueQRIQ9ADt8yUyXJFuU+Fx8HHqlFS8Gh3vBSTHNU7H2WGEEGcyjZumZlBWp4z5snyHfQfA+B84emAsGy7tPF+atkPcxtCXOAwqxnrrlFDDMR5PhnRehpHZ12FpwqoV62lbNqL5+iW7u7Xx9Fn2oaMo3APWqmFY5tWKbolTVW7qSxkZ4t76maf77XpeuhSwqoO+OYqa3LS5INk6y0I3Emd0GqKzKv83Ip5JaYpH6Scx0+0BhI4Wnn6+8dSLnvO08sXaB9QWoOH6vudDVTWw9uaimv/MwQ+K2JVVo+uWI+VeX2fAy+iGHlJ+/sofdx089iSxQatIG7h0LJZbZ/HDAR9DYwI44R/QNJpVyLsnfRwsV0Yj8Ff01qvQI+nTCKws6deCpvCOhf1i433Su80H/WpZBqcxxiICRy0eerpARo1qtUZJfw7G9iVhWR+xLkot/qjma9fZSi7Tmwzbb2BHxtZSpX01RzGWn059AkPt/21+vMblfQhGk5dxDSSrPpkmfKTWog8eTIyJs4kIubDjbTQQ561zFXfErAwRquoNwTjmUQsZgrdjCVdiI/xN/5Ko+U29RTCo4FWAIzYsbJAaVcJVWnrTZCbzQxU6gs/dd/X/vMCquMe/6cntRDX+Xlawc2rPWvsZXqRdAmGK0vL3lr984rcdG3+tE2WyxYnQkIv8a2skiSYd36qO1QfaegwmRR/TXZ2p034h0edunJ92c14GF5UXS4TE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199018)(31696002)(86362001)(186003)(26005)(36756003)(83380400001)(31686004)(6512007)(66556008)(6916009)(2906002)(44832011)(5660300002)(4326008)(8676002)(8936002)(66946007)(66476007)(41300700001)(2616005)(478600001)(6666004)(53546011)(6506007)(6486002)(107886003)(38100700002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdIQksxR0hCZ0VrV0dEa05LYkpITWV5blBkQlVVSkhDUjhndFlQb2NrOEt3?=
 =?utf-8?B?RmdQY1lFeEtZKzhsM016UEErdUNTSFNBUmtodm84U3ZHRGJCN3E3bUJTaGlW?=
 =?utf-8?B?d01qMTBZUEJIbDdBTWtjTk44T1MxM2J4TXFYbTF0anEzSVBWVFR6M2s3SFBX?=
 =?utf-8?B?Q0VHdzg0cStyTzZoa0pXdDgralhHKzNoYW1nZXRyeFhRbkpSNTRvbmdTM0JL?=
 =?utf-8?B?aHhlZDhsWTZHNkxBSmRKL2sxTFNiYW41ZzBJejBqVHhrVmgxVnRSNExLc2lV?=
 =?utf-8?B?UG9tcEV6L0hMTFMvam15L2JZZUthemZ2cGRSbks3OW9WblRVSHo4VTAxS3Zj?=
 =?utf-8?B?bW1aTTRjNDM4aC9JSXdFeHgvTGF1VDBHTUMxREFkMmNIZSsxUzBsTEJ3cHU4?=
 =?utf-8?B?SnBlZlhuQTh0QlVNNGFSbmFQSWFQZHJKdHVMV2tjZEQ2Vm4xWjU1eHRQKzZm?=
 =?utf-8?B?TkFVZkdwSnJuSHFGOGFMSnVSZ1R1VTBOSTZVNzZGSmxvbVpiY1E0WFdYMTBp?=
 =?utf-8?B?aUtQM0FpSEloU2g4MGtsbjJ1YlZaWWs4b2Z4Vy8wNlZPZzBTMkR3MndDeEtV?=
 =?utf-8?B?bXR1eTlhTThJLzd1cTFYR29KcHArSzVjZlZhQTV1Y2ZPbWFsaTVZMDZEM1c2?=
 =?utf-8?B?Q3JWbmtVZGhXUGpURkZ3aGVicy82VVRUR0VtUUk5QVZJc1pnOERtR0xBSGVo?=
 =?utf-8?B?KytHcWpVMHVGRUVKTkgyNzBub3BEVzNIcnlyYUhQTlZGNHh0Ly83aGJXUWhS?=
 =?utf-8?B?Z0IrbkxDRlBVelhVMXpEbnNoNFEvdDRoRDdVS1czeDZDYlpyS0JzNTcyelRk?=
 =?utf-8?B?S3k5TkZVZ3RzSUQvekxoVUxZTUQ4Y2pvZEQ3QzRLZFNtb2hWaXVEMDRaZ0h1?=
 =?utf-8?B?WjRCZ2owY3RRcHgzcWpOQmw2TUdmOXlHZkFZdkpBRTdvRzAvd2tvNXAxdlpx?=
 =?utf-8?B?dGd6a0FjMXF2Z3YzQkpWc2pCLzVSUHB2V2VocXZER2tqOTEvTlE4TlhsOVBD?=
 =?utf-8?B?b2F3NkJmZFlZL1FjU0taR3pVZ0VLWkg2Vm5rdm5BQVhINFo5ZGVLZ01hNGtM?=
 =?utf-8?B?MjdnR0RpeVdRbU5SbGRPTzdSWEFUMU9SNzBpQ1lCNWUvS3poMWlWclAreE10?=
 =?utf-8?B?YXBFdWZ1eElqS1FsdndFUTl4NythUG1sY0JHb0hpeUVLVXJrMVkvNmNYQ0Zn?=
 =?utf-8?B?MWVaYzhtR0NMbnllVmRRaXgza1ltMG85RktOZFh6eStoMmZrL1AzdTR0a0JQ?=
 =?utf-8?B?Y04yL1dPdE5maWZqbDBnKytvNGJSTU1aTXBqUWlmZEJFaCsya1VoczNzREtH?=
 =?utf-8?B?MzY3SnBlcE1MWW5nQXZXK1hUanVTdjdpa1FSZEJLOWJaWCtKUU8rVTBJZWsz?=
 =?utf-8?B?citybHMvTGZZMXZOZWlsbm1ucFByeThXV1NtK1E5Tk9nRmFTdldUZXgxRXVF?=
 =?utf-8?B?RnY3ZFM5TXc1bVBzOG0rR0wyRUhvenh0R2R5WTFQYmlZNWtuL0p3eDdMVHdO?=
 =?utf-8?B?RVduUFhNYnc4WGxYamVOcFAxK0xvaDd2VFJocGhMYzhIRVRLZWxNbzVoWWQ3?=
 =?utf-8?B?UmkrbzBoeDRiblJLZUNyK1ZiN1ZPaXN0TFAybEd3OHIrSWRuL1ZNQkYyOEty?=
 =?utf-8?B?UGV3S3pJRnRvbkxYbzhLWGxlWHBOSCtWMXBwNk9PZmRGV1FpTXo5SW1GeUpX?=
 =?utf-8?B?TWw0OXMrcUxkelMxZExUMmNDRllHczNqcGY3Q0UzVzZhOXJuSi9WZG9TMGJk?=
 =?utf-8?B?NTFHRkZoNGFyRDhqdWZFa0E4MWZMRUt2ME03RklxYUhrWTRKZng0TFVqU01q?=
 =?utf-8?B?d0hMTVYzTitrT0ppNEFYcjNBa0cvbHJQQmg0aUx3dlhrTm1tOE5MVVJrcnZz?=
 =?utf-8?B?ZjFjZmlwbnM0cXhkbmsvOTdpcTE1ZEhmaG9aSjJrUHg1d3NvQ1YwYm9MYXRw?=
 =?utf-8?B?a0k2bHcwTzJhZG9vb3VyQjdObVRKc2dJYVBkSTl6dFdwU0lVaURnMDh2K2du?=
 =?utf-8?B?Y1Q4c3lsRWxSdU5tY05lc3RoTUpURWozWnlzTHdmMkE1bGVBUnVPY1B1Nmti?=
 =?utf-8?B?blk5VHh1VitlVEtPaFFGV1pXYWhCditFV1RhTVc2YllkWHhIbTVPUWl5blZU?=
 =?utf-8?B?ZmQ0OC85THlXOGNUNmppQ3NhSm5DYTdoNzhmUmNJZTc2Mi9HU0FUWVh0MUFO?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7deb2365-5fa9-4b9a-518a-08db0b324614
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 06:44:35.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53ndxOqnHhve/Uu/pPJVxbm/dx5SUt+0g4/kwn8ZZxfXM9Z2KI9juVvbHjAKVqERSeCyWc4mrMU3COT/Vq4b9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR02MB9039
X-Proofpoint-ORIG-GUID: Dfz8Nrdedq5LvjbyEFWKhtcp6M1Z2sGK
X-Proofpoint-GUID: Dfz8Nrdedq5LvjbyEFWKhtcp6M1Z2sGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 7:30 pm, Daniel P. Berrangé wrote:
> On Thu, Feb 09, 2023 at 07:08:13PM +0530, Het Gala wrote:
>> On 09/02/23 5:35 pm, Daniel P. Berrangé wrote:
>>> On Wed, Feb 08, 2023 at 09:35:57AM +0000, Het Gala wrote:
>>>> hmp_migrate() stores modified QAPI 'migrate' arguments from qdict
>>>> into well defined MigrateChannel struct with help of
>>>> migrate_channel_from_qdict().
>>>> hmp_migrate() also accepts uri string as modified QAPI a 'migrate'
>>>> argument (for backward compatibility).
>>>>
>>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>> ---
>>>>    migration/migration-hmp-cmds.c | 105 ++++++++++++++++++++++++++++++++-
>>>>    migration/migration.c          |  15 ++++-
>>>>    2 files changed, 116 insertions(+), 4 deletions(-)
>>>>
>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 7a14aa98d8..f6dd8dbb03 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -2463,9 +2463,9 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>>>>        return true;
>>>>    }
>>>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>>> -                 bool has_inc, bool inc, bool has_detach, bool detach,
>>>> -                 bool has_resume, bool resume, Error **errp)
>>>> +void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>>>> +                 bool blk, bool has_inc, bool inc, bool has_detach,
>>>> +                 bool detach, bool has_resume, bool resume, Error **errp)
>>>>    {
>>>>        Error *local_err = NULL;
>>>>        MigrationState *s = migrate_get_current();
>>>> @@ -2483,6 +2483,15 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>>>            }
>>>>        }
>>>> +    /*
>>>> +     * Having preliminary checks for uri and channel
>>>> +     */
>>>> +    if (uri && channel) {
>>>> +        error_setg(errp, "uri and channels options should be"
>>> s/should be/are/, also best to quote parameter names, eg
>>>
>>>       error_setg(errp,
>>>                  "'uri' and 'channels' options are mutually exclusive");
>> Ack.
>>>> +                          "mutually exclusive");
>>>> +        return;
>>>> +    }
>>>> +
>>> This change for qmp_migrate will need to be in patch 2.
>>>
>>> QEMU needs to compile & pass tests successfully after each individual
>>> patch. Currently it'll fail on patch 2, because the code generator
>>> wil emit the new qmp_migrate API declaration signature, but the change
>>> to the implementation signature is here in patch 3.
>> Yes Daniel, it will fail on patch 2. My understanding was that, even if
>> sometimes individual patches dont compile properly, the final series of all
>> the patches should be compiled properly. But I understand your point.
> No, unfortunately we require the strict behaviour, where *every* individual
> commit must compile and pass unit tests.
>
> The reason for this is that when chasing regression bugs, it is common for
> developers to use 'git bisect' to test compilation across a range of
> releases. 'git bisect' will land on completely arbitrary commits, so it
> is critical that every QEMU commit in the repo must compile and pass
> tests. It isn't sufficient for just the end of the series to compile.
>
>> I have a small concern here Daniel, if you could help me resolve it?
>> - There is a similar issue in patch 4. Where some function parameters are to
>> be changed. But that function responds to both source and destination side
>> changes. So though patch 4 contains all the source side changes, it does not
>> take into account destination side changes and it does not compile entirely.
>> And after destination side changes are inside patch 6, the dependencies are
>> resolved. How is it possible to compile individual patches in this case,
>> because then each patch should also have some significant meaning to all the
>> changes. So, in that way, source side changes in one commit and destination
>> side changes in another commit makes more sense right ?
> If there is code that is shared between src + dst, that may put constraints
> on how you split up the patches.
>
> Possibly a split like this may avoid having dependancy problems:
>
>    * Patch intoduces the 'MigrateAddress' struct and related child
>      objects, but *not* the MigrateChannel struct.
>      
>    * Patch introduces code that can parse a 'uri' and spit out a
>      'MigrateAddress' struct.
>      
>    * Patch converts internal socket backend to accept MigrateAddress,
>      with 'migrate/migrate_incoming' impl convert from uri -> MigrateAddress
>      
>    * Patch converts internal exec backend to accept MigrateAddress
>      with 'migrate/migrate_incoming' impl convert from uri -> MigrateAddress
>      
>    * Patch converts internal rdma backend to accept MigrateAddress
>      with 'migrate/migrate_incoming' impl convert from uri -> MigrateAddress
>      
>    * Patch converts 'migrate' command to accept MigrateChannel param
>      directly
>    
>    * Patch converts 'migrate_incoming' command to accept MigrateChannel
>      param directly.
Thankyou Daniel, seems to be a great idea. I will try to restructure the 
patches in a manner that every patch will compile and pass unit tests 
individually.
> With regards,
> Daniel
Regards,
Het Gala

