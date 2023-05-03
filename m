Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB26F5B34
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:32:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puESb-0004Hy-Ue; Wed, 03 May 2023 11:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puESY-0004HS-W2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:32:03 -0400
Received: from mail-mw2nam10on20631.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::631]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puESU-0002p7-Cn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:32:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX/yIP8thpkrCd4iilwCoAIWsp9gf6UsEyQotu2KtSOTx5bmQWsvLEQARFyCmn+7wrBwC6eXvCUx+V1IPI2zxj69i13zIHBdTE/qQy+mjYqwS7OkUbdV9cTDmSIgJV6ABdZaW4g1BL3/Ltifmd3BGDwiTEk+kkiQiac/pRXzizW7FcOY7I3OrJqvhmNBUYMKRobKi8F/oC8qizhtFkYJ1ErtJr2H+8N7T4HAAYcx1dAOIIO5hoJ293hrxgezw7uniAxwqjBoJqyFNFFMTD3O0Oe1kLhNlqOBBmmo0GO4SjwgYr7nKeTa4TE2tXqlcYVedF0PtuGLI9wIL+GEkYR7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIM24qyhKPU9Q8HzrBxE7Fu1y0rgEnhsNXk27b/GTr4=;
 b=dwo/8//ajOlMwpMMJZrl+kpGVeOzEFEDy8VfTKDyfHuSQiXBaz8BJQn52qnHCH9FWAaxP8lUGQ5H5bR6H5cq7EP+/MQsor2Lu0xInrtaUKYSG0JYYfBYWDPcoZW2fvbwXqjui3JEHLIx5Ropbr3POFZpwY7KWC6ODG8MPTDDbfx3oCX7zCUZiYkFmmC1wxYV5+KJjkLw+ZMkL2V/RclkFyoV6CTErN/unSNabBvGXB9M4jAoVvdCkFPx+gc6/YAfrGTI2dqSQ4nfTN3yume26XFfmnPChqC/p94wlwwzIFBUUI0ot/C+LpW25q3gUPcAChtYJ4hN+NKPkFY+hUViRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIM24qyhKPU9Q8HzrBxE7Fu1y0rgEnhsNXk27b/GTr4=;
 b=QdS9wD4P44QAHtELcOuk83r78x0cMMF6tTWGVR/bKJxLU4Vo6h/0Kbiy5OIV1QbXRdidb7p8iFjd2HkXlc6tOWuZENdTgfCjqbPEVwti6xmFitn7BfQhlIr0fhBPqdtmK2BSpjOG2TbjRfOo1rWrQXDM5I2Mey/lS9EtbupV3b4xzlCbcV+Ch0FWauttwdmWnQKXceiWlmUgwEdok5hPLgWzXgON13Nk6kmNA/LGW8ktMWlURmDuem6r4yTNJgRF2ZcD4TtymdW9tYsCfBVKMqa7ZRmdG7mMrET9Wdqoqr/X+UDCZ8nuqRGdS+x8ScmCb9oNlGs90s3pTGDLNydbbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:31:49 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 15:31:49 +0000
