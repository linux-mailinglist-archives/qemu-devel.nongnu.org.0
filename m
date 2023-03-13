Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4BE6B8320
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:53:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbpA4-0002Hw-PU; Mon, 13 Mar 2023 16:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisco.iglesias@amd.com>)
 id 1pbpA2-0002HY-Gq
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:52:50 -0400
Received: from mail-dm6nam12on2079.outbound.protection.outlook.com
 ([40.107.243.79] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisco.iglesias@amd.com>)
 id 1pbp9z-0004Lt-M2
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:52:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwMi4rY3ZMHfFykarVgww8EV6GadyRcpSIH1Q9ch9EHlCJWHNUsJAxaK/LkA6kL7r//M5nUn9WOkfwH3TtKr3Eo9Ha4gdw2lcZKmFsuKcsyx7dwU1K5/C3yv+4WRBOJ4uqivgPa5s736gGLSZZaV7UjT8H5lZwDEMMJg7WcNfcgGd7tVlwHriZ3JT/vlwfR/Tt5YCCEFq54Hc1LN1EDszlkUomnFXPjGRi06pfN06cCcgBAtQagQ3rVAEo/tuWHkYdySh17EY8bzAqVLOKNU1neipUKjR8o5cNPeJ+LrdLP0ExyWMc3CPBBpEqJ/pMwgOGRD3mY/xbFMJTzAx7Po7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gUAkHLb1d4dOU2xhuiFEYxAe6x6s01TdXr/JuIQW3c=;
 b=au+OxKf8crepI38bEiAye8rEUtFXteJB8zcku8gyb4x4SJyzPEJrbxvFAcyPLrUP8ljOnrViMjMg+BE9buIQDexdgGOWooQKD+Lwnvb3IzLKZZAsb64rbLuQZcL+5WgFsWrrG2T2f3GVi8gK35nm4PGfObpTbbMbhNUHv9vPrVMSo+gXHZGpIrj4yxFHVhezG2pLS53ZfP/VmZ00/PyVcMYAeOGOFwlfHdmWE17l8j1D5Y2Ipx3EmHue8yrpIt8cNFXJX9tQsFBdp6x/KmD/agMmsybXDtPr+mjTM4wqNOtVUWYiBUW/HEJamM6DXJrT3/ynlekpnbHBXsZxXLnJNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gUAkHLb1d4dOU2xhuiFEYxAe6x6s01TdXr/JuIQW3c=;
 b=tFu540KHevC1Rw80oH6pnXcAxT68A5dxC+t6kpPilhDbChLSo8qfCSKN+WtwrwvysO/oIFWWBDY8uMTG6AeXE7VClMXlA4cupg/F7Avcti8pZk8cyM4xo2UVe9nZDWFRzCclDb3dUJak0WSZQtnz+0xt+lobhaGKY1neklB7PUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1130.namprd12.prod.outlook.com (2603:10b6:3:75::19) by
 CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:42::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 20:47:42 +0000
