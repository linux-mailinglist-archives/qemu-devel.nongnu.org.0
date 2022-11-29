Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA263BEB6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 12:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozyZs-000495-MD; Tue, 29 Nov 2022 06:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozyZq-00048l-Ns
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:15:02 -0500
Received: from mail-ve1eur01on071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::71c]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozyZo-0006zp-5x
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:15:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKXEB12NraQmlpQdkI3VfKwC+fzAUu1Dg79WkYerLZBPCSoW4TIy9Ie/7mdnO8UoO8KQN5KijTij4MPrL6nexH7eLr4+LEHUPMVXaHFwnuYb3yz3MO8ug/bmCBmVy8c9JRnFAO3EjTWF39x7F8LaOU9oyFkmpkq+OupPZSihUp55M54JrLiUIUILzS8ltcRtvP/k5A/VCJeW7ve6enq8t+PHJIBnXr8k+lF6yo1T0zmFyKXvWIBOCMBi2ET36tqlkEBYZUCZ2W0r/Ok+ssvy2zMwYKz6kMaq0H+FimxlaTBZSePZTAXsCJWrCikgMl8pfI3jxy/1OIe3aESVeqrNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzUbQSzbU5cPEZWUtP43BBFHFVMv3KOzIAuamCmUuvQ=;
 b=CPY2wZpy4kUAjw86c6wjlwFBNvznOMA7zRTL7Slty8n2a/Rt7ImAHBCBERFApHugYBjByZUTTnWVV80Cucf9dZsZl5wK0eGf+8oO9ZskhofcXIjC/obEme+A32p3lNQ+33lSRS9zFPAa14qX9/LwqYiPlZT/UctgBsgaracS5KpqXXNjg35n4eoa+SnlSwNBOsQFfnPHFzTV4EO80yugvbzAaIMqX6Ai8PgemIRsj0+5s24oguLWrn0PIQ5eLmN8K1mT+GkK0iDUEGYljWusXXVxmFY9ZGy/YJf4M9LMtI4qfyBmuJtcxpwjXo+inesxq0KslLXu52fSOXMdE0O0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzUbQSzbU5cPEZWUtP43BBFHFVMv3KOzIAuamCmUuvQ=;
 b=IN4wJmlAzHp91X+JowBD6tN+xw0D3DqRQr5wmSiPknEVvYWKG0/5i76mYDBI/JxLc3YQ8tJ5Wkq76FwthGLqcqpoq7kNChR+amkGGvnOb1/9HQxT86mqQNVX9s0EBNYTtmTheU5oQRY7aTLJCnOtj/c0waZ6KslgmLMaKC6a5zAsje8Uco8hBmlMei+AN9Rabsh9LLj5YR/gbbX3gI+46L5Dsm3jnQyZUmDfaXm44t1t6Y8Tn0BonyBrjgafeO/MmRKF0zj96IL5ttNyYtVW/hBL9pRp09ZGiMCI20Fy0h8xoC2hjOFb8AZ++RzNedFE6VpLqeTIewNc4aQNl+2LXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by AM8PR08MB5860.eurprd08.prod.outlook.com (2603:10a6:20b:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 11:14:53 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::e0fc:a968:655d:f14c]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::e0fc:a968:655d:f14c%7]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 11:14:53 +0000
