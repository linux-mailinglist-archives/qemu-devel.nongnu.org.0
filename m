Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19B477040
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:29:40 +0100 (CET)
Received: from localhost ([::1]:52146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxox7-0002Ox-Lk
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxovj-0000yY-B8; Thu, 16 Dec 2021 06:28:11 -0500
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:59232 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxovg-0004t2-MJ; Thu, 16 Dec 2021 06:28:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hScK1QXYNrTgL1/QA31BZApaL1oGW168kat1qywKgytyd1NPt+CuuTjOrPYn8NZLMbKpDpkV84v0B6yC+FvyKSlUOw/xzU5P4XAY0T3FNh1GrSoumHlngiHXVi1sWAvSuarPebKghUy/U3R9MLBrn2UmoyF/dCBfaeQBkzX1p2oqmQJZPamhws03qDiwc1puhR/eRqQHwkLW6aFBPOa6XATG0B6rr/dAQubYj7FDfwm9cM/U2ir59sJt261W79N/4wUfd6mwuXpzmtGW+2xx/BuA3x/ZFTdmy2IT3aFgh1cYC9ntQsWhU+OjQOmrENVvkhVSq216WtZ07yNXDhAl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1Mgc2BuYwG7tThM9r3pLzMCd1X5b37DCyBTmMoGkNI=;
 b=iFlcL+svDHteVmbDNo3kpxixA37VJgcVBfC4hVBzDZjAjXc+LYTJW1TewNQEh+f2bqECSQ3CJjj0QcgNP6RyjiMhvZZcVruHBaNFi4paDXDY5sY57n5r7lepBTYXL23+Qd8rFAd3qY+5ZkvDYaRBOltYOnaCyGOGvRflGDoNxE6mjUr+yPUH2l5iVCJejcgCmKj6WHZXZ4lDN9xGRMLFmaucCcf5hXpOEd3va009ynCoMwHb9jGnFxPO/r/Z+1Z/Xox4EGTBlcXT/I1s1sHSWQQdcWoxnMQjNGlJz8jCTzx+meTvk3eULieOmVTq5SdWVIxWsGcRtw6TsGzhVXnQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1Mgc2BuYwG7tThM9r3pLzMCd1X5b37DCyBTmMoGkNI=;
 b=WZn9si1fFz44zj+nvv/ZRIHINNN4wIRpPJXJiXQHwn4gUXQGMy/Cjh/dL63ts5doHVlIrdvSFORlpw+grPlygdgvJVfh1rxAM7vtiGoUiKG+npmpC6kVLQf2YTtuN+RP1EsMXHRzTUmhWfKgHnjk75YzgTElayPc2ls5/Y3nwyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3186.eurprd08.prod.outlook.com (2603:10a6:208:5d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 11:28:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:28:05 +0000
Message-ID: <f4c3fc19-7e6e-13d3-99dd-7d7c00002f16@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:28:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 22/25] python/aqmp: copy qmp docstrings to
 qemu.aqmp.legacy
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-23-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-23-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:28:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8821c26-8f90-441e-0ed2-08d9c08720ac
X-MS-TrafficTypeDiagnostic: AM0PR08MB3186:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3186F81CD13A15AD6A9B8DB0C1779@AM0PR08MB3186.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GImlZE3sw0qreAAQvO2Wyo+0tRG3WI1pT6xOpDrbf+tzdoleN0jD7rLQLI+ISAWlUcGWxDBhLrfPqATAdcNzvgr1EKKzImMwJbu7i/xSrcTJ0u+WJFHowyhGsODLN1oRlYq6pcY92IndNG+Ro3HN6+8RLdPbYVC4z9cEH+Apb12sO7Ee5toeggxaMD9xsR9V4MXa1vYi8BLleRplWPXfPCxsNLH7pMfsCZtQOMMgikkDYaPrxAH7rxUbD2tI4XBEe6GgMOLA/l1PU3pNaWrJet+/S2RcZHwv1InWEG/SCtOqBGVnzvjJ6ntFJK126Xz0VE1Q63dMzfavcHHidZ0DoOcxcfxzz3ujhloJhsFIioLgQwBBd1U8yqZdrpPLnoHk+OKypSeCfMnXqFwvX8hfYmdu5p7kQBie8VLmUu07eJiDwtoJuyTJPa3tWctaJWQ0UjNA3Ryd3i41EM6Vr6e3kbMzsclLw8GEvd6EcuMhuJ5KY8Gvb7FBAAzXmVTATfc8vzgdizNZWVVQRdqiVQsWzzCE1kRc3aLmrxRDBw/qn1FlU8HLuUt/ZEf6lbqScAuwn+UeI0+ubhwNGmEvOUA07/4xpbMR0t5beMqx+NLlCUBADPwdEa6hrnlS0l2tjPr4PITPORoEcLgFpNpMuAzso6v3tsQ5trfNjlL03FXv3lHJ915mp91CJ/XOeeW2IM2PouZjQUdrGiskrW3gwHS2CnXVLp0tbNXzD5BiE8d1uOBFjhla695ip7CIJIzmxm5+DH6BGjSUm7RcfTxNXMARug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(4326008)(86362001)(38350700002)(316002)(7416002)(52116002)(16576012)(4744005)(66556008)(38100700002)(54906003)(508600001)(6486002)(956004)(5660300002)(8676002)(66946007)(36756003)(186003)(2616005)(31696002)(8936002)(2906002)(31686004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnAvQ2lpUWVhVjVHTnZ0Wk5abWEzbEY0U3UzODdLeGdGRXk1TVhZOUlSUzJr?=
 =?utf-8?B?eGJTajk0aGc4LzRHMmc0aFc2eWhGQnFjVy9EUUdiOS9jK0JoK3g2eHV5Zzda?=
 =?utf-8?B?QVE4eENUZHBsV3BUV0VEcjYrSUxqQ013OVlMMHBTWDRraVhONDBiQTc1anRt?=
 =?utf-8?B?OERLWXlMc1JWVVp5ZDkrVC93d3NKWCtBN1Bqdy9XbUYzTjJqUS9oMEdaZng5?=
 =?utf-8?B?aTR6YUQvbGhYbDFESU9iLy92Y2Y5WVVSUU0rU3VUdUNoUmw2NVN5MEZQQ0Qv?=
 =?utf-8?B?a3FwNFRCK0JQNUx5RGtvRm1FMFo0Z0tWUkRJL2w4WXJlNzZqZVRONmd4cTQy?=
 =?utf-8?B?SDJMaUxLMzJwVDFmRkJHeG5HY0I1VnZvd3IzZCt4cjdiYi9rNlF6eERVTUI0?=
 =?utf-8?B?dmZBblNCODROOFR1NkxCNUl3VzFoZ2laWm42VXZhcHhmVUIyYndHNXNXK09C?=
 =?utf-8?B?WEhKbGRXeDY4MndqdndDYUN2Zi9mRVJNbUxoS0pUMGpHT2VpVVlHVUF2MXJz?=
 =?utf-8?B?dldieFQ3WEd5ZjFPbXlvRnZST0haVGtpSlYzT3BodXd0ZWR4b0ZWSFBTQzFL?=
 =?utf-8?B?aG1yWC9seHNuc3dEY0pRaTEraXREY2tMM2ZYYkRldWd3aWhWSmZJcno2VWJw?=
 =?utf-8?B?cWRlc2tEUVY4bjYyWDFqbHd3ZW9uQlVtaWdDa2Zvd3VGOGc3SDlvQStSK2hn?=
 =?utf-8?B?bitCcnViN3RRdkRaVnFMQkY3aXl5UVhTRSsrY250NmpHZjRXaHBuL2kxMlQ2?=
 =?utf-8?B?TzZIT25DbkVxOXI2YzZwaFpkL2IzcVVUOVpkS09MQTBrbUlIaWRYSFEzdjI3?=
 =?utf-8?B?SzZhd01DVFVJZGpGc24rWDlUc2RHTFNINlFtcVkrbElSZXc5cXhUM1JtcUND?=
 =?utf-8?B?UEptVHlSYmFqRjJwNUdITkJnOXpEckJVQklka3hoYVVzS0RzM01SQTRRZTc5?=
 =?utf-8?B?YzlFSGdleXVxaEhCVWlNRTlpV2RZREVKYk4ycSsvSUswWVVNVkRjNk45OHRP?=
 =?utf-8?B?WnV2QWxuWE1meExOYVNMRTViTDF2RnBZekluWFpZWEgyWDJQUEduMDc5Njg0?=
 =?utf-8?B?L2Z6TFYvWGVzVStwbVRybW55YStpTE45VmFtUnVJRjlmc0dRNXZIY0VSMDNB?=
 =?utf-8?B?cVRxczA2bUxUSlNEeUhEYW82UUxVaHBkTU1oc3VDREJLM2prRWUxcVl2RTNX?=
 =?utf-8?B?VkYwOU9lK3FnQmdVWHFmeUV0ZWthM0xjaE01TWsvWHlFTnJIa1dxZU85d2ZV?=
 =?utf-8?B?S21TVnc4VlgzOWhXanB2Y0Rra3gvZlNKQUd3WmNuVEZKLzFUVkxrSGNaS0hK?=
 =?utf-8?B?TWFvanp6M0tOQU1hQnVMa2VCMWpLV0ZuWUU3MG0wOFppYnVuU2tHTHoyc0dG?=
 =?utf-8?B?UnZYdEx4MmI5YTJ0ZEE5MmRsa3FLdXNSNTdYU0ZYTUtOUWV4VVdtcWpMcjBP?=
 =?utf-8?B?Z21ZS05DWmxMOXQyZ0FCVk9IcVloeFJ5M2VrK0J5OVBRSFlWeFpuY3BYOHdG?=
 =?utf-8?B?Tk1Tc1NQbCtmS2xXSjBpMEJJeCtiV3dKRHJYaUFvYks0Y2RXUEtGcERNUE5G?=
 =?utf-8?B?SEJYbGFOeXdZOEs5d1FaZmplMThBSVU2eVJlM0NERE5WdGZjSjh4WlZpbExL?=
 =?utf-8?B?TFdPRlVZblBmeUpiYzBTOXlIK3FWckYwT0NQb2cvUnBQMVhtNnpvaStlVGtZ?=
 =?utf-8?B?dVF4Rnl3Q015anRjY2p6SUpVWmJBM1Z0V1VRYXVIQzhMOHgxL090eFBuOWF1?=
 =?utf-8?B?bndxSXJJcklMNUxsbHVBdEU1Y2JmUktXVVhDWmVpbEJZSktCQStXbTJlLy84?=
 =?utf-8?B?VEJLN2xOV3Z2ekQ2WVN1cWV2d2RuLzJIbHR2TG5OV3Y0Y3RIVlRNakRlMFhT?=
 =?utf-8?B?cm5ZQ3RkWG44Q1JJYmM5ZytvT2dHTmhIRTBhYmtVdDYzME1RRXREV1hBeEFQ?=
 =?utf-8?B?ZFNwM3dPNXVBZVZOUWQ5a05rUDJhdlRVU0plZGFZYUZXbXBRVSswMVpBS3V0?=
 =?utf-8?B?V3ZwMGJ1MDFIa09VUE81Y2h6RWZxaWRXSG9JT24yWlRkUE9TOFU0Wjkwa0hv?=
 =?utf-8?B?dG9tTTdsU2x1Rkord1Radm85dnMyKzFJRThLa0hjWTA3TFVocFl3NW9oU2xL?=
 =?utf-8?B?TTVNWnFZZDcwODV6OUxsWHhNaWlXWkg3S3dQdFNWZDFkNzQ5c09BcGtYNkFv?=
 =?utf-8?B?d3NrMTJiWU04QklJaEg2YXZBT28zaFc4dFRqNytRMXZKSzRmMHJoRWt6Nkxw?=
 =?utf-8?Q?jYUh+rTmBnHZpR4nbxMkM7WQ+L8e0Mq8XFblrATII0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8821c26-8f90-441e-0ed2-08d9c08720ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:28:05.2185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XKWrl/Cz0x/wU0bbuqVRYpagDMIqek761Ygwd6SIm0KHPM4xtQyUKBXA1yecLHAPwzKy8jljTTwHZTuY6mlf14GT8ag4bakYZg04tet+z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3186
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.12.2021 22:39, John Snow wrote:
> Copy the docstrings out of qemu.qmp, adjusting them as necessary to
> more accurately reflect the current state of this class.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>



Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

