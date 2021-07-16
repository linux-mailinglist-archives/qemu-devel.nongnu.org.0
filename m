Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C956F3CB8CA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:36:50 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4OxN-0005cF-KA
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4OwD-0004d1-CK; Fri, 16 Jul 2021 10:35:37 -0400
Received: from mail-eopbgr30122.outbound.protection.outlook.com
 ([40.107.3.122]:2789 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4OwA-0001sJ-Pd; Fri, 16 Jul 2021 10:35:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZbEtkROklSqe5XhaJ+czdW3zBJYYAoZ874qnv814e1pgTx6JsqGVH4CasFVH2j2GOBK4LOpzzgGwo6IQqU/dI6dsF7IRSppVO8mTpELl1mn/qNGONMd/Fs+N7hytAbZNYhnmQJwSHKv1L1T7bQhfsZZU2K6VWQrL3g2moQAPONn2TrogqOn5hFyEJ5pmBYxPcx99vILWmrnYjy38N2DWP4o6xo6YlIpjtu9E0cVt9ikFa+UEPVNXuAXgcmtM3qKfzYBz38w6iN8bX0tOU+5DJ5b7HXY0LFNWAQq9pfusVNG+DEeUPciZQIfVr9DVNEXU6myRpN22s4yhExtUKfrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpJLJSSoIDIiDePNqzDl3v79LuAhqeBh9D2Y9Z4Rg6o=;
 b=nIjSe+7qCKlD6LwREM3OSX/S5aBIqp7B98pwcDaMgexh11qGmsxRAHqc9J03MBzoGQSWJe4LIBUmTbLuyqcZ6u0/fe8m5sIwz6yqTgUyVGB5C/2+V3bJf3+HS6gOkTrDb+hLu/JWVBwIfyuplGyL1B1yF5WA9sdCL2b5EQpuyfTNut6DuQsmBqkg+Y7gxLZTKWuLU3wgdDR2PHPPkjlrKRd1h6k6k/dCV+7qGnKBQWme/6tRxDauo+563GWKEV7gaMisw21vH2SU+5a+lKvCS9YDfhKCg8ZcetvXVJ+9ItrF5ae18sWLxoojhN3tapkvGlvJKUjKF170VwJyKcDp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpJLJSSoIDIiDePNqzDl3v79LuAhqeBh9D2Y9Z4Rg6o=;
 b=O4wQ+QAsejin5LTUOGAeBjrUpSfcvrFVHmHEugxEZr1OwfdP/7lzAChTLwpsIXN06MrGGkpKWbDcR7HR+Tk3IW2XnypBMhvqZOTWXH5y271vi7wQ7c2mU5MjO30FsIu0FTzj54h1BGDVY0eq1ACJ5fcNHJAf2P+TV2H+hf2gKzw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 16 Jul
 2021 14:35:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 14:35:23 +0000
Subject: Re: [PATCH 11/14] iotests: bash tests: filter compression type
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-12-vsementsov@virtuozzo.com>
 <9646362b-c01f-3ed8-b5c4-4fdefd9786eb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4cf48c9b-8d6d-1a87-4712-a405a8fbdbcc@virtuozzo.com>
Date: Fri, 16 Jul 2021 17:35:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9646362b-c01f-3ed8-b5c4-4fdefd9786eb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0101CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM4PR0101CA0054.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Fri, 16 Jul 2021 14:35:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eede9241-b02f-4c07-10ba-08d94866f204
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB34480D1E7FC85A12B323E2AFC1119@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SsNL6T3J6j36LPzHPauFovi+iM9fYEePFvyFmmiyAinXBeby+1nc7LYhKftZ44nldlvGrZpq53Ssau41YN5c3Ez4qSSzg7XY93Zr5A+kvLsNWJxtKK27z7pDUH21U7d25Az+fScWFEWlb3ZXES7dtgUkHT/hKT/G/qJdUw3x7+Fil1GIWlUfOiLzFcjiGJPYkdongDON8ezHCvTTSXH2vtkpC1X/AWycRTHBCa3jb2oHjCUUB0eNTgzGyqOftkpfRSw/9GaPnf+b0oVKbY2xzcUxx2ggsr5dm/UMrim2efCnRkYCimnmwH+Q92whP6NhE+xZnIhTY7PDwrKPTZSp6HU5m48juv9oun6M9RQ3eyAZew7oBoIg7T0Ezn1dfJ1KsOLHCYbl6FMQ+9sOhHB4/tR4hhWwFEXHIfzHJHQG+ADjKxBMPBgb25idBFWgWfHNCZ97KZbyCB8zOiHa8nbNec2GTPk2Ug0SRapS8ORKWX85R7klQ39khhJMsxHfe7CzjlSFPUJxHHbMw9h0aY5Iz1o1WKFmD4uIcQjHZ1yhvnl+48ukrtWvXKRe3bPIOHAzn+R1SwZVoNoKyHxTyMqtMTNiivGkVmOH+YX3Jqs3wPlBeENoITvHTpfzV5Ty3pt1Jw/+ANi1nAFnKfJ58vQBEsUCpsH0LH2TotJStmzz9PNU4veT+LGGEOh+YL2IqWjpvhcP90C35DKJeI4OqPqo8C6M66++zASH3plCpV4i2Bg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(66946007)(38350700002)(66556008)(4326008)(478600001)(2906002)(2616005)(956004)(186003)(16576012)(316002)(66476007)(36756003)(26005)(31696002)(38100700002)(6486002)(8676002)(83380400001)(86362001)(8936002)(53546011)(52116002)(5660300002)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGpqOEczTTVTaUFWc3V2QmR4RG9vR05Kei83dVVZKzVkVUcxQmt6cnpoTGVE?=
 =?utf-8?B?VXFxL2thTnQ1T3BrdlJGSDJBUkVRbTg4N0dDQVpqc1pTUUJMSTFveDdtcFc2?=
 =?utf-8?B?RWdna2l3aVU0OCtVbnFQcURhRTBpVlN0R2MzbGlmQlhsOWcybXV5Rnl5eHo4?=
 =?utf-8?B?c0NiWDd6Z0xPVTRvZjgyMDhJWkVsMEEyN3BESHEwa1EwTnpueDhvU2ZicVZh?=
 =?utf-8?B?LzltaVpQd0NZV29QMFl4dVR2VVZBTytIbS9xQWQ1MWdWWTRuWWp0TTBYeW1L?=
 =?utf-8?B?NXNJM2V0ZHlUSWtURFhBQTQxZlNsMk0rRmZXbVY4cWU4VllvTWROOFBpdm12?=
 =?utf-8?B?V2VYbkdUaGlqRVhUQkIxdGNUdGZHczYrRFZnUHZpbStpUThmWi85dDBGb2lS?=
 =?utf-8?B?Rk1CMjh1RjdEbUVrZUR2SkpTUEVhSDFNZEM2WmRSSmV6WG9TcUhvK0p6azVr?=
 =?utf-8?B?WlRyYXVBQk50Tm16U0x1Q0ZiS2FCaVJBMElZbi9JL1dJVm1hSFh4VHhwWkxE?=
 =?utf-8?B?eUE1YjM4T3NEMVdHTFhnN2lRUFBicWNlTngyTUpGUDdpK3NJd0wvSTBERVhz?=
 =?utf-8?B?a3BqY216R3ZHK2p4YWtjaXFuYUJQL1N0SXNLVXFXSWQvU0g2anFIR0RtYUFj?=
 =?utf-8?B?bUdmQ3ZSK05nYk9ZTWZ6QmxPQU1ZNy9UVE5kaWdwTVJPOFo3dFF1bUF1Q1Vv?=
 =?utf-8?B?QlkydGpvcWFNakVQdGloMGg2aWJDZWJwTkZKV1RyNUdIL2hySDJ5TmNwQ2RG?=
 =?utf-8?B?T0FzaXJMNThxTy9yZjRaTytjMkxtaGp0dVFVeU5TTUU3WmxaRkJ3UGtxd2tK?=
 =?utf-8?B?aVkxUm9lUnZGTCtJZ0drMDA2eVNISmczbko4dm9UdGdoR3I5SmhUeGNkZlpH?=
 =?utf-8?B?NEoxK3VIZUxiRkUrcWVpblhvTS9TSWpFWm91TTBxbU45ZlRvOG5sZFlPdDJT?=
 =?utf-8?B?dElNa2lHRUVpd2tqUWtWRS9ycEJ1aitjdEJCdm1JOERna3RkQVg3RDEybXJ4?=
 =?utf-8?B?OEZQUTR2TmVTZ0NsNzVzMnFLOG5ZWExtUjk0V0xRL09WekIxN3VzWTNPSHkr?=
 =?utf-8?B?Y1BVY1NqV29HZ1RmRjJkRHo5WDlySVdyMk5ZMFUrMU5XOGQwYU1CMFUvbHlr?=
 =?utf-8?B?dnVmRHhVcjg1NjE4Qm4xUGVPT0c4dVd0K1dZc2dBUE0rRnFRN05nT3gwUVNw?=
 =?utf-8?B?N21yU0x0ci9OVUd3OEJGRUpBeTI4OEZpcFZFMEk4RlRLLzdGTjRpbXJ3YzYz?=
 =?utf-8?B?RXo1Q0tRQVVqL2pydlcwY0Z2b0FxVWhpazNybUR5R0xscndST3AyczNTQUlN?=
 =?utf-8?B?RExjVTVacUFWOUxyOVRmbWFhd2dnTkhlUk5rTE8yUkNjNmcxSnIwcFowRzd5?=
 =?utf-8?B?NTRBSmdwcGtJdkthNVFLRmNUemJyZGxkUktoSzFzdHRHdExGUnJRZ0FuQXBD?=
 =?utf-8?B?b3ZQNVJOeGh6NkRnTWtwMG5RVXArQjVhUE5RcGNqQ05Xb2xWanNFSXozYVBC?=
 =?utf-8?B?N2Fwc0pVMC9OcitiUFc0VGJUVmJKaEtYOFl4YjhtRWFRRzFacnNkd1Irb2da?=
 =?utf-8?B?RjNIdXJ1Ky92TURWUHJxR29pNWNHbHJhbjdGTGQ5dXA4UVh5SGxPamRISHVh?=
 =?utf-8?B?VkdQdjRaWXVaamkwNDNUNUhjTjFFV2lwOFdjS25tUW9zRXhSZkdhTVEwVlFW?=
 =?utf-8?B?RHFVK0NmVEdKMzAxbzNKUnFmbU9lY3Z5V05qc29NdDh6d2FhRkd2RldvRlFa?=
 =?utf-8?Q?6yAyqN3GGydhYx9Wn3Ps4rHSAY2P99nviw2z5n9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eede9241-b02f-4c07-10ba-08d94866f204
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:35:23.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syQaowx6hxG55Y766FoQLWXq0BdavZuDXbemoNKr0TTpxWTa71jb8x6KD9GolUpr5xFWKNXyrb2Tw75JQm91Vhhw1NZ/yR9LmI1ixONKxsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.3.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

16.07.2021 16:17, Max Reitz wrote:
> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>> We want iotests pass with both the default zlib compression and with
>> IMGOPTS='compression_type=zstd'.
>>
>> Actually the only test that is interested in real compression type in
>> test output is 287 (test for qcow2 compression type), so implement
>> specific option for it.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/060.out       |  2 +-
>>   tests/qemu-iotests/061.out       | 12 ++++++------
>>   tests/qemu-iotests/082.out       | 14 +++++++-------
>>   tests/qemu-iotests/198.out       |  4 ++--
>>   tests/qemu-iotests/287           |  8 ++++----
>>   tests/qemu-iotests/common.filter |  7 +++++++
>>   tests/qemu-iotests/common.rc     | 14 +++++++++++++-
>>   7 files changed, 40 insertions(+), 21 deletions(-)
> 
> [...]
> 
>> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
>> index 268b749e2f..78efe3e4dd 100644
>> --- a/tests/qemu-iotests/common.filter
>> +++ b/tests/qemu-iotests/common.filter
>> @@ -247,6 +247,7 @@ _filter_img_info()
>>           -e "/block_state_zero: \\(on\\|off\\)/d" \
>>           -e "/log_size: [0-9]\\+/d" \
>>           -e "s/iters: [0-9]\\+/iters: 1024/" \
>> +        -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
>>           -e "s/uuid: [-a-f0-9]\\+/uuid: 00000000-0000-0000-0000-000000000000/" | \
>>       while IFS='' read -r line; do
>>           if [[ $format_specific == 1 ]]; then
>> @@ -332,5 +333,11 @@ for fname in fnames:
>>   sys.stdout.write(result)'
>>   }
>> +_filter_qcow2_compression_type_bit()
>> +{
>> +    $SED -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
>> +         -e 's/\(incompatible_features.*\), 3\]/\1]/'
> 
> What about “incompatble_features   [2, 3, 4]”?

Will add.

> 
> I’d like to propose adding some form of filtering parameter to qcow2.py which allows filtering a specific bit from the qcow2_format.Flags64 representation, but that seems rather difficult, actually...
> 
>> +}
>> +
>>   # make sure this script returns success
>>   true
>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>> index ee4b9d795e..813b51ee03 100644
>> --- a/tests/qemu-iotests/common.rc
>> +++ b/tests/qemu-iotests/common.rc
>> @@ -697,6 +697,7 @@ _img_info()
>>               -e "s#$TEST_DIR#TEST_DIR#g" \
>>               -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
>>               -e "s#$IMGFMT#IMGFMT#g" \
>> +            -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
>>               -e "/^disk size:/ D" \
>>               -e "/actual-size/ D" | \
>>           while IFS='' read -r line; do
>> @@ -996,12 +997,23 @@ _require_one_device_of()
>>   _qcow2_dump_header()
>>   {
>> +    if [[ "$1" == "--no-filter-compression" ]]; then
>> +        local filter_compression=0
>> +        shift
>> +    else
>> +        local filter_compression=1
>> +    fi
>> +
>>       img="$1"
>>       if [ -z "$img" ]; then
>>           img="$TEST_IMG"
>>       fi
>> -    $PYTHON qcow2.py "$img" dump-header
>> +    if [[ $filter_compression == 0 ]]; then
>> +        $PYTHON qcow2.py "$img" dump-header
>> +    else
>> +        $PYTHON qcow2.py "$img" dump-header | _filter_qcow2_compression_type_bit
>> +    fi
>>   }
>>   # make sure this script returns success
> 
> Could have been done more extensibly for the future (i.e. a loop over the parameters, and a variable to invoke all applicable filters), but, well.  Not much reason to think about a future that we’re not sure will ever happen.
> 
> Max
> 


-- 
Best regards,
Vladimir

