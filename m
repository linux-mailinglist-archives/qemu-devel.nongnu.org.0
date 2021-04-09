Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A53597D4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 10:29:13 +0200 (CEST)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUmVs-0007kt-HW
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 04:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Yanfei.Xu@windriver.com>)
 id 1lUmUo-0007FO-9J
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:28:06 -0400
Received: from mail-bn7nam10on2045.outbound.protection.outlook.com
 ([40.107.92.45]:53121 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Yanfei.Xu@windriver.com>)
 id 1lUmUl-0002Y9-JI
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:28:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUqwya7szQL2m4vuS3mJv9TpLP6l09Ejrt4Te9JwpvtV4zQfuQeXlCA+SSvKx/o6v6tNvvP5uu2atgyA+tUSYI58tfCNfat9dVLzqETdX4CtZ+skgDkmtjKQRauUJpK1b8EzIs3YNWHWhaczERaOfahgru8LtRTf6inQUG9UBc7iOFaK0gjkesM/P8JBxF6BLTf7k4GX9J+HBNyrFyAYBVtmkziVSgC7jQI2rrrj8V5T2WEOx9kEbhwMf9cWUl8sUZp3813dise17AwsMNgodCH9bSNlcllzzFiJvyzC+JqDc+4PUUeipFGcIIApQsJIJIWKcEJSEbLrBTGrpTOa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaTo4jLmWWjvgrsgXWAF2eMyn1wrO3DvH5t1nCwqNeo=;
 b=IktT21tYmXjGtlfguz+1ksALs4EYfLrnvjPImbCeP2sy/Dx2VCEo+JqALFL0aggqp+b0roW+b3k/AljIq3MTCh549ZhV2SUbTgy79Meda3mOyJH/oxXbatKJI93owvnvUbe6ZL2Buk01Kn/ZLKgHibWVbfCFVe29RfMslvL5dNeBwS+Xl7+CGnZpEMLzGn0n8JCB4tXjVVXzkymj7T2oCa+Ls9wO1yB2wWX79UqjAZq0IFsQ1zb3/rfqLUHvkXKjtSA5eresUobsEAD+Mg3xsEFmZpKQRDFGxuqje5EH/DRWpc3FxD6u2OymqD5BGNmwtM8qmZXpSx1GfkhnJHpAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaTo4jLmWWjvgrsgXWAF2eMyn1wrO3DvH5t1nCwqNeo=;
 b=X3X1Hntw42EOh1nPHVxJ66wrxExv9+oaom/VkRCm+BdqTTrEvEXIbvAJjXgevJWawhB/01Eizki3wHh/aaGGGsfzejCxtfVYuctYPStyc8Qshug92CvOcgzgQhwsKRNjL01+QWL/afa6q1TukOr+pvv/UNVLluVdtYR8c7nHZm0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=windriver.com;
