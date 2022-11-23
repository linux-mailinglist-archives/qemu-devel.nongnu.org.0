Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA28636703
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:29:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtXO-0001oU-1F; Wed, 23 Nov 2022 12:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxtXL-0001kF-15
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:27:51 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxtXI-0000GA-ON
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:27:50 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANB6ubE012333; Wed, 23 Nov 2022 09:27:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=wSYPHzM9l9R625FaYVH/BruPC7tMIH/+DSAFhwRSANg=;
 b=iBGMzr1A0SUKwqqxhrujVK7wLNVb368/odc5c8bRG2xHJL53xAMNRteQp5om2V/MJ1mc
 NQlrAV8UB1WjruAMHacb05nInPdjrkIN22LkWGS9J0a4fRTk5aB4VGJ91EfXcnMSS0NO
 W041aUVqDdjpycSPmR2FZk+CCjtHm3N5jAVbiIQopypVGvuP0MTMUQFo/8d8y/+abQaJ
 DVsMwnRbIFStn7YzINqkEVrqbab5anG1Jyzd5xEm4k/8ImT9DYY3PLzS+l2AbSZ1CKxs
 Hy9BtzSUK6vQGi9sSRnPJcOT9HHQiVqCveb9RvKI9NehqJd966dak84f7RTEFjNFazKz ew== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxybktxgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 09:27:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0l+hIWxgGxCcBJg3LrxO5gzhbHMFXj+/M0NG3tt+W6b7aB+7fVfNW4Hxx2Dnd/5Id98DnIkYfwfWRnNY2wwtXee8R8OlFBR+L9JhaZUSutiHfgvL2B2JHev0mb4TzD0GMB0hEok8fbC7p72hpI6eEB0Y/5htDz+UqzfOMw6+R4Pd9UaPRUH/20YUoKBZaaJPfmC4I4ySi+QCrfIg9VNKD83mtXOT0Rq6V1Tnp+6B8KvvB110lzBtuG9FruTbY2r864v+MceTEL6XSgeNNaYYiqJ9IH93Q2IJsQGoAXrVcziS6et6M2X4NORo14HpIq6RDh4FCnpw2I08vymNf1kDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSYPHzM9l9R625FaYVH/BruPC7tMIH/+DSAFhwRSANg=;
 b=aki1GCdYFO7agpfMIVaUT4ZOytP116ovb3139iOcENwdjUgSjDobdtjPL4RdlpgqbCGbjk3ciiTQbaxM0BqUiwLXbxZb6YJdK+pe3ZYGtcq41RKio403LKICLQZpIR+pAuxhjQW5Ou5rYkOYCqRUyeKoKPRJCCtmwbJfpvQEz9j0P748hiHK37MMOpYidb262Ya/FQJn2vgMNxR/UGKEwnUDaZUqlPCy7gc/zhf3BwAbnxMKSybkrwWqWyaHDQ9iP9fTyGgOlaY4+P9c0BTjzcMrzVdjncf7C4EOkNuiU7YaNBrhLbDQQpZ3gRHtiVTzt0LxJtdzm5SH1JBdSraR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSYPHzM9l9R625FaYVH/BruPC7tMIH/+DSAFhwRSANg=;
 b=R/AHjA/PVeVldcord+84W+Rdjlmfkx1Ip36/saMsQfJV5OnOhZys4SPhwiqofmR+X1iGKDqk14lLHj+TPXFWFnuLU2PuW7nrJRvy9Ysdo20ol32Xfy1Ge2SVl6z6qloF+gxPYmS4Qf+ojUOXxJcPGmjAjFQYOTNfj/izcK9TBNMe15MibqPZF0TtXhTsRh5MXS1vs3FRBOxN5Ac7AilUJA/YktXPcUpCwHPrLjYi7Dtpht4CrVqLCFJpuCMjeYWtfHNYjPAoQuV9hh5365hGKYYSZVkjNc+2/aS/I8F+Gi1zcXw/FVCU4RjKcc8A7QGeGtaL63/VwkKpbSMVu9ohZg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB7375.namprd02.prod.outlook.com (2603:10b6:a03:2a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 17:27:45 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 17:27:45 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v5 1/2] io: Add support for MSG_PEEK for socket channel
