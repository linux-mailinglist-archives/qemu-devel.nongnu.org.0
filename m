Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3266B8B8B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyVn-0001fT-5p; Tue, 14 Mar 2023 02:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyVk-0001eq-Rz
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:51:52 -0400
Received: from mail-sgaapc01olkn2081e.outbound.protection.outlook.com
 ([2a01:111:f400:feab::81e]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyVj-0003yz-3b
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:51:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmP4KGzuQz9GLb8k2ImBP4FJ4uy1GOxXCgM0b/J3AJcYu9YGxUBPssSM4wk8duBXidtcYfsqkhBcNB6yETkoI9HH3dNgtH5vHmR1CCXvsqcDSTIflb1mW+sflecJGhrBfZRP6dhkPxzBqJIFH7PWahuvCOSdNeEFrHSW9rsEIHWTncdCyaSncQ+7zT4/HU9jkAtpTyUTFDUP3xm0HwD5fM7+JL8yJ3AYq+pH++C0WGVVSJQHSuT1OF1uPs8hvtykBCnI4gFhflk0QNkuVuOs99kiujLrGbOPcsL7gQ+JVxvuLOxWUgNdiHN45RhHe6a8p/oIKAFz6UEilwv9YgZBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mTpmkenkOhlH1QHzVK42L4Gy3BBZz2zeiMTuhV3xAw=;
 b=XrjlSJVVPnawgLWSIwdO3hPmcmud0g+l/Nt+q2Om2Lcxi6/4SkuC9NHvRsPyaHwZdu5z0qRaKzNApHYE2UFllby7W6jCugoIqD2KWEKXnVhQizlGkhrJYU7etFjtC19LeqV4rMHfN0ZbZeoA3QcYsV/jyV5yoHjoh+Ed5dmmh6RBktaQH+5GQibuzD3AWAzvQDBMfB3Q91DliC7XULYnvHHUlWnOQLPAB7CRMs6NoaQJ9iR1kCmy7gifBuqXNcmNqF/ggEKjasi+3m+4mAVI6FTGyxaVm+7/k3YMcPPFHMX8NoE1d7EBTHjJV2NAqtTbw6qo/lMRbDLj/QJ9+z2X1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by PUZPR06MB4632.apcprd06.prod.outlook.com (2603:1096:301:b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 06:51:44 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:51:44 +0000
Message-ID: <TYZPR06MB541827F2D233142AF75534099DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Tue, 14 Mar 2023 15:51:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 1/2] util: Add thread-safe qemu_strerror() function
Content-Language: en-US
To: TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <cover.1678770219.git.y-koj@outlook.jp>
 <TYZPR06MB5418B64D371016CCEDE577419DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <TYZPR06MB5418B64D371016CCEDE577419DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [c+q3z5cCPP660Fa/Ji31fvojUKoSSoHvK5OLkI7Pi5Z9hCk81iDxlWG9APrw5TDPzDAnWgkLxws=]
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <8976ee09-205f-5e98-220c-dcecb30a1071@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|PUZPR06MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: a365a0d3-83f3-4bbc-4396-08db245892ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yceUgjHq6AlQbpLJb/UI+9mM3Vk/ZaGb/Cbh8p8+Ud2+53xRsXg2L/Scr6lbVHH1Du9UPDesv/DKSQqwODtgL4xMcKwRjlnuDdPgkq9IXUgCH+EXgnOstz0UjhEkdyZhjQpdzsQBjNZlwJ66lg5eqyphwghU0XN+h2Lqf+3cPURSdNvvx8Mljfky9o0/6OC7KwtDibs+0LXqudemgse7YHinbOybEWFrP7Lei7FKCA+vaMrdtO8s4fyOp/Y3/GLcXvyQ+OAJL5M9DMG0rtYvvDzedcWeVEYUrlp/+Oeg6PXHRMMwT89Ba6nXKYitLRX+x1etyrOe/srp4lmm1/HbSZb2yveDGaOasfjlVa0t/KkMDr8+vdPNnHx0mvX9WB1tHsAwQchdRWh8Y4aLLcMToi+1+3ZvO5fDCudBhHtlTdQ42ZPYE4q9BD3NyFLqeCjnCgnh+ccuW+r7YIMfELymYz6WLX+29ETOO0ublkEUMLJJf9G+mS0tLqj36kWRdguwz9pDyRscbq0jFIEkoRchHEq/1vXUqfDJQYGjgz9zVwL26uUjMcrydsiTnyNxdPd77lJk1oNqGbpQul8YlNwefJoeD1d79AvppwXVt2YOb9r5Arfcb1hJe0jURZZakTNTIuZXbIi7ZwngafzK2v7UIA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxlclVKNDM1NHR5TDArYkVYZWswUDJqamlCYVlSWVJtRDluZ2R4TFJYeHVW?=
 =?utf-8?B?YmdEZm9YM2FVRkdvYkNxck16UkFCSVZJRHhDTnpWaUtSVWpMTTc2eDl2QjV0?=
 =?utf-8?B?MWdJQ2VzL21mL1cvOThsSjhaVE9Zd3VkaFVmL3RSNFRaNlZleVRLbHh1b0JZ?=
 =?utf-8?B?NVRROEVrWktMdG9OTXN0ODJSOXNYT2xwNGgwNytpNy9CTVluT0hqUVVscm5Q?=
 =?utf-8?B?QkpmNWkvUzJvTnR2SHpLS0hrTFB6bUVweU1rZVp6MzQwQzIxVmFQcC9yMnlm?=
 =?utf-8?B?WEhDNWtlSFdaemZCYXZYWGhZNHVYcUFrZkNRU0NPOEw1VWZYT1lWNzducnYw?=
 =?utf-8?B?M1F5MTBxQ3JiYVNiOVFUWDJvR0hDQXZCclowSllIOVA3V3EvU3pjMnJxTU9F?=
 =?utf-8?B?KzZscnJFR3I2OTB6RVdOZHdYVVFsVnFiTEljb3NsZmQwZHJWcmRJTHJ4THN4?=
 =?utf-8?B?SGRva25abWg2c1gzN3VGM2dpY2s2QS9jNzhQWWp3YVpzVndaNjByYnZNT2JP?=
 =?utf-8?B?d0FKUVZKYkYwQUV4TWNvM2QzaFNja3lxeTRDNld5TGt0S2pvQy9uVXRmKytO?=
 =?utf-8?B?NmxJTXFxMGJqSnh5ZWJOTzE5aW1wbmtNSE11NVVQNHJTMmdMVlFLVWRsNTBP?=
 =?utf-8?B?NGVkRUEzenN5Njgyditaa3U0L1Y5aDIvWXYxSjdoT2FWMFREazdkckxNeDZz?=
 =?utf-8?B?ZkczRExUVHRqNUFqMVowUFNXL0wzZHJkRDR5bmhrWklmNWZYa2hBYVNBYm9a?=
 =?utf-8?B?RTFpeUdHSzlocVY2NWV1M1gwcEpnOW8zZjBCdGR1VHh4cUNUY3prZ1ZzenBH?=
 =?utf-8?B?c2tDcDRiZHRaNmdzKzZlUGNZYm9PZUVaYzV6djA5UjFIZ2pMa2RNanh0L0dW?=
 =?utf-8?B?OEpVN1AxQTZmZGhCWW1RNjZHdVhPendYbmQzcGhDZEJZVFRqdVVoSUZhR3lE?=
 =?utf-8?B?NkNhdkd2SGhWVnZ0VTdtRkE2b2Uwa2M1ajhVQjB5Mm5tUWlIZXlSMkFTM1pI?=
 =?utf-8?B?clVPWU8xYjNTODVkU296eGl2MlppUTdTZHhlRkhhSjFFRTk1N1p6aWFEdVA5?=
 =?utf-8?B?a0JMNUEydHhZa0g2dlRKVDREM1phR0JHMWpBRWNRNVZSd0ZHclo3djg1b1E5?=
 =?utf-8?B?Vis4d2N4dE9KY3JQa0l0TXF6WmpOdFBIZXhMOWtUcnRhRlVoTjBGQWFWK1pH?=
 =?utf-8?B?ZnkzNG1QQ1J6QXdTcFo2QlpqTjYwN0QvaTQ2YitiS3JSSGswMHUzOHRvNkF6?=
 =?utf-8?B?ZzUzY3cvOERJS1lvU0prVW1QUFB6dGY0VlhLVFdDMllod2praVFrakhWSW92?=
 =?utf-8?B?VDZ5akVJbGEyUlpoYlUyMUQrdWlQRSs1VzVWeS9GTmZwZFhPMXJ4WUZ2SWFu?=
 =?utf-8?B?ZHNsb3BQUWg4djhZbHlXZDdaZi8zeDErWjFqK2JGNEFnUTNMVC9DczgxRlJS?=
 =?utf-8?B?dU9JTm9kMDFIR2FKNzY4NEZ5ZTEwMWFuWEZXTVhpNXpGc2VMdUdvODJrVitl?=
 =?utf-8?B?RENONDVZNWVFV25jeWg4YllXV3JFbGdRbUpQUlVYdXhZL3FPT2xOWE9ZRGNE?=
 =?utf-8?B?T25xaEhhNEdBNUMrOTBBMnEzUkNxdGNoMy8vT0pETUx0UE8ycGQzRnFVUjdP?=
 =?utf-8?B?WHJNK3ZtdGJYcElMRGVHazdXeFNNWWpEQTViKzY4TU1vc3VOdHpGWE1GT25u?=
 =?utf-8?B?Q2hib3NqMElJOS9tQkUweU9nVWtQbHlieDdZVVY3R1lhaCtnSHRvT3ZoYytQ?=
 =?utf-8?B?WVlIUms1Tm9iR0VaaHJYZ0g2Q0ZrVnBuUEJSUlFFZUJWM2YwTkxXV2l6RVht?=
 =?utf-8?B?UXpnU1N5cTRvY05aZjZIdz09?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a365a0d3-83f3-4bbc-4396-08db245892ca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:51:44.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4632
Received-SPF: pass client-ip=2a01:111:f400:feab::81e;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I'm sorry for sending ill-formed thread twice.
This problem was because the SMTP server overwrites Message-ID,
and git-sendemail does not reflect it to In-Reply-To: and Reply-To: in the header.
I will test well before sending the next patch.

The original cover letter was
https://lore.kernel.org/qemu-devel/TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com/T/#u

Thank you.

On 2023/03/14 15:40, Yohei Kojima wrote:
> Add qemu_strerror() which follows the POSIX specification for
> strerror(). While strerror() is not guaranteed to be thread-safe, this
> function is thread-safe.
> 
> This function is added to solve the following issue:
> https://gitlab.com/qemu-project/qemu/-/issues/416
> 
> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> ---
>  include/qemu/cutils.h | 20 +++++++++++++++++++
>  util/cutils.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 92c436d8c7..0bcae0049a 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -117,6 +117,26 @@ int stristart(const char *str, const char *val, const char **ptr);
>   * Returns: length of @s in bytes, or @max_len, whichever is smaller.
>   */
>  int qemu_strnlen(const char *s, int max_len);
> +/**
> + * qemu_strerror:
> + * @errnum: error number
> + *
> + * Return the pointer to a string that describes errnum, like
> + * strerror(). This function is thread-safe because the buffer for
> + * returned string is allocated per thread.
> + *
> + * This function is thread-safe, but not reentrant. In other words,
> + * if a thread is interrupted by a signal in this function, and the
> + * thread calls this function again in the signal handling, then
> + * the result might be corrupted.
> + *
> + * This function has the same behaviour as the POSIX strerror()
> + * function.
> + *
> + * Returns: the pointer to an error description, or an
> + * "Unknown error nnn" message if errnum is invalid.
> + */
> +char *qemu_strerror(int errnum);
>  /**
>   * qemu_strsep:
>   * @input: pointer to string to parse
> diff --git a/util/cutils.c b/util/cutils.c
> index 5887e74414..3d14f50c75 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -131,6 +131,51 @@ int qemu_strnlen(const char *s, int max_len)
>      return i;
>  }
>  
> +/**
> + * It assumes the length of error descriptions are at most 1024.
> + * The concern of write buffer overflow is cared by strerror_r().
> + */
> +static __thread char qemu_strerror_buf[1024];
> +
> +#if (_POSIX_C_SOURCE >= 200112L) && ! _GNU_SOURCE
> +/**
> + * In POSIX.1-2001 and after, the return type of strerror_r is int, but
> + * glibc overrides the definition of strerror_r to the old strerror_r
> + * if _GNU_SOURCE is defined. This condition handles it.
> + */
> +
> +char *qemu_strerror(int errnum)
> +{
> +    int is_error = strerror_r(errnum, qemu_strerror_buf, 1024);
> +
> +    if (is_error == 0) return qemu_strerror_buf;
> +
> +    /**
> +     * handle the error occured in strerror_r
> +     *
> +     * If is_error is greater than 0, errno might not be updated by
> +     * strerror_r. Otherwise, errno is updated.
> +     */
> +    if (is_error > 0) errno = is_error;
> +
> +    strncpy(qemu_strerror_buf, "Error %d occured\n", errno);
> +    return qemu_strerror_buf;
> +}
> +#else
> +/**
> + * In glibc, the return type of strerror_r is char* if _GNU_SOURCE
> + * is defined. In this case, strerror_r returns qemu_strerror_buf iff
> + * some error occured in strerror_r, and otherwise it returns a pointer
> + * to the pre-defined description for errnum.
> + *
> + * This is the same behaviour until POSIX.1-2001.
> + */
> +char *qemu_strerror(int errnum)
> +{
> +    return strerror_r(errnum, qemu_strerror_buf, 1024);
> +}
> +#endif
> +
>  char *qemu_strsep(char **input, const char *delim)
>  {
>      char *result = *input;

