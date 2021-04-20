Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0833365E2B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:03:43 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtmo-0003A4-AA
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYtjr-0002Aa-4l
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:00:39 -0400
Received: from mail-db8eur05on2092.outbound.protection.outlook.com
 ([40.107.20.92]:47009 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYtjo-0005Ux-K4
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:00:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtWQoiGtwNdjabmoKiGaaboHvbWgfpzpuQV4UcRcXI5rbVUZrySJnqUXr3nAGE0xHtNiz0+3YmOIQpRh+LeNiDEihKsCQtkbejrI7wiSjAOIx2ihJ+/aWdx3qGliY7RzOQgljysSq6+Iac564lHkcy12ezxUdjw5oyLfaIuq80WbFt85fLNQ0OHB/AriDWZa2Od7SRqx4mMc9Tws2T4Q0HxEp/e17sJtPDC2yafyCZs0Zx+Yo7TWkQDoSysoGbEV+8hhZTGbgDXfmY65+srXRMg3CHNOVUVuSSsDlvSfA3xKALyQqSTGe9R2L5JT/+2UmW8FGb61biB+3eftYdsNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arvDraXcGF7nQ8L/pRlLZL7fuhfbXBXP3i67dE5GR+Y=;
 b=DoPCL87mCA276Yguqyve4VSx6zCODk+zQfcE7Cf4unPe2JssPfle0uNfXTt2iMRMF12+wk5/LACgtEAWl25LbOh2WYbryK17YyrqJIgVZMztcGvvZq8ybK7irJ9Tf1qcQ3g6zHIPENxGPKVzbO23l5OFOwGfJSuYdHp+RFO/KIZaSHq9dTJTMekU4/Avde5iz8MLMb2PmI4J9jU2P9hOn9MKPHOrZ7Sm4Ux0kFc+13PGp5hIl4BLrxxXm5oMcxYf3+IkDQCg0IoDt+M1XpA/6NvtsZxxyr/zMMWTLaAKvvpJCCPko5Seg1JCcgQQ4oB4fiTthnNJLuaj4PfQaosJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arvDraXcGF7nQ8L/pRlLZL7fuhfbXBXP3i67dE5GR+Y=;
 b=KUu/pZwYrnGVFZPMMhoFTmu6VisVNNayjqbGK5OyBkNN7T3/j5H8AC+7IUgFQN7UnLcYR0jJA/KtUuv/EWXW/cGsivmaEvc336dReZK5w/2k2+nD+GvGclZAKuATXX3xy+OZC4si2DbgTNWCHFRCBpR0vGIIlqUezrJkYgpE8vs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4850.eurprd08.prod.outlook.com (2603:10a6:20b:d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 17:00:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 17:00:30 +0000
Subject: Re: [PATCH v6] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6d8371c1-8864-62ad-9349-182a5e74858f@virtuozzo.com>
Date: Tue, 20 Apr 2021 20:00:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Tue, 20 Apr 2021 17:00:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0ac5223-6080-4304-2b28-08d9041dce15
X-MS-TrafficTypeDiagnostic: AM6PR08MB4850:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4850AD1F20D023D5BF56ECB6C1489@AM6PR08MB4850.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tONTyrX+h7G1r8Y191eNlLmGNdGUCmyAtTS3Ng+aeNNuXnT/W9LKNZ6Q0Sb7qWyoHpf/XcIddF9Vmv9T6uEmr7Hf64aGYSnNNFfYwJlzb0Zj/aNUcaQ49KBP7mHnjfBag5NNmSDxjCBlhINr0uKn50rHRz0B3ntFG939kp0+NeuALzU5OLzB0Ik4OfQPDy8s/qNgoBp2wEgiMNoCLt8tDPTI6Dx60qtfiiTQjNv98uEE7k7XLUIFi3QhEjbEIQlvwXOEIpY0MsH5qlOCqDU8CYh0e7AAknirfHh5bxO5NZEfYS9H8fUIS2/bDySM86em/eUkUq5Oevjl8NOZCXVYjy586rO7cVl/FuN1YOzrmnB4mVzsc0nBXEcYX/iXA44Dt7btYpfpxn6tsGtMwqPCFWRT3T4Q1ER7rH4seQiFyexlFgMJljAU+A+YohOuLTjRdd+z2vM6cnW9+ECfmejcqdl4GgbT0cbtrnX1A+pWYF+8tzf9WB8Svo6VW3FhFeEPghkF0XNC5sk7DCVki4Nnn1CnCTVQiI9/hw5LVMLZOOqdICf9yGltfPKnrBN0naXBlje3tKbHYKmbfnIdsZQN+rDv1aEshlge3Kdii3D2towU5Uevh7LfNyQgO762gC6w6MnXovbD919VEuJO+yqAKXmwEH7P/Kp1odwV6swI1APCvM7lLVuXJfntY7my7QjlxDUOKYtnksJwsfbb+x6hDyWSRPi+t/EUIjY/9Rt/uIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(66946007)(86362001)(316002)(2616005)(16576012)(54906003)(66556008)(66476007)(107886003)(36756003)(4326008)(31696002)(16526019)(186003)(478600001)(8676002)(38350700002)(2906002)(38100700002)(26005)(52116002)(31686004)(5660300002)(8936002)(6486002)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDB3VXowUVdNZzFUcVdQM2ozdldnUTVHV0JBQXVqQzNzNWlTd1VvTG4zZTZY?=
 =?utf-8?B?VWRrUmE4QmZWb2c1NndIKzZRT1h0VnNCVjErWTZOeHlLalJTM3Z4VXJIdms3?=
 =?utf-8?B?UXlWdjFYalptUnVDenI4WWUxcnpnV1BFMmNtU09TUW9sOEhvT0VLVWVna3JN?=
 =?utf-8?B?VjQzL295aEFLSjIxT2FyckVvNmozaC9ieFBveEdCS0s1enFQRjllRjdPNlRn?=
 =?utf-8?B?Mk54NWo1S1cyOGtFb21seWtIR3hTREZRNWN4OWFGWjZtK1BSVXFWRUNlQmZy?=
 =?utf-8?B?d2dlM1Zsb3dIWWpieUljLzdtbnYzSzRvQkZpbGNaV1RHdndkb1FqWWpRQ1ZQ?=
 =?utf-8?B?Z2o1ZnFTd3NWd2dpT3BVV0k5OVhuaE80SjdiSW1PeWhpbzZ3c09FYTBQRnFu?=
 =?utf-8?B?eHl3ZGJZVFdONElZSWk0MHFrcHRsZjVyWEk5Nmt4VVlnQVMzRm0xMi95R0hP?=
 =?utf-8?B?Yms3UDhpdHZZY1pNYWZQeTVSR3lTeG8yWnd0bWxsV3dOdTFJMnJGMkp5ZDNW?=
 =?utf-8?B?NHBaRWVGRVU3UHE5V3hNazBNNm9OdFZFOTZJY2V5UmZGT1ZadGhGL3d0eGxD?=
 =?utf-8?B?WnRtUDhONjFWK0dTMnNXd3d6WFJadkMzZ3U2MGM1WnZMcGVIclFXaUZ1Lzdl?=
 =?utf-8?B?QjJjWU5pVUNlSUxIWnFsU09SNDBsd3dZK3J3Q1UxUFhicVV5S1lQZVdjSHhl?=
 =?utf-8?B?M05ob1l5ZmlMU2kwRTRaVEsvby9Zb0piWFZEaHlUSlEwK1FWUDcxd0ordXJP?=
 =?utf-8?B?UFh1bnJCS0hqNTNwU3Y5K1gxa09KUkluVUo0ZFVXbGFZcnd3Wjd6N1BTeXBW?=
 =?utf-8?B?SmpzdGprcjVQa25xNy91V0ZITTF6c0JmMXowS2xzVktGanRrQllITng5R3JJ?=
 =?utf-8?B?KzNVSWNKcDlUUEFPVUExaXBoQnFYWHF0R1hpRVpKSCt6OHVaY3pPaWFUTVVW?=
 =?utf-8?B?bzRVR2NIb0t4eHFDRVo1V3l5aXoxRWo4aHVxaTU2RG14NFVJNEt4d0ljSFpE?=
 =?utf-8?B?NnRLbWhJSEFkbVl4YlJralhFZ1NkQ2ZTOXJCVTlqWEdtc1NZZ20wbjVuU3du?=
 =?utf-8?B?UlRpYTMwZFhPSFVra1dBM1MxV1daZFNDK21OMVVYMnV1M0xHUXBhRzU1eklr?=
 =?utf-8?B?cDBwYVJEY252K3JaaUxzUTZyYmZTTVNPemlvTFVnSFQ0ZTlHbW5YdGMyNHQx?=
 =?utf-8?B?SVZQaHpUNHd2L2gzZjNqL1ZVblpJcEIzdmN4RVVsQTk5UE1VMW9oaVpCOXFH?=
 =?utf-8?B?R3ZuVWtuYjRpMFdKaEYvbWF5ZSs1TkxLYm54VG1sL2tzTGtiUExZUmo5Z0g5?=
 =?utf-8?B?SGdSb3h4RUpSbGppK1gwYTUrcWdpSEZwOTZsS21rdE1NekNXUjhnYWhxR0da?=
 =?utf-8?B?RERRSENNVk9FdVJkYi8wZlVLTWJPRDFaZ1AyY3NQTXNkZWpWZzNoaWczNWVx?=
 =?utf-8?B?MU5VVEpnK0dHMnZOL2RZNUtCZ2k0S3Rid2xWellOY3k3Z3ovQ2ExcGNEdm1i?=
 =?utf-8?B?VHZ3b0kvRUdTWFA0eDUrUzFsbTBnaXJtWVFZTjlMaHVjTzVRa2lscWU0N2Jt?=
 =?utf-8?B?enNRclQvVEpkaXFIdFU1MERZUkxnbXJBcUhaWWJ3SE5JYnlKcElRcWVGM1JX?=
 =?utf-8?B?VHFSYVRYN29DUGhPM09JOWJDSTNQY0ZYU09jMHk4ZFZEdm40dW5xK1loNk1k?=
 =?utf-8?B?RmQxTFdwTzkvMGJrTUFuTnk0REJYQXljeXg0T1JhOUJvcHpjZnc1aVBaNDJC?=
 =?utf-8?Q?T51p9Ue3whSVK3fP8NJ1Q+raSEISgOuQSns4QhP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ac5223-6080-4304-2b28-08d9041dce15
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 17:00:30.8518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0b74bWsxlFn8VDgLTwtkBeuq+KBBchRTO3suMq2fTNvvkqHYOlINAPde5CCmcqGJOY2B3rY1T0sdnfNpSw9CJ1KzeUI/mHjz2PNuUog6LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4850
Received-SPF: pass client-ip=40.107.20.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

20.04.2021 19:19, Valeriy Vdovin wrote:
> Introducing new qapi method 'query-cpu-model-cpuid'. This method can be used to
> get virtualized cpu model info generated by QEMU during VM initialization in
> the form of cpuid representation.
> 

[..]

> +CpuModelCpuidDescription *qmp_query_cpu_model_cpuid(Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    const char *class_name;
> +    CpuModelCpuidDescription *info;
> +    Object *cpu;
> +    char *model_id, *vendor;
> +
> +    /*
> +     * Method requires initialized machine and cpu
> +     */
> +    if (!ms || !ms->possible_cpus) {
> +      error_setg(errp, "Nothing to report");
> +      return NULL;

indentation should be fixed to 4+4=8 spaces totally, as patchew already said.

> +    }
> +
> +    cpu = ms->possible_cpus->cpus[0].cpu;
> +
> +    class_name = object_class_get_name(object_get_class(cpu));
> +    model_id = object_property_get_str(cpu, "model-id", errp);
> +    if (!model_id) {
> +        error_setg(errp, "'model-id' property not found");

object_property_get_str has errp argument, so it should care to set it on error path. You shouldn't call error_setg by hand here, it will crash (trying to set errp which is already set).

> +        return NULL;
> +    }
> +    vendor = object_property_get_str(cpu, "vendor", errp);
> +    if (!vendor) {
> +        error_setg(errp, "'vendor' property not found");

and here

> +        return NULL;
> +    }
> +
> +    info = g_malloc0(sizeof(*info));
> +    info->model_id = g_strdup(model_id);
> +    info->vendor = g_strdup(vendor);
> +    info->class_name = g_strdup(class_name);
> +    cpu_model_fill_cpuid(cpu, info);
> +
> +    return info;
> +}
> +

With fixed style and dropped extra error_setg() calls:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