Date: Wed, 23 Nov 2022 17:27:34 +0000
Message-Id: <20221123172735.25181-2-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221123172735.25181-1-manish.mishra@nutanix.com>
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SJ0PR02MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: b24daf20-37ae-45d1-5bce-08dacd780879
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyfQH5rq1IkMMCiOANPoA7WsoXWHQty8lz5rr0qpN4RsSZ5OUjKrzzYE03uXF930hzsFxv4wZeTIYDr7kjHzkuUXXrow96kwaS4J6q9NeCzVYa+DQZXL0nDF5leAJc/Ig2wEn5h8gOz7q4duY8FUBhVLL1LF+mtu/wC8Ihln9Cbd/IZYdXNB4dUJfG9OMWJ1aR49HY55VlLzIaG6ZPjW35EqXHphR9QieSo1QNgC5LGiQJpvjMVjU6KpI1+l6VcwKKFmLvpO3ZU1f/RXiqNc7WShcobYFGBsb4Kvr/9UJR9EfS2/HK38rDORMbiIG1RpkHSQSl3AL/CL4wXpreahsyMSkMWhP9MdoDKOhg6BD/53RkSAZgRoNK9yeqMw5qhzclax7oq3YINBcQTMeukIOduX/+Ot/YdJwH61xfXfOXz/qsPB4YXv/NfwtJl8uVhVqiH5JkO+P1a6Zjhhmgd+Q8raHB/H6zI0Urh3LIAGxwEJLJsu53hFGh4Jf8YzdkxAJTpWM9S0vHRe/9iNfzcUYvZnP6MDi0dARq7gEdCL1gcFUxmXsRId8fxsG1JGWfacd6BaFAjvJgyuRq/NuQXy9kmQd8VTkhX+Qdd6bJCa/7uYhpo0G/vSVNsQXzpw7X+Y88nAPYmnTJ2PIr3lolQp31i8xaICuDg3lGb2PSRywCTRwMOTjIu9BrnVklLkxOer96uLeV7CIP26/6/Oc+Op8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(26005)(83380400001)(6512007)(2616005)(1076003)(38350700002)(38100700002)(186003)(2906002)(30864003)(5660300002)(8936002)(478600001)(52116002)(6486002)(107886003)(6666004)(6506007)(4326008)(66476007)(8676002)(66946007)(66556008)(41300700001)(316002)(6916009)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzA5MHd3elJwWjkzSnEvK2FDZHRXL2ZOU0E2KzdOcUJ3Y04rTjN4eFdLa1l6?=
 =?utf-8?B?MlFHbTFYNzhjVG9sSmF2Nk9IVHJURnNzUHRtZ2QraVJnOEpmMTdEYWZjcWtm?=
 =?utf-8?B?UWdoOXlTTzZYeFkxV21XTHFIQ2VoS2dCVmZFU1UrSzBoK29BeURNL2xVUFo1?=
 =?utf-8?B?d3FWZVdYVWUrTXd5ZFYvNkEzTURYcjk3NjRYMS9qSU8vbmNSdklRYXpBZVgw?=
 =?utf-8?B?TGt5NzBYMDAxNWI3eU5BYlhFWWRNK1pMeEZmK0FFZlpITkFNSGk4cWFFeHVE?=
 =?utf-8?B?N1cvZFpzaEJ4bUY3S05vNzVsTDBsTWR4RHd4SmtOT2V3Zk11VS9hRDF3Q09m?=
 =?utf-8?B?QjdrZC85QjBRUXpCbUNZS1lEL1EvOThaUzhVMHFQL3h0ekN5MVM1YzVlN1lQ?=
 =?utf-8?B?MWRwbituWVhWUS9hbzZLNk1IZnlsVFlRNFVrOUFQZ1drcU1RdWhLTFBFRHBF?=
 =?utf-8?B?Mm1HREdQcUZ0SG9Fdmxrc0I5TlM0Mm9JdVRWc3pTTkFrNDhHejFsamVGNFpX?=
 =?utf-8?B?Umlzcnp0dUZCQVNoSXVuZytFSDdJY1pBc0lVYjR5RlNzY0N2eVF2RVZNRUdL?=
 =?utf-8?B?cWpIa3F4TkNGZk9ySFV5L203a2hNMHFlU1pXVzZtZ3JjaDUrYWgrSmhENkp6?=
 =?utf-8?B?SVIyTzdWR0JtT3o1aDJrZzIvS3E1MVBQTmhYb3lTTmYxK2J3VnZ4OG15dlJo?=
 =?utf-8?B?TUk1MHd2bXc4d2hwNGh6akxoTUU3QlBkRUF1RVJqcmFZRlBCMmNVcEY0R0Jw?=
 =?utf-8?B?ZmExQmp6emFHSU5WWkxoMnJPVVJTUk1yNi9UQ2NVQlVFVmdNakJ3MUUyNzNE?=
 =?utf-8?B?a0NQaWNsRVNTcEwrcXR2Ujk5cmNHVURpcXlkV1hNNmIrWUFOdGpmVWczaklF?=
 =?utf-8?B?VGZIQlVNT1lndGIrZTlHamFsSVBvcEpDNGJQei9DZHppQWxqWkEvcndFelcz?=
 =?utf-8?B?ZXRqelJneXdpaWY1Y0hLOENXQ1VGc0h1T2NFdHlaS3VQalZLQkUxVzZHamRN?=
 =?utf-8?B?SjRJaUo2S0RiZmxBdHlSWTNlRUErQmc1cVFUcmVUcE8vcm1UQ3YrR3lIVmpw?=
 =?utf-8?B?MS8zTEVOQ1pubWJIRGpqb0FZbVlOODVmdDZlMmZ4STF4L1FxTmlkUU42UkxF?=
 =?utf-8?B?UXNXLzd2OG9GYWMzSUYvL2VxK1FaOCs5NFp5OVBGRnB0eW5LdzlUNEdxRGkr?=
 =?utf-8?B?K3drZXRLelZRWnMzdlhwNkxsRzYzTHBXK1R3d04xZ2lSSVVjbzcvTjFvOGVS?=
 =?utf-8?B?ZmRLQlpXTmRBUCtPODVFSzBwWFI5R1V1V0haNDFGZFFnNitSaVd5bUR2TS9p?=
 =?utf-8?B?aWFwTllBMC9oZnVKd0dWSDJLQWh1c0hNRXRtczJNVm4rTU04b09ENHlsOTEx?=
 =?utf-8?B?azVTT2dmdCtucTBEZkxRWUdNeFFiUW5zREdWV2dxUFNETWs1Q2Rla0JMTkNk?=
 =?utf-8?B?Ti9aenpZWW1OdXNvMEZnODB2bnFDQUp2eVMwV25DWjJNKysvZUtVR045M1ZS?=
 =?utf-8?B?OFg2YmdsWUJvWGRlUmx1VGZ5RUZYWDNZeXNrcldaUFk5Ynd3ck9kUlhhaXlv?=
 =?utf-8?B?am8rMjg5MVIxUkxSc1Z6R2Q1MHdKa25jYk95Ylh5L0hXVC9CajJta2c1SG9h?=
 =?utf-8?B?V3A3RGg3NGJMclk0VnJub3d3cnY1TXBDSGtXVmJDemordklDSTdMWUcwRjl6?=
 =?utf-8?B?WDNERmc5MmttSWJzbU9VV0ZsWDYycnJBRGRuOHV4Zi8rb0VaRmpwYUlFMUZC?=
 =?utf-8?B?SnNRUlJRQTVnSXRUOG16MnlObGZJeFVrZVBiNjRnZDl3M0xGOVduWk1sTDJq?=
 =?utf-8?B?SWJGdVZBTllza1FWK1BlZGZRMFZGVHRXeDcxTGM1d0lONkhVdHkzZkk2QURa?=
 =?utf-8?B?ZWo0ZUUyVzhwMXVxWm1Nc2grN081dUVtY0dIRlRCaVFLdEJYMm1CZUVpanZq?=
 =?utf-8?B?aHJIL1M3NDQ0ckVTVmVTWkRqUG56ZXVBZFBwbmFuKzR5QUFVa3JDU3g0TVh6?=
 =?utf-8?B?NlhXN3RYMjg5eEpqZ0xaems5OTFjZHYyNHlGMHlicDVPblJWZjFsK2c5RFM0?=
 =?utf-8?B?Q0pXbElaOG0xL1VvTDhtNlVoWnpackp0cFdTZVdTQ3BPeGwrcWNGMWs5enB6?=
 =?utf-8?B?Wk8vM1NyanZaS05wOXQ5Q1pzYk5za2VLWVZRbVpxWmdtbytNN2tMMlo2dnBv?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24daf20-37ae-45d1-5bce-08dacd780879
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 17:27:45.0786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBxObqMQFfAwtb5cuHfmQHUWx38TEw5hR35zY8AMQ2zKkkOdYN3NDPyVy2eft94gK5BQfD4uc1fbka7Xk1xECQFDhoml3cqmxLa/8dkYddM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7375
X-Proofpoint-ORIG-GUID: Mk3frOZ8uRMy1Be9DabWQxF40NCMxozF
X-Proofpoint-GUID: Mk3frOZ8uRMy1Be9DabWQxF40NCMxozF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_10,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

