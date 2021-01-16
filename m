Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6622F8F5F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:04:52 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0skc-0005QP-S6
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0sj6-0004go-Hk; Sat, 16 Jan 2021 16:03:16 -0500
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:27788 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0siz-0000gM-H7; Sat, 16 Jan 2021 16:03:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwch2hbjasnPYqWoDkSBkQDDtLd2LrVinDfuzrEK/UdCwifhPf9ieUE1S4p+uk51CFeaE/S9+2RR/fsf0Et5Y54s75F6s4u4Fov8J1g5jlO8FmSGr9wYS6p+WYQwOnfWjp7WygjAsePLlOVPVVAbp7bw0XBmVWXomaEtoJhmAj25t4mwj/nPxgwivFETzyC4fpHzmGrcWZvfCYX6uAOiwr7SHhVnJFeNyg9Z+0y2H1zPCtXT3B//j6gCx7OPPtH2hi6Wy7EXGLC+w1BntAQMtmXjW+apFiNWQK2OrD/y0xQzTpddmNsWt1M3VviKxpZtZiz8wr/b+1dA8reFqI/Pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InxjptW7Xlb8fhZNxAPgtTFDQjKSG2oGDgUjANdKFQE=;
 b=Ps0sWfSwA7ig7ixZBkidXPD5AB+vA4nq8sJNrY9QzU9+/TJ4z4Zj1qPmgADuVOHMnM/q5U+jWobLss9IIg0axXVJukxSnb4FuaCl868HiSQH8pszE9m34fc7LUJQPmbn6lE4RNdPS8LBPiv5sqcEfdn4bDlk+M0P8s/BXLFx842EKAa+gKHZQsUnN2mk8cmC0nMrCV6mwXIKnp/JXzFzGJTb2gW7MjMirxHY15XDPRgLryUTSoa6Ey+71ICIwf9+7aToBQxH8wtJLCUeWn+h5NImHKcs1IFyz51E9SKgMAjN2n91vz8A+KeumrombeA0o6ScyCMiu8d3XedfRz4r9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InxjptW7Xlb8fhZNxAPgtTFDQjKSG2oGDgUjANdKFQE=;
 b=g5flTXpuXVOVq4h9ac3Icchv/L0kIEVAyu76LoC6odd5+CdpyRGEV/sjsgrNkAddtykdeCTszxlq//5Y/H+fMROUUxvfT0GvVLBiWLnCdFGvv2hiP2M5afVdVFIIxtfv8+qL0idg3aFO3Gs0rsV/4W7INdG3MUKvXmTW888V3Nk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2420.eurprd08.prod.outlook.com (2603:10a6:203:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 21:03:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:03:05 +0000
Subject: Re: [PATCH v3 13/25] iotests: 129: prepare for backup over block-copy
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-14-vsementsov@virtuozzo.com>
 <d510d1fb-5c1e-cbc8-0d68-9fa53c3bf8be@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1a0ff2df-649d-7b78-fab1-1d2284300f98@virtuozzo.com>
