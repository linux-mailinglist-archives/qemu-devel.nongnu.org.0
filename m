Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B839A121
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:35:05 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomYy-0004ce-GY
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1lomXc-0003XP-CZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:33:40 -0400
Received: from mail-bn7nam10on2076.outbound.protection.outlook.com
 ([40.107.92.76]:12608 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1lomXY-0006FD-44
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:33:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6voUxvXxUpICTcYucErMZeH8PEoeKCQYMFEXXyEsStAguq4BLgNN4BS8GZ9AhlKTqjoOCNyvIAaxCq1RMyyYVnAQ0AGxF5jbKF/CBkP7HN0k5u8f/lb7eOIUkr2N89ordoGSyWpVXmY80BzFLOSUceeAsC5y9jDIhS61YtzLLxgF8TPDPioxMDaZSSpgFhFNvcLG52xh4F/HVFphGtAYijU4llpR/6/7pSoLZnph/+9o+1MQGh+HKRigjaqCxIccUvcZHVvlNC1E3y+ZjshvMnyzl3nis8JSBWMxz68bss2OUk45iUTOZ/4vbwvTRxh0HDLFxnC3esW0C1Yw5FYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEBi41BnYF39FHQxTCBk4tq8dNfwovBH3juGmovA9sg=;
 b=CSDoVocEayK8kSg7JAPbP652yW84c0FJfmwjiFpmEBT7Cvx0dA6f4XFwsLUIqYY0yhaimCEUuD4GT9HrkiGgs2cRGX4EcroaLTmUH31TwYwS79jF5yYbs5Ye2C59ZtiZMp5mLqqiZq9RWf+3A0PyyZSrUOpgmzpq8zgC2IrDsVQ6VSvTu8EqPkNfoxotzbWv0Evz/Lx2s/FSXBBF403e4YI9B5lKTtvgxFiHuQijTI/pI3Nq5H5JuNdB0q3Dl8d3BMDjmKhKFZU5e+ogxQ3AJsOFlL8ueqxtcq6M3bSI87UfIO76RjG7kcQaoImN2MgtNz97QtNJU35kAQR8QYgUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEBi41BnYF39FHQxTCBk4tq8dNfwovBH3juGmovA9sg=;
 b=BfS50lvI1kRJ8gsKvIm6d1SmZ4vsUtoS6T8w6j2rmE+imC/nrya4+YfqKXhRmD9J5WFbUyc1zr5WTZL6o8mfaa11ZnLE9TWDh7tGDFI6t9uQ7guGPpoESyg0bBvjW/Ii8MgkgwEhY6hTJkbg7ICPdpyFj3bQizgzCqd9F68ACGc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Thu, 3 Jun
 2021 12:18:31 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::9898:5b48:a062:db94]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::9898:5b48:a062:db94%6]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 12:18:31 +0000