MSG_PEEK reads from the peek of channel, The data is treated as
unread and the next read shall still return this data. This
support is currently added only for socket class. Extra parameter
'flags' is added to io_readv calls to pass extra read flags like
MSG_PEEK.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 chardev/char-socket.c               |  4 ++--
 include/io/channel.h                |  6 ++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++++++++----
 migration/channel-block.c           |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 15 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 879564aa8a..5afce9a464 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -283,11 +283,11 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
     if (qio_channel_has_feature(s->ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      &msgfds, &msgfds_num,
-                                     NULL);
+                                     0, NULL);
     } else {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      NULL, NULL,
-                                     NULL);
+                                     0, NULL);
     }
 
     if (msgfds_num) {
diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..716235d496 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -34,6 +34,8 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
 
+#define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
@@ -41,6 +43,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
 };
 
 
@@ -114,6 +117,7 @@ struct QIOChannelClass {
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
@@ -188,6 +192,7 @@ void qio_channel_set_name(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: pointer to an array that will received file handles
  * @nfds: pointer filled with number of elements in @fds on return
+ * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Read data from the IO channel, storing it in the
@@ -224,6 +229,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp);
 
 
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index bf52011be2..8096180f85 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -54,6 +54,7 @@ static ssize_t qio_channel_buffer_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index 74516252ba..e7edd091af 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -203,6 +203,7 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa..d76663e6ae 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -86,6 +86,7 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-null.c b/io/channel-null.c
index 75e3781507..4fafdb770d 100644
--- a/io/channel-null.c
+++ b/io/channel-null.c
@@ -60,6 +60,7 @@ qio_channel_null_readv(QIOChannel *ioc,
                        size_t niov,
                        int **fds G_GNUC_UNUSED,
                        size_t *nfds G_GNUC_UNUSED,
+                       int flags,
                        Error **errp)
 {
     QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..dfb8cb6c40 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -173,6 +173,8 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
     }
 #endif
 
+    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     return 0;
 }
 
