Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F360476F38
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:54:13 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoOq-00017s-Aw
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoMr-0007JZ-L3; Thu, 16 Dec 2021 05:52:11 -0500
Received: from mail-eopbgr70099.outbound.protection.outlook.com
 ([40.107.7.99]:37121 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoMf-00044n-Gd; Thu, 16 Dec 2021 05:51:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yur5RmJCGUWfRr/0w72f0LRMIoQxZ7HMTiWFpNHgmFw2mD4kPcAMimFcDpOfYTBAayUWUaF7YhljW0V9uNzFDX0q6A1hm9kOSKoXqaNqJtLvZYegkA2qldRhSFh926C5mtaBtCJKoLWS6fOI59sU8VIYdcQq4EUmc+it5sgtl9wWW2MvNNymHkOh5iEmK5JHyysQWleABjKyYxScsxq2kzKvIr544IA+YDpvLi0bqpPEukC8i5UwovxtmM1tR4ey3ReNlwuCttrlZctka6YjEwHvK6Z3jW/04g2voSkyXluDz37kbs+PCXoDhCE8hqzntVTk1uKYF9NvESQwrBGosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4i0Zw0e/A6dr8dNMJC/fzl6vQPRKVc2FkjKosGJ8Jk=;
 b=Mh6DYsSdkjyFYNTfgOXbIgb8mDe5G8q/TMLCYWoc/MqiQLOCjR820PfIzr3VGrX79ze5aBnTBar2VxdxiCJ9xjrGZOmVYr0xY4YCaNZsIIqfQpeeOo61Q5+9ImAv7ZYGI3D3DqP1J7k7wk7cyFyTN2WkoQ16kmkkYD44lHljf9eNiTpLhHkVd2Uh6ALYkqoApHxMUIUgWan2g3BIITu2sb3QqtYQ/1TWy/palnvCPDwY1mtWLSZo75Qdt2EfmdSShM4THHyErv0bgXUqompquLQy86f/sArmbzePtUmuzLR9hJawe0hI3ydIXgfNnKANAzH7dvEp+XpiWBTmGwXvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4i0Zw0e/A6dr8dNMJC/fzl6vQPRKVc2FkjKosGJ8Jk=;
 b=rVDD+orfnel//wq+AkrT/FFCN11eTqnqgU4oux0ACPKb7VU61L4fyFySKlMuKBQtGhCXo9TUrLX0aQjFWgqQxIZIDjN8Sd17OB9wlB/gpodylqrFZH0dhuKwS63qy8/1Q/tvsBV5OMN53j/WUI8vsz1Y7xeyhfe4Spf5wQUETQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3362.eurprd08.prod.outlook.com (2603:10a6:208:dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 16 Dec
 2021 10:51:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:51:53 +0000
Message-ID: <1cfdbd81-810e-05e6-57cd-a63e9cb8bddb@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:51:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 12/25] python/machine: permanently switch to AQMP
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
 <20211215193939.3768033-13-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-13-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0239.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::35) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR06CA0239.eurprd06.prod.outlook.com (2603:10a6:20b:45e::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:51:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b24a2fca-4e1b-476e-57ab-08d9c0821247
X-MS-TrafficTypeDiagnostic: AM0PR08MB3362:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3362F85B49DB4FAA78832148C1779@AM0PR08MB3362.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bi8fivIoXk9b3kvKbCaDs5goIe7vvUvUi9kptLrXaTvmzzefjsMVlUfd4Tjo87/GAvAD2khcAd+W/SX1P0OtJEs6BlCsgzOaG6E36so1Zpj/L6e22RCax38OLiK3AyiOzBNy+MBODcZCA+1E8lNbdc2rfdxzYKHN/t6Nx+39NqemrarbRscrRY2HoTkofHAOj61dL2URlaTWaUpjJflPcB8CEPqkKGq1QqyQbyvFIGdNHzZLom6+Ov8G7mRs0j6MdBaKTH3xTzFPAKEujA/ITEcs40jN6gJfS32QCJ+yycOBMwNr3N0UP42crX1YNGo08I8uBzLAkrzoS1ljsnHxKpA3PUZziHlLKKAWMoJiqYkpXmzdO2/teLwlLSKr4SaAgRVB/hyFnTFInBRdu5MPFhkxwbdG0ZK7b/M1o7R3UoLCp29s4eZ37wfRzW7lAuHbJabH4vBGo0/uxr2pnuTClmXDq77HqKt26u3hOWvEgpda8IsbPUj/kvDffaUP128Ze/9aDBNMCPKQ9VOwAKCd63lJwzaZXHES27dnDV3bi4RujIMX5esHEiEvtbv6Dl/3VMdJJnvZekUpDWl8Gw8Fp29mHUsJWijndTcnRGZKrE2nscwT7DupzdUCR9nFSpz9DlR7o4s2NFDxZKLH0MGPTwUNgXQlnzRZ7Farnv/ufJs1kP48OYequJRfavOBa4crMg0/K6K4tSKWdgQEeoffKBer/yMCNDZf3CBRhWlHO1SbOUH2EdZigB0z5P24+zgipfHLlnT4/X3eDfnTRnynA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38100700002)(8936002)(2616005)(956004)(26005)(66476007)(16576012)(4326008)(8676002)(54906003)(31696002)(83380400001)(2906002)(7416002)(186003)(66556008)(5660300002)(316002)(52116002)(36756003)(38350700002)(66946007)(31686004)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkUvK0tJeis4SG5WOHVDWDQwS2hxT1hsbXpWck1uLy8wTzRCTWQ3Qjg3a3hj?=
 =?utf-8?B?L2htaEZHMDZ5R09vWnY2Y3hrUjRkd0xlWjJHdS91QVBkUjltcEl6dGdydVg5?=
 =?utf-8?B?Ti9DeERvelp2Wi9LTEJmWFk5WnI2Wk4vQmJYUDdlVzNVVGhhTDBmL1l0Yktm?=
 =?utf-8?B?VDI4d1VBQlNKRUl6VDNNUEZrSnFCNm1kVGh5cnFsSGdSb1JQVFZBbXdYOHpz?=
 =?utf-8?B?a1VhamhuL3ljWWI0RjdaWXZubDdWa0dOME40ODhQVXZsZ1RPTDBlYTR6cUZS?=
 =?utf-8?B?NllGUHI0VC9hRlc4VHFlR1B6RnVrS24vRExXb2J1S2g4RTBjTTVzeVI4Zkpa?=
 =?utf-8?B?MkVSeGp3SnhhZFZlWG0xY28rckdCbFB6QllXclprMzgvQUF2TjZiN2ZNUTJs?=
 =?utf-8?B?M3hyYU8xTTFpai95QmR2RWlsOE9EbWhtaWQ0TUVhcHJYRVR0T3JXSWdkWDJr?=
 =?utf-8?B?QkhTWHhMeTMvMC8yVFF3QmlDWVN0Z2pvdFkreklkWUVXaDYrbUMyN2t4dUQ3?=
 =?utf-8?B?VWpNaHFGd2FXaWhDS1kydkpoWk5qaVdHMW8rN2RRMG9DcFVPUXEyL2F2VUhB?=
 =?utf-8?B?VllnZ0dXa1JPRzQzcWFyUHc5UFZ5anlxVVN4Q0NDNU1QNDkvT2FISDg0RUVY?=
 =?utf-8?B?THNqRXFmOUFuZWRFTVIyOUgzcElIMEE5OEVqWk5DNGFMQnlWTGlxSEJhOUVZ?=
 =?utf-8?B?bE1scmJqaGI0V0ViN01oT3R1SHdldmw1aHNoLzFqZ1E1YVkzNXQvY29KMTdB?=
 =?utf-8?B?Z1lmcURUNHg1a2VJNDBXSUhYNTZCd3hDdXhPVTNpeWNEOGFEUStXR0ZDNjdz?=
 =?utf-8?B?R2daVmRseWFGMFZKY1J5c1kwUnBBeFZXZTl1ZVVJdU9BWnJXNFZzY1hIZytz?=
 =?utf-8?B?TWhyb3R5UmxRWlI0clZyY0RBTURnczZDbkkrdHd6eVpwcmM4UUUyb2Zhd1FS?=
 =?utf-8?B?VSsrMGxZbUdTSlVPVEN0dFB3REJpbTMvVGR3ZnQwQ0tMejY4SVV5RVlzMHY4?=
 =?utf-8?B?cU9DZzU0SVkremc4TnYzU0lodGFVdVlJM1pFOVdXb2k0dFBKS0pTcHIwdGM2?=
 =?utf-8?B?dUU4MkRSKzhmcHpYMGlmb09VbmxWYk5jcjdsZHh0TmErS0tkM1VTUXVHZFY5?=
 =?utf-8?B?R3psNFVVVk1MdTdKUnJrdW82YVliMkJkY1p3UXkraTM3L3ZMNlhVdWR5K2xX?=
 =?utf-8?B?Y09Pa0dQNjZiT2NMRjBMTTNkcW4xNC9pUGJyQ2F6NmdHMWdiRzI2Vm1kcGJX?=
 =?utf-8?B?TUZJY0tpTkFvaS9UNnkyOW82ZjlkRGdublAwUDA4VjlrSFBmSzZ0K09CSFNq?=
 =?utf-8?B?LzlUQ1o3SUpranBLTTJyeEJ3OWtFUjFTdnE4RDlIcVJlTElkWXBwcDJoZTZ0?=
 =?utf-8?B?QTAvZU83ai9GNnZ6Vzg2Q2IvdFhMN1crcUFaYVZnRURPUmk4SnJlVkx2REQ2?=
 =?utf-8?B?WkFndHZMNjVPZEJ1L2QrODNtc1NxdjhaZldGUFlxeDFXMHJJcUZqVWkrMEJs?=
 =?utf-8?B?VUN4dFJtYlFOeU1IUE0xcFJCcTlmNTN2QTZ0bXBTZldSUGxaQXRGbEhnK05Q?=
 =?utf-8?B?MnhyZG5BRUszM1ZpYjFOL2tYTkF6T2ZiS01EWllRYXpKdElnd0lNT0pWNTRm?=
 =?utf-8?B?QW1Hem82UlR5eFMrRTJEVWZzQ2tXNDNFZkN0V1lWUmZ2NS9aVFJUa251WXVj?=
 =?utf-8?B?eVpQclg1MFhyUEVGeFcrdEhVMzR2VlBYY2ttYlI1dWdlR2VVb09ZY3VFckNz?=
 =?utf-8?B?QzF6WVF5VUZUUFMwWGVRWmY4L1VXVHBRMU53YWFaSi9OUFJ2OFN6TDloa2xj?=
 =?utf-8?B?QUdJR2FiSTFLajhTV0VyOVFxMHJlenc1S2hRWHhhVDdyc3hLNXJjV3hscy9Q?=
 =?utf-8?B?ZVVuOVNCWFhPdDBuaXhJQUpON2hRdW5BUnZqMitOaGtoZzJOcUhwWWdaZWMw?=
 =?utf-8?B?VUMycFR1VzR2TnFnQkM4M1R1K0FrbkdEKzZURUhFQkJQRzljeFdyb1BvQlN6?=
 =?utf-8?B?b0R6WHlPU3kveTkzTFE2TnJhVmJpV0dqdmhtY3NGaklSeVAwZWZUZ0EwMDRV?=
 =?utf-8?B?MjIwR1dvbzdLemVJZFRUSStIc0xCRXdaUE9kSTFaTGY0amIzMVo1N1huN05o?=
 =?utf-8?B?Qmt1aVErcGRVZVRFSHgyUTBkQUl1a2x3Ump0am0ySFhGMEI0UG84MENTSS9M?=
 =?utf-8?B?Y0M0RlR2UGFPaDZxQ1FYcWZuYzJCNDY2eVROOENiS2NOQUFVWG9LR1RweGV4?=
 =?utf-8?Q?y03M/r+MaRQFJ56kI3ONszEi/RThSOSU/pDrMsAvoM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24a2fca-4e1b-476e-57ab-08d9c0821247
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:51:53.7928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xXMIFjDXhQMLz6qTYVCh2g8eSXRDNgT/l4UzM5zi3of91VtFdhh/3fnApPlLWkbdldjQUj0rt+USe+qWwlgO+DSKkURgEkaUPi46/Y5hg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3362
Received-SPF: pass client-ip=40.107.7.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
> Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the
> switch permanent. Update Exceptions and import paths as necessary.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 18 +++++++-----------
>   python/qemu/machine/qtest.py   |  2 +-
>   2 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 67ab06ca2b..21fb4a4f30 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -40,21 +40,16 @@
>       TypeVar,
>   )
>   
> -from qemu.qmp import (  # pylint: disable=import-error
> +from qemu.aqmp import SocketAddrT
> +from qemu.aqmp.legacy import (
> +    QEMUMonitorProtocol,
>       QMPMessage,
>       QMPReturnValue,
> -    SocketAddrT,
>   )
>   
>   from . import console_socket
>   
>   
> -if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
> -    from qemu.qmp import QEMUMonitorProtocol
> -else:
> -    from qemu.aqmp.legacy import QEMUMonitorProtocol
> -
> -
>   LOG = logging.getLogger(__name__)
>   
>   
> @@ -710,8 +705,9 @@ def events_wait(self,
>           :param timeout: Optional timeout, in seconds.
>                           See QEMUMonitorProtocol.pull_event.
>   
> -        :raise QMPTimeoutError: If timeout was non-zero and no matching events
> -                                were found.
> +        :raise asyncio.TimeoutError:
> +            If timeout was non-zero and no matching events were found.
> +
>           :return: A QMP event matching the filter criteria.
>                    If timeout was 0 and no event matched, None.
>           """
> @@ -734,7 +730,7 @@ def _match(event: QMPMessage) -> bool:
>               event = self._qmp.pull_event(wait=timeout)
>               if event is None:
>                   # NB: None is only returned when timeout is false-ish.
> -                # Timeouts raise QMPTimeoutError instead!
> +                # Timeouts raise asyncio.TimeoutError instead!
>                   break
>               if _match(event):
>                   return event
> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> index f2f9aaa5e5..817c8a5425 100644
> --- a/python/qemu/machine/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -26,7 +26,7 @@
>       TextIO,
>   )
>   
> -from qemu.qmp import SocketAddrT  # pylint: disable=import-error
> +from qemu.aqmp.protocol import SocketAddrT

You can also import it simply from qemu.aqmp

>   
>   from .machine import QEMUMachine
>   
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