Cc: brijesh.singh@amd.com
Subject: Re: [PATCH] sev: sev_get_attestation_report use g_autofree
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, ehabkost@redhat.com, ckuehl@redhat.com
References: <20210603113017.34922-1-dgilbert@redhat.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <0733cbaf-293e-9c77-b85a-4575b31755d4@amd.com>
Date: Thu, 3 Jun 2021 07:18:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <20210603113017.34922-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [70.112.153.56]
X-ClientProxiedBy: SA9PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:806:27::31) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Brijeshs-MacBook-Pro.local (70.112.153.56) by
 SA9PR13CA0146.namprd13.prod.outlook.com (2603:10b6:806:27::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Thu, 3 Jun 2021 12:18:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bf3beb9-2c47-414a-937d-08d92689b38c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27173D2B670816CDEB4E320BE53C9@SN6PR12MB2717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVh0KFuvPmi5a8K3KzThio3RL4Ql1b834mRhy1u9uh57Utzwkf1TAJgHGzsx6YpQu+DrAUXcOUV6aaUgVoL1Bk6EfSr4iETg7Xkfteww3CDNxzncVznlKpqIAoFq+SrNLS0avmLGKiaZVmMY/5scbS0ghTSyPTnHX4bvQLcf0wXfhrXkGYPBtrskvdH9rCipzfUB+UizKcpJIMDGHZVHQro02XLf5UEVVPPRrt6PonMzvB7A585S4okjOx2zqkVO2xiQRahX6n+xNZy5jd+uQGwpL1GV4CVLeKs9cFeIPuXYTpIuKel/n7kdySgUY9Hbh7dBluQgHb157JFkMnoHMSutpI2Vn7jR7qv3a21XhCml8+Mva4CjfSeGR981BE/pHLQVNPIw4B3/xEcTIz9Zs34+0mngU7GiDAbvxCk8Wz+KN8lzkUoFQs0yM8vxZ4jV3DdDBOuZTfBc97r7Kkjj7t4O75oaTYrTty+uxuAGh10RPaoLwx9/Y6Ravpc/KI5qF3LJXhiTIBaQEnaKcKM/WNruwipa3OKF0crVOLvNaFZQ+AEEjvIEBQkLzhyfhZ+MO0WzyuuA2wlwl6+NTU8B5528tAPxZ+KwsLod6XpEZTNr3XMKMVedjlEcb630J6IY58NGq+5Qi60rBsgvDzAq3Msu5g3MZn0gqSGaJto3ditQ+RCN/S9yqQOfLU+9EpFVzbxufRmwqnP5DMk+JmPzK1RhZ2dsAqlVYNmfeUjvEEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(44832011)(2616005)(66946007)(66476007)(956004)(66556008)(6506007)(83380400001)(2906002)(31686004)(8676002)(5660300002)(31696002)(6486002)(16526019)(26005)(86362001)(186003)(36756003)(53546011)(6512007)(4326008)(316002)(478600001)(38350700002)(38100700002)(52116002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTZYNVErNTdqQkVVNUNBeVVsZW03V1N2UDZ6N0JGMkpGeG83VVcvcXozeGdC?=
 =?utf-8?B?MVdDeHY0N3N1bjRUcXI3cS9aRkVGVG0xY2hibnp0cC8ya0tUUk9uMXJ1TCtT?=
 =?utf-8?B?NXJReG1Xa3duby92VVJZOWxaZjhJcUFNY1BRM1VUa2NzWE9kcExvYzBDTnJB?=
 =?utf-8?B?NnIrbkt0c2Y5WkJyQmx0dmZEWFdDbllzTmVqNTFnbCtyREswa3dXSkExRERk?=
 =?utf-8?B?dGhaYVdvV0oyUnEvcXFtRWtwZ2d3RmNQcndqeGp2d2Z1a2JZYzlPb2o0V0lk?=
 =?utf-8?B?d3plbTNYT2NVb2JwempWR3pIUjNNTDVPcE9XYTlFSFc2S2FOT2VKUm1mWlZ1?=
 =?utf-8?B?NGRrVWtwMVl1V3ZDbjJkYWQ0SFcvb2VnQktYNjhmQWluRTlvSVBQbGJGTlJy?=
 =?utf-8?B?M1N3QkpkUXZhbnFJZkM3TjdkcmoxSGdTR3AzamhGZitvWWYyRlFSUTI3UzU5?=
 =?utf-8?B?VnFuS0dYTVdOUnNxNlJKQmR2Tm4rbTAxL3dubUtBZnJ5eDgyTzNjVjZ3aVpO?=
 =?utf-8?B?MER4YUlHQWIxTHM0K1ljdi9IOGtxOERGclZmVTVDVXViUmFRcVNNbWZwUE1X?=
 =?utf-8?B?aXdCZlhVSUlzRGVqZnNnRTlzNXcvMVJBQmRWWGMzUmt6c2xESThOT3k0ejdP?=
 =?utf-8?B?Qmp1a2VzWUlnaHUyUzUyQ2RNNThDbnZ3OWh1L3R6N2lKa3ZMR2dOZldEclNv?=
 =?utf-8?B?VzJGRTNyeDFxcHB0RUpGc2c5R1BkeWFUb3gvbkFRbWROa3ZtWXRXSTRwcnNG?=
 =?utf-8?B?ZTBGcWMzcW4rTmVhMmx6NnordWxQSVhZT21jYUV4NjJkZG9Vbkl1VlFIejdm?=
 =?utf-8?B?bjZnQU1NQjZHS0pKcVlVWGRibDMwOHd2bG5IOVE4SzFjSFBNbEZBUHhhSmtp?=
 =?utf-8?B?ZzBXazdtdmZVYW5BckZMZ29PUmllSXhjMnliTGZ3d3A0RHkrc2VZR0xWR2VG?=
 =?utf-8?B?QUExRk1pd2ZqemFveHdpSlhGblprTE5BRm14K0d2Y1BKM3JkN2Q1d3NEWHZP?=
 =?utf-8?B?cWEwV2srMzNMKzN5dE0zTHVaWmxmSjVtalMvK2twSXRuUDBqM2ZkRE12TW5n?=
 =?utf-8?B?cnM4WlpjQlpCc2QvQkkrNDUzcFo4OXprZmljOTVtT0FJdGRYOXhGUkVCMzBs?=
 =?utf-8?B?YXBCMlZLRE5ndG9rVXRtbVNEUytIUGUzZ0JUZys2MCsrOEFXQWRHUEhzRFRT?=
 =?utf-8?B?SlBFRUN6Mzh2eWQ3TDduQk14VlhQMGNBMUw0YWNBWVFxalVHNXJYNS9NaUdy?=
 =?utf-8?B?bXR2NjZLMmx3UzdjY0ZIWjlqMUgwM3lGbUdLaTdabG1UTHE5QUowTDZYVkp3?=
 =?utf-8?B?bkFCOWJydzV2TWcyVE9mRE9tSWZ3RFFqeXBhYjl3S0FibnFSVWNmOEQwdWxK?=
 =?utf-8?B?YjQyQ3FmSy8wMGYvd3ZocWU3SVA4ZVp3TmU3aTBkM00vTldsazlLZDZ1aUdD?=
 =?utf-8?B?b2Z0b0U3eDFDQmpZN1Y0K05ySzQ0amcxK3I2TzF2cE50eGtsdW9FQWxzSGdK?=
 =?utf-8?B?aC8wQzNibWRVZ25TUnc5blBTaDJkTlg1SXJmc3FXMi9abkNhVWJwT1liVkFU?=
 =?utf-8?B?OHR6ODJoN1l6V1Fxc3V3SjhyM1FOb1MxdjFtMVgyR0Y1YmVJSXRESUhjT0x5?=
 =?utf-8?B?bkFBRWNKaDY2TC85dU9FK21uU2tyTTE3dkJPNnJmUTkyZzV0aGFkYmVTQlRv?=
 =?utf-8?B?MFM0VGJtcnlCNm04cU9YQldUZE45dHlLOVlqRkFEU0t0MHl2WkZ2c3BicW16?=
 =?utf-8?Q?XcDlbwhjsfOe+N3vdb9nqLxNG3s/r0PG3E9AUg8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf3beb9-2c47-414a-937d-08d92689b38c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 12:18:31.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT3g+O/jpMsRnFSY31NJ6fhP/kLu61Ygem4uh4a0dYq2/zIDaJ0gSTuZMAc5jYvFz9SxmUaxBiTccO4c2f7lFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2717
Received-SPF: softfail client-ip=40.107.92.76;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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


On 6/3/21 6:30 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Removes a whole bunch of g_free's and a goto.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>

thanks

> ---
>  target/i386/sev.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 83df8c09f6..0bd976b4d0 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -500,8 +500,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>      struct kvm_sev_attestation_report input = {};
>      SevAttestationReport *report = NULL;
>      SevGuestState *sev = sev_guest;
> -    guchar *data;
> -    guchar *buf;
> +    g_autofree guchar *data = NULL;
> +    g_autofree guchar *buf = NULL;
>      gsize len;
>      int err = 0, ret;
>  
> @@ -521,7 +521,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>      if (len != sizeof(input.mnonce)) {
>          error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
>                  sizeof(input.mnonce), len);
> -        g_free(buf);
>          return NULL;
>      }
>  
> @@ -532,7 +531,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>          if (err != SEV_RET_INVALID_LEN) {
>              error_setg(errp, "failed to query the attestation report length "
>                      "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> -            g_free(buf);
>              return NULL;
>          }
>      }
> @@ -547,7 +545,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>      if (ret) {
>          error_setg_errno(errp, errno, "Failed to get attestation report"
>                  " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> -        goto e_free_data;
> +        return NULL;
>      }
>  
>      report = g_new0(SevAttestationReport, 1);
> @@ -555,9 +553,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>  
>      trace_kvm_sev_attestation_report(mnonce, report->data);
>  
> -e_free_data:
> -    g_free(data);
> -    g_free(buf);
>      return report;
>  }
>  

