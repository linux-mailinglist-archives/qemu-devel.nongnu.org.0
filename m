Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580EE2B8C22
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 08:16:25 +0100 (CET)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfeB5-0006Gc-T0
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 02:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfe9L-0005Ql-5T
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:14:36 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:48431 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfe9I-0002uC-1t
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:14:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5w4r28XHT9ES6roFo2aMFJTKoOykME+anvCTzJ/lMttdUg78g/EGliYKfieJI4n3dZ1NLYa/S+syOcRDZb0eJmeBAhkdewKhIKhUaZ3LSFzA2IZpoPDSkNkrL+YUEf2zv5ZH4bFwP/PAsvZo7FQXr/bxumgXmyLqlf/2ih4wxyMXuytmneCUfY0XnUanqexSLaiAO/2FMgnhjisxv3pBGodGzifrUKR0mrKX/JhudJiAl+bRSgSH4DytNi6vXCbKPX+iW495RYiA0b0u4zHng3320I7UF4N5OtT1YXx+arnj7c53Hmo8ntHdB2a1Yn3HW0Yp1qjO5iONuxVb56LjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAIaFZ0enTVbPtT4Az2eyDX+k3bgQ026Vo7+ZqydLTc=;
 b=YeelzEArfiIk6a5vEa03so5Z0bIdwsje8Njk0wfLdLtHn5R/4kXADCBvYzwH1GYJvy8QnpGPyYNvuXctHrTIs7wWcNqjSV3gNZriViKRf+AZY5lBaTaAKbi6ePovzzL+/Flc5d0ecJklWtfIZuN3e1CF45cxz6PxzAQtJrMBIubuF56VWJoe/H9ilz1hexz/sZYNu9GQHkQuEfbuIqDVD+RXphdkBSHVkHEYYTtpCCbPi+0HoGxZbzE4WHzs7Pu87eamJTQ+5r6OTKM9eQK/IsKwg0/f8JZah+cFsrQqj5czmj7AvcsUmy1ufJIAyZVlkIlGL832NKomwB7h7RlnQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAIaFZ0enTVbPtT4Az2eyDX+k3bgQ026Vo7+ZqydLTc=;
 b=LV4RFmwB+YE9b5CDpdyu+ma9welMM269f/rcvGExvbviTMxuqizWN5tnLilkP5P6lb8qlW9bmlgSiAMUkK2DZS945LqGLC9D8BLLdc7+4DOgE4CjlyZMDa6GaKNCXzRExTA8egFiL2P/X/xLEIGNbbGsN9woIME72SLJegevC7g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5808.eurprd08.prod.outlook.com
 (2603:10a6:800:1a1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:14:27 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Thu, 19 Nov 2020
 07:14:26 +0000
Subject: Re: [PATCH 1/7] Introduce 'track-writes-ram' migration capability.
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
 <20201118112233.264530-2-andrey.gruzdev@virtuozzo.com>
 <64a0605b-7a16-1aed-df89-4e605306a241@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <0bea921c-b38a-703c-9351-597a6344a3f9@virtuozzo.com>
Date: Thu, 19 Nov 2020 10:14:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <64a0605b-7a16-1aed-df89-4e605306a241@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0101CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::45) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0101CA0077.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 07:14:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ef8dd5b-297c-4568-4801-08d88c5abf90
X-MS-TrafficTypeDiagnostic: VE1PR08MB5808:
X-Microsoft-Antispam-PRVS: <VE1PR08MB5808F2A4994CBD90689574D99FE00@VE1PR08MB5808.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/5AWciG68m8fU6P4+oSQknlMtNBxkEfJsK5AYI83TRivXn/1I8HeMfyDZeJPNXwzKnKj6vntWNwVXJ1MaWQwT2UWN++qdZvlio/g8UcTmZa+OZbwqQ79QeafNswQaAl5+NIDH3BlhjZ4v8CqTLrRt5Mgf8O1OpM+BkRvWzFTfrCeOnUS8rmcwCuFziLgCnfseVoVP3sDN+z29E+mH1jv133pWAotEW2eU+rVkVAVHMsynqXmOmDcI9xO3SwsuIoc710Iysq37ensVJah3jShXh/0TGfOGahcSvS44rIFsIaZZEe1z0JQTi04VdtkM2jFs1MtOSl4Pz56S+ZeOUGUhsRNojUUHL26Kfs77u1hZkgc6kwaE576hUDC/IThkS1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(366004)(376002)(136003)(346002)(316002)(16576012)(6486002)(44832011)(54906003)(83380400001)(31686004)(2906002)(478600001)(53546011)(16526019)(186003)(26005)(8936002)(956004)(2616005)(31696002)(5660300002)(52116002)(66556008)(66476007)(66946007)(86362001)(36756003)(4326008)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: K8CHtm1DaCbRPHKJC0SetmLuNgxVpuvQRYUUmt8bwtTfsi6oYZCcg1Wqcqzov8Ud+pUJR1s2CVwm/bM0ljwjOhEOeBpYsSfsp6QvT2nbMGD72DLvizP3xDO4h/mn3B+rQ4LpS396gIbyCqK8XmlfOoPskAEOeQiDbJ3+O0y2bFPvtJ8vYKCzcPHyQMo7horgGWJXuLJU6dD8oCHXhcJ2JaM4Ic71Waq8cHlvkyL5XoFzfIgqlRxLDKkzdvcRFFwohMHttfweFW4NH8tyKm7aSlCL+xkJJgkJhSBICgbHANCHlgjrU3E1VV7+KnYBkTwskT0s+My2fL0jOpv8v2Qk7wASHSxToplrNDrhsIVaJ5vM+vA190qGL8irNsqLDspcYhSPZqaaCwSmGDUimfBIUSjadFVEf7fYwIX1yf+/ul42cgJBjqHUVjdy1f2xXuu/xIKRTpOqG0xUcOpV/Tte3Z6fcG3XUpnO6sUWcstCJgD1wxdycweulrUA/lbSX8FWNE2Nf5UzluDLhS7viV9+4+yRIuJ5k6IQKyrVouEcO1qoJh/pgjzsXitdsyPsAfsj5sTgqQLlhm6Xwn6ayZN3nMWTjItow14j1BVZq65a8fn8YAWp40kChnaJ+YVohyEjISEXB7tSbOQVqmqWNXi8Ubv6ucEKrCaGMItdXI3B2EwilRP1BYkVFW+s2xtVi8UA3iTjGhXPYTfWb4G89tTQ0ONl8GxtHgQdxW4jvnBkT21IKRkbcScawQ6ozAxg6u7HPCg9xUu4uRDaCONzitZhEyjisJiof2qsLuYAgwyOI3SPgXZZ9HbP2GaNlMvApvvuFQk41ox5xRTG7IC2sM3fAMpy+o2/b61/b+LBnFqN5HoI1Sx1XIqD0s8JD4509at9
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef8dd5b-297c-4568-4801-08d88c5abf90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:14:26.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMCS9hme/FkYMal+E7c5cNdTE/mGb61hrm/F8JgRboCUonGgU8plsDT7kN5cwNpEPGqj4rZnru+GBRVjphpg48e2kVyDiTK9mjJbgmQ30bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5808
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 02:14:28
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

