Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C58346879
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:05:56 +0100 (CET)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmLj-0000PY-N6
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmIe-0006Cb-NA; Tue, 23 Mar 2021 15:02:45 -0400
Received: from mail-eopbgr40130.outbound.protection.outlook.com
 ([40.107.4.130]:47556 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmIb-0005F2-Et; Tue, 23 Mar 2021 15:02:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU83QypqVkqepI5mSg4lsZpdmO+GMJ9isD1Thlono2bxDgNttEIJCJbsFn5DHxY7dQkHR1b+nQVw2h9/S0Wo8UDiV0UtfsafLwUmglo9Bg/JWon79IRJlnJPC1cFHlrSlJMuryUgkHU6eKAHaA9CKifbGhMtYYbqRqj7T7Oe4wRhZH1915sx088cQMo61vBOgs0mLf+Znn/CTJkdHKr4b3T4GfEVGAuzu39m7pdYvQlv3F2DNR6F/0AwXw88jM6AkAO/xY2WeXI2KaW4FQk1SxtR/bTEk793tp/aV3ZY4kPhq8hQUaZCgDbOx65CljhoY/xBo1SqaVRxlwVib0VjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNhavKa7G6ZZ0RZ6Jpw4+KSasZ9wDMG6aKB/2qQ8EcQ=;
 b=j5F6AhP6JKCoFyeIRLxILZTdYRjbcmkzTmUtYaQmGNkAHV7qjTllV3dj1neOYUA+uLYtaScXDAXSC9SKAL5g+rOOfYTZ8MHdP9P+hX0cbSdf+OXEORkH7LZmfoarfJj0d2XZzilcmJRHWB3fn1RuoQ/ajhpWrFOrBV9We2VnhjNFn2ZzKWnzqO4tptuxAM0C6I9/of+Wk7p3uy5MgBUciF6Mdp7G637BWVuSZ+46lZ4dgpEftH8U1QAdqWgC5XVN+WsdqTk+CGveSdhWuvoUcZvBpTZMQh3MVWshHwLq1yafZw3RSyEZw9sQ0tqBd7b5AIbRYG23i6GlrAWiVO0J8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNhavKa7G6ZZ0RZ6Jpw4+KSasZ9wDMG6aKB/2qQ8EcQ=;
 b=sVPnYOqrM93jZ4OdYpTNed+CJ8ZB7k7BSgMsunpUgorxJnZrQQh2fZup3HtXtn5eqRUPqomyf8FYpqmTZaGCPZIlBZZP7+pyqSIS7G9AdJorG+jRrBeoEnT0g4JOqZHNepGkcs81iwWR+gXoPDvbtYvgEI0hvJ6qZ1Ukor3ablk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1969.eurprd08.prod.outlook.com (2603:10a6:203:4c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 19:02:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 19:02:37 +0000
Subject: Re: [PATCH v2 2/5] qemu-iotests: allow passing unittest.main
 arguments to the test scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-3-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6ec89f07-bbfb-9b49-fb81-a33f0ff6011b@virtuozzo.com>
Date: Tue, 23 Mar 2021 22:02:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323181928.311862-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 19:02:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ec7091-4e55-4ed5-d3f4-08d8ee2e399b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1969:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB196916CD58A901B632A6F10AC1649@AM5PR0801MB1969.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cl3DIrSfJnyHh2MyyUa1kOK6dg7ZyeFUD9tP27hsNsbf7elTyDlULnc3M/drOqACO2R1yuEXAxxrxK5apZ+JLe83YPu4MDvpfyBy743pwemmH1l2qPDe/YIbErqxX2rPVQJKd3NKdp+CgGlzmLhJElafECVyHDDUDKiPydYi1YB0rVl8yPH45BX/k6oGFD0GkIONSJIzp4rhr2c2x17uhar2ezcQa0ESHM/4IkcMBoHCekrUrrQMrWefdKbJLu+AzRXT0w5NAm2QrstrvRGXtGxDSXqdCaHQKIZYh5O802YutSFb2V4Jt/k3TzjidbT1sPy5aFT/aaMPMjd0oOGN18IWCsTPouuzyZaTgL22DWvn5tD4rm+6no6CJVmmm0SwTkzj2kwcEiPGOVqOZJg5mpBnfLUprVL7f6smuoG7MvRQQ82kTSlYfV6wIrNGOVzOqRFHFakkhfGrY3Hk3KvuNfyyQFaZ1fmPRjMKQW3a7+O9wLO8MtsKNH8cbbTNmVNUuezEnOyQgQ6JCib9/kDMdXWWQ/HvFMv7/Hdbafj7uiQouC8p5VMdTr9v11yxG1LUZ+VVM6DAk+y+cReP5v1mwp/EJh7gLDR5H6FSPvbYSo5RZYYSoSuuaV0hBVQ2I8+rRFKFGufYVqGtyP3am2VmFXh+V5FhMQF7uBG9ImffZyONe2UAb+NY9vFJ+KGZaUjrqAn0C+cVTMQkmJsjOUQicg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39830400003)(366004)(8676002)(31686004)(66556008)(8936002)(66476007)(83380400001)(86362001)(26005)(186003)(2616005)(31696002)(66946007)(956004)(16526019)(36756003)(5660300002)(4326008)(2906002)(316002)(4744005)(478600001)(16576012)(38100700001)(6486002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajRrTE1rU1BMcVVldlFtNEpVc3MrRmxrQXFXcEM0U2NxbHJwRHZ3SGp0N1Vq?=
 =?utf-8?B?TENmVzVHUUlITW96eVRMdWhGd2NNcnFQZHFnQzlvbzEwcE5wQXRUeUw4ZGk1?=
 =?utf-8?B?bzJydEFYR2F5ZEdzb05KMXpvNlZVdVUrMlJYeXJVRklvc0ZiWmVOR0Fqb0oy?=
 =?utf-8?B?Q0NnMmR0WFVFaXl0Ulc0aDRDV3k1ejI1ZGd3eE1YYlpnc3NnaHJvVGpYVHJH?=
 =?utf-8?B?RENUSnFnZVBOajM5d3ZWUXJiUklhZERBcVhlM2QzbTJjbVR5bUdGTFh6SDNo?=
 =?utf-8?B?ZGJHSkszQ09BTDBoWlh2SkYyQWcxL0dwby9DaitGRUVQRkkzWnJpZUxXdnk3?=
 =?utf-8?B?VXg4ekozK3QreUU1NWd4V3lEQkxDa1pyVTg1VkpKZW5NN3gxRkttSFZacW52?=
 =?utf-8?B?d0Q3Q0ZkSXByTHZFc0VYSnBFdlcwOVVyNG9yNU1zV3N2dDU2cjNGYzFCdDlU?=
 =?utf-8?B?d0hJWGU4RklJSnRVeG02UGhKV2lZZHVPNWRtV05UQ0c0MlZBcVZHc0lGZWFp?=
 =?utf-8?B?Tkh5cndJUXlxVW4zNHFvNFJQYWVVcVFmZGtpMkdTdnFPb1ppSE9Kb2RWWVBi?=
 =?utf-8?B?Z2JPZkl4STRBM25vaVgzUEY5bmRpNmhBeDcySkRuZFhhY0VDcjlsN1AyM1E4?=
 =?utf-8?B?Q1VaUVNwditYKzRsUXFVcHFhR0dQbzRMd1UzSEtULzB1RVNDbVd5TWwzL2Fj?=
 =?utf-8?B?d0tybkFoMFBOOEtHTkxxcFNvb0tOelRvaUFHbSsyN1JHanovdms2bkkzZXJs?=
 =?utf-8?B?R245c3dTTjhCcjBBQ2oyU3A1Y2UwSFBSdDdVT01lVTl2YVROcUx3eGViUmFH?=
 =?utf-8?B?K3Rtb01qdUVPS3ZlTDUrYXZyK1NmNEZqdmYxY2V6UWhVU3dIalpIUlFPSElx?=
 =?utf-8?B?WE1Sc2R5eEtFYnN5QU0rWlliblF3T1d6bnVUTXlWdGd3LytNbThuazJKVTBu?=
 =?utf-8?B?NCs4bWFCM25UMnlzaS9aK0JIakw1TTRKYzdIN25MYlcwYXNkNWRhUjhkbC9n?=
 =?utf-8?B?SlRqQ2VIcXY1VytuejFLcmkvczlRTVpUSTJNZkNlVU1ERzBQczR0ZldRaFc4?=
 =?utf-8?B?bmc5RzArWWlacENIRlppWTZURi9xT0lIRktlR3N2eEUzemgzRzVjcDE3aHIy?=
 =?utf-8?B?VmVsZWhVd3ZHL1FPK1ZTdVFoVEt5ZVMzSzU3QTdGVjNpYmEyT1VtU01sbmtx?=
 =?utf-8?B?V2FOV0k0cmFIU1hFTm1PZEswQXJKTkFRQ1BHSkxqUHdyVFIrY2J4WkVVZEd0?=
 =?utf-8?B?UXFwY3Q2UmE5cTFPTk9qQ1I1VDhzREhHa3hGdFVnZkxjMUtTaDBJTmN3ejFu?=
 =?utf-8?B?TDFUajIycEVHSFE0VmZibThwbE9oanJoL0ZUemVIWllCb1d5T0hPVERMeit5?=
 =?utf-8?B?SmlvRGVXRlBHTUFtVENIUGM3Y2MvMHdodmZoc2Y1djgrbGU4c21jLzJRUUh5?=
 =?utf-8?B?Vkcxd3hHNGdYNGgvOHdwM3NQMnErSEJEcnlYMElwNkxNYU1uNzVxNTJ5VEhN?=
 =?utf-8?B?Zk9tK0RUOTFQSnB0aXljQlpTa2g2UkpIVFJkZDBIUTUySVVXRGR6eG8ydnpm?=
 =?utf-8?B?M3J5dHVCd1dnZ3JMM29sVEEyYlJ1YTRqb0dlNTNxbGRENk0waTJLWW5WcmVj?=
 =?utf-8?B?V3J4aTJ5L1JQRm5sWlM0eGo4OW8yRkpXZkhpWS9LNVhvcGpnbFlRY2htTDNn?=
 =?utf-8?B?L1BVbkFHb21GY2xKcEcyTTNtMEhNWFAzMWROZ29zMDdlN2F4cWk5dVFkOU5l?=
 =?utf-8?Q?Ne5rR2sM/QFYTPYZeGZD2puIcwX9kdXA2nC1FHr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ec7091-4e55-4ed5-d3f4-08d8ee2e399b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 19:02:37.6529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmQG6zMr5mIj3hVDeDtT+tTfBeLmB7qk3Jq5lTX/cASFmFjkXXFkPjMVdEla3TkqsZ88sI7HLaXfM+G0gwCefAbXmUnWl1NgRqIz17xuad0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1969
Received-SPF: pass client-ip=40.107.4.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

23.03.2021 21:19, Paolo Bonzini wrote:
> Python test scripts that use unittest consist of multiple tests.
> unittest.main allows selecting which tests to run, but currently this
> is not possible because the iotests wrapper ignores sys.argv.
> 
> unittest.main command line options also allow the user to pick the
> desired options for verbosity, failfast mode, etc.  While "-d" is
> currently translated to "-v", it also enables extra debug output,
> and other options are not available at all.
> 
> These command line options only work if the unittest.main testRunner
> argument is a type, rather than a TestRunner instance.  Therefore, pass
> the class name and "verbosity" argument to unittest.main, and adjust for
> the different default warnings between TextTestRunner and unittest.main.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