Message-ID: <dc5af4cd-1844-5b67-2eb1-56dbee5d9dec@nvidia.com>
Date: Wed, 3 May 2023 18:31:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/8] migration: Add precopy initial data handshake
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-3-avihaih@nvidia.com> <ZFGUriGbwleLEIcm@x1n>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <ZFGUriGbwleLEIcm@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::17) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e11f6f-fa50-47b0-fbfc-08db4beb82e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVFNrssAI/IVP49kOGe9Qb+F6kmmvwqZ2c1qoocO+7Y/X+BjXQrbkTn3wcU1wY0gClbmMckBp5U8O8U4/2gYrDWWLGEFQs7jMJrzNyS+rwMNICKdVpEu2L5DEe0zDYIvEkqt+IupzgiW3V5JQr8L2Tmzwvtvlk+A07CGKhclBNTB8BHoNaOw13vdvGMlsf79BC0u9ocvfmjvua2ttPOwoE7F71EqIC1j/HlDVY96l2oIoPAcHrKst5aVZxLmrtaUVG9LH3Z/yEsIbCEBF2aU0BI3Ll6OvFdyegbmKWSSskCKx+rS1VffjF4gBaaaX1HUPtudcv5UX25CNbh/l2qVyA7xMd4ZSzXfSTHwJslQfzcAWOXhLLgL2KSAOhnxvyOmBMWrL6FPJZ2KlTP4x9AfxGFyugtshDMFk9R2mWT4mjLV6dpWiKLm18+u08bwyUK2mHDakWkynTgLsnDOA25+C/5lkybEvYWWbmQTSIi7ux3autvdZURvY98JEup44ao7AAL8wWP5E+hbtxK2fQ+AEuuKozYpKd8XknvkbMlPf+4tdISvr7N8WbXqJDT9Suma8T3dW2fS9JnrUdf5x3rzR75mzphrgXeJEo0k/oVg3SZW0zIlr64niVn9797c9KCVdPjybnh8r3REQhE8/FrR2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(7416002)(26005)(186003)(38100700002)(54906003)(2616005)(83380400001)(6512007)(2906002)(30864003)(53546011)(31686004)(6506007)(66476007)(66946007)(66556008)(5660300002)(8676002)(8936002)(41300700001)(86362001)(6916009)(36756003)(6486002)(31696002)(6666004)(316002)(478600001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L082cTY0dFV4ZjQ5eG15SjlQWGZKeDl1YlpSS3VkR3JtZWlia3h3ZG9ZYi83?=
 =?utf-8?B?eklJd0dwOTBzdklnN1RmUERIeEhVWkUvakZydXVaVzBEalZ1RyswajBnV2Jj?=
 =?utf-8?B?TkYxYWZwdUhsR3k5cGRzZkFSK2tSQWRhc2N0MGp5c2RqWXIrUTh5bGJhd3FI?=
 =?utf-8?B?aVRySmZUdE9nRDdrNUlVKytaSUxSRTFpMmZEc2F6bGlKQ2ViL2ppLzVNb3RS?=
 =?utf-8?B?NkQ2d0pOWmlsRzU0YVIrcmE5NjlYNTVpSTkvR1lSelUyNkE5ektMZHdTT2hL?=
 =?utf-8?B?UlA0eUdCRzVoN0NuYnQrNTVZTTgzWHI2d2ZlVDEwVDNvQWR2SkQvakFHRFRR?=
 =?utf-8?B?dlR5bTQxeE80NWxQWEhRWWdLUmVWVTF4d0VwUXY0cnhTM0ZibUxvN3dyc2ZK?=
 =?utf-8?B?MGNkM1BiaDA0NUtKaHZNT0ZIVVRsa0xpTXNVb3krZkw1S09oVGRFM2FPNU50?=
 =?utf-8?B?N1NvaE50ODhiODNYcmFCSnYvRXNjekxaNFRIbnpIRmlKZHhySjFneUdhcWZB?=
 =?utf-8?B?VjdzckNaY1lGWmlncGp2blVGUjc5c3lmVU04NThJaloxMFA1V3dBQmxFNm1v?=
 =?utf-8?B?cnIzWXdwejNMSnFnSHdUSlpEUG1paFgrM2lRcDcveWJQdnBjWm1ZNmxNYUNt?=
 =?utf-8?B?Sk1CaU1ObGJBRHFRMFZzSm9xdmRPaHlxTmRkM1ZCblcxTk93bzFvWnhucUhG?=
 =?utf-8?B?a3Z6dWdaUDFBQW1sLzBtT29rVGp0cVFSQXFxakkwbC9LbnAwSlNweFZrWU9K?=
 =?utf-8?B?Q0U4dHNyb2Q0QitsSkRSdmVrOHZSQlJoVDR5dDlua2xXOFI4WWpVeFo0cFdh?=
 =?utf-8?B?RkZMamloM3NvcUdJd2xHL3BBU002R3R2NSthRXZTdmRGOUQ0aTFhMHRYZy9y?=
 =?utf-8?B?VVpWbHpiWjlBejNkUWFtSWdkcG1xcmR4Vm5IRzRSTnZOcUJpeTQrSkZMRzNL?=
 =?utf-8?B?d0N1VS9EKzRvVDFEckt5WTZGeVJMd1NqS3V3ZGlGc2ZiS1Q5a1VLTmZac0E2?=
 =?utf-8?B?Y3B2dWdNUTJldm83Ym5pOUN6UmNheUhrMzF1ZEVFOU5QZUNPckVURUNORTg1?=
 =?utf-8?B?UVIvRVF2ZkVsY1lwRW1rN3k0NndNR0cyYU1ZMFZZQW5PejNZdVpIU0l2bi9J?=
 =?utf-8?B?REtGV2o3bmJUMkU1dFppbVA3cTVyc1lTdUprRDl3NFh6UStjaldVUG1Fandi?=
 =?utf-8?B?Q3kwckNhbzg4bEpoYWlXQlQ3L2hBZG1RL0E3TXZJaEpXM2p3UnRUVjU2S1FB?=
 =?utf-8?B?L0pmQ0pORk9PZmtRLzEwSVZVdk42U2NsR05xMll6cXBubVpBOVdudDBUNVk3?=
 =?utf-8?B?d3l0am56bzZYMFovdytCYVR4UWd6Y3g5S3ZDdDNMVHcySjg4R2JkQ3VNUUg4?=
 =?utf-8?B?bkhNSkZiMlozWTNsZGZETXZGT3hMT0JwQ2tSWU5LK0JRQTVka1VFdVFDRXF5?=
 =?utf-8?B?RTd6Sk80V21VZWd0ZjNqY0lxTi9jTXlXMnJGY2xMV2c3OXo3RDhFendXVGsy?=
 =?utf-8?B?ZUMrYkJ5T3N2SktUdS9ybWpEcHZpL29uakIyaVNmZXZXelN5UmorOFliLzdm?=
 =?utf-8?B?aTBtWCtvd1VMRXh4MkpvVjE4Z0thVG1raUJ4MWl0eDMrdThseWR2TFNPMjRv?=
 =?utf-8?B?bit4a050NFkyTlVSRllkYW5QVWlHNGY1bWp5aFU2Q3VWZnZEMnEveE9ZREhx?=
 =?utf-8?B?aURDRWZkNXcxbXZpU2VyQWZCTUJrcW1uSlBURHBSSldKb3RWbTh2OUhMZFlX?=
 =?utf-8?B?aFFLdUhaZzdpVDYxczZidFhmRG9zdno4NHRRSy92YXFhQ0dGN2RTQnI4T0pR?=
 =?utf-8?B?Y0ltTHYyQm5UUWREejhKOExNOXVlY3J6bGx6RjNFckNzU21aY21ZVWtwZGVO?=
 =?utf-8?B?bEtIRU5Obm15OFJTMWx2bXc4WStQdWJkOEM2eU56bTYwVCtRRG1CZmE5OTQr?=
 =?utf-8?B?WHdTbjJtSnFST0hCLzN4MmJGRkc0ZHBmaG96alhwK1VwdHo2Ykc4REpVTFpS?=
 =?utf-8?B?N2hZS3ZNWFAyY1ZkdzFob2ExVEhDVElzUXdVS1VjelRUajZVNkNuV2dEYTdL?=
 =?utf-8?B?blQ3UzhGZmJnSWdrb3VFQllBN3hXcWNKVnAyTk1oVmRnT0tUZlJpOGVZTW9G?=
 =?utf-8?Q?ouO5tQvfft8+nZ0AHU782UjeS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e11f6f-fa50-47b0-fbfc-08db4beb82e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:31:49.1514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeExtTW2wqHC+0NgbhsAjA5M9Hx8Q/Yi2AVt9HBMIQXc/hEbogFUXwZQ+6vWRp4DpYhSqvA+EHaTuiYxw4s8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
Received-SPF: softfail client-ip=2a01:111:f400:7e89::631;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 03/05/2023 1:54, Peter Xu wrote:
> External email: Use caution opening links or attachments
>
>
> (I've left high level comment in cover letter, but still some quick
> comments I noticed when reading)
>
> On Mon, May 01, 2023 at 05:01:35PM +0300, Avihai Horon wrote:
>> Add precopy initial data handshake between source and destination upon
>> migration setup. The purpose of the handshake is to notify the
>> destination that precopy initial data is used and which migration users
>> (i.e., SaveStateEntry) are going to use it.
>>
>> The handshake is done in two levels. First, a general enable command is
>> sent to notify the destination migration code that precopy initial data
>> is used.
>> Then, for each migration user in the source that supports precopy
>> initial data, an enable command is sent to its counterpart in the
>> destination:
>> If both support it, precopy initial data will be used for them.
>> If source doesn't support it, precopy initial data will not be used for
>> them.
>> If source supports it and destination doesn't, migration will be failed.
>>
>> To implement it, a new migration command MIG_CMD_INITIAL_DATA_ENABLE is
>> added, as well as a new SaveVMHandlers handler initial_data_advise.
>> Calling the handler advises the migration user that precopy initial data
>> is used and its return value indicates whether precopy initial data is
>> supported by it.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   include/migration/register.h |   6 +++
>>   migration/migration.h        |   3 ++
>>   migration/savevm.h           |   1 +
>>   migration/migration.c        |   4 ++
>>   migration/savevm.c           | 102 +++++++++++++++++++++++++++++++++++
>>   migration/trace-events       |   2 +
>>   6 files changed, 118 insertions(+)
>>
>> diff --git a/include/migration/register.h b/include/migration/register.h
>> index a8dfd8fefd..0a73f3883e 100644
>> --- a/include/migration/register.h
>> +++ b/include/migration/register.h
>> @@ -71,6 +71,12 @@ typedef struct SaveVMHandlers {
>>       int (*load_cleanup)(void *opaque);
>>       /* Called when postcopy migration wants to resume from failure */
>>       int (*resume_prepare)(MigrationState *s, void *opaque);
>> +
>> +    /*
>> +     * Advises that precopy initial data was requested to be enabled. Returns
>> +     * true if it's supported or false otherwise. Called both in src and dest.
>> +     */
>> +    bool (*initial_data_advise)(void *opaque);
>>   } SaveVMHandlers;
>>
>>   int register_savevm_live(const char *idstr,
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 3a918514e7..4f615e9dbc 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -204,6 +204,9 @@ struct MigrationIncomingState {
>>        * contains valid information.
>>        */
>>       QemuMutex page_request_mutex;
>> +
>> +    /* Indicates whether precopy initial data was enabled and should be used */
>> +    bool initial_data_enabled;
>>   };
>>
>>   MigrationIncomingState *migration_incoming_get_current(void);
>> diff --git a/migration/savevm.h b/migration/savevm.h
>> index fb636735f0..d47ab4ad18 100644
>> --- a/migration/savevm.h
>> +++ b/migration/savevm.h
>> @@ -58,6 +58,7 @@ void qemu_savevm_send_postcopy_ram_discard(QEMUFile *f, const char *name,
>>                                              uint64_t *start_list,
>>                                              uint64_t *length_list);
>>   void qemu_savevm_send_colo_enable(QEMUFile *f);
>> +void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f);
>>   void qemu_savevm_live_state(QEMUFile *f);
>>   int qemu_save_device_state(QEMUFile *f);
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index abcadbb619..68cdf5b184 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2964,6 +2964,10 @@ static void *migration_thread(void *opaque)
>>           qemu_savevm_send_colo_enable(s->to_dst_file);
>>       }
>>
>> +    if (migrate_precopy_initial_data()) {
>> +        qemu_savevm_send_initial_data_enable(s, s->to_dst_file);
>> +    }
>> +
>>       qemu_savevm_state_setup(s->to_dst_file);
>>
>>       qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index a9181b444b..2740defdf0 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -71,6 +71,13 @@
>>
>>   const unsigned int postcopy_ram_discard_version;
>>
>> +typedef struct {
>> +    uint8_t general_enable;
>> +    uint8_t reserved[7];
>> +    uint8_t idstr[256];
>> +    uint32_t instance_id;
>> +} InitialDataInfo;
>> +
>>   /* Subcommands for QEMU_VM_COMMAND */
>>   enum qemu_vm_cmd {
>>       MIG_CMD_INVALID = 0,   /* Must be 0 */
>> @@ -90,6 +97,8 @@ enum qemu_vm_cmd {
>>       MIG_CMD_ENABLE_COLO,       /* Enable COLO */
>>       MIG_CMD_POSTCOPY_RESUME,   /* resume postcopy on dest */
>>       MIG_CMD_RECV_BITMAP,       /* Request for recved bitmap on dst */
>> +
>> +    MIG_CMD_INITIAL_DATA_ENABLE, /* Enable precopy initial data in dest */
>>       MIG_CMD_MAX
>>   };
>>
>> @@ -109,6 +118,8 @@ static struct mig_cmd_args {
>>       [MIG_CMD_POSTCOPY_RESUME]  = { .len =  0, .name = "POSTCOPY_RESUME" },
>>       [MIG_CMD_PACKAGED]         = { .len =  4, .name = "PACKAGED" },
>>       [MIG_CMD_RECV_BITMAP]      = { .len = -1, .name = "RECV_BITMAP" },
>> +    [MIG_CMD_INITIAL_DATA_ENABLE] = { .len = sizeof(InitialDataInfo),
>> +                                      .name = "INITIAL_DATA_ENABLE" },
>>       [MIG_CMD_MAX]              = { .len = -1, .name = "MAX" },
>>   };
>>
>> @@ -1036,6 +1047,40 @@ static void qemu_savevm_command_send(QEMUFile *f,
>>       qemu_fflush(f);
>>   }
>>
>> +void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f)
>> +{
>> +    SaveStateEntry *se;
>> +    InitialDataInfo buf;
>> +
>> +    /* Enable precopy initial data generally in the migration */
>> +    memset(&buf, 0, sizeof(buf));
>> +    buf.general_enable = 1;
>> +    qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
>> +                             (uint8_t *)&buf);
>> +    trace_savevm_send_initial_data_enable(buf.general_enable, (char *)buf.idstr,
>> +                                          buf.instance_id);
> Maybe a generalized helper would be nice here to send one
> MIG_CMD_INITIAL_DATA_ENABLE packet, then it can be used below too.

