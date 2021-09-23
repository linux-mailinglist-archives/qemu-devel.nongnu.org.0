Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B8416542
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:35:16 +0200 (CEST)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTYx-0006EB-FM
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTTWO-0004dL-US; Thu, 23 Sep 2021 14:32:38 -0400
Received: from mail-eopbgr70099.outbound.protection.outlook.com
 ([40.107.7.99]:18854 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTTWM-0008O4-99; Thu, 23 Sep 2021 14:32:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/woRV+SmHStSlUncPx4yNHYWIszyACQFcex3dxD3GaPILHLqwMfQAZfZ6Q7hNhN71Cnr2+T5TNSTqFpekCdbcFUQxueCbLaEpO8ntdQjOArvPozQ+cBD79IEQNcyr8cDcIJdmCaezO8RSaC9vC5z8XbrnHAbrOs6DcSHYqlBzbiV99PAlvc1V0VTIwEZP8NCB1rHGnQxIVP49LLldGuzqaQTlQwC/VZyVbuZSYPuLH7pqyKJVb8R5qS3TLrs3HeJIGNU2FK4Bzj295OXwIJ5K15lDZchPTmJ80iHWk1DH8VS446QtAl+VYT+P1530RD/81Xw4O+Kw625I3azyTxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NlwxlS7hkLVck158s/3m5SP4r4Ua8elgiv4IRfDtluo=;
 b=m9h/M85S0dYzIf6XGfaQQEr1LnroBl+txUvPUtIV8SfoxEjCleB8V5O5CgTY90uehXeSVNRXWDNMJY4zvL3zapOoNKphONQHMV4vtrS3tNOZvfzKD+k9x7IXfpzcMZ4YSDtWV5Oad9Q4Sq5bccP5Rd0fGyEBYGFZBLMn3UPLrXd/tynf9gCaDpQSGXPLlMeSyDpoUL7O5HWVLacxfWAOOFgl9Z52ML0ynW8jmSyhI4L9c4ZkwcDaiskyoLIg+MQoEJBP0wIGJbR9BykgkXnS1Kt5FSf+zW10ebcylp9H61JqAlm/W7Sfc2h2AespZSOMWc0vf3MxUhMVgft5/fBtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlwxlS7hkLVck158s/3m5SP4r4Ua8elgiv4IRfDtluo=;
 b=QeH3ld1gf4UpZMTfIkrLd7ou7ggmkatgBbmD3lVDTdqv7xF7qQkYYipZm2wvy4h+MV6vpXXMSaCPyReWfriLAoMCTgfjX5yu2k12pv07+h48MAELQWUBm0YYzlEAyI1efMpebyw3PEX0Vsus8VE1c8bvq7gkptGrEQJZ10/prtY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 18:32:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 18:32:29 +0000
Subject: Re: [PATCH v2 2/6] iotests: add warning for rogue 'qemu' packages
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org
References: <20210923180715.4168522-1-jsnow@redhat.com>
 <20210923180715.4168522-3-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d9c1be2a-e927-49a1-b30e-f99d48946928@virtuozzo.com>
Date: Thu, 23 Sep 2021 21:32:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923180715.4168522-3-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR1P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 18:32:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 723a3c2e-865f-4240-2a31-08d97ec07fa6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-Microsoft-Antispam-PRVS: <AS8PR08MB655129181956F9465FD1F523C1A39@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcIX36udJB93xWB0M96bly7cRRkFBaSqQ5ntR4IDKC+HjotI0WjQCBB5NcWZyYw+eYYTrVQSlfwHcGHSOxsV3227Ytb7n5Pt0ySoUzHS2GwXzLIbBxDJF3/5BesC0ndjjAlkNW7xBhoYX8aMA+o65Bi1olcHJE45020ugOKRjEHTwtUk6OoueINOOsYL1wnd7gap/INWHVsuDOj8SLXsAsW1IAQHDbk1jdjP+DkzWec9LfwBPIcNBDjSfECJQ/JkHBSXcNFKo3SmVSCq+6kdV86259GFZTAtaFvwLcMh/18eubw2aCq34YnFZ+LcOTZSENq+Rmu1nh3kkkWtEZG+VXrl9QI2qMZOkWZCx7kt0GVmCbdtHuP6ug1IpPvIWNOJzA3EZTi5wCbcMBFNCcyoLoO3EoZR077e57CGQ/dRof+W7PSL+dXbmP75d0FpXfNSEXWLa0UC+6CjlUreUcFysR2/iHNmQiybLR3mLOtVTbS8+5/1/kJUjxr3ViH9ukg7uDuzOrHvwLTFPYOfv2FhfTzNN2w8fULqTYS9HnDHeT5VMb5cXVw8Ozd2E+J7rMP5Lya8I3Sn+KqhDCH7W3+DKCcDryuWVkuPZc6d2t/RGXZkFCMAR2yjWXv2FbUoltXHqwENujEer7kH0nyuEA7U8vjO6jkXu2AtPZFWjgSJQCHdV2IyWYPCYbNWnxPd7maCEt6e5qgEsLObquOfw6NxNHUoZjgUX2zvWLnBmEsA4AxaHRdbYveeuazStf+ku70KHVbSw75izYN0bq8lNa0Yq8FCk8O9mV5iJXcu2DUq/s1T7cP+W7kLYN1GMZB2uwiyjobL/Bp+FSou2Xx8UMCpXdAyKq1rKdoARHt0u526rBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(86362001)(508600001)(16576012)(316002)(54906003)(8676002)(8936002)(36756003)(5660300002)(66476007)(66556008)(52116002)(31696002)(4326008)(186003)(26005)(956004)(2616005)(6486002)(2906002)(83380400001)(31686004)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdnOW5wdmtPK1NvOU11Z0dVazJUOWtxL0RkUU5ib2lURDJ4VUlRRWc1Ni9I?=
 =?utf-8?B?K044bnhXQ2ZwZFMycDk1T215Z1o5aWR2N29YblE1ZnRjd3NaOEV1SWwxRnF5?=
 =?utf-8?B?RkJHS0cyZmdkWDI4ZDQzNXhPYi9HV1c2bGVYbVJ0Ly9JNUt0QjNPSk1nZktx?=
 =?utf-8?B?blJOckx5eW14ZURHU0JjamJqcG9mVUo2TmFvQjJQUkNEYW82Y29id1JrVmha?=
 =?utf-8?B?YmdXOWQzUDdOMVRjODZURnQ5cDR4SERuMW0wNGpaMDgvcnlKK0dpeHJwS3Zm?=
 =?utf-8?B?VlRaY0ltT0hTWm1jVEsxN0x6VTdmWjlkd0xMNU9leHBQczJlZXFIZS8ybnZr?=
 =?utf-8?B?YzV6ZlMzSEJQcUtHcUtZWUlxR3RXNDAzMlZIUWwyWHdIS21FbDY1MXlJTTdX?=
 =?utf-8?B?TVQrTmhoeitRaFZHRXpUUE5SQkI3Mk5KL3I5a2hMRmV6TUN4amFwb1hiNFBQ?=
 =?utf-8?B?b0hNVDBCbmI1ZFcxSHNHdiswdGhqSGlFN09TWlRNVW5jQm5nNll2WFFzNlBh?=
 =?utf-8?B?UDdXRlBFdlJvTUhBallkVnU4S1pZMkxPNzdSUGRJZC9UUnpnOXpWWTcvZXZp?=
 =?utf-8?B?ZGYzZlJaZkU0NEhMc2pZMGJyVXV6SlYyL2cwRjZSRWZOTWl1SkVFTGdreUU2?=
 =?utf-8?B?cnlUQS9aZmdiZFg3QnB4SHhMWDFSdGVESXBFWG5xS1dFMjNyZjF0bHZpTDg0?=
 =?utf-8?B?MXU3WFgwYUdtWkZFN09Jbi9SSjFPU1Axa01NeVFnRjhRQ0FvekV3STQ1Tk1h?=
 =?utf-8?B?TWJrOCtlNEU2a1kvUkpBMGcvd2tldnpNM25tQlFDcnN4RTBpd0dTS2U3UHFI?=
 =?utf-8?B?a2pYMnBrWWZpaFRyckVZVTh5b3BKQUZKWmNaSVJmb3VobzhtVlNXVEJFbURi?=
 =?utf-8?B?bittZFVGZEJqQ1Q3Q3BkWGQ1YXVxZzd5N3JKTXE5RWZDZWExd1dMWnBQc1RB?=
 =?utf-8?B?RWZuTGpnZ2dQazJtcmNHanpldDJHTU1tQ2xiVTRoOWZoazBDQVVRSDVTVXMz?=
 =?utf-8?B?R01xWllIL1JvY1B0bDdzaDZaNkNyaDJDMnlZZVZjWEROS1dDZHNhZkZCVnFi?=
 =?utf-8?B?REV5bXd5eVAyNERUYnp6d2ozQXFFVUJab3JpT2NwbWZQakFQc2drSnRVSHY1?=
 =?utf-8?B?WkFTL1BGRjBIb1gwT2c1aDhDaXdFQ0ZkOHBkSnM4WFBUUXhPUW5xNmMrazJm?=
 =?utf-8?B?T1luS1Z6eWFaT3JmRjN3YkQvcGdUby9UOEdYWjQwREFyaFVjUklEclZwRHJD?=
 =?utf-8?B?d0wveUN1WnBzL28yVjljUG5ZanhSYlBuV01NMFA1ai9ZQ0svaHA0aFhPdWZB?=
 =?utf-8?B?UVVtK1l1K3A1RUsyb1cvUlJRblozaUJTOGFxVzRnUGRHM0p1dlZIQkkyR2xj?=
 =?utf-8?B?UE93YytOeWh1N3ZaQU02a1JRR3JWVlRrTDY1TkE1SlJxMWsyTEcyNDVVY3lI?=
 =?utf-8?B?OGFkWFJIVnFVWTRMM3dsc00xdHpPSjR4NFNCc1BGNGZFNHdjV3hnQjFQR2xi?=
 =?utf-8?B?UFFjYUlxeWJndHVJN1djYWRTU20xV2poOEp3b1RaSC93akhqbXlQTDIzYmRT?=
 =?utf-8?B?ZXRkMmZXOUNaaEZXcDJ2V3FPYjlpM2pCT1ZSQTJWb29Cd0pWV0RmdEVlWWho?=
 =?utf-8?B?NFViUzRFZ0lQYmN2eHkxL2Y0Y0IyU1R0R2RScnByaTN6NnIwNDBTU3Vha1Qr?=
 =?utf-8?B?ejh6U0xVYmVCS2xTd0xHZkdNUjBXUzY1SEpvQ2VhWlVDQWtuRGJZMnp6RENL?=
 =?utf-8?Q?CKqnBTE7Y4MefE5J3OrJoQHCsJlgEcYJlT+ruDm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723a3c2e-865f-4240-2a31-08d97ec07fa6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 18:32:29.1665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWfNniH6XYFtBz/H5bI7yqUpWI4h2oInRf6IqKLOYJwmyeL9XWoSR6T1HPRpUKNMEiJpCDPjvktQTp4JB3v8zhHDpFtLTwzv0XGDmqpcIdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.7.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

23.09.2021 21:07, John Snow wrote:
> Add a warning for when 'iotests' runs against a qemu namespace that
> isn't the one in the source tree. This might occur if you have
> (accidentally) installed the Python namespace package to your local
> packages.
> 
> (I'm not going to say that this is because I bit myself with this,
> but you can fill in the blanks.)
> 
> In the future, we will pivot to always preferring a specific installed
> instance of qemu python packages managed directly by iotests. For now
> simply warn if there is an ambiguity over which instance that iotests
> might use.
> 
> Example: If a user has navigated to ~/src/qemu/python and executed
> `pip install .`, you will see output like this when running `./check`:
> 
> WARNING: 'qemu' python packages will be imported from outside the source tree ('/home/jsnow/src/qemu/python')
>           Importing instead from '/home/jsnow/.local/lib/python3.9/site-packages/qemu'
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/testenv.py | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 99a57a69f3a..1c0f6358538 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -16,6 +16,8 @@
>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   #
>   
> +import importlib.util
> +import logging
>   import os
>   import sys
>   import tempfile
> @@ -112,6 +114,27 @@ def init_directories(self) -> None:
>           # Path where qemu goodies live in this source tree.
>           qemu_srctree_path = Path(__file__, '../../../python').resolve()
>   
> +        # Warn if we happen to be able to find qemu namespace packages
> +        # (using qemu.qmp as a bellwether) from an unexpected location.
> +        # i.e. the package is already installed in the user's environment.
> +        try:
> +            qemu_spec = importlib.util.find_spec('qemu.qmp')
> +        except ModuleNotFoundError:
> +            qemu_spec = None
> +
> +        if qemu_spec and qemu_spec.origin:
> +            spec_path = Path(qemu_spec.origin)
> +            try:
> +                _ = spec_path.relative_to(qemu_srctree_path)

It took some time and looking at specification trying to understand what's going on here :)

Could we just use:

if not Path(qemu_spec.origin).is_relative_to(qemu_srctree_path):
    ... logging ...


> +            except ValueError:
> +                self._logger.warning(
> +                    "WARNING: 'qemu' python packages will be imported from"
> +                    " outside the source tree ('%s')",
> +                    qemu_srctree_path)
> +                self._logger.warning(
> +                    "         Importing instead from '%s'",
> +                    spec_path.parents[1])
> +

Also, I'd move this new chunk of code to a separate function (may be even out of class, as the only usage of self is self._logger, which you introduce with this patch. Still a method would be OK too). And then, just call it from __init__(). Just to keep init_directories() simpler. And with this new code we don't init any directories to pass to further test execution, it's just a check for runtime environment.

>           self.pythonpath = os.pathsep.join(filter(None, (
>               self.source_iotests,
>               str(qemu_srctree_path),
> @@ -230,6 +253,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>   
>           self.build_root = os.path.join(self.build_iotests, '..', '..')
>   
> +        self._logger = logging.getLogger('qemu.iotests')
>           self.init_directories()
>           self.init_binaries()
>   
> 


-- 
Best regards,
Vladimir

