Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C56AD5E8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZOOJ-0001Fw-2h; Mon, 06 Mar 2023 22:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pZOOH-0001FT-HW
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 22:53:29 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pZOOE-0006cP-TE
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 22:53:29 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3273QxAC026962; Mon, 6 Mar 2023 19:53:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=XcaKtPe9q1YLMKCW6yQgutl4kq6uqJJ9K3JVCP5unkk=;
 b=QLPtioIiX6vKXX1KgWehk44V/CF0amEo2t/RYPpPug+5dcCmCb8yKVRMvov1+6qXpz9v
 ocdJUjOu5bxCst+O8E7C8G4AcnVqYLvMxfPvMFUGmLAtMtUT+X1TIRbz5buGurZ0/Cxk
 G07hjnIGG21G8PmPXaoNY+X+MwxI87jOOGqK85jiAL0gqweXWUrlTByftjxPJagmcV1f
 Av09EnNhbCB2vayjesjljyyjZacHuxu0byl21EHdzJJ5jAbT7C0toEIG3FHohADqid2Z
 0SSbC2/WpWviI5EE4o/ujln7ztMGlt9LvLYQf1wgNGl4Ys5UggkppA7YsnRV3beAFXHT 5Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3p466mmr5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 19:53:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX9Ry8xvNIY3UQIMlTbUCK87YiE0OEUlDqE3bmYLd8ZnQBiikj9CP2QIhl/xcq4l09gKOaomrhJA5Y/lQt3Jcut0+CXDJZ0bIKr7oGH08l/iwCLPNi7dwM7VDaIYWVk7WFqTPGR6Chy3dCz/67KvZEbJHztVg5lVMhVfk8TAHTlKAKOuJSnAkMj2D74v5k9+F8RDe4EglxowtNdWK/VFbBxNf5/DDyu11Yvle07v2PKwaTUx8JN6uc3nTR7+OU1oDwRU5c2aYKO3VyWX1BNdV+/l1jWh0cfN1OF3FrMuIy48RarTm98WWwEG4VSqAjTdd5wjyC/OOWoBczcq1PSVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcaKtPe9q1YLMKCW6yQgutl4kq6uqJJ9K3JVCP5unkk=;
 b=D17w3YU9lTmnKyc+g5gejyzpQgJVeKa0sN/PEsoWOTs3gXquOSlLO/dU07R2t/PJwRg/cmgbf+eTmQvJym0nHsws8jkSdL+/d6vp2xuO1E2COqkIKDP692Oovsicnqb6lZwE+tz7uzMPUOgsWLdM5fXXRdYq7N1pMqnHhxwAjPhdFufJA49/bkFKiPcZKASLh3/60OYpl/Cxg3Ar56Nio6Qf5XXkl1K48v4zZfVTzKNcnb11SoumQZgIpK3kPdWlTj3B5w7LKL0nsxExjiaH6WOuGUu8s8DIigIIzu8+O8C05aBHDGUP2hLFzx81AM3ekYSdrIwMYGbHSXlqJ7PgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcaKtPe9q1YLMKCW6yQgutl4kq6uqJJ9K3JVCP5unkk=;
 b=ss8FcNAYdUTVDUxpFu+bO5owgKgc1FohRp2RNnCBuV/FZruSnc3IxvREEkymZhmVOuQ6ZuSLosSE42odjFHppinvjx4Yfx9bjUp+TTXw0Djvk1KuQBJJ84Vf1ZkMWkdxmPJAr+Lg2Nd5HOswv66fHqw3OGhMWi2tuuC6eBG3+twjVJJkTTYw8f2/cTa86DJ0qhOfKWHYStR5iB2o+UBKTGnoWBZA7AAAzRO5uqE25GsIilMqF0hEoZWhsdgYFENytYi7L0RU3uqJEhzkpLr/9wbOZK9cJlLD9r7100YirvS0gsGyJPl0bmhy5QHcmdj6Op2NsUW4exYbvd7KQ+VbEw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB7806.namprd02.prod.outlook.com (2603:10b6:a03:322::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 03:53:17 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::70fd:8d15:bab8:29d6]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::70fd:8d15:bab8:29d6%6]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 03:53:17 +0000