@@ -406,6 +408,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     }
 #endif /* WIN32 */
 
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
     return cioc;
 
@@ -496,6 +500,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -517,6 +522,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     }
 
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
+
  retry:
     ret = recvmsg(sioc->fd, &msg, sflags);
     if (ret < 0) {
@@ -624,11 +633,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t done = 0;
     ssize_t i;
+    int sflags = 0;
+
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
 
     for (i = 0; i < niov; i++) {
         ssize_t ret;
@@ -636,7 +651,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
         ret = recv(sioc->fd,
                    iov[i].iov_base,
                    iov[i].iov_len,
-                   0);
+                   sflags);
         if (ret < 0) {
             if (errno == EAGAIN) {
                 if (done) {
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..c730cb8ec5 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -260,6 +260,7 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                                      size_t niov,
                                      int **fds,
                                      size_t *nfds,
+                                     int flags,
                                      Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index fb4932ade7..a12acc27cf 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1081,6 +1081,7 @@ static ssize_t qio_channel_websock_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a8c7f11649 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -52,6 +52,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
@@ -63,7 +64,14 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
+    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support peek read");
+        return -1;
+    }
+
+    return klass->io_readv(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -146,7 +154,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
     while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
         len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
-                                     local_nfds, errp);
+                                     local_nfds, 0, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -284,7 +292,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
                           size_t niov,
                           Error **errp)
 {
-    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
 }
 
 
@@ -303,7 +311,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
-    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
 }
 
 
diff --git a/migration/channel-block.c b/migration/channel-block.c
index f4ab53acdb..b7374363c3 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -53,6 +53,7 @@ qio_channel_block_readv(QIOChannel *ioc,
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp)
 {
     QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..199227a556 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -614,7 +614,7 @@ static int coroutine_fn prh_read(PRHelperClient *client, void *buf, int sz,
         iov.iov_base = buf;
         iov.iov_len = sz;
         n_read = qio_channel_readv_full(QIO_CHANNEL(client->ioc), &iov, 1,
-                                        &fds, &nfds, errp);
+                                        &fds, &nfds, 0, errp);
 
         if (n_read == QIO_CHANNEL_ERR_BLOCK) {
             qio_channel_yield(QIO_CHANNEL(client->ioc), G_IO_IN);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..3cf1acaf7d 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -106,7 +106,7 @@ void *tpm_emu_ctrl_thread(void *data)
         int *pfd = NULL;
         size_t nfd = 0;
 
-        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, &error_abort);
+        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, 0, &error_abort);
         cmd = be32_to_cpu(cmd);
         g_assert_cmpint(cmd, ==, CMD_SET_DATAFD);
         g_assert_cmpint(nfd, ==, 1);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index b36a5d972a..b964bb202d 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -460,6 +460,7 @@ static void test_io_channel_unix_fd_pass(void)
                            G_N_ELEMENTS(iorecv),
                            &fdrecv,
                            &nfdrecv,
+                           0,
                            &error_abort);
 
     g_assert(nfdrecv == G_N_ELEMENTS(fdsend));
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 232984ace6..145eb17c08 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -116,7 +116,7 @@ vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
          * qio_channel_readv_full may have short reads, keeping calling it
          * until getting VHOST_USER_HDR_SIZE or 0 bytes in total
          */
-        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, &local_err);
+        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, 0, &local_err);
         if (rc < 0) {
             if (rc == QIO_CHANNEL_ERR_BLOCK) {
                 assert(local_err == NULL);
-- 
2.22.3


