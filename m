Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2A4770C9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:43:03 +0100 (CET)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxpA5-0005d3-NJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:43:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxp8z-0004oR-8d; Thu, 16 Dec 2021 06:41:53 -0500
Received: from mail-eopbgr70092.outbound.protection.outlook.com
 ([40.107.7.92]:53582 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxp8w-00074m-Ht; Thu, 16 Dec 2021 06:41:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwOHhmg7x42n4CzAdZCcjRk1UpaO9NsbCaDhRCUuoJubPn0v2LQvxuZoJIhfraQh6F6zp177KsCzOmhp7EKf680o0qqozngTpxrpgw//Swo8OSBgtRrfIDh3rMZyvEe6dyW200OtpRE6OlXj4nQHS4CJSL7lS1HMxx4AEosVsqVT7L99X3H40KKpXkgCVqoYG9AakHZ70w8sI8d2WvY3v6Nrhxf06gOdNsb6MXk/bHrZCAZI/CoQbQLqUrusVRtjFOmUD/vIXYnzVZahEPnHv8kEhmQ6c+GYjsLhjGhbDvgeiTX8ZyCF92s4s6N8RSWo6Wxkoq6ReF/w11JfGhAgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeEgEMa85pD5QH1/Aqbla0s+4GfQb2yAWqiiJUnrh6Q=;
 b=Y0IOW2MbMayfSQfJHSxvoVOaOdzcxNBFbkcIu/MwqdpHuI/mrRIic/tHqtgbeJ/GRWMylhxlLRLPAsGtnGt7fky+l9lCx2Kq3qEZjD+8VdyfYoVC3rFX5DZnPBfLvwUUbjQ0jguP/sPIqDO0G1anCF1/4Lj0pnzXF5ywmTp31PxkDQMLwAr1JUSlCrX61QRYIyC+9co+zoYkBOv7mTaEfgzKXzvWJqccYVWTvR8z0VEYXGNgfBIUV4Dqd+m5wIfJ+sOyMKbFqGDN/QDRoi2czxphNmaBocVdUsbHp3PwCelqk3LN9zHSGwanBijjenk2JtaR1vG51U7S5DqC/S+3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeEgEMa85pD5QH1/Aqbla0s+4GfQb2yAWqiiJUnrh6Q=;
 b=EGnysD1jQsx0yuMmbS50NvXnqsg51vkQxuqfHMjVvs0D5kJsjG+7IOIsMUlOyMjTT8ZsujqrI6S8BOCUZVW3AgKXgtbo7wzTOpnQeZLdESLFtHFM1/Sha3pplpD2MMHE12pqD2oU6GrPgToVimJzg4fbkSS4veX03n8r8Vdsop8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3538.eurprd08.prod.outlook.com (2603:10a6:208:de::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Thu, 16 Dec
 2021 11:41:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:41:38 +0000
Message-ID: <59b70dd8-cae7-4106-7ba3-ba0b6f74897d@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:41:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 25/25] python: rename qemu.aqmp to qemu.qmp
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
 <20211215193939.3768033-26-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-26-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::41) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:f0::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:41:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6fa926d-f2f0-4a70-0862-08d9c0890591