On 18.11.2020 17:31, Eric Blake wrote:
> On 11/18/20 5:22 AM, Andrey Gruzdev wrote:
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>>   migration/migration.h |  1 +
>>   qapi/migration.json   |  7 +++-
>>   3 files changed, 103 insertions(+), 1 deletion(-)
>>
> 
> Reviewing just the UI:
> 
>> +++ b/qapi/migration.json
>> @@ -442,6 +442,11 @@
>>   # @validate-uuid: Send the UUID of the source to allow the destination
>>   #                 to ensure it is the same. (since 4.2)
>>   #
>> +# @track-writes-ram: If enabled, the migration stream will be a snapshot
>> +#                    of the VM exactly at the point when the migration
>> +#                    procedure starts. The VM RAM is saved with running VM.
>> +#                    (since 5.2)
> 
> This is a new feature, so it is too late for 5.2; this will need to be 6.0.
> 

Yes, agree.

>> +#
>>   # Since: 1.2
>>   ##
>>   { 'enum': 'MigrationCapability',
>> @@ -449,7 +454,7 @@
>>              'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
>>              'block', 'return-path', 'pause-before-switchover', 'multifd',
>>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>> -           'x-ignore-shared', 'validate-uuid' ] }
>> +           'x-ignore-shared', 'validate-uuid', 'track-writes-ram'] }
>>   
>>   ##
>>   # @MigrationCapabilityStatus:
>>
> 

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

