Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE42B8C47
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 08:28:52 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfeN8-0000Er-QZ
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 02:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfeLQ-0008Fj-BH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:27:04 -0500
Received: from mail-eopbgr80100.outbound.protection.outlook.com
 ([40.107.8.100]:31779 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfeLN-0007Qm-G7
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:27:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms/lCCBqjZlyfNDnI3hzm5yVgiPhTE/qDkF7LeCC39Z5Bas4cMz6cbIPakF5NFfAF4QA+kpmCQUmo5rm5NRbh5p9u3ZasruzgQdWsTsPay1kP4iss+eXUz2FD1ZeTguqZTy2wrvoXAz24Wtn3rfOU+YAX0+zrncErmyK+AsscG79cHgNEj+OIQ0zG8afrECN2/XFnieDyaqQzDwOkdphLoLPU28/wtB5kY6hSf9sWFCzhQ575K9izWdwl5Sxhhjm1UcoErJCFQ/q3dXGH3Gg60E+FRLo5rfBKZMOqKuKhKRMQP04rgwWQj5krnZoRrA41XyatzorzSL1vVtaHzAU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVClEylMNqJUYpiG3F+1N19witrBZeu6Sh+mW+Klx2Q=;
 b=WaanTagTAPUCPsZnxUFGI379X+5p55n/wHQ9tqnRmjQk1CdTDs8lY6TR3YUOIwBYDJT1bP/7MMru0CX45EfV6PsXw9JDNaq+tHmwKbMWdJOw5xbZ9NTRgsODn8iVtE0jDx7MKIewqcFJVPhfknAAOIJhD/kf3qHhJd3W2qiyVHs8Lrmx8ujcDk6zvttLEQPp8RhV8qanPLfhVlgBqkERe1+QeQMguHC0IUu8Lh0IQWS4cwnm/Xa5GweMj7H4srKC40jAtwlr8Gb0Jint6eX6gjQPXWcN8mZ4Xyse2ISfM9Y1H5dNGkThc07C8WafA02zlmGuq6/Qsi/Vtu2bbh3Vgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVClEylMNqJUYpiG3F+1N19witrBZeu6Sh+mW+Klx2Q=;
 b=GEmN0KneGJIFb2VUnf1DRIZrWBlTh7GvvK8jFnrJCEz0G2qt+ha67xDVB9ImLmZ59SAmCoFsMm0LsFs9ImP9nfc6JJtOoo53QLgm+wUYL2TILnVkXr2pIzAKA5AOteMgC2aSpo8Ow2eYupK3lij762kr6CycYN8/6Wpo2Z/rz5E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3069.eurprd08.prod.outlook.com
 (2603:10a6:803:45::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 07:26:57 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Thu, 19 Nov 2020
 07:26:57 +0000
Subject: Re: [PATCH v2 0/7] UFFD write-tracking migration/snapshots
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
 <059d386a-d02f-db1a-8a2f-9359c6cfe17a@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <4832aef4-00d0-6d19-63d2-9ea64c0171d8@virtuozzo.com>
Date: Thu, 19 Nov 2020 10:26:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <059d386a-d02f-db1a-8a2f-9359c6cfe17a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.12 via Frontend Transport; Thu, 19 Nov 2020 07:26:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34dd422f-6d81-43e3-1d45-08d88c5c7f48
X-MS-TrafficTypeDiagnostic: VI1PR08MB3069:
X-Microsoft-Antispam-PRVS: <VI1PR08MB30698B07AEC668A5C0EF1EA29FE00@VI1PR08MB3069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5A1aIbqPesdflm3XXkH9HA+Y2BJz400izrhXcP1S8zhZbP2kqNAkeE0geWbGMWDrhr4C9w0JXjiCxYzfHSxmACJYH/ub0ZeewtTiqEqXy1u2Xrdob/jiNyM1sYWXZl/ct5ZF9p3qlgr4NXcS61keYLHlOfdheCCLU/piFZ9NeEo87JMPns+s6AG6Khzt6ODRoNylRV5DtHe/lNmMe3gFlaDB7BtUZrLT1UwA8D66K6p4bAVveVqDF7GJB11LUFATVezhMqdPXXhGIpMVtTE0zxJbp+QpP98xfD/xx2pDpfmMkL5Su9axn/39oQXHmdy+uZu2HrrzoxT1o6jWos0MwGzGDATvH7+vcYkDVmDpiC9uBMzZsx+YWRBm5OZ6KSV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39840400004)(4326008)(5660300002)(66476007)(316002)(83380400001)(6486002)(66556008)(956004)(54906003)(16526019)(36756003)(8676002)(53546011)(86362001)(16576012)(26005)(186003)(66946007)(8936002)(52116002)(2616005)(2906002)(478600001)(44832011)(31696002)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: J4f4T96ShlsvlKlzXjJjuWMcMV8APT+UHLdGRuIrLgGiKTqDdyldlluYj43BR4v9cOBTg0iL12agZYFd9BkJuzVV80w4XpyKqnfgGN04tWP8OHqNkHQvEP0oJ5bwkcVWMC3C+oYMA0bFlNiJk8DKH5w/Zf74kFwda1S2/VSFqHMl/utY/oRmp6mGROsK8fWHtwWS80VXdXKfRfWtKi6NpuHurMJ+h1Mr6w+rBDc5T+AO7mo/VkWSbPKLd4krV2AVvJwhNhow2c+nmUxXczhSHfqYI58ASpoCaJ9OanXYqaeqbLOkXirWPZHUUXpSCluXcuyODZM67W1xgEOs5GZu9F3FMoZ1dttXF94keSu6ApTpzEMgExoxpV5yGf7if4y66VuFCES10sCfPMouOa1AULop94DPjX6Rg/asPcCQZKEo+Uo9qi2EfUrmD/fdVZddGaIL2KaXlScLpMqD7FNWWkY9Pw8FaHt2/AqmTk9NrCKB6/HKYaUFbv07l5vlnZZkUL4Q10GzxFUk8rWrice30Z+qX9NI0M0KfvDgbCrHYA/vaMyynQp3fc0+W6PgeUWMU9za4RGJIcg5B/OXBYvtivUbzRj0kJyJbwX813bvAxABw344gTxUXNyyNXRp0CbOWCPcWHEJ7sm4xAJlVrtQOqzASg2lh9tpnEFltDPoyCfEG2uXk020gUI2Ldv8gyoCf0Jz1SeSlYD02QlAqdUeeYGEhRD4A0XE7J3FdD6QVF3SV2jbml9VHX5/grbI6MPaGGPmWEQ2JIwa/ETEJNj8Gwp1gS/bAILoJcUyxIxLVwf4lmmc3Tim/hOAt3qRc1L78XDLSvnnzHikL1YKaMi/dl4P04DjOJE9Uw1ee0qgi127PmuAxAw0OV9B9vsQLDXgZz7l1ZDaxaawL9R/FoOawQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dd422f-6d81-43e3-1d45-08d88c5c7f48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:26:57.4756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDnnoSY/Uf3zIpulxVNXiPuiJpaniTCSMIvwROea9CePavSxEzgLRbWCa7Cu770sTZNrqKNPUpGRvzTaMgBEPdqcHu0f3IBERI7XTCe9Xns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3069
Received-SPF: pass client-ip=40.107.8.100;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 02:26:58
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.2020 17:54, Eric Blake wrote:
> On 11/18/20 7:20 AM, Andrey Gruzdev wrote:
>> Currently the only way to make (external) live VM snapshot is using existing
>> dirty page logging migration mechanism. The main problem is that it tends to
>> produce a lot of page duplicates while running VM goes on updating already
>> saved pages. That leads to the fact that vmstate image size is commonly several
>> times bigger then non-zero part of virtual machine's RSS. Time required to
>> converge RAM migration and the size of snapshot image severely depend on the
>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>> creation time and huge image size.
>>
>> This series propose a way to solve the aforementioned problems. This is done
>> by using different RAM migration mechanism based on UFFD write protection
>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>> guest RAM content using write-protection and iteratively release protection
>> for memory ranges that have already been saved to the migration stream.
>> At the same time we read in pending UFFD write fault events and save those
>> pages out-of-order with higher priority.
>>
>> How to use:
>> 1. Enable write-tracking migration capability
>>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
>> track-writes-ram on
>>
>> 2. Start the external migration to a file
>>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
>>
>> 3. Wait for the migration finish and check that the migration has completed.
>> state.
>>
>> Andrey Gruzdev (7):
>>    Introduce 'track-writes-ram' migration capability.
>>    Introduced UFFD-WP low-level interface helpers. Implemented support
>>      for the whole RAM block memory protection/un-protection. Higher
>>      level ram_write_tracking_start() and ram_write_tracking_stop() to
>>      start/stop tracking memory writes on the whole VM memory.
> 
> Subject line is too long on that patch. You probably forgot a newline.
> Also, it is more common to not include a trailing '.' in the subject line.
> 

Sorry, I'm a bit new to mailing list process, indeed I missed newline to 
separate subject.

>>    Support UFFD write fault processing in ram_save_iterate().
>>    Implementation of write-tracking migration thread.
>>    Implementation of vm_start() BH.
>>    The rest of write tracking migration code.
>>    Introduced simple linear scan rate limiting mechanism for write
>>      tracking migration.
>>
> 
> How does v2 differ from v1?  It makes life easier for reviewers to know
> what to look for in the respin that was fixed based on the problems in
> the earlier version.
> 

The only difference v0->v2 is that the latter would pass checkpatch 
test, nothing else. I've accidently disabled checkpatch commit hook
after found it's false positive on do {} while (0); - for the semicolon.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

