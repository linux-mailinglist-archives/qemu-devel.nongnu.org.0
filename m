Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197413A3DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 10:18:02 +0200 (CEST)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrcMb-0000D1-6S
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 04:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrcL7-0006tD-HJ; Fri, 11 Jun 2021 04:16:29 -0400
Received: from mail-eopbgr50112.outbound.protection.outlook.com
 ([40.107.5.112]:28645 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrcL5-0000Dv-DK; Fri, 11 Jun 2021 04:16:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2E2Gpny1wiISMlbbG4Vtuz4p1A5TbH0qzifiNcnxUSB3OMEw0RHbMsep3x/O7XBz5aatga9rdyFVCu+rmSuxDackruCJb7cG8A+Ios0xv37kDGnsyBjH1d8bj7AXpToIy17mTAiuSViizhs8vr8CCyZ/vGbLME3bhe2p7mmnEuu6Wc4gPKJZFjNFj9QSvQ5IS5uaJ4hPRqHHN37p0olU2leGJSzlt0RpmKOzXhO4A7HRb+IOq4K8frHMdBp1ae5hG+R9v5EVr9Oqw6UlWkMI1zV1zvRInMnecZgSwNxnBR52PtfZ9B023DrHidncHUX7hRMTIJRlIJToATz/pJTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EaGr+RMLWYolXDxvewAljinuGGIBP742oHaeS8d340=;
 b=HNnGAIFqS7NmpPO8EdZm2cv0DXt34/0+FdgfPuMgrz8DUg2ZN7ALtvGTgqIvhdYrJ3esaT//WUAxcCvPN2JIK6kmlMSFqU4rFg8dteK11CPlrDyBAcqq3FqyJpnVTUta79oYVcH/N0ViQL8mP0ftrjmMyVrCfBa50NUSMm3lCTaFaI7tDVixBj4pOc3VMC/eBgQVLG9cEnebhM7OuJsVgqY5xC56kuK77T11ozKVoJ17s1epG8p8VnhaoOShSg8TKF5pr3GXXSNLDPtw30fbNqwg7vOtCB6WcTr8yyOJ0t4zFIFot1pL0OUOUnmKDPULdBpOfLe4kqhk5CrSWWxSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EaGr+RMLWYolXDxvewAljinuGGIBP742oHaeS8d340=;
 b=TaAGz4AUX5KBMdc3oLOCOHLKdP7YhLINfXrn4e/MxeNyu7Eslol+4BoKJ40E/ZsEoHkOwBJGNX6yRX4grYAxEwebaVom24PPC8cyGHIjegl3zLU7D0+Ea2WpEATWOkpeKsZu3mDv5Rtms3SqDAgKtIcbicLW4NeK3c0ozhdLEo0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 08:16:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 08:16:22 +0000
Subject: Re: [PATCH] qemu-img: Use "depth":-1 to make backing probes obvious
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>
References: <20210610213906.1313440-1-eblake@redhat.com>
 <0a92c583-68b4-c072-68cf-1c6a17a7517e@virtuozzo.com>
Message-ID: <8ea330fb-ee0e-9f8d-f780-33f0897bc1e6@virtuozzo.com>
Date: Fri, 11 Jun 2021 11:16:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0a92c583-68b4-c072-68cf-1c6a17a7517e@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 08:16:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81e11f9f-5d8f-4f4e-69c5-08d92cb1331f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171302FF8E36CE5C36782084C1349@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xruEXxIEtwCPHHh8uTu7EZ3SX2ZvpCpErCReYE/R33AIQX2qc9hjaLYagF2SnU1v9PlClIusoD+SCT3Nm7Ld37fdb0T2xBAt+tAFlIUmlSK8GAZDA21kIthWC2vdEgHK05OPUEZ5QYZRpQyZe9SoxLEzLb/9NX5emYmxfPSGU7sbt3WfF8ELIHoiFnBR81we6nQ9S/cHGfidCwtiPsGRP8dfYYzGwchPC31mDvFusmnbPUA1BrmfG9vevORw59df5mfgHQ5QqmSE4TXFphF5Gj7Ab9JDv2yNpOW7LFffRbDDzUO8s//si016KAGYA1dtLTRh6IJrJAcxEIv3sfdttGcZPXnsls00ucDggVV5Sv7IahB+gSHvkO1A1hydr9v3fgJfYN+5D51TDFE9VK854h712tTwLZH4NWhuJGtgzvHq9YUIxk3WYzSAs40MeaOzlrhhr6I2bu6lsOFDWxNW9bXGpAfBfJNFfRf3mdE6JmtVAtJEOT5JD648AQLCcFFMLXULpupHr9oErT04B76mXdVjXpJ1mpyxbkXP6QM9ENeyWJ03x4LCbyZngu9OdrBESdP2UMKBRkh3dNlFjc69M/vy2Ty7437vPnUCea75/rN73ZJ0SXalyEHPUkUufuu1q9WoAVDH/wOAWk6FgE+GTz0uphVHlPA2obOI7a+UlFYCsAZkfEyFKKTodQa2NYmBlLKsJlJljQaVzk6JG0N+cO0m+sdhDZHLPRxSb1cvPDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(346002)(376002)(396003)(186003)(16526019)(26005)(2906002)(316002)(31686004)(6486002)(86362001)(83380400001)(36756003)(38100700002)(38350700002)(54906003)(52116002)(8676002)(5660300002)(31696002)(4326008)(66476007)(66946007)(66556008)(2616005)(8936002)(16576012)(956004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE45ZGtUdkFOQWt6NTZjMUdwd3F3OXFCTXMxUFZ5VFl6eTVJMDJLRkFReGRw?=
 =?utf-8?B?UnY1VHJuOURZaDFkdGJUVitrK01zakwzc1NpQndJUFptNTJORHVhaFptNGZq?=
 =?utf-8?B?b01BS3Rlb1U2SFBPSDdWZXJFSlZEakppUWRmZWpHcjh3UEpUSmQweTUzS0ZZ?=
 =?utf-8?B?UE91S3cxK1VKaFZPQ0RjQ0xGZm1xMXFYMW9iem9aNDUvU2tIek11TncvZUYv?=
 =?utf-8?B?RmlVLzJJMlVzcHNneGhVMjRTVVduVjl1N3ZhRzFmY0pMZ2ZBWDh1MU5PT0t5?=
 =?utf-8?B?RlRQWm9FZk5ZckhFb3ovY3Z1TldTTDlaNTkxWmswNDNoQ2ZOZ2pqNTNkRjBx?=
 =?utf-8?B?N1VlSDgrTjhHZ011QXRJM0t3a0o4TkdQaTZlRWpKc3d3UXRONHlXcmZ5MDE0?=
 =?utf-8?B?aSs0L1NVVTFzcGl5aVVHRU9WLzFuVzJoNTJ1SDJhbnh4NlVUWmNOVW9PNDFp?=
 =?utf-8?B?aEorck4rdVRjTEpEWDdqd2ZlbS9DeXhVbnRIaWNOUSs5aTN1eThYL0ZQcDNr?=
 =?utf-8?B?bGhyR0hwd2F5dlJXajVabHZNckdwZTlaNWdaWEdLRzZqZEQwZ240NUNYLy9Z?=
 =?utf-8?B?aUNTSFdFbC9iUExVNDFuWFJYUk5qdEVZcEJ2Q21GOGVJSWZWa2tNeXB0dGxE?=
 =?utf-8?B?bitiWXl4SldIZkhZQkZPK3dJaDNBdWFWcnh0MnQzanlqWTBkaUlSV2ZmSldL?=
 =?utf-8?B?czFXTHlFNm5JNVlPWWRjQUZHeURkWituWWJhOWorOTdGSUdzV0J6T0ZBVFJw?=
 =?utf-8?B?WFVrRmg5dzBRK3h5Q1FaZ05FRnVTbVJGVGJBcUYvTXQvVUgzUXI0U1B2d3dR?=
 =?utf-8?B?VXM2SURBWDkrM0VaSDJTYlplakhsZkNyK0V4QUlBaFloY244WHdoN2loSGVJ?=
 =?utf-8?B?cFJlR0ZNaGdpMlVzNFpqaDNSc0p3RDBtN0gwR2Rnb0hITTFDcHBzUGQza0Vh?=
 =?utf-8?B?Nk1sNUs0dlpPd2c3NlpRMm9GVW12MFBnNWxNNy9VaC8xakw3dUJtTzVMbEpD?=
 =?utf-8?B?Y2lLUm01ekpKWStMM2ZOTXRHM1VlR0R3b1F0cDI1dTV6UjdTMkpKK29SbW15?=
 =?utf-8?B?cTB4Y3UrbWo4REZOYlBKYXI2ZzhoRGtFbjFTdEpRTW1xdnE1WVFtYTBnTnR6?=
 =?utf-8?B?MGE0aTNtRjVTcGVZdkRpVGN4YlBzMmZWd3A3SGU1WHRZSk9oUFU2bGc1cXZj?=
 =?utf-8?B?RkI4ZTEyOUdYdnNkZEFTTGYxQkw1OElGVU5PUVBzMjk1N3Nzb0ZBNGlsaXhP?=
 =?utf-8?B?U1BQZ0Z2aHpZNTJGYUFNWXhpYkhZR1o4MzM1K2EvT1NvRjBGaDlOSjJzenFL?=
 =?utf-8?B?RnZ3STB6NUwrSXk3Y2h3OFdCZGtMaXYrM2podTl2YVFheTd4QVZIL0hwNjJm?=
 =?utf-8?B?TkNEVSsvaXF5MWo4TzV4S3QxZHZvVXMrWlY2b0lvRE1FTWlYUlRiSGFHZ3hP?=
 =?utf-8?B?WGhZKzJKVlkyYU41emZjZlNXRlpKbi9kYVpXOEtJdkZkZ1E3VHlPbWZVbTdU?=
 =?utf-8?B?T05JZXYwVExEK1NSYVY1ZDRKdHBucFdQZzVPVzJncVhoTnpFTjB1aUhwNDhL?=
 =?utf-8?B?dWlhbjRNUnBsYmJsVlI5dW1URWVkNjhsRmc1WDlqdU1IUGJDYzIvY05kMTE5?=
 =?utf-8?B?U2xRaVVBTWY1NVBrR0ZBTnpTWTVNeTZPUXhEWWxncllzYlJKSDA0dFlrcjRQ?=
 =?utf-8?B?SnlqN0lOL0F0ejZ3UUd3OURVUG1sU2ROek1zOVZ1TjlmRjRoSHB3N1RDbGQv?=
 =?utf-8?Q?8lGmd7b7VOvNBOOoqZAvD10iRVfgFwhLXb9iiXK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e11f9f-5d8f-4f4e-69c5-08d92cb1331f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 08:16:22.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: actlumTcUZGy6qy08GSqiqtPZsSOUzVzgvDXr7PQnbZJbhZWEvj4dtnmJn1psl6Cro+2K39yS2g0gfiJvVq9uIghD87tIEqDicMbFC32d6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.5.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

11.06.2021 11:08, Vladimir Sementsov-Ogievskiy wrote:
> 11.06.2021 00:39, Eric Blake wrote:
>> The recently-added NBD context qemu:allocation-depth makes an obvious
>> case for why it is important to distinguish between locally-present
>> data (even with that data is sparse) [shown as depth 1 over NBD], and
>> data that could not be found anywhere in the backing chain [shown as
>> depth 0].  But qemu-img map --output=json predates that addition, and
>> has the unfortunate behavior that all portions of the backing chain
>> that resolve without finding a hit in any backing layer report the
>> same depth as the final backing layer.  This makes it harder to
>> reconstruct a qcow2 backing chain using just 'qemu-img map' output
>> when using "backing":null to artificially limit a backing chain,
>> because it is impossible to distinguish between a
>> QCOW2_CLUSTER_UNALLOCATED (which defers to a [missing] backing file)
>> and a QCOW2_CLUSTER_ZERO_PLAIN cluster (which would override any
>> backing file), since both types of clusters otherwise show as
>> "data":false,"zero":true" (but note that we can distinguish a
>> QCOW2_CLUSTER_ZERO_ALLOCATED, which would also have an "offset":
>> listing).
>>
>> The task of reconstructing a qcow2 chain was made harder in commit
>> 0da9856851 (nbd: server: Report holes for raw images), because prior
>> to that point, it was possible to abuse NBD's block status command to
>> see which portions of a qcow2 file resulted in BDRV_BLOCK_ALLOCATED
>> (showing up as NBD_STATE_ZERO in isolation) vs. missing from the chain
>> (showing up as NBD_STATE_ZERO|NBD_STATE_HOLE); but now qemu reports
>> more accurate sparseness information over NBD.
>>
>> An obvious solution is to make 'qemu-img map --output=json' visually
>> distinguish between clusters that have a local allocation from those
>> that are found nowhere in the chain, by adding "depth":-1 as the new
>> witness of data that could not be tied to a specific backing image.
>> Several iotests are impacted, but glancing through the changes shows
>> that it is an improvement in that it shows more accurate details.
>>
>> Note that the documentation is specifically worded to allow qemu-img
>> to report "depth":-1 both in the scenario where the last file in the
>> backing chain still defers the cluster (corresponding to
>> BDRV_BLOCK_ALLOCATED not being set anywhere in the chain), and in the
>> scenario where qemu is unable to determine which backing chain element
>> (if any) provides the data.  The latter case does not exist now, but
>> I'm considering an upcoming patch to add a BDRV_BLOCK_BACKING that
>> would let a specific driver (such as NBD) inform the block layer that
>> it is known that a cluster comes from a backing layer, but where there
>> is insufficient data to determine which layer.
>>
>> As a quick demonstration:
>>
>>      # Create a qcow2 image with a raw backing file:
>>      $ qemu-img create base.raw $((4*64*1024))
>>      $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2
>>
>>      # Write to first 3 clusters of base:
>>      $ qemu-io -f raw -c "w -P 65 0 64k" -c "w -P 66 64k 64k" \
>>        -c "w -P 67 128k 64k" base.raw
>>
>>      # Write to second and third clusters of top, hiding base:
>>      $ qemu-io -f qcow2 -c "w -P 69 64k 64k" -c "w -z 128k 64k" top.qcow2
>>
>>      # Examine the full backing chain
>>      $ qemu-img map --output=json -f qcow2 top.qcow2
>>      [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
>>      { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>      { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>>      { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]
>>
>>      # Repeat, but with the backing chain clamped. Pre-patch:
>>      $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2", \
>>        "backing":null, "file":{"driver":"file", "filename":"top.qcow2"}}'
>>      [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
>>      { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>      { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
>>
>>      # Repeat, but post-patch:
>>      $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2", \
>>        "backing":null, "file":{"driver":"file", "filename":"top.qcow2"}}'
>>      [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
>>      { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>      { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>>      { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
>>
>> Note that pre-patch, it was impossible to determine which portions of
>> the qcow2 file override the backing file because the "depth":0 regions
>> were combined, so even though qemu internally can tell the difference
>> between sclusters 2 and 3, the command line user could not.  But
>> post-patch, the "depth":-1 markings match the "depth":1 markings when
>> the backing chain is intact, and it becomes obvious which clusters are
>> important.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> I'm not sure do we need a kind of new option or deprecation period for such incompatible change..

I see Kevin worries about same thing..

So, probably better is just add a new optional boolean field, that shows that data is "nowhere in the chain". Such change is a lot more compatible.

> 
> Personally I'm OK with it and like the idea:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