Message-ID: <e94e1c77-a37e-1a6b-1f1f-716ecc685522@virtuozzo.com>
Date: Tue, 29 Nov 2022 13:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] qga-win: add logging to Windows event log
Content-Language: en-US
To: M M <mike.maslenkin@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, yur@openvz.org
References: <20221128185403.447817-1-andrey.drobyshev@virtuozzo.com>
 <20221128185403.447817-2-andrey.drobyshev@virtuozzo.com>
 <D3E30AAB-37BD-4EDA-B1A9-D3F0F349F878@gmail.com>
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <D3E30AAB-37BD-4EDA-B1A9-D3F0F349F878@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|AM8PR08MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: c093dd50-d83e-4b99-9c00-08dad1faf072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbiSHoCTpCEIalixeXgFs3qI+CNbyVFWupHJfPH3ZEnaqCdxO/0s2W+qk128RbvqNsHuUpwNlWeYy6NlB85aMDvfvIU9XDdR4g7zo9BLA7n1lw2ZxW84CsqtzrJ0sDxrsZpC6pQefChPkwdTIVqJZ1DfhX94ilrOvuqgcxkADscrhB9BjoOM7PvDXmNo22D3g6D7u3hyz12kGZQnpCBxOJXP0xDpd0LtLL30Hj/vWKcSofq7SXua0k5ug904vxcFrNJOZ/JkSNaGgYKyGRniFWLKWldc/HhBxmubthcOXYoOQiI7kmRXhvZzWopHCI5Inw+rIHMWUmSAu7oTg2VDnW8QcKZ0WfkN2w8OmtZ0yThx7l8yI3m70/S8HBWuyNpxxenR3lpflAVdrROZaibukN2votM80uetk5E9dQbycRPz0TspyckFX53BdkqxtDaby3zd3W3cnfa+GKrcjsTl1h3FMzkAiLBdDQiV7BET13woP+XdixYT1jueebkEHJzz48vI1d5WC0GoFdIGIlvQcaQf0nUWaHfXsLKhp7iKclK/DRFPcmeUrkUweiktt0zNwGe6AHt7/A6lV8Hr4OqEg8djKog8x4ux7FqDBEa6BDetuBC9OIn7WfJU7jZq6VcgUjJVsXjLY7A2MYfYEz6k5+Ve8zj1augVuVL1ycYA2mH85uLuXLdNCgW3+HOK3gL5kxfD17p9Z9OSqkJaaskAPw4uIOH7eX2hpW4ern67WlUrnAf/ZunVAm7gMaL5A9Ttis9TVkRaY0kiHtVJnKp7n+luCwOuCiKWsr+IQ08hjck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199015)(478600001)(31686004)(6486002)(966005)(2906002)(53546011)(83380400001)(6666004)(107886003)(66946007)(6916009)(38100700002)(5660300002)(44832011)(8676002)(36756003)(66556008)(8936002)(6506007)(2616005)(4326008)(41300700001)(66476007)(31696002)(86362001)(26005)(316002)(6512007)(186003)(45980500001)(43740500002)(460985005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGgzelN6RmhmUEhESk5QdmRVYmFLbjFFdUdmd3pjRXI2eWg2OEZjaGhGVnVr?=
 =?utf-8?B?NFZDb3UzUDJqeEkwWE9lZ08wRHordzU2cXVBQmRnblE1SUM0R2ZGMzdLYzhO?=
 =?utf-8?B?S3NmNktJQzI1bkZrY1N5K2xtTU9aZmc0RWl0R2FiL21STjluc1VuMDFtMmt4?=
 =?utf-8?B?WU5TYnlONXA5V01oNGpMeDQ3S1pZVEZ1cGFsOHloMDdybHVmUERpam1wSStP?=
 =?utf-8?B?bnIwbSt5VXIvSHkzSHBjNmpYT3NMNjBNTUJOalZ3TnpFRUYyUUkrUkdSaW4w?=
 =?utf-8?B?SEU5eTJkM3NmZEdDMi9ZQ1lheWNGMHgyZmFSb0VKWWluSkZ1dC9mSVNXNG9C?=
 =?utf-8?B?WEFCZUsyeHo1ak8xaVJRN0UyY1k0U3lYcXBldWpqaHZBOEwrQ2I5ZTBMNmN0?=
 =?utf-8?B?UXFEOFhzNnJMK2k3bGthcVI0QmJMZXRwSVdWZmNSWkh5U21ldllLYUpUa1hs?=
 =?utf-8?B?NGJZbmJLQk9EQnhFamlId2JKdUZiNVhJOHNYZWZkdkpsL3A3TmRSOW9jL1JQ?=
 =?utf-8?B?V0ZsVHBjMXE4QkNWdEUrTkRQOVhSSmdxS1UxUEpjY1pLdiszcHNNck13THlR?=
 =?utf-8?B?ZEhUcHloL1hlemtQWktxbkwwd0lvdkhNT0JYOUkva1ZQdytBZkFxNk84bHIv?=
 =?utf-8?B?MFhQUzdUZ2RSaVlQMlk4SXVFdUJYdTJCTmJFQ2NFZUV0WmFDcXpOd1ltelp0?=
 =?utf-8?B?anl3VHZhem9DcEZuYitDbE9iWTliaVZLRldVY2VrcFRUcWlOQlFsUmtMM0Vx?=
 =?utf-8?B?a3N5dTVmMWhlaWM5aTdHQW5HK0N3M3d5NVNlNm5uYzNXN0oyV1RpYXB2bUVN?=
 =?utf-8?B?cVBnZXJLWHk1V05GbEgveE1oQ0pqeGg2MEFKeFNFczFHeVdxblhrK0RYQ3Zs?=
 =?utf-8?B?OW5YRHRCSWNMQzJmMm5iWmlWcWZsWEZHZ1UrY0kxQ3JRWEJ3VkpYRUxlVGtY?=
 =?utf-8?B?QTd3TUkrdnlPdmtyTWh2RmRLYlVVNmpXdFhoTmNVNHJPbkUyOWtDN213OVZN?=
 =?utf-8?B?M2gyYS9jbk9yNDErczFXY2psLzdlZklJZHNLVmNmSC8zMzBUQXk3MUNaQzRV?=
 =?utf-8?B?enpjU3pXOUVSaTFoVTJNc0dXYmxnSmdVK0FENUFzcDcwSnA1U0JXT2dIUzcr?=
 =?utf-8?B?by92Zy90Tld3U2w0a1lmd1N3WGZwSGdrcGlpUlhURkFEWlNpRnBGMWZIbXdU?=
 =?utf-8?B?anlvY2tLeTNMRVZ2REVpZHVaOUs5S1VJYXJya2hpVUJyMkZEaEVsVEVXVFVB?=
 =?utf-8?B?N2pwaDBFUTFDWVNJMmc5VDE1U09Oa3FST0ltUkQzVGxjN0srSUtwRHRpSC9n?=
 =?utf-8?B?K2dqbzREWGFiUW9tVDdMV3BXM3ArMEJqb3h3NCtieFpZczV3NGMwOW5nYWRm?=
 =?utf-8?B?K0VCRnBtTnlDYWU4SG5xcmxUeWR2RjNUNWJzalZEQ0JSbTM5RzBmMHVjdmVU?=
 =?utf-8?B?cVVHOVFaR2RlcVdIWjRWWTE2ZnBhSzRWZWo4VGEwb3c3Vk16cEVBZktYd1dN?=
 =?utf-8?B?N3Bkdml4OWJMbFFaZytMMFRLTnVvZFN1ckdLVXBVMTVtZmZIYk01MWRCazNM?=
 =?utf-8?B?OFN2blg3amlMQ0dhVk9PL25odWRRdXlsYmxVYzFzUkpOVjYrQWtETmlNSzRL?=
 =?utf-8?B?dG15WndjSnFhdndZcnZYYnYvc01Bc0JrT1A0NWNYVzlRZ20vKzBBdFJRQnZF?=
 =?utf-8?B?NEZHdXRZRzJEYU9XWnhNKzZOTVFsemJTamxrdExkcE1XZjdqazVNUE1KbGhz?=
 =?utf-8?B?UncrbTM3TDAzajB4b1o5ejFheVVRRkl3dE5oM3NFV1R1TU9EbXNMRVMzZm1i?=
 =?utf-8?B?RlArODFLcTQ2TURYWDlIV1paN3JQdnNKd1pjYi8rckJzRzdlekYwcm5GaFc4?=
 =?utf-8?B?WUMvUkxBSzJ3UmFMM3MvYXUvVlczeHQwRzd0VmVuT1k1aytFMkI0ZE9kbjUr?=
 =?utf-8?B?dEE4RmF4MTM1KzFvdFE1ZkZRNDFOSkFvZGhKa09nMXNYdlBWTGVxaEIwYnAw?=
 =?utf-8?B?T2VrUlE5OWFWME1udTRsUllMeHhGWDA3TWhaZWp4aEl6U1hmRmtZbFVTQ1pN?=
 =?utf-8?B?M2dtRS9IVjAzb2NqeFhMRTlYVHQyMlBGSWpJRi9jcEpsWi9jRW53bE5XcjYw?=
 =?utf-8?B?YlJkS1ZtaTBnUTR0MFBNRXUzdTQweXdCcDVFeW1LdFRRcVJPREVxMmdWMzRF?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c093dd50-d83e-4b99-9c00-08dad1faf072
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 11:14:53.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWmaqPD9MzP3rXxExXHZOZUr8jm24GIEfVPRRTpxGSL79eld5W2lTSVtYLrKNMTj6dTx1LEnenMuh+7Cm/B0j7LikPOH3kTSbUTbiut13zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5860
Received-SPF: pass client-ip=2a01:111:f400:fe1f::71c;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/29/22 00:36, M M wrote:
> 
> 
>> On 28. 11. 2022., at 21:54, Andrey Drobyshev via <qemu-devel@nongnu.org> wrote:
>>
>> This commit allows QGA to write to Windows event log using Win32 API's
>> ReportEvent() [1], much like syslog() under *nix guests.
>>
>> In order to generate log message definitions we use a very basic message
>> text file [2], so that every QGA's message gets ID 1.  The tools
>> "windmc" and "windres" respectively are used to generate ".rc" file and
>> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>>
>> [1] https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
>> [2] https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files
>>
>> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>> ---
>> configure                 |  3 +++
>> qga/installer/qemu-ga.wxs |  5 +++++
>> qga/main.c                | 15 ++++++++++++---
>> qga/meson.build           | 19 ++++++++++++++++++-
>> qga/messages-win32.mc     |  9 +++++++++
>> 5 files changed, 47 insertions(+), 4 deletions(-)
>> create mode 100644 qga/messages-win32.mc
>>
>> diff --git a/configure b/configure
>> index 26c7bc5154..789a4f6cc9 100755
>> --- a/configure
>> +++ b/configure
>> @@ -372,6 +372,7 @@ smbd="$SMBD"
>> strip="${STRIP-${cross_prefix}strip}"
>> widl="${WIDL-${cross_prefix}widl}"
>> windres="${WINDRES-${cross_prefix}windres}"
>> +windmc="${WINDMC-${cross_prefix}windmc}"
>> pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
>> query_pkg_config() {
>>     "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
>> @@ -2561,6 +2562,7 @@ if test "$skip_meson" = no; then
>>   echo "strip = [$(meson_quote $strip)]" >> $cross
>>   echo "widl = [$(meson_quote $widl)]" >> $cross
>>   echo "windres = [$(meson_quote $windres)]" >> $cross
>> +  echo "windmc = [$(meson_quote $windmc)]" >> $cross
>>   if test "$cross_compile" = "yes"; then
>>     cross_arg="--cross-file config-meson.cross"
>>     echo "[host_machine]" >> $cross
>> @@ -2667,6 +2669,7 @@ preserve_env SMBD
>> preserve_env STRIP
>> preserve_env WIDL
>> preserve_env WINDRES
>> +preserve_env WINDMC
>>
>> printf "exec" >>config.status
>> for i in "$0" "$@"; do
>> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
>> index 73ce2c4965..d9567836f3 100644
>> --- a/qga/installer/qemu-ga.wxs
>> +++ b/qga/installer/qemu-ga.wxs
>> @@ -110,6 +110,11 @@
>>               <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
>>               <RegistryValue Type="string" Name="Version" Value="$(var.QEMU_GA_VERSION)" />
>>             </RegistryKey>
>> +            <RegistryKey Root="HKLM"
>> +                         Key="System\CurrentControlSet\Services\EventLog\Application\qemu-ga">
>> +              <RegistryValue Type="integer" Name="TypesSupported" Value="7" />
>> +              <RegistryValue Type="string" Name="EventMessageFile" Value="[qemu_ga_directory]qemu-ga.exe" />
>> +            </RegistryKey>
>>           </Component>
>>         </Directory>
>>       </Directory>
>> diff --git a/qga/main.c b/qga/main.c
>> index b3580508fa..10314dfe5d 100644
>> --- a/qga/main.c
>> +++ b/qga/main.c
>> @@ -82,6 +82,7 @@ struct GAState {
>>     bool logging_enabled;
>> #ifdef _WIN32
>>     GAService service;
>> +    HANDLE event_log;
> Just for the sake of uniformity
> shouldn't we close this handle at cleanup_agent() similar to wakeup_event ?

Sure thing! Thanks for your note, will include that in v2.

> 
>>     HANDLE wakeup_event;
>> #endif
>>     bool delimit_response;
>> @@ -324,13 +325,14 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
>>     }
>>
>>     level &= G_LOG_LEVEL_MASK;
>> -#ifndef _WIN32
>>     if (g_strcmp0(domain, "syslog") == 0) {
>> +#ifndef _WIN32
>>         syslog(LOG_INFO, "%s: %s", level_str, msg);
>> -    } else if (level & s->log_level) {
>> #else
>> -    if (level & s->log_level) {
>> +        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
>> +                    0, 1, NULL, 1, 0, &msg, NULL);
>> #endif
>> +    } else if (level & s->log_level) {
>>         g_autoptr(GDateTime) now = g_date_time_new_now_utc();
>>         g_autofree char *nowstr = g_date_time_format(now, "%s.%f");
>>         fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
>> @@ -1286,6 +1288,13 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>>     g_debug("Guest agent version %s started", QEMU_FULL_VERSION);
>>
>> #ifdef _WIN32
>> +    s->event_log = RegisterEventSource(NULL, "qemu-ga");
>> +    if (!s->event_log) {
>> +        g_autofree gchar *errmsg = g_win32_error_message(GetLastError());
>> +        g_critical("unable to register event source: %s", errmsg);
>> +        return NULL;
>> +    }
>> +
>>     /* On win32 the state directory is application specific (be it the default
>>      * or a user override). We got past the command line parsing; let's create
>>      * the directory (with any intermediate directories). If we run into an
> 