Received: from DM5PR12MB1130.namprd12.prod.outlook.com
 ([fe80::dbe7:819f:6b2b:d1fc]) by DM5PR12MB1130.namprd12.prod.outlook.com
 ([fe80::dbe7:819f:6b2b:d1fc%8]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 20:47:42 +0000
Message-ID: <1f98fe27-23e2-094b-a693-17ba63966f8a@amd.com>
Date: Mon, 13 Mar 2023 21:47:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 10/10] contrib/gitdm: add group map for AMD
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Tong Ho <tong.ho@xilinx.com>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-11-alex.bennee@linaro.org>
Content-Language: en-US
From: Francisco Iglesias <francisco.iglesias@amd.com>
In-Reply-To: <20230310180332.2274827-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::9) To DM5PR12MB1130.namprd12.prod.outlook.com
 (2603:10b6:3:75::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1130:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 1858a7cd-d3c6-4aaa-185a-08db24043089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PHaKVIO6fgFheDYLoHnUtNLRuGVFHhSWiT6bsCr/rs30ZujfhXtaMjhVKJLfH5nggahKtDiDlobdH+Im7diF6EPFO/DM1NMgdloveEHaAB5qj4CAAjlxLvnc1UQQg9zImzA5iejbRlbzU45Rafl2K/6nXzlv46jD8kwSqjD0g8DaRz0/Jw6G7cAax2+HQ74yfXWiukF+gzAEpWpv0ruVk9YoqKnZx1fzteJyEhmRTEZWNAVZ/GuJ5nKhQeKo39vGMaupROjYwPl3ggMVa6ctQoIcnmNxTsWSOxqKrXnkLjhglLwYmzPBaU4dytVX8cap03rhorWNS3OfBGzMCcUTLQzyyl9Soex8LSpQbz3JKAXg9fWnbS7R07FhNC6dzwsUG4j78XLJ+Z/qgvJ19PiRN0kGSlFu+Xia4bb3l0bkFbTOc5emHrhP+Gunum1YszWPrcfKI+5j39cMgL7is1AEP/C70uX45ov3nvKgU0cwV//TSUxOntPBxpt5VH5ehOSpqGxvzomLh6ZcLhnXG0dxIVbHFI5w21PGDWCRR9vpsVJOMHw8Glz9hLE/dIbiemxHn0wm0b2joGOl0CPRAcPiimz/w6UwbBn4Z41CrCBT8+5zjdrRxONm93cjh9sgm0rMrt8VoTtP253fwdQPxZ76Wg6V5vuDo/EWDR1LzIAnGnBGoKz9BwI4a1MBVmhwPoPq7jFJD/sKv/BW/7gPOA+UMlvGPMnOwbiNVujBa54vWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199018)(6666004)(83380400001)(38100700002)(316002)(66574015)(478600001)(54906003)(8936002)(186003)(6512007)(8676002)(6506007)(26005)(36756003)(5660300002)(53546011)(4326008)(66946007)(66476007)(66556008)(86362001)(31696002)(41300700001)(44832011)(2616005)(6486002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnM3NlRJTVptZ1RPV0R4cUtVbHBWVGVvNkxjVFpDQnN1QytPVXgzUkpHTDhS?=
 =?utf-8?B?VW0vS2FKTkE0LzVyem9CeWVlYys0a3p6RU96Y29HR3dBMHEwRHgrdjRnNHpr?=
 =?utf-8?B?M3R4Q0RQMjhiNGx1dm9rVXlhdzZlcElIMjJVbWxFRUM2Q2RidUVZdWhJVkZL?=
 =?utf-8?B?SnU4bnBmRXJkMFFVcjlCaGExK2o1WmppWFhWK1hqQnhDK3hKZ0FWY1VYTGZW?=
 =?utf-8?B?ckJ4OXhoMFhPNUJrYTEyaXA3V2I1ZjhPZHV5OU5WMGYrVHlCamhQQlN1MDFD?=
 =?utf-8?B?ekc2ZEVRZ1ZLQVp2R29oYmhNdnNxMjFRMGpLK21sZHdSaTMrNHh6US9XR3NB?=
 =?utf-8?B?UzMzcm5GNTlHb1BoTTNIV0JRSjdSSVJ5WEN5TlFHQ0g0U2Vab3J4SXorS0h3?=
 =?utf-8?B?b21yaTVLbDhXajAvSVFmM2FUaXZMU2E0emdhV1VEVkVsa2RLQ25wbllzMlNm?=
 =?utf-8?B?blhxbUQrd2licW1MLytJWEk4cTRTS2h6bnJzZEp1YWV2SFBTcHJaTVFNbS9P?=
 =?utf-8?B?cUw3SjZZcCtjTjF4czdDSGlhUHVBQ01KRW9ZWVF0dVZDKytWR2laQmJzMndv?=
 =?utf-8?B?VXRjSHJZbFhRMkxwYmpYcG10YWNybitxcnBETm13RllYcWU1L01sMngrRUpJ?=
 =?utf-8?B?MTJuVEpOVmx6NUxJMzRPTTV3MnZISGFSbTZQUlFTcXJmeU9YMVFnbWdVVm5V?=
 =?utf-8?B?VFoyNE1iTEErYnZkRU0vNUU4Z1RpRktCbEQvTVBMdXN3OE5ZS1FKK1ROd2Y5?=
 =?utf-8?B?ZFlYVFhoT2FLaTZLakd4N3ZlUkczYjZEWTVXdTZXUDh1bjlsSHNaRjUwMW4r?=
 =?utf-8?B?cWJGZk55UFRrMFJKNHdaRnlLSmNuN3NYMG94WGZ3ZnFZQklYMi9QUG05dTA4?=
 =?utf-8?B?ajlucEtkQlRSRkhva0t3RitpVDNBcXBnWFV4QUxOS0FCdkJ6N0JmN25VSzVD?=
 =?utf-8?B?SDV3THdUMzgzaGRSMzRZQTJZdUJpb2RRdlRjelRFTGtocUYzNDMzR2V1QVpI?=
 =?utf-8?B?MVVaYzRHTmovL0lkTDBBemp2MlcwSmRuS1cxV3pxR3NKTkxOSlVmY0p2MDBh?=
 =?utf-8?B?c1VyYm5VT0FDaUM4UUNnSkYwWllYdTlXL2pmQ3V4ZzFBUjBGTTN0RXdidy83?=
 =?utf-8?B?am9UNEtpS2J1dWlITllIMUNCVmpreFE1ZVg0SHJjdEhqclplMEZDUDdPaEMr?=
 =?utf-8?B?RHBxR3pMejVPbS9ldzdWUVhTWnBhRytxS0FtYkJJaktSZGsyTmJxTnBydTRt?=
 =?utf-8?B?RU1OU2dQS3o4THFHQjVscktyZnJuOTNtYWVEcDF0WDZKK016TFlUVUozc2R1?=
 =?utf-8?B?UTFzc3o4T2dVUko1VVNtUklUdmVZSXAyRzF2MEJuWjE1YlV1enI2UGprZTU5?=
 =?utf-8?B?aWZGUHNQSGE5UmZkNDArMkZQVEp6QkY1bDRsVmJVc2tueHVTQzE0Yno4Z0s4?=
 =?utf-8?B?NjhWUDAvOTZHUHVHdnVoMUtSeFJNa01WZEloOUxYQ2F1WjhMcC9Ya2dyVGM4?=
 =?utf-8?B?T0dOQTNTaHk4ZFhWaVhQZEg1T3JvVDh6eHA1V1dIREtaUXBpazNTc1ZsRmZu?=
 =?utf-8?B?Tjc3UXhjWXFrOW5kbjB5elF1c2E4TStvNVdINUc3VFVuQmlkWlhmd2FibW85?=
 =?utf-8?B?RzlyNDNqMDNnOFV3cm1udHNCbTRsQW9WQ3pEVlY3ZUpScWJ0b0RkUHIxZmhW?=
 =?utf-8?B?NnRRQjl2SDRxUzVORmsxMFZTNEJneG9BN0JuZ240MWtRRTBhbHN5ako1RkdP?=
 =?utf-8?B?NUc3S085ZFU4MDF6WXFoZlZBTjVoaXZGaUZiSldLQUkyOHJoWXB6OVB2eU5N?=
 =?utf-8?B?RDBWNnFrZlpOaHZ4WGx1WjJSRWpmSnpyR1FDTjk4eHcxTE40TlpIRksydm5t?=
 =?utf-8?B?MWVDYlZQTVZVbkRkM2lia2lmb21RTnZuRmRWNC9nWFczaEJGYzhzVXZqSnVL?=
 =?utf-8?B?UCtaV3lWWkZOMnlPV1lHSGVvUCtjak1WTUFka1VCellSY1VXRWVFOUJRdFlM?=
 =?utf-8?B?T0VQT2pQV2FMdG0vWWZxU3ZHUjNxOUhTNmp4TXhDMXZjaTJqMmVxTkR4WWI2?=
 =?utf-8?B?MzE1NEwzR1FhQXFQN25xeFFGK1FmV2l4djgzZDlSN0tEMmFENkszbDJmM2E3?=
 =?utf-8?Q?//EPt3ub9ecSIyKT0BT9SQ0Ep?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1858a7cd-d3c6-4aaa-185a-08db24043089
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 20:47:41.9098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRoRwHj7t3z8j2p1BUU8TNnE7XOKFiD3Ct9nOMyr0KAOaZljyG3c1VqO4UTEPJkX3bqTtx49tqq578UVHLVGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648
Received-SPF: softfail client-ip=40.107.243.79;
 envelope-from=francisco.iglesias@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



On 2023-03-10 19:03, Alex Bennée wrote:
> AMD recently acquired Xilinx and contributors have been transitioning
> their emails across.
>  > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> Cc: Vikram Garhwal <vikram.garhwal@amd.com>
> Cc: Francisco Iglesias <francisco.iglesias@amd.com>
> Cc: Stefano Stabellini <stefano.stabellini@amd.com>
> Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Cc: Tong Ho <tong.ho@xilinx.com>
> ---
>   contrib/gitdm/domain-map    | 1 -
>   contrib/gitdm/group-map-amd | 8 ++++++++
>   gitdm.config                | 1 +
>   3 files changed, 9 insertions(+), 1 deletion(-)
>   create mode 100644 contrib/gitdm/group-map-amd
> 
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index ee0804b6ed..79fd65b077 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -50,6 +50,5 @@ virtuozzo.com   Virtuozzo
>   vrull.eu        VRULL
>   wdc.com         Western Digital
>   windriver.com   Wind River
> -xilinx.com      Xilinx
>   yadro.com       YADRO
>   yandex-team.ru  Yandex
> diff --git a/contrib/gitdm/group-map-amd b/contrib/gitdm/group-map-amd
> new file mode 100644
> index 0000000000..bda4239a8a
> --- /dev/null
> +++ b/contrib/gitdm/group-map-amd
> @@ -0,0 +1,8 @@
> +# AMD acquired Xilinx and contributors have been slowly updating emails
> +
> +edgar.iglesias@xilinx.com
> +fnu.vikram@xilinx.com
> +francisco.iglesias@xilinx.com
> +sai.pavan.boddu@xilinx.com
> +stefano.stabellini@xilinx.com
> +tong.ho@xilinx.com
> diff --git a/gitdm.config b/gitdm.config
> index 6908ddbd19..c9d961dd23 100644
> --- a/gitdm.config
> +++ b/gitdm.config
> @@ -32,6 +32,7 @@ EmailMap contrib/gitdm/domain-map
>   #
>   
>   GroupMap contrib/gitdm/group-map-alibaba Alibaba
> +GroupMap contrib/gitdm/group-map-amd AMD
>   GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
>   GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
>   GroupMap contrib/gitdm/group-map-facebook Facebook