Sure, I will do that.

>
> Here instance_id is multi-bytes, we may want to consider endianess.  it
> seems the common way is use big endian over the wire for qemu migration
> msgs.

Oh, right. I will fix it.

Thanks.

>> +
>> +    /* Enable precopy initial data for each migration user that supports it */
>> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>> +        if (!se->ops || !se->ops->initial_data_advise) {
>> +            continue;
>> +        }
>> +
>> +        if (!se->ops->initial_data_advise(se->opaque)) {
>> +            continue;
>> +        }
>> +
>> +        memset(&buf, 0, sizeof(buf));
>> +        memcpy(buf.idstr, se->idstr, sizeof(buf.idstr));
>> +        buf.instance_id = se->instance_id;
>> +
>> +        qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
>> +                                 (uint8_t *)&buf);
>> +        trace_savevm_send_initial_data_enable(
>> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
>> +    }
>> +}
>> +
>>   void qemu_savevm_send_colo_enable(QEMUFile *f)
>>   {
>>       trace_savevm_send_colo_enable();
>> @@ -2314,6 +2359,60 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis)
>>       return ret;
>>   }
>>
>> +static int loadvm_handle_initial_data_enable(MigrationIncomingState *mis)
>> +{
>> +    InitialDataInfo buf;
>> +    SaveStateEntry *se;
>> +    ssize_t read_size;
>> +
>> +    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, sizeof(buf));
>> +    if (read_size != sizeof(buf)) {
>> +        error_report("%s: Could not get data buffer, read_size %ld, len %lu",
>> +                     __func__, read_size, sizeof(buf));
>> +
>> +        return -EIO;
>> +    }
>> +
>> +    /* Enable precopy initial data generally in the migration */
>> +    if (buf.general_enable) {
>> +        mis->initial_data_enabled = true;
>> +        trace_loadvm_handle_initial_data_enable(
>> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
>> +
>> +        return 0;
>> +    }
>> +
>> +    /* Enable precopy initial data for a specific migration user */
>> +    se = find_se((char *)buf.idstr, buf.instance_id);
>> +    if (!se) {
>> +        error_report("%s: Could not find SaveStateEntry, idstr '%s', "
>> +                     "instance_id %" PRIu32,
>> +                     __func__, buf.idstr, buf.instance_id);
>> +
>> +        return -ENOENT;
>> +    }
>> +
>> +    if (!se->ops || !se->ops->initial_data_advise) {
>> +        error_report("%s: '%s' doesn't have required "
>> +                     "initial_data_advise op",
>> +                     __func__, buf.idstr);
>> +
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    if (!se->ops->initial_data_advise(se->opaque)) {
>> +        error_report("%s: '%s' doesn't support precopy initial data", __func__,
>> +                     buf.idstr);
>> +
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    trace_loadvm_handle_initial_data_enable(buf.general_enable,
>> +                                            (char *)buf.idstr, buf.instance_id);
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Process an incoming 'QEMU_VM_COMMAND'
>>    * 0           just a normal return
>> @@ -2397,6 +2496,9 @@ static int loadvm_process_command(QEMUFile *f)
>>
>>       case MIG_CMD_ENABLE_COLO:
>>           return loadvm_process_enable_colo(mis);
>> +
>> +    case MIG_CMD_INITIAL_DATA_ENABLE:
>> +        return loadvm_handle_initial_data_enable(mis);
>>       }
>>
>>       return 0;
>> diff --git a/migration/trace-events b/migration/trace-events
>> index 92161eeac5..21ae471126 100644
>> --- a/migration/trace-events
>> +++ b/migration/trace-events
>> @@ -23,6 +23,7 @@ loadvm_postcopy_ram_handle_discard_end(void) ""
>>   loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
>>   loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
>>   loadvm_process_command_ping(uint32_t val) "0x%x"
>> +loadvm_handle_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
>>   postcopy_ram_listen_thread_exit(void) ""
>>   postcopy_ram_listen_thread_start(void) ""
>>   qemu_savevm_send_postcopy_advise(void) ""
>> @@ -38,6 +39,7 @@ savevm_send_postcopy_run(void) ""
>>   savevm_send_postcopy_resume(void) ""
>>   savevm_send_colo_enable(void) ""
>>   savevm_send_recv_bitmap(char *name) "%s"
>> +savevm_send_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
>>   savevm_state_setup(void) ""
>>   savevm_state_resume_prepare(void) ""
>>   savevm_state_header(void) ""
>> --
>> 2.26.3
>>
> --
> Peter Xu
>