X-MS-TrafficTypeDiagnostic: AM0PR08MB3538:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3538A920936C46E1915D9D52C1779@AM0PR08MB3538.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPTMLcloqeFM6W6tpW4dD0JyU46FIYFM6jNk1zxeTFyOmAdiPxSQpJoTVcndhObvHssjH99A9aQ/MBQjjXE/e1iDOfIjD+3dMxHpqmRDtKaPhmp3aP2TymeLod6mHETubEfj7soDg025uXALQ/1zVNZ5yq2LqZqVwwMkx+AWqFMqPFAvN1JtCrQQ2Y1vx9Xklqcy0sVhtQDA0q6rEDf1oU2MpFndgt0aouJzFRZ6u0Iia3AwzZKBlsAVWJktP7SXOI1IFuTjTzgJL+zhAEqV1cc8TsK5D34MXGX2YxFHmfKVPR0aKRHkWfq4B7WhfQ2kMJcCyu0Zqm0iniALZsWXkF43MfJcsKeW2sUVgcOIP/lTrKDBgnLRW4n6fTsBj0m4wlFka+4vIXqmeR8f4TyKBn/xeOIjzeJxNC9ygY7+yJQ1WEDq1G7JUgUJCBbhd59nf8tE3ArRnk90nEh7XVXH5rwRhz9hNalg8EmxgO/YoeH7N+uk7g/xee/aao98XEwz9bru73OfIesZsBDntcaaYUWXiMIWWtWcuAKlXYFIHBEHAwDzZ67CPPL/CTEndvjSTZ0fVHM0YDifdkYHOSXkpN1/2rpzbzhFVfY4AkCtpjwIsNaJ5LeqSwdXrUcsils2vEeQG0U7sC+6jyd++lWr+yrR/c2+EccfpAmlkl16m+06LCEOkYP8DaLCawaX7x9o5BgJx7/XJgxVeEEptgmf6eh1PXP6E8SqXXgaS0unwSa7UWCRK4+D402Re9C1LFMujR4iMpI2Z2Zo0Gw0CEDOmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(31696002)(4326008)(36756003)(38350700002)(26005)(508600001)(66556008)(31686004)(54906003)(38100700002)(86362001)(66946007)(66476007)(7416002)(186003)(956004)(2616005)(16576012)(52116002)(316002)(8936002)(8676002)(6486002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVVycFVPaER3T3F6SGswT3VYUGJzNVlzSHZ1ZXFIWUlUQVFseEFiMzczMlJ5?=
 =?utf-8?B?UUU2T1JwVkhySk0wWEF6bjBwcEFZcENoa3ZXKzhSQzhOQ1NXRlh4WTVzcTA3?=
 =?utf-8?B?Yi9JQ3FGRWk1emNpWnhQSkVScTJiSFpJVzVXOHN6S2dmYUZPQlRVUXg1a3VP?=
 =?utf-8?B?ejl3WXdKT05yQkhURzhENDRNZUtMN2l5TmUwcStzWkFlbFdOUk9hUHBMMUlh?=
 =?utf-8?B?M3Q3djl2bmZISVJCNGZuOUNoYWdRcjl6SGx1eTNqcCs3MEQrMkJQZE5CanlG?=
 =?utf-8?B?eEZYRy9TUllNUUxoY1hxZCttS1ZTbDlyWFhmcmlkSWthYThLYWpBWnFQeGVp?=
 =?utf-8?B?TjV5dThZSmdkNXN2VWU4b1ZVNFlGZ29IejJ5RDdHV0RkN1o2c0FIR0tNMTFC?=
 =?utf-8?B?QWt3K2lCSWx0enRKdm14YUZBVndoMVFiODNVa2Yvc0xhRkJKK3VNTWcxMHFM?=
 =?utf-8?B?azZ5R25YajRNajA0eTRBQXRVbE5PU1ZIUGMvcTlBem0yS01ueEJtbkVEQTlC?=
 =?utf-8?B?Z1RjdFdaOXR2RlFURXA1U2wyaGNiR2VzMXRpbVZBQXNSK1p2bUtrcFVSRVU3?=
 =?utf-8?B?OEh1RjRqNWFydnZCN2NTaWJ4Y3FjSjJ3bEVMemFKZEdIczZzREFKUnpMbGNZ?=
 =?utf-8?B?UkZLS09pQlBOaHBpc1Uwa3RFZkVIQytKNnJjd0l6dUdTblBQSEJacjFPYlR4?=
 =?utf-8?B?YVYvYlFkejFSUHlsdHNrUGVMajF0aGRLQlhMN0JabzRWL2QxcXB6bkZkQnRs?=
 =?utf-8?B?ak9oMUt5Q2haWlZBTFVsUThnNmw1QlBtOHFLbDNHTEkwRm8yMEk2UWxVaWI4?=
 =?utf-8?B?Nm9jYW9ZWHlGQlFBLytxekNGY3BONUhjNkh0UEx1aHIyVTB2Zi9nUVBEZTZ4?=
 =?utf-8?B?dzM2YnRMazU3dG5LSWtuNWNRZVRybFJQYkhZMTd5SEYyaTlqR2VNMlJtbk9B?=
 =?utf-8?B?UGFEbjRUTWdSODVFa0QwdjVnbjh1RHh6YWlRVnJUR09JQVd3RitwcmpyeUlR?=
 =?utf-8?B?a25QZ2FGemU5cVQzN3JaMHJ3ZlZITEdqT3lGa3BZUlVIUHZVWnpGSE95bDcv?=
 =?utf-8?B?L2h0Q05PODBZd3FjU3U5aXVRZlZlSE0vc052U2I5Y1ZXdUlSODVqVml3c29E?=
 =?utf-8?B?MHpvTVhTT3hSbzVLNmpCdGI4NzBFREgzb3lTdXRzMWQ4UXZ4aGh1cm4rQjA1?=
 =?utf-8?B?QUR4MTdoL1ZLTVphNFA5Z0MwdXltUWlLdjNVMjJpNi94UGVicWJVcDcxaEFY?=
 =?utf-8?B?R21GV01oY0dyTDdHVmQ0OUNhVHE2NVptNGZSbHV3T3EvRS9MVXkybnc1L2Ra?=
 =?utf-8?B?dGhmTE1zNnJPYmtXTk1pSm1nNkpmNDBTVVpOQ1huWGIwcHdEUG1wcVVMemdP?=
 =?utf-8?B?RHpWZEJaazBRelhFbXQ5WXRpempIcDdpMXlYQXdMRG1leGE5Z2Jqc0UxaTFK?=
 =?utf-8?B?Z2QwQzhycEF3NjQ1QkNyWDJqT2FORzJQVnl5dFVIdUtOSkFjWmZPK2lMbjdk?=
 =?utf-8?B?Z0w0VnV4UTBGT0hsZXozZGJYRDRiSzdzQ1U2dmxMUDgxZEEzZGR1Q3BXbzdY?=
 =?utf-8?B?SXFsVVRWb2FQRTlLdWsrWW85U0xnOHovVk5ibHhXOEJIUVhKQkpFM0I1NDU2?=
 =?utf-8?B?Q0llMiticXRVUjUwV2hrcER1UTF0WGFjWUpZbmRjUjZzVEdCaHpQd3E4T2tP?=
 =?utf-8?B?RVEzSnpoWENBdXpKbERnakFxU3VYdmw5a1cvR2ZyMm9XcDVLOG9QM1JLUlNK?=
 =?utf-8?B?dG1NWGM1REYrVTU4V3lRM2JCK1NWKzlSdm9sT1dZclNhNUhLbm5TcnNWOFNX?=
 =?utf-8?B?QWxDdEhGM0grRmpIaW9FU3ErSXdJTFdXaGh5WWJCTWhzWGZSMURYa2V2cVJF?=
 =?utf-8?B?b3pKRU9iNk1Ddkx5YjRGcG0weUNrdmxKRUpFb3BrTnVudm1DWFk3Z1YxQVB5?=
 =?utf-8?B?UXNZRWFiaTdiS010Mlo4cUNUbG1ITU90SXppazNxM25kVWtVUVRCam1Jb0tw?=
 =?utf-8?B?RUVTLzI5MHVWSElnYTU2MEd1RU80eUp1WE90Z0xacnpVRmNTZ3Q4VUtTcmNq?=
 =?utf-8?B?YmwrRTZEQjlzK1lwR3dERVlCNmtVTmlIMkdLYUdlOXVINWhhVlZFZ3Bta0NL?=
 =?utf-8?B?QUw1SVZFK0RuaHJWMzczdUtKK2o5OXZlVG1id2xObnFEUTBIeGMyUW1TQWNI?=
 =?utf-8?B?REJ4UjlVMEZyWTZxdDRYNE0yeTZFRDkwRkFyemhOU0s5cVdOQ1lKTWc5SUZa?=
 =?utf-8?Q?prwBo0S9IJIRCs0EV7bEs44FEiQ3DT/0pMewP0oNVs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fa926d-f2f0-4a70-0862-08d9c0890591
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:41:38.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSo15SGxm5YmdSWbX+m6L33AdIWlo5yyRZJv3K+D1gZ8QpOzJ3zs0vTSkRk8N12uC4qG/EEqlARCZsWs3n6KXq3PJFJJZS6f2HfUuxx7W10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3538
Received-SPF: pass client-ip=40.107.7.92;
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
> Now that we are fully switched over to the new QMP library, move it back
> over the old namespace. This is being done primarily so that we may
> upload this package simply as "qemu.qmp" without introducing confusion
> over whether or not "aqmp" is a new protocol or not.
> 
> The trade-off is increased confusion inside the QEMU developer
> tree. Sorry!
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Great job!

I looked thorough the patch, changes looks correct. Simply rename every aqmp / AQMP occurrence.. But:


[root@kvm review]# git grep -i aqmp
python/qemu/qmp/aqmp_tui.py:AQMP TUI
python/qemu/qmp/aqmp_tui.py:AQMP TUI is an asynchronous interface built on top the of the AQMP library.
python/qemu/qmp/aqmp_tui.py:Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
python/qemu/qmp/aqmp_tui.py:Full Usage: aqmp-tui --help
python/qemu/qmp/aqmp_tui.py:    Implements the AQMP TUI.
python/qemu/qmp/aqmp_tui.py:    parser = argparse.ArgumentParser(description='AQMP TUI')
python/qemu/qmp/legacy.py:        self._aqmp = QMPClient(nickname)
python/qemu/qmp/legacy.py:        if self._aqmp.greeting is not None:
python/qemu/qmp/legacy.py:            return self._aqmp.greeting._asdict()
python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = negotiate
python/qemu/qmp/legacy.py:        self._aqmp.negotiate = negotiate
python/qemu/qmp/legacy.py:            self._aqmp.connect(self._address)
python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = True
python/qemu/qmp/legacy.py:        self._aqmp.negotiate = True
python/qemu/qmp/legacy.py:            self._aqmp.accept(self._address),
python/qemu/qmp/legacy.py:                self._aqmp._raw(qmp_cmd, assign_id=False),
python/qemu/qmp/legacy.py:            self._aqmp.execute(cmd, kwds),
python/qemu/qmp/legacy.py:            if self._aqmp.events.empty():
python/qemu/qmp/legacy.py:                self._aqmp.events.get(),
python/qemu/qmp/legacy.py:        events = [dict(x) for x in self._aqmp.events.clear()]
python/qemu/qmp/legacy.py:        self._aqmp.events.clear()
python/qemu/qmp/legacy.py:            self._aqmp.disconnect()
python/qemu/qmp/legacy.py:        self._aqmp.send_fd_scm(fd)
python/qemu/qmp/legacy.py:        if self._aqmp.runstate == Runstate.IDLE:
python/setup.cfg:# AQMP TUI dependencies
python/setup.cfg:    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
python/setup.cfg:[mypy-qemu.qmp.aqmp_tui]

[root@kvm review]# git ls-tree -r --name-only HEAD | grep -i aqmp
python/qemu/qmp/aqmp_tui.py


I think, this all should be renamed too

-- 
Best regards,
Vladimir