Received: from CH2PR11MB4246.namprd11.prod.outlook.com (2603:10b6:610:40::17)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 08:27:57 +0000
Received: from CH2PR11MB4246.namprd11.prod.outlook.com
 ([fe80::2137:b1a3:9cfe:d6e7]) by CH2PR11MB4246.namprd11.prod.outlook.com
 ([fe80::2137:b1a3:9cfe:d6e7%5]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 08:27:57 +0000
Subject: Re: [QUESTION] qemu: how to control the switch of floppy drive
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com>
 <ab55b868-8797-70da-3e04-8221bc1fa01e@redhat.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <1bb1cc11-cb57-0006-ff41-04f283fc3e06@windriver.com>
Date: Fri, 9 Apr 2021 16:27:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ab55b868-8797-70da-3e04-8221bc1fa01e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To CH2PR11MB4246.namprd11.prod.outlook.com
 (2603:10b6:610:40::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by
 HK2PR03CA0064.apcprd03.prod.outlook.com (2603:1096:202:17::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.8 via Frontend Transport; Fri, 9 Apr 2021 08:27:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68561245-7e8d-4208-7a9b-08d8fb31611a
X-MS-TrafficTypeDiagnostic: CH0PR11MB5235:
X-Microsoft-Antispam-PRVS: <CH0PR11MB5235420B39CC3F559B0940B5E4739@CH0PR11MB5235.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9lBQLQ8LdVZpcjq4JtlQShpoayxidNUE7em4RD+tOHkLaNoTZeQFoUegtY2bIJORcampJY3w/kOZiyQJhK15WXZasPioTSSdFESxcrtZSKk6vEkw5WVmOJpjIPQcuW1/52N5QklvyXwV7ax+q9Gt3ZOR0A5mGTRLc1unwg0dL5o35e58k3npQgMtSOEFoxB7uuCTumYzNowVBTVQ+1SDROgU7G7SHZ1G742s5P5jru+gnXmJpF8aQdDxFhLpxPI7NMo5FJ3PALAZbU6oSyIic0AxdFl+0isqrNHumXNUxH0JjhmetQ+A5/iFpsKkxt8QdJ7csi6R2bE9bhQor98f6y6+TyauRy3RIC0wRW0IscP40aXDRUegNvjCB/BQjXQDVe2m8qeX80d9DfT2zAwMfQMtm6wX6QMIXGfrkS/k6dKCE/Qe+6So3TA3HiKz+XOFJaw+1zydc0gLGUPpxEULWdfESyLT6rlfIt0TK7CEt1B30WIoV8bzo6db3tQBWbcvvmC/5J7E/O+DmrxaPZmxbJHzPCW/7WJCvZ1aA7QGL2SaVc3yfFs8Oz6aNHc/9n72kzuN/jkGryY5OQhehLOOcZHidTJnhwqGlvoUIoD3SktExL55EtWnI2ZKsuIdPa/EAl8ID0xisDO2Af0tZ2TVpMoyEF4IL1NGozAjlImZPwDCekMbsoaAzo5Jet4ph2m5gFKbLEmtcb+1J3NuW0LKLESiSQlHXbhO2GuHq6lEj5I3OhTO0a8GAHr0ZWPVre66GNRmdGfoGPucJkEQ4Adub9PJopJSXUFFXeST2j/PS833+igyite/a9ER1rBmWvmfTSntPG3juaOTItaoYG9EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4246.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(36756003)(956004)(26005)(6486002)(2616005)(16576012)(53546011)(16526019)(38350700001)(6706004)(316002)(186003)(38100700001)(2906002)(86362001)(31696002)(8936002)(52116002)(478600001)(83380400001)(966005)(8676002)(66946007)(31686004)(66476007)(66556008)(5660300002)(6666004)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1ZDZGhtVlhXN1VES1loR1ZaSU9BdXlhcHBVWTgrbHhGMUJxdXNtWTNrQ2Ev?=
 =?utf-8?B?T01UbEFvM0hTYUVzNGZHcnJzVldycGJkVGlYU2ZNZ2gyZCtUUE5yVmlEVmRZ?=
 =?utf-8?B?b2VYajJrK2I0NXRoUDJPYUptZHo4a2JQLy9qSS95aDY0bVVpT0dscDJ5dEk1?=
 =?utf-8?B?OFE4WUVBRnB0aW10S3pwSHJWbDhDQ0ZhN2d2RlpRdjRPNVl5c0gydm01Z1Vj?=
 =?utf-8?B?ay9SUDBMRFAzUi85eXFEZ0NlVFFwRXRrM1dpS1dzSDdBYXFRdTJCaVRnbmFU?=
 =?utf-8?B?TUtiYmJUU2I2aXhXUHptK0Zad1IwL1Z4THpNNEdrUWZUbHo1YlRYUWR2YWZG?=
 =?utf-8?B?TSsrNEh4eWhpNE53MG9vL2hVd005L0JSQWIyTzNTYmFuRC9Id3hsTE40YXJy?=
 =?utf-8?B?cHRiV255Z01LQ0ZUL29PbGVlOGNKNU4xOEFvd3Ewcnh4OExNSWdIU3A1TFlQ?=
 =?utf-8?B?dkk1aFBMcDR3SnhPcWRkM0RablMzYUtMdzQ5UG02Y2hZSVhVVlNzNmtETVl3?=
 =?utf-8?B?RjlidGloM1dQSFZ0N2V3L2tKTFpicE4zVjMzZlRYOVRlbVV3TE1tdXJDdVA0?=
 =?utf-8?B?OCtTVVhpTHZ0OXcrK0RRY2h1bXFwWm1XSzg4Y0NKSk0yNGd4MDJ4Q1NKSm41?=
 =?utf-8?B?MFJweTFNUk1wZGxNT2pQbU1udklQamVKSmtkbjNQMU83NFdCdWhIWkNuSk5C?=
 =?utf-8?B?c3ZxaTFXNEFhdDNCeForclNwUStRTGcyWjBlQnMyTVJ2Y1hiWnNFQTFpNnJT?=
 =?utf-8?B?U1NwMkVtRDNqc1RaZVpmTndISXUxZEN0Z2l2c2FlVEN6SVJNeGdLcEM5cHV3?=
 =?utf-8?B?ZTFkMEg5UXB0MC9CYWpCcTh6NE80bVBmcFRWTlpCUWFVVVhIeUFsWFI3b1JR?=
 =?utf-8?B?QzFmUVBYdExEUnMycGxhYkJnajZsVUo3RzVBSnBwaXppRHQ4WkxHc3NkU29I?=
 =?utf-8?B?UlhKVmJkdlRaMXI3RFpjZkEzQzZraWJsU1grZzdEd2N6ZEtZRFNsVlF4WmJk?=
 =?utf-8?B?SldmNGowa1ltTHVZUVN1dllLOUZwZkpXdVBtUzV6RlhmeWZIcnZhRXlhN29C?=
 =?utf-8?B?M2p0YkVEWnQxQkExcWMvemNXSE5CQzJ6K0FJVng5TGdJNTBWeWUvdnBJWHpr?=
 =?utf-8?B?Z0hGb1JkQnhlSzQwaUtQOURXTEFiQXBIQmoxcTdKM0JBZjk1N2dVcDVnWE9o?=
 =?utf-8?B?L3dnczBpTWdKMTBxTlI5RktncEpIV0tTc1JTWFd1L2JmSWVTTVFvU2hBK0pH?=
 =?utf-8?B?d2MreTBQcUVDK1N4N0Z2MGx2c1lxdkUrS1EzUmx0MDZ5MURYQU0vaUh1a3Fh?=
 =?utf-8?B?UG0vbjNnbXVyWWV5ZDZOTXA3N2duN0RHai96UDJCcHYvaTBPY1oxMlphNDZH?=
 =?utf-8?B?dHBvQnNLb1Z1TWxWajNTZ2FIU0NuNDBhUTg5ejFwS3V2cU82dHlZZG9rQkNm?=
 =?utf-8?B?T2lBUllZMnZ1dnVCcHdWYTI1ZGYrWjFYRWEzQ1pnbnRBVG9HZ2JHNkxhdnpj?=
 =?utf-8?B?bGQvYVJMekxYbzMxeGUxV3pxa1VwQ05CTEhmbWNJVG9FaXFuMmRVWHFxSnNJ?=
 =?utf-8?B?dXQvMHM3WWVVMCtHQW9tYmI1MzZMOVZrS2pRQitlVXlyb3J3cytCaTVwRkk4?=
 =?utf-8?B?Y1c5a3FPUFdBZnAyRjNWaEdvU1ExNXdtOHJqMnBpbFN6QS9yYU8zUUtISFZi?=
 =?utf-8?B?dkpOb1QyOW9WeU14OUR5OTJTWE5adDNRQlBLTUMvV0hETzY3bTJON2RoWkNi?=
 =?utf-8?Q?g3PTaXic5ZAAdApaA9nqEyS+OL1Ejb6iQaaVAlo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68561245-7e8d-4208-7a9b-08d8fb31611a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4246.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 08:27:57.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svkMshHN81GVz3FmspZVDTCNVh8PP7jCXSJ3ZIzgievzX6QNmsrcOtMB8XdqOgo+pjjynTsDq+QL6XPiQOyxhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
Received-SPF: pass client-ip=40.107.92.45;
 envelope-from=Yanfei.Xu@windriver.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



On 4/9/21 3:10 PM, Philippe Mathieu-Daudé wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Hi,
> 
> On 4/9/21 8:48 AM, Xu, Yanfei wrote:
>> How can I disable the floppy controller drive when I boot a VM by qemu-
>> system-x86_64? I did not specify any arguments about floppy, but after
>> the qemu boots up, linux always can detect floppy drive and then
>> modprobe the matched floppy.ko.
>>
>> qemu version: v5.2
>>
>> command line:
>>
>> qemu-system-x86_64 -device virtio-net-
>> pci,netdev=net0,mac=52:54:00:12:34:02 -netdev
>> tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-
>> random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0
>> -drive file=/path/to/images/qemux86-64
>> /qemux86-64.ext4,if=virtio,format=raw -usb -device usb-tablet   -cpu
>> core2duo -enable-kvm -m 512  -pidfile /path/to/pidfile_4167420 -m 512
>> -snapshot -serial mon:vc -serial null  -kernel /path/to/qemux86-64
>> /bzImage.bin -append 'root=/dev/vda rw  mem=512M
>> ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1
>> printk.time=1'
>>
>> As I konw BIOS can control the switch of floppy controller on a real
>> hardware, But how can I do it on qemu? And does the qemu enable that by
>> default?
> 
> See
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/qdev-device-use.txt#L105
> 
> * if=floppy
> 
>    -device floppy,unit=UNIT,drive=DRIVE-ID
> 
>    Without any -device floppy,... you get an empty unit 0 and no unit
>    1.  You can use -nodefaults to suppress the default unit 0, see
>    "Default Devices".

I see. Thanks for your link and detailed explanation. :)

Thanks,
Yanfei

> 
> Regards,
> 
> Phil.
> 