Date: Sun, 17 Jan 2021 00:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d510d1fb-5c1e-cbc8-0d68-9fa53c3bf8be@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0902CA0019.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.72) by
 AM4PR0902CA0019.eurprd09.prod.outlook.com (2603:10a6:200:9b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Sat, 16 Jan 2021 21:03:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66527ab2-9662-4866-0f2a-08d8ba621e2f
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2420:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2420A9A30D67F361B2ECA73AC1A60@AM5PR0802MB2420.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUM/WO+qx0W913bxAfftrVaj118VLxnBLuyfUfenozqClR7dMHPzX7E/tYId3yZm0uLbkCtxhOfyrqQLzl1irh32OkF9f5pH+jSkbgC9TVZCswKrci5gQ5v1OHxJ3+UHD4hERxj9qUBldwpCXop4b7xU02PoTQucsi87+/gx4zdJ5PkUBDUOAYAF7GsIqwVvOSXYc4b3sIz5x6YQnXHbQCpExiQrbu5PMA3DfTb+oAW0q03XIIVuErvvG/4e8bhpvEXvbJQXzL7sRvwm1r3TZpg6O6/Y3heYtlC3N+V1fIF6GA26OVntM91Kq2im8y69GcHLCV+f4TaxblXy/gj42CuoBXim3P1VJR0QbKt5kMQuyWwrzQboQ9zSSL3OSq9yBHCdmBV4u2Ss15afCi2x85RL9e0ZtBPMk6nZ4nUrtvttkqGO9A6YW+qcYj4T49eAbdqRc9YO9+ILYLGP6gCEfgplXX2rAvibrZzg3XcsPyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(346002)(366004)(376002)(136003)(83380400001)(26005)(956004)(2616005)(16526019)(16576012)(316002)(4326008)(186003)(53546011)(478600001)(6486002)(52116002)(5660300002)(2906002)(86362001)(8676002)(36756003)(8936002)(107886003)(31686004)(66556008)(31696002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUJ1NHViRXByTmNOa0x6TlMxNldFS3FkSW9ISklhQ1NnQWZ1OEkzS0pxUFh1?=
 =?utf-8?B?N25icVR3YWt5UnFRZ1V4bjE2OVJIaWVLZEpOL3FHL0NLRUg4RTRYOUhVY0RP?=
 =?utf-8?B?ZVFjcm91RktrOVpGTGszTGpoNC80Nk82VEVZQlRXdmdEclhkTW82MHpaOEl4?=
 =?utf-8?B?anVhY2JFVER5aGxCSEg3U2Y3VmZEUFFWY2dKbFdJTFFXdFo0QkMzVXNhdVI1?=
 =?utf-8?B?a0Y2QndCWW9uRUxBSVFMd3FyeEszbTc5Q2JRc05ocW5BNFA3ZkJPejVyNU0r?=
 =?utf-8?B?K2lDazZKUWVRNUs0Y2ROTmRROTJkSEMxMlZlYzhDbktKU0QvNHoyRGFsS1ds?=
 =?utf-8?B?Mzdqd3AySkk5Q2hsUEt4YlYwL3cwZ09KMEZOSWtJL1l1STdZQW8vUjNVQ1RM?=
 =?utf-8?B?YThvb0tOZUcrUk4xY1AwUmdXU1RHSVlSeFI2b1ZkUmhaTGdCNFpoWDNwd1Uy?=
 =?utf-8?B?U1dNUFJCdks0RGRkWnF4cEhFWTV3TTM3dEhNNXRaWFFhcERXeTlmbU11TVha?=
 =?utf-8?B?MXZNOFlMMDZHbHZtWEN3dE01cTk4a1pQZDRiRlNhN3k4YnpPQXlZYjNKZGVL?=
 =?utf-8?B?ejBiUGdGSGFZMUI1RklCWWl0c21oSkZOUXg0RG9vODgyZk53ZmNDWExwOXh3?=
 =?utf-8?B?Tk1FQjdRVjBjUmo3eTVuRFFaZVZVNUxsSWl0SXI1MnI3S2ZZUU1URjE0anky?=
 =?utf-8?B?ZVMzY09mNDA4VlBZeE5WaFM1SlB6R2h3RGpmb2JQWFJQT1Y2V29EZEpQell3?=
 =?utf-8?B?NEs1dFNiQnRDaEdGQityeng3dFJNdkNxZmVRL2RKQmxud2RkN0htL2FwWXlu?=
 =?utf-8?B?ejhlQmNNeVJrK0dXQmpaYnVDdjJHdVpCRW9hYXFxWlZqY01LUnhwYmpwVER5?=
 =?utf-8?B?Mmg1WnBzY2dSVXcxaGF5ckpZZ2RVRFpHS25BdE93cDY1WUxaREZ5UVFsdmFh?=
 =?utf-8?B?U1IwT0hsU2gvM2xWS2toWXdkT2IvaXZtOHVzdzQyT05YdFh1N1plNERnQjhk?=
 =?utf-8?B?SGIvNkIvRmlPRVdVdkRTVmNFYVEybWxkQkc0SkdnZk1URVpIVStMZFptWUlP?=
 =?utf-8?B?ZEhWNk1Rbzhuc3VLd1ArbVFucTVXb2UyS1lqTzZoNUtpWjF4THk0bUxEenls?=
 =?utf-8?B?Vmx3Z0Uxb3ZLUlF0U2d4OVl0alhXZ3lPWEpabFQ3UWRobXc3aEdLWVZWM2VH?=
 =?utf-8?B?WXIwTXNZRU1Kb2pGblpVNHN6VzY2ZHRwSkFRS1BOMkU1RDNhTWZNQitjdWky?=
 =?utf-8?B?NDNMcGxhdElKL0RDVzJVSDhuckpzZWt6NVJGYWFYL3BWQ3BRejNidHpJRlh5?=
 =?utf-8?Q?qDrNS9HO45/AKdFSIE870jmODyAu/XTSRh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66527ab2-9662-4866-0f2a-08d8ba621e2f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:03:05.2779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GFPkA+DiJeA+YHTWlLtKTPjqQoYAhYC4zuQG4xDBzjOVg74mYRxzB8+4fwnpjn+ZtHBdtP/m8y/lIkf6kvwK8qF/TlXMnGCcOD7Bof7wUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2420
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.039, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 15:14, Max Reitz wrote:
> On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
>> After introducing parallel async copy requests instead of plain
>> cluster-by-cluster copying loop, backup job may finish earlier than
>> final assertion in do_test_stop. Let's require slow backup explicitly
>> by specifying speed parameter.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/129 | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
>> index 3c22f6448c..e9da0208c4 100755
>> --- a/tests/qemu-iotests/129
>> +++ b/tests/qemu-iotests/129
>> @@ -77,7 +77,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>       def test_drive_backup(self):
>>           self.do_test_stop("drive-backup", device="drive0",
>>                             target=self.target_img,
>> -                          sync="full")
>> +                          sync="full", speed=1024)
>>       def test_block_commit(self):
>>           self.do_test_stop("block-commit", device="drive0")
> 
> I still don’t like this very much.  We write 128 MB of data, do_test_stop throttles the source to 1 kB/s, so even “a lot of parallel requests” shouldn’t finish immediately.
> 
> I feel like there’s a bigger problem here.

You were right!:) And finally I found it. Will fix in v4.

> 
> Then again, I have 129 disabled all the time anyway because its throttling simply doesn’t work, so I guess
> 
> Acked-by: Max Reitz <mreitz@redhat.com>
> 


-- 
Best regards,
Vladimir