Message-ID: <74dd1f3a-3b57-98bb-8095-70265130ad66@nutanix.com>
Date: Tue, 7 Mar 2023 09:23:06 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] qapi: allow unions to contain further unions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
 <20230223134027.2294640-4-berrange@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <20230223134027.2294640-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 147696ce-dc73-48e1-dda6-08db1ebf7bc9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKQCQBDyeVuJ3dU6ZkHcN6R1syA8tU1Ig6xFqe/xjetVrVPwgwJ/tcTZqfsCM9NgoXr47BHee79maLm9v/tzQ8YoYE7ZLPcIGnCDSDKvQJ4+0PhKcJgJPTV02GRpoGPni3G7m/jLGHom7cRTJpvkXHoA8OfFiT4jSuO9ewBkj8TNBAQNbYX2ds07pIyqp86vYRB2hE/B/F35ktdvX1Th1EPN0CnIU7KtUZkX5h7uvQrwXEUD8jMtvkdzDsoxTEcWbixbalO/vIsF/DFW4THwWnOLgFL1wc8W/yYYJVi2jaT1xGPkEGO5UBbWIDXbjfZxrcrm13XWaVMbJDgJoRynuBOrkcficOOopwhfqE7e5h7ZIDiQK67lh11KSwCu7hs1wfJNsg2Fq/qdHvjh8+0tMaMIE/iEcMybvAecPVTg0kTPqUsGb1TNR03WAtKfb+94/JSXJHks8xHjhRPUbYdDjwulhued7qwf5pJRL8Gq4vGlHw1dlBQ0ZG94ebHPusqhUmM7EoX3fDEJyzqGTFbWa0MBwc2YTHO9E9rCvOo2o1q8FoJo6m4tp/1uP1FWmWnZHJZ4g4txQaZgsSkvELfh+7xICc00Iv0V8H15J6Bls7JEqAHwi0BoBc39chmyutssReW5ZRJjllSVg76cfJk1eXwJZ2Ka6ep+ZMs5E72XiiKaOZE2Zw678QaaWeCq2E8GKzi9xOyps0x8n643cID1G8T4txgdjik4/YY96Knusxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199018)(186003)(2906002)(6666004)(38100700002)(5660300002)(66946007)(8936002)(8676002)(41300700001)(4326008)(30864003)(66476007)(53546011)(44832011)(66556008)(478600001)(26005)(6512007)(2616005)(6486002)(36756003)(54906003)(316002)(86362001)(31696002)(83380400001)(31686004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzJVR2xmekE5MVJmbXl4Q083STYzbEVkUktBZkVSbzBRT1JmTmtqRnJKbSts?=
 =?utf-8?B?OVYxNFpEbzNCVCttRkFBUVZIQjg0c0J4YWlDYVpwdjgzcWdoTVNkTWxkQWpR?=
 =?utf-8?B?WGRlcFh3d0gvKzB3S2Fwc0xxWHQ2NktIQmpUY3lpOTQ4L1lycDRtZkQvbWVB?=
 =?utf-8?B?RllSZlJQNnZ4Q1hMdk5TUytEd1lrQmJHb3lMWTdWeTgwOWZ4NEg3RE5LdjRo?=
 =?utf-8?B?VFBQR09ybHdTUWZ4NkVubmJBZzhrYUVVK1Y3RDM0cGN2T2lmM1F5cnpuaG1r?=
 =?utf-8?B?RDBvT2VVVHRocHpjYkNlTkgwcFBrdTNuSDhJN1RIcVBFZjlQaWdaa1B1N0M2?=
 =?utf-8?B?cFZWR3o2ekpZc0VjeFhaWmdOa2pQUk1yVTlwOUJwVFlTUUp0WEk1T2tnNGVB?=
 =?utf-8?B?Z1AwMWdmVCtoMWlMOW5QU2ZJZjdlLzYwSWd1UXdTZnlDSE0wSWMwR1RCYUFm?=
 =?utf-8?B?SlpsZW4yd2o1SWFMNWFja1VvVTJKZVY4WFBCZVFjSFVTU0dHMWVvQklpZFZl?=
 =?utf-8?B?V0ZkY3lrZXljeVE5K3R4enpWMHJnWjNDSDBqNVVMRGVsTmZad2VaaDBuRXJq?=
 =?utf-8?B?ODJ4RW8zNVhMUlJVYzFDNnBIRG04YUozQXRJdUVCL2VidUNiN05qSGRuY0Vl?=
 =?utf-8?B?akgrRTJaOGl2aFZYT1lzc1ZKTzNPb0Y4eXhCZnZrQkZTYzhLbDdGVndibVJ3?=
 =?utf-8?B?NUpudTVNWTZ5UHVBUEhrWUNvQzhUeVoraG1DRTdXWVQzZ1lJcklrV3ZORU9q?=
 =?utf-8?B?OGFHYjlhTk9HZEQ4MCs1TUk2U2sxTGZDYUdkOG5pcWVjVVE1TW44SnlITWl5?=
 =?utf-8?B?MVJVR2JZcWRKTWVsMGtHZzlRVVlmTXBVeGRWSmNhTGt6U3hiM0JDNTlCNFhx?=
 =?utf-8?B?NFQvRzN3QndJbHpsSklRaDJOYTJzNnFocklaSVdCUDB4VFhYZVZPQWZRTUVP?=
 =?utf-8?B?Um5FT2szYTVwcFlHcWw1cXdMRU80TmxJWkJBejQ3dllISXhCZUp1M1JGcHVB?=
 =?utf-8?B?Znl1UXAvcldxbUMvQzhYczNtMEhtVCsrRUtOR25FSEJMR0o2NlAvWE9xOHlY?=
 =?utf-8?B?Sll1dGtTZjBOOWpMSXIwbXAvc28ydWtKWEdVZFkycngwQ0QrQW5wWEZ6WjJh?=
 =?utf-8?B?eEpHTkN6UzFLdFFRbUdKWFFEUVQwby9Dc1dxdjNJaCtOUCtNZVFxN3VRWEU5?=
 =?utf-8?B?YWorYkpGWkNuOEJ4cDM5SnByVklBcGp5ZS9ObndvajRrN1dvWXFmdWNYOWNP?=
 =?utf-8?B?RGJybVd3a3QxNzBZNVlzU1d0OExFU1A2SjJUb29yMUNEQ3UrS1IvQnN3TEd4?=
 =?utf-8?B?QVJJbi90MHl1bS8zT2FYZmZQWGcraUNqa3hKU1RIR0ZMYkNpMGNyWk1WbllC?=
 =?utf-8?B?K0Y5ZmduMkhEWCtobVR6U0FKbjlHRDl4S1VtSXczTis3V1gwdHhYdFYrK0Va?=
 =?utf-8?B?R1VaRGRIOHVrK0c4MDllYVZkOTBkdWMyVnA0M2hDQnVPMkd3VTAzMUk4REha?=
 =?utf-8?B?aDR0bkdlY2pCYks1d0IxVXh6dDRQUTE0b0p4RjBQbmZpMXpHajkzRmhPOXhr?=
 =?utf-8?B?YSs4L0ExdGtlOXVETjZqNDdyRHlpbDJEV3NhV0o1NmlndFVob0tBRlFBUTJm?=
 =?utf-8?B?ZHZDYXlPRko4QmdjbkhIOHVhdncwWXVzZlV2WUo5OWZLTUdIYklNTTZHejJm?=
 =?utf-8?B?SC8vRmJQcm5SaFh2SWhQR0F3T1ljdmt6SnBRQU1aaHJKeVd2c2NNMldYQTgz?=
 =?utf-8?B?Y2NqTzNDM0JUYTNWVCsvTjRrcS9ob1JjK1Z5U1AwcGZGU3IzQzVNQ2habmtG?=
 =?utf-8?B?Q1pXNFZuZHFqL053a2h6MFFQUC9XVmlDVWZXOWQ2ZjhwbnRxMzJ1RlFYZXRp?=
 =?utf-8?B?ejZtbnBhR2J0cnczMmdhcXdQclFQQW1qUkpiSEJEV3NDQVgxbjhncWdtRUZj?=
 =?utf-8?B?VjIyL1UzcU1MMVhjNUlDMWdnN0lmWUhNT2lHUWVyOFZJdDdQNDlHWDZtUExV?=
 =?utf-8?B?WEFBQmhMb2lrNEpjZVhSZmdESUFRSlpBL2NUT2dJQnFwVXJJakFuc2tYdXV6?=
 =?utf-8?B?Zmx5QkllWEhsd0dtUjhSeWxra1hiV2NqemZCMS9QRDNBVVVJZzFaUzdBdC9u?=
 =?utf-8?B?eUR0S09VNkszcUtIUmVHelNSNDhKL056dlRRYUhjL1plc2ExNGlKc0hTNXVn?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147696ce-dc73-48e1-dda6-08db1ebf7bc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 03:53:17.2158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVQOw5xzecSrKdA16xx8j2C88bejSd+GACf5bwT/7o5JbKZJi0Uj2Lef7av+C4OUKy0XHgDlzibxUOA89nBX8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7806
X-Proofpoint-ORIG-GUID: TZw2Cy4KzqIHQ3-U7rm8Wnx67NuTwSb5
X-Proofpoint-GUID: TZw2Cy4KzqIHQ3-U7rm8Wnx67NuTwSb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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

Hi,


On 23/02/23 7:10 pm, Daniel P. Berrangé wrote:
> This extends the QAPI schema validation to permit unions inside unions,
> provided the checks for clashing fields pass.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   scripts/qapi/schema.py                        |  6 +-
>   tests/qapi-schema/meson.build                 |  2 +
>   tests/qapi-schema/qapi-schema-test.json       | 32 ++++++++++
>   tests/qapi-schema/qapi-schema-test.out        | 29 ++++++++++
>   .../union-invalid-union-subfield.err          |  2 +
>   .../union-invalid-union-subfield.json         | 30 ++++++++++
>   .../union-invalid-union-subfield.out          |  0
>   .../union-invalid-union-subtype.err           |  2 +
>   .../union-invalid-union-subtype.json          | 29 ++++++++++
>   .../union-invalid-union-subtype.out           |  0
>   tests/unit/test-qobject-input-visitor.c       | 47 +++++++++++++++
>   tests/unit/test-qobject-output-visitor.c      | 58 +++++++++++++++++++
>   12 files changed, 234 insertions(+), 3 deletions(-)
>   create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
>   create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
>   create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
>   create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
>   create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
>   create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 6c481ab0c0..5c4457f789 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -465,9 +465,10 @@ def check(self, schema):
>       # on behalf of info, which is not necessarily self.info
>       def check_clash(self, info, seen):
>           assert self._checked
> -        assert not self.variants       # not implemented
>           for m in self.members:
>               m.check_clash(info, seen)
> +        if self.variants:
> +            self.variants.check_clash(info, seen)
>   
>       def connect_doc(self, doc=None):
>           super().connect_doc(doc)
> @@ -652,8 +653,7 @@ def check(self, schema, seen):
>                           self.info,
>                           "branch '%s' is not a value of %s"
>                           % (v.name, self.tag_member.type.describe()))
> -                if (not isinstance(v.type, QAPISchemaObjectType)
> -                        or v.type.variants):
> +                if not isinstance(v.type, QAPISchemaObjectType):
>                       raise QAPISemError(
>                           self.info,
>                           "%s cannot use %s"
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
> index d85b14f28c..1591eb322b 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -194,6 +194,8 @@ schemas = [
>     'union-invalid-data.json',
>     'union-invalid-discriminator.json',
>     'union-invalid-if-discriminator.json',
> +  'union-invalid-union-subfield.json',
> +  'union-invalid-union-subtype.json',
>     'union-no-base.json',
>     'union-optional-discriminator.json',
>     'union-string-discriminator.json',
> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
> index ba7302f42b..40f1a3d88d 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -114,6 +114,38 @@
>   { 'struct': 'UserDefC',
>     'data': { 'string1': 'str', 'string2': 'str' } }
>   
> +# this tests that unions can contain other unions in their branches
> +{ 'enum': 'TestUnionEnum',
> +  'data': [ 'value-a', 'value-b' ] }
> +
> +{ 'enum': 'TestUnionEnumA',
> +  'data': [ 'value-a1', 'value-a2' ] }
> +
> +{ 'struct': 'TestUnionTypeA1',
> +  'data': { 'integer': 'int',
> +            'name': 'str'} }
> +
> +{ 'struct': 'TestUnionTypeA2',
> +  'data': { 'integer': 'int',
> +            'size': 'int' } }
> +
> +{ 'union': 'TestUnionTypeA',
> +  'base': { 'type-a': 'TestUnionEnumA' },
> +  'discriminator': 'type-a',
> +  'data': { 'value-a1': 'TestUnionTypeA1',
> +            'value-a2': 'TestUnionTypeA2' } }
> +
> +{ 'struct': 'TestUnionTypeB',
> +  'data': { 'integer': 'int',
> +            'onoff': 'bool' } }
> +
> +{ 'union': 'TestUnionInUnion',
> +  'base': { 'type': 'TestUnionEnum' },
> +  'discriminator': 'type',
> +  'data': { 'value-a': 'TestUnionTypeA',
> +            'value-b': 'TestUnionTypeB' } }
> +
> +
>   # for testing use of 'number' within alternates
>   { 'alternate': 'AltEnumBool', 'data': { 'e': 'EnumOne', 'b': 'bool' } }
>   { 'alternate': 'AltEnumNum', 'data': { 'e': 'EnumOne', 'n': 'number' } }
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
> index 043d75c655..9fe1038944 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -105,6 +105,35 @@ alternate UserDefAlternate
>   object UserDefC
>       member string1: str optional=False
>       member string2: str optional=False
> +enum TestUnionEnum
> +    member value-a
> +    member value-b
> +enum TestUnionEnumA
> +    member value-a1
> +    member value-a2
> +object TestUnionTypeA1
> +    member integer: int optional=False
> +    member name: str optional=False
> +object TestUnionTypeA2
> +    member integer: int optional=False
> +    member size: int optional=False
> +object q_obj_TestUnionTypeA-base
> +    member type-a: TestUnionEnumA optional=False
> +object TestUnionTypeA
> +    base q_obj_TestUnionTypeA-base
> +    tag type-a
> +    case value-a1: TestUnionTypeA1
> +    case value-a2: TestUnionTypeA2
> +object TestUnionTypeB
> +    member integer: int optional=False
> +    member onoff: bool optional=False
> +object q_obj_TestUnionInUnion-base
> +    member type: TestUnionEnum optional=False
> +object TestUnionInUnion
> +    base q_obj_TestUnionInUnion-base
> +    tag type
> +    case value-a: TestUnionTypeA
> +    case value-b: TestUnionTypeB
>   alternate AltEnumBool
>       tag type
>       case e: EnumOne
> diff --git a/tests/qapi-schema/union-invalid-union-subfield.err b/tests/qapi-schema/union-invalid-union-subfield.err
> new file mode 100644
> index 0000000000..43574dea79
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subfield.err
> @@ -0,0 +1,2 @@
> +union-invalid-union-subfield.json: In union 'TestUnion':
> +union-invalid-union-subfield.json:25: member 'teeth' of type 'TestTypeFish' collides with base member 'teeth' of type 'TestUnion-base'
> diff --git a/tests/qapi-schema/union-invalid-union-subfield.json b/tests/qapi-schema/union-invalid-union-subfield.json
> new file mode 100644
> index 0000000000..e1639d3a96
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subfield.json
> @@ -0,0 +1,30 @@
> +# Clash between common member and union variant's variant member
> +# Base's member 'teeth' clashes with TestTypeFish's
> +
> +{ 'enum': 'TestEnum',
> +  'data': [ 'animals', 'plants' ] }
> +
> +{ 'enum': 'TestAnimals',
> +  'data': [ 'fish', 'birds'] }
> +
> +{ 'struct': 'TestTypeFish',
> +  'data': { 'scales': 'int', 'teeth': 'int' } }
> +
> +{ 'struct': 'TestTypeBirds',
> +  'data': { 'feathers': 'int' } }
> +
> +{ 'union': 'TestTypeAnimals',
> +  'base': { 'atype': 'TestAnimals' },
> +  'discriminator': 'atype',
> +  'data': { 'fish': 'TestTypeFish',
> +            'birds': 'TestTypeBirds' } }
> +
> +{ 'struct': 'TestTypePlants',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestUnion',
> +  'base': { 'type': 'TestEnum',
> +            'teeth': 'int' },
> +  'discriminator': 'type',
> +  'data': { 'animals': 'TestTypeAnimals',
> +            'plants': 'TestTypePlants' } }
> diff --git a/tests/qapi-schema/union-invalid-union-subfield.out b/tests/qapi-schema/union-invalid-union-subfield.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/union-invalid-union-subtype.err b/tests/qapi-schema/union-invalid-union-subtype.err
> new file mode 100644
> index 0000000000..e45f330cec
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subtype.err
> @@ -0,0 +1,2 @@
> +union-invalid-union-subtype.json: In union 'TestUnion':
> +union-invalid-union-subtype.json:25: base member 'type' of type 'TestTypeA-base' collides with base member 'type' of type 'TestUnion-base'
> diff --git a/tests/qapi-schema/union-invalid-union-subtype.json b/tests/qapi-schema/union-invalid-union-subtype.json
> new file mode 100644
> index 0000000000..ce1de51d8d
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subtype.json
> @@ -0,0 +1,29 @@
> +# Clash between common member and union variant's common member
> +# Base's member 'type' clashes with TestTypeA's
> +
> +{ 'enum': 'TestEnum',
> +  'data': [ 'value-a', 'value-b' ] }
> +
> +{ 'enum': 'TestEnumA',
> +  'data': [ 'value-a1', 'value-a2' ] }
> +
> +{ 'struct': 'TestTypeA1',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'struct': 'TestTypeA2',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestTypeA',
> +  'base': { 'type': 'TestEnumA' },
> +  'discriminator': 'type',
> +  'data': { 'value-a1': 'TestTypeA1',
> +            'value-a2': 'TestTypeA2' } }
> +
> +{ 'struct': 'TestTypeB',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestUnion',
> +  'base': { 'type': 'TestEnum' },
> +  'discriminator': 'type',
> +  'data': { 'value-a': 'TestTypeA',
> +            'value-b': 'TestTypeB' } }
> diff --git a/tests/qapi-schema/union-invalid-union-subtype.out b/tests/qapi-schema/union-invalid-union-subtype.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
> index 77fbf985be..9b3e2dbe14 100644
> --- a/tests/unit/test-qobject-input-visitor.c
> +++ b/tests/unit/test-qobject-input-visitor.c
> @@ -706,6 +706,51 @@ static void test_visitor_in_union_flat(TestInputVisitorData *data,
>       g_assert(&base->enum1 == &tmp->enum1);
>   }
>   
> +static void test_visitor_in_union_in_union(TestInputVisitorData *data,
> +                                           const void *unused)
> +{
> +    Visitor *v;
> +    g_autoptr(TestUnionInUnion) tmp = NULL;
> +
> +    v = visitor_input_test_init(data,
> +                                "{ 'type': 'value-a', "
> +                                "  'type-a': 'value-a1', "
> +                                "  'integer': 2, "
> +                                "  'name': 'fish' }");
> +
> +    visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_A);
> +    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUMA_VALUE_A1);
> +    g_assert_cmpint(tmp->u.value_a.u.value_a1.integer, ==, 2);
> +    g_assert_cmpint(strcmp(tmp->u.value_a.u.value_a1.name, "fish"), ==, 0);
> +
> +    qapi_free_TestUnionInUnion(tmp);
> +
> +    v = visitor_input_test_init(data,
> +                                "{ 'type': 'value-a', "
> +                                "  'type-a': 'value-a2', "
> +                                "  'integer': 1729, "
> +                                "  'size': 87539319 }");
> +
> +    visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_A);
> +    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUMA_VALUE_A2);
> +    g_assert_cmpint(tmp->u.value_a.u.value_a2.integer, ==, 1729);
> +    g_assert_cmpint(tmp->u.value_a.u.value_a2.size, ==, 87539319);
> +
> +    qapi_free_TestUnionInUnion(tmp);
> +
> +    v = visitor_input_test_init(data,
> +                                "{ 'type': 'value-b', "
> +                                "  'integer': 1729, "
> +                                "  'onoff': true }");
> +
> +    visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_B);
> +    g_assert_cmpint(tmp->u.value_b.integer, ==, 1729);
> +    g_assert_cmpint(tmp->u.value_b.onoff, ==, true);
> +}
> +
>   static void test_visitor_in_alternate(TestInputVisitorData *data,
>                                         const void *unused)
>   {
> @@ -1216,6 +1261,8 @@ int main(int argc, char **argv)
>                              NULL, test_visitor_in_null);
>       input_visitor_test_add("/visitor/input/union-flat",
>                              NULL, test_visitor_in_union_flat);
> +    input_visitor_test_add("/visitor/input/union-in-union",
> +                           NULL, test_visitor_in_union_in_union);
>       input_visitor_test_add("/visitor/input/alternate",
>                              NULL, test_visitor_in_alternate);
>       input_visitor_test_add("/visitor/input/errors",
> diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
> index 7f054289fe..1535b3ad17 100644
> --- a/tests/unit/test-qobject-output-visitor.c
> +++ b/tests/unit/test-qobject-output-visitor.c
> @@ -352,6 +352,62 @@ static void test_visitor_out_union_flat(TestOutputVisitorData *data,
>       qapi_free_UserDefFlatUnion(tmp);
>   }
>   
> +static void test_visitor_out_union_in_union(TestOutputVisitorData *data,
> +                                            const void *unused)
> +{
> +    QDict *qdict;
> +
> +    TestUnionInUnion *tmp = g_new0(TestUnionInUnion, 1);
> +    tmp->type = TEST_UNION_ENUM_VALUE_A;
> +    tmp->u.value_a.type_a = TEST_UNION_ENUMA_VALUE_A1;
> +    tmp->u.value_a.u.value_a1.integer = 42;
> +    tmp->u.value_a.u.value_a1.name = g_strdup("fish");
> +
> +    visit_type_TestUnionInUnion(data->ov, NULL, &tmp, &error_abort);
> +    qdict = qobject_to(QDict, visitor_get(data));
> +    g_assert(qdict);
> +    g_assert_cmpstr(qdict_get_str(qdict, "type"), ==, "value-a");
> +    g_assert_cmpstr(qdict_get_str(qdict, "type-a"), ==, "value-a1");
> +    g_assert_cmpint(qdict_get_int(qdict, "integer"), ==, 42);
> +    g_assert_cmpstr(qdict_get_str(qdict, "name"), ==, "fish");
> +
> +    qapi_free_TestUnionInUnion(tmp);
> +
> +
> +    visitor_reset(data);
> +    tmp = g_new0(TestUnionInUnion, 1);
> +    tmp->type = TEST_UNION_ENUM_VALUE_A;
> +    tmp->u.value_a.type_a = TEST_UNION_ENUMA_VALUE_A2;
> +    tmp->u.value_a.u.value_a2.integer = 1729;
> +    tmp->u.value_a.u.value_a2.size = 87539319;
> +
> +    visit_type_TestUnionInUnion(data->ov, NULL, &tmp, &error_abort);
> +    qdict = qobject_to(QDict, visitor_get(data));
> +    g_assert(qdict);
> +    g_assert_cmpstr(qdict_get_str(qdict, "type"), ==, "value-a");
> +    g_assert_cmpstr(qdict_get_str(qdict, "type-a"), ==, "value-a2");
> +    g_assert_cmpint(qdict_get_int(qdict, "integer"), ==, 1729);
> +    g_assert_cmpint(qdict_get_int(qdict, "size"), ==, 87539319);
> +
> +    qapi_free_TestUnionInUnion(tmp);
> +
> +
> +    visitor_reset(data);
> +    tmp = g_new0(TestUnionInUnion, 1);
> +    tmp->type = TEST_UNION_ENUM_VALUE_B;
> +    tmp->u.value_b.integer = 1729;
> +    tmp->u.value_b.onoff = true;
> +
> +    visit_type_TestUnionInUnion(data->ov, NULL, &tmp, &error_abort);
> +    qdict = qobject_to(QDict, visitor_get(data));
> +    g_assert(qdict);
> +    g_assert_cmpstr(qdict_get_str(qdict, "type"), ==, "value-b");
> +    g_assert_cmpint(qdict_get_int(qdict, "integer"), ==, 1729);
> +    g_assert_cmpint(qdict_get_bool(qdict, "onoff"), ==, true);
> +
> +    qapi_free_TestUnionInUnion(tmp);
> +}
> +
>   static void test_visitor_out_alternate(TestOutputVisitorData *data,
>                                          const void *unused)
>   {
> @@ -586,6 +642,8 @@ int main(int argc, char **argv)
>                               &out_visitor_data, test_visitor_out_list_qapi_free);
>       output_visitor_test_add("/visitor/output/union-flat",
>                               &out_visitor_data, test_visitor_out_union_flat);
> +    output_visitor_test_add("/visitor/output/union-in-union",
> +                            &out_visitor_data, test_visitor_out_union_in_union);
>       output_visitor_test_add("/visitor/output/alternate",
>                               &out_visitor_data, test_visitor_out_alternate);
>       output_visitor_test_add("/visitor/output/null",

The changes look good to me. I have tried to built migrate QAPI changes 
on top of Daniel's v1 changes, and it was successful.

Once Markus and other maintainers approves this patchset, I can post v4 
version of 'migrate' qapi changes on top of this change.

Looking forward for replies on this patchset :)

Regards,
Het Gala

