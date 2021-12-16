Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E7476D88
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:39:03 +0100 (CET)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnE6-0008AR-97
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:39:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnBj-0005eY-UE; Thu, 16 Dec 2021 04:36:36 -0500
Received: from [2a01:111:f400:7d00::71f] (port=49888
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnBh-0005tf-6E; Thu, 16 Dec 2021 04:36:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSPYch71KgmlscY/ZEcBZWrD2C0FdBDBODzMmm8p4o94xBTrd8blbADAOOclGR7H00g0LFMaUDKi/qjWEJ9aja1mV1usl6DgGLpxhv6fuAOMSQ2PPMA++Mq+X8IkFdfndMWn7eSR88xJAUeZ/Z2xjxF6mxnpUd4QfwmUcgHPaNJB+2U5Ar8J4ucQqgp51EuWCdldOLs2iSuu5/HamqW24eD88WFXhyQdFFQZqFN34KrA4141W1mDzEhDYZG1+0oDZAQCFG+toN2EX2i1mDTt//vmuhz2Zp0OaxF2uKphYDCPhGRdfpKZDWIGZai+Mmf9UfwJYOOvRJF2uTPyvQybiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq5YhSHKro9F+zMSqHI/2p27xOlfKCSi4Eo9Ps4fJWs=;
 b=c9MpokFFoJXWHv06RV8KnMzwAcmrRY6WQ4A+I5MQznexorD0TGq+p3YcpjCyhB4nKpHZDRR+ICx/n+/ls8YfwvkGRmNq26vzUMHKxlt0Q5d/ipyRCkAKOi18BC5dxJMhMZfMg4ofAlbXIrGX7wo0PEpqm0930CEeb9JhG1S3iViZ+dOr1gv1xMk1GFvXWJ2n0v1uIJVmea6CvFED+RnxoZGv91TLF7pDQws1Jo1VNpIawk6vZPzVKuca6T6/vQ1Ss5bCCD+cyWVdC+T5eCkpOzORrS0vl3V0oT5SadVBzNvzpTd5Xe/Ho+ebwswI55i5rnJfAk7+Tfam/WtlMG36Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq5YhSHKro9F+zMSqHI/2p27xOlfKCSi4Eo9Ps4fJWs=;
 b=q9PBYKPuC+M37wbuGn1FkkK49/DLL6geFHPDTPXgJMwyDE1ZzBlPKLH3CuIGvxdRZq9eE6r9eDdcSieAZtV4hUUpJo+m0IE9LFeYFcQ6jpyPhY/K/LXpYhFuwB4rSPNMTvozGDcLs91q1ZQ1GMPHMD4O+ZgyhqX+saGBe/6FxgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5762.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 09:31:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 09:31:21 +0000
Message-ID: <bb4ea49a-1442-bc71-7ea8-262b86b692ab@virtuozzo.com>
Date: Thu, 16 Dec 2021 12:31:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 01/25] python/aqmp: add __del__ method to legacy
 interface
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
 <20211215193939.3768033-2-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 09:31:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79387b33-088c-4436-b696-08d9c076d1e8
X-MS-TrafficTypeDiagnostic: AM8PR08MB5762:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB576289045109DA02710B98BDC1779@AM8PR08MB5762.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dMASxx56t1olYUjySWpUPohnsfAaqTrdvUVkpNcSQGy+JIErPTpbQjrqeUvL6uEIjXjGueO1AXFobFLY1zDlA8Qjw63AyN2FLa1vedlUJzZYEyaN5agMGBQuYmw476LOw7hNR181DV44t9a0X6I1Db+WXhTgn6v/xr7moR528xwsRzue/ruDZ9wiyV5e9vcCa5QZm7CYzFm0jAJ3GoW6WVY+T9hcuKQOxPSgsIqNUgxC4h2UURaNOpJ2D8qnVbQq9uXTolTjlZnKCO/avH7U/u4fyhsdzJKXNV/PYfclIH9JEaVM2RQWAJAlR1AzCLCvIETm091r4vrkrTu6pXPM+n6xBbcUZuWRrfkTHltW9gQsL9ENMhF28yRC+gYOu8k0GtHBhxzCKyniPS0rb7T9AE3e/uIE3V5WZKBffA+FaoQh/icYzbgfmeaJ5x9hx6CsbbYpH9E52RJBs4cGGcIq6IPrc1W4A+0kzNa8CAcI5XxEnX7lt0d7zoVg6mELfkPQm5ezZjy2JKK2Iv0D/bonlwQFjiNMAya8zkbOGDSsPE+Q8RomSN5dw3iV78viMAALe874zkjRS8UPMDdk4lY0r5mdJlI5DR41JrPStUdRPeYZjU+ZdHOXXRTfPXRibogab/w1XtIZikyyxLAHK97GX++VGUn/jUaF/ToWYDulYE1+TuQLvRNab4N0+wds+83fMwQbvOj1usahA+Bqut0kRiS+hnzgsw84a6Oa1D5v0oSwWRUXi8VhaIOvcORPvrX8gDSTJ2NFPmJr2TJI2PdXqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(54906003)(36756003)(31696002)(86362001)(66946007)(31686004)(83380400001)(66556008)(66476007)(2616005)(186003)(38100700002)(316002)(52116002)(38350700002)(8936002)(16576012)(7416002)(8676002)(508600001)(5660300002)(956004)(2906002)(4326008)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3hpc0M2d0tUQzVnd1YzUy85a2hFY1h2djZtWmN6ek91Z29GS0JNdUQ0Z3Yx?=
 =?utf-8?B?MG90U0JVQ2hmYWdlMjlPc0I0eWY0VUdCSGpic2VzVkswcGhTRGY1NDNHY1NT?=
 =?utf-8?B?b0xXM3ZFdElUSTJNT2RtdGtrMmpkR2V3QU1DZ05xRkFQRjVJWEkrL1pkem9o?=
 =?utf-8?B?Vi8zRDhrOVNwTFhyVzZLaENuY0pMcGNtYlpSdUw4dkFBYi9qOGxBclpPME4w?=
 =?utf-8?B?NENhL2k0ZysxaGFLSzhIREUwVm0vaTdZbGdjc1ljd3lJTlNqTUt2MTFNQXkz?=
 =?utf-8?B?VXphNjRRT0R0a01rRzNVTkN4U1pEanpROHdJMExINHRmcHhoSVdSM2JGZHo4?=
 =?utf-8?B?REx2V21xeCtBNzJOc29HMWZmWGk1dGMwTWJxbm85SDR0T2dWZDVybUZrNUNT?=
 =?utf-8?B?T0xWdUp2UHoyUXpCYW02WkpwOEJTaVd2SlJ0aUNoeU9OSnFSZWFzZThrVmUv?=
 =?utf-8?B?TzVWa1FsRC9EZEZFSzBuUjJEZmxyU1pibDU1NHMvdkljOWRNcG9zTFhDbThp?=
 =?utf-8?B?RXMzNWVYd0ZTK2ZNTVhSYmFxWGYzYS9kWkZGTm00TkVLNnZZc2phREFGNUhw?=
 =?utf-8?B?N0J3OWhpVEJmNndlbFJ2MTFVQWZNRHBUTWg5SUZrM29nNjVIeDluRllOLzJk?=
 =?utf-8?B?UlJramV2aTNYQzF0Y1RlQW1kcW14dzdHcldkUXRCYXo0UFpxd1FhZmVIQzdN?=
 =?utf-8?B?SlFWVEh0WW10ZldmQ0d0RmFZU1h3ays5RVFYbzdZckh2bm9leWhnKzNwTXpy?=
 =?utf-8?B?TDJKQXZyekFwWWlZM1VXR0ZCeHROdlAvTVdudUwydjdqdHljd0NWZXNHemFl?=
 =?utf-8?B?bWI3NFFuWTVYSkRLb0FuMkl6UDZ4THQvNlhERk5LbXM4VFo2ZG5XQkZ4aFpt?=
 =?utf-8?B?NzFsbCtaRURsVE5saUVuU0VmV3FIcDlvVmtmNlVhWE5YQlRWaUthcUdZd1lr?=
 =?utf-8?B?aWdwc0JKYWRaQUNTZUVpOUV4ekoydjJsK3N4aW1uZ0VFaytuakM5VGE5blZX?=
 =?utf-8?B?S2MwejFxLzlhRzJGaXMvSzVIUmxVSHIyV0J5cnJKcE5KcitPc3o3SGVOemNo?=
 =?utf-8?B?aFNZZ1NBT0VUQ3pxYm1xRWs4bDN3MktYQ2RBOTlERVAxN2tkNkFPYU1UV0VJ?=
 =?utf-8?B?ZW9nWExVSno5ODZSKzcxV0F1dGMyUXFpM1oxTFBkdzZCVnIwVzExNWNtY3lH?=
 =?utf-8?B?WERyblpTOHJBSmpCT1pKd0d1eFhadWE4U3NjRDlnRzhSSy9EVVZ6QTBMb3l6?=
 =?utf-8?B?YVFsdW1FRnQxOFJUdElDRXQ4dXlLRjQzTFo3N0RIaEtiSG81S3NDVXh0WHRm?=
 =?utf-8?B?WUxrRUkrUEVwLzZtOGZramZTYjJhanRWQmsxT0lCQTZiYkVSclc3NDZ6L2N0?=
 =?utf-8?B?L01rZGNsNU5neUlyZWI2cUpYRkgyZHRLSFVTSnd3NDZXRnd6enBsREpIZko4?=
 =?utf-8?B?QWh3ckhYSmpSYkg2cTZITnpyVmZheUQzQy9ybHJoMUNSZFliSk9ZV0tvbUhK?=
 =?utf-8?B?bG1lMUVma0dXT3BxYi9TamJHR1piWERNYmpINEt6T2hPcjlHc3JPdlZCVENU?=
 =?utf-8?B?RGdnZ0NnWHBZLzJRUWhaN2hTWXg0UTc0Z3RnTmZWZEFtdnBrLzZ1bDNER3VU?=
 =?utf-8?B?bGV5SjNXWXJENEpJclVieFAxUEI0WEN2dVZLYUFKOUNOWjBNNXdXWWNSN1Rw?=
 =?utf-8?B?cmJLbGl0OW1nd2ovWU1nVWtPRlZFMERXcVBLRlN5NmtFYitTRHd1T0owVkpn?=
 =?utf-8?B?N2VOaGVOTUhnbGdkT3Y1Tlg3YzBBeXEweGpTd3NVMXY2bWEyQUdscW5pT2NK?=
 =?utf-8?B?L2hiNjJiL2FyNGdOV294TGdBK29rdzVHdHVKcVlHVEJPamMvcytBb3lWdDQr?=
 =?utf-8?B?Vmk5VGMvb0ZyY0lQdm1yZlZ3S0Jwc0JpQkNreTlrWjdxZ3hSMFZsT1ZaVWtW?=
 =?utf-8?B?aDcxMFRLWnpTbjNJUm13SGxTbGFVWnNMV2gxcTNqbno4UVlSZVVLQ0pVVnBu?=
 =?utf-8?B?czB6VldsVFJOeUZHMUFDclFZR2VSWUlmWUFFc2ZKQ3NhZFpycUpreGhKcHFV?=
 =?utf-8?B?eTVyeFdIYzhnMTZMRjE5a2IwUlFHY2JhR2Z4R1k4aHBtL052ejFIc0VNSW5Q?=
 =?utf-8?B?Snc1VlY4UENwVFE2NmM1aTlDQ3lJczUvVW5jRTRKQzEvYkZ0d0pTMGFNS3Ba?=
 =?utf-8?B?U3NOQmxYYmpSWTdDaDVNZTd0NjRzQ3BLUXl2MEZ0VmZILzhsY2Q2NGh2ZVMx?=
 =?utf-8?B?ZjAydjZ2NUt6VzRwam56dnFDeDZ3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79387b33-088c-4436-b696-08d9c076d1e8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 09:31:21.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwCUoVAAMlwhodJzPcotf1zsWtN/6wLnpQgmrGgRTmNFzt1kz4TVi+zM3ECb4gnlpWjbcJJ482ASpxloKc/uXvi+kKJTPDSnHE8kVxI45Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5762
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.12.2021 22:39, John Snow wrote:
> asyncio can complain *very* loudly if you forget to back out of things
> gracefully before the garbage collector starts destroying objects that
> contain live references to asyncio Tasks.
> 
> The usual fix is just to remember to call aqmp.disconnect(), but for the
> sake of the legacy wrapper and quick, one-off scripts where a graceful
> shutdown is not necessarily of paramount imporance, add a courtesy
> cleanup that will trigger prior to seeing screenfuls of confusing
> asyncio tracebacks.
> 
> Note that we can't *always* save you from yourself; depending on when
> the GC runs, you might just seriously be out of luck. The best we can do
> in this case is to gently remind you to clean up after yourself.
> 
> (Still much better than multiple pages of incomprehensible python
> warnings for the crime of forgetting to put your toys away.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/legacy.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 9e7b9fb80b..2ccb136b02 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -16,6 +16,8 @@
>   import qemu.qmp
>   from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
>   
> +from .error import AQMPError
> +from .protocol import Runstate
>   from .qmp_client import QMPClient
>   
>   
> @@ -136,3 +138,19 @@ def settimeout(self, timeout: Optional[float]) -> None:
>   
>       def send_fd_scm(self, fd: int) -> None:
>           self._aqmp.send_fd_scm(fd)
> +
> +    def __del__(self) -> None:
> +        if self._aqmp.runstate == Runstate.IDLE:
> +            return
> +
> +        if not self._aloop.is_running():
> +            self.close()

As I understand, if close() was called by hand, runstate should already be IDLE, and we don't call close() twice here?

> +        else:
> +            # Garbage collection ran while the event loop was running.
> +            # Nothing we can do about it now, but if we don't raise our
> +            # own error, the user will be treated to a lot of traceback
> +            # they might not understand.
> +            raise AQMPError(
> +                "QEMUMonitorProtocol.close()"
> +                " was not called before object was garbage collected"
> +            )
> 

weak, as I'm far from understanding aqmp library:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

