Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBF6BA4EA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 02:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcGKG-0001eC-Cw; Tue, 14 Mar 2023 21:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1pcGKD-0001e2-SX
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 21:53:09 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1pcGK9-0007kZ-Iy
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 21:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1678845186; x=1710381186;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3At4cd1kjwhHglgtE+2E4+ODY5rk1L3nRJlbfAPtESE=;
 b=lu+hgcSl06B85hLdUfO5yCDNuErDBkptHzHlRfsiV6bKZsxJEnH2bNgg
 Q4AHh2w/FwV2xvLcNr5iKULmqoU9zaEgJFpZG4wT8c7tJ5EBqXzhbxDgn
 Ez+gZLKg8XWd7rews98ibwuFT4pMt6m3OJkFbhfOW9cR2q/USrfIMYbN2
 waRDBWzDjZl/k58CxUVaVLyUfWtBWIgwXDZP6fkh8x7GJ+bSHY96/UZN9
 oQmf2cmc/3PqIMITbr9yjn3VPuwWLgx/tXPqMZOV24Ij+KJIbm9JQ4wlr
 8TxIZMoRvLs06KvOngJ4oOerFiH+JcRFYYusO8yJ+pdlstddKt7hjfsok g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="87567900"
X-IronPort-AV: E=Sophos;i="5.98,261,1673881200"; d="scan'208";a="87567900"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 10:52:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huobkDg+9dpB1Hx+Q/mDYWXOmsoZ9FJInCl/2DcsYPQe5VU/Bzyva8U83t8ryCLeyvfJVAeL6wspnrhqd06mvjRTbigbx7CJG7H4RSsvw0cJ8rBFzzB1vLT6z7qUYO6c4vZF47Yo83ftuW55TwfOnPYl5LY3jawen/SXTKfrPZ7Eqb6yPYiSgjLTcP4Vt1AK9u45NxFlwS7oljHdr80MOvZVHJJZrS0D4Arua9Ut16keN71f7Ztw7YCno/Hgf4J9/d9th1qtUztda1etbNB8bQI3y0qUpvHuS17Hrv5Al4YlVN0V8Zg98KVBKzqkuBlrSeOqiJhbcXHbaCnP34XDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3At4cd1kjwhHglgtE+2E4+ODY5rk1L3nRJlbfAPtESE=;
 b=c2pVk0AKMoQV947QEdBd18LroU5uoc4NEa+W1Ao01vh5ec2v4Be1pRWV0Kcsq8ecgIBuggy63NYxomO9CRHk5yUW3cs6U8qpWR4pHBpv9aiWbwDus3x+c6aVhmRrlXXdDvXl3PkPeNK3nSN8+BXG2Q6TLLbGuDjhyrPHJ+7pGANHQRptHH4+2kJdqoGC5UEaDjnUFeEvb0KfcaLTg9OJ+4bGVKD3YWPyri6w0Npq/66/rbdLOxNpGwjEkzhyshkhnlFEqPASVsAnRG3SOxxvuDkQsd96skwQEz1fYpJ+OS6ugvNTNS4kIsxdkluP0DRh6LguEVN2cZEvVptA93psUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB10390.jpnprd01.prod.outlook.com
 (2603:1096:604:1fb::14) by TYWPR01MB10854.jpnprd01.prod.outlook.com
 (2603:1096:400:2a8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 01:52:50 +0000
Received: from OS3PR01MB10390.jpnprd01.prod.outlook.com
 ([fe80::777c:ddcc:cdd0:7ec2]) by OS3PR01MB10390.jpnprd01.prod.outlook.com
 ([fe80::777c:ddcc:cdd0:7ec2%3]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 01:52:50 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>
CC: "jdenemar@redhat.com" <jdenemar@redhat.com>
Subject: Re: [PATCH] migration/rdma: Fix return-path case
Thread-Topic: [PATCH] migration/rdma: Fix return-path case
Thread-Index: AQHZVpjPxwM612hTj0mDiFk8f85wRa77FH4A
Date: Wed, 15 Mar 2023 01:52:50 +0000
Message-ID: <399184dd-a996-84f3-5038-6ea7b10f0251@fujitsu.com>
References: <20230314171558.75941-1-dgilbert@redhat.com>
In-Reply-To: <20230314171558.75941-1-dgilbert@redhat.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB10390:EE_|TYWPR01MB10854:EE_
x-ms-office365-filtering-correlation-id: 1b1566d4-9033-4c37-dd6e-08db24f7fbb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UUi8DIyT5nrzibqYLINp/B8SlLmhPDrz4Vw+fkY6d/L/davS9NbFYSuf2Hyd/22XpV6inJFdQrQ3biUBdXc7nEpG2f0dd6OzmAzlo8826zOl5qlc2nRBSJIJZ0zdyPNmUV6oLWafunoqspx4PMt6it89+6QGTZAxxHwvepuH2yEmmj7DIVCqdW5iccmHhMemAvv3Nd9pz8sKeamNwLeQwLLQ41oW/2E1e66161/kD/YRkaiAB2+fakccZ3vi+DTewNEz0P6/mHV/sYTFE4d0lOxD6OQ/qgfQyHMQg27Ayx+VQXy2sf6aG0Qp0n/QdTrKVZaAet8quye9pVZZ7mPqwUz0wWdmmwYZx3XF68/KNOrZMnDR5li+dptC+O3eWb4bMVoudpG/X6Tznx0SaBFIrTpePCfWFnrrax/HqWZa9LO8pArfd1W+1tg4o2iIX7BKM1EkBq0zeSNbPVgcKuy5Ox+A6wrXzEJML6zX/Lmz09t+HBLK4SCnu0xpdwh69KvE5BiproNOFKOVn2fRuc2Ozweze5VgilxGQYLeX5c+Y5cs3j6NoOySo/85YHqXNHbZzsvE9R4HCFzEUZFdGtGP8g2MGjT/uMlzyhtkUEAdwZZlBXZM6kwJ3dHkmvbVBb1KNTcCy517lUIwKWBGC54JbM67Mr7NfpgCveFZss8ffKUPXPNjaEz0Zk80LZQItXxPYFlOhGU0+2dxNnzggMoPGH4lx1IHGkmIfmk1KgzLoH98LlquDd7ZZ+EnsRuRUrysxnTeUxr1lDWKrdlRNnZhAz+etQAkYiigkQFveNEZRp4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB10390.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(1590799015)(451199018)(91956017)(122000001)(38100700002)(82960400001)(31686004)(4326008)(64756008)(41300700001)(66446008)(38070700005)(110136005)(316002)(66946007)(66556008)(76116006)(66476007)(8676002)(8936002)(5660300002)(1580799012)(83380400001)(2616005)(71200400001)(478600001)(86362001)(2906002)(31696002)(26005)(53546011)(6512007)(6506007)(186003)(6486002)(36756003)(85182001)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czQzY0RIRDY1U2tUQ3NnbUY3ZUFydmJvR1BzTzNDMWZ0YVdRdTR3VUJUMGZ0?=
 =?utf-8?B?SjdiNkpyVDhTYTRLY2RjVnYraUd0VU8yZDBzdGxHUUhBTWE3eFZ4ekRTMmg4?=
 =?utf-8?B?VW9Hamk0VytwUW9rTHNlME9jV3I0eUFXYnh1OGIyalphODBaM1Rkb2hXSzlW?=
 =?utf-8?B?Vm5rNzNNbmtpSmRyRVhCNDh0ZEhjVFM5c0pmQitkOS8rN1BLS3NOeUpnTisz?=
 =?utf-8?B?SllYMTQvaG1wZEJ6bE5adytET3lvd29oY2ZXQllJUHlMT084T3hRZ29ONDh1?=
 =?utf-8?B?NDZBNE5XQ3NJRjhYOXJyc01wRlZYOW80M2o0T1ZxVUNmUDJSeW9rMFNjQXcy?=
 =?utf-8?B?M0NWeWxvL1A0L0ZzVDJUYm9tZ1NZWGVsWW5XZkxlSVJGMlh1Rk1SVlJhOE11?=
 =?utf-8?B?YXcwSWVpQ1lsQ2dMS0hnM0o5alZya2pud3ZrYzRVNm9mNkNjOWxQMWNhWTNs?=
 =?utf-8?B?UCticnlXRjNHcUNnZyswa0xZSnFqSnJELzZuTFpHS1VjVVU4ZGpOZzZzZ1VR?=
 =?utf-8?B?MjRxWVo4U05pYlBUUW04ajBNQUZlekZKTllkelJFRGowWTB5c2grb2hUUFJn?=
 =?utf-8?B?TkpQTjRhUXI2VHZEM3ZCZCtocnFrL2RIT3JNQjJibEpWVTY1R1BLbDh0dFM0?=
 =?utf-8?B?dHRQMEJlRDNjMEVKdWIxTjVEenlMbEltWlJlRGtTcEhxa1o5YnZiVzdEVThk?=
 =?utf-8?B?bWd2aWFyYnhkQU9nY1dBSHpGL2FkRkttcDlEd0ZzN1lKNDkzY204aWFBZFgy?=
 =?utf-8?B?U3dEaHdIQ25uZTMrOWowRjB3aEJHZjZWWC9rSXB4Qm5EeUtTV1phYXZGOUZJ?=
 =?utf-8?B?Y1FGeTlVdjlDakErMnNXS2NKc2lXNXpkZkp2Tlk1Ni9MY0tmclFXbVJ3S05G?=
 =?utf-8?B?MTF4YTNFdmd6UmRzV2piLzd0VXdyR2dUaTczaWZMNzFZSEx5bi9mWmtSOUR1?=
 =?utf-8?B?UUtLZHU1MmJxZE4wZ0doVXZOdy9rWHpYZ2krSkoyQ0JXbDVKQWc1UDhMallO?=
 =?utf-8?B?bUVINEg5VHBVN3hrZXV6SVhuVW9DVVFwWHl0cDNMRURkbTQySnllMDR4c3Zj?=
 =?utf-8?B?QjVMWlhwczNLblErUlFIN3lGQW1vRVBaQTFlc21kR0NXSHJaY3IxaTVXQWVa?=
 =?utf-8?B?UzMrbzZhZDhncU5jVFRaaDFTTVdwMGNtbnpCdUFtOTNzVHZWUmtFYit0blAv?=
 =?utf-8?B?UE9lTU1sNGtrcHdBOEtUdnZJWStpL1ZtejhTS3JWWE9JZmFIVnpPTUpkbTVZ?=
 =?utf-8?B?YW4wT29Xc3QyOTRwbGpxNDF2aGFtMWpncnhWRXRiaVphbzZwTXB4UFlCN1Fk?=
 =?utf-8?B?dW1iSGJuTGV0bTJwNlhnd1lDMzY5OWxhMzNudzNZZ3JlRHdXL29HZTgvbWsy?=
 =?utf-8?B?K09FVlcwem9vSlN3OHpNVS84V0lPSlZMZXVsMkdZWURlZ3BBbFphM1ljT2FX?=
 =?utf-8?B?dFRha1Z5cEhQdGpYQnNrZkhwS3pqZmNYSFNwSXpYMk5VWGgzL3BoUkNOT2dX?=
 =?utf-8?B?WU8wNUx0dThvcXgxZWJkUmFKNGZsdXZkdFQ4ZXh6MnZqM1V0OUUwYkhIWU1I?=
 =?utf-8?B?LzkyV1B2YUJ1RE05Z1ZkV2wydzFrSEpqQVMwakROQmpPa1lZb1FQVmhUdUpH?=
 =?utf-8?B?L0U1NTdUZzN5QkdDdlgrTXROVUtwUWw4Q1dKM0VKajdNZTAvMFl2MVgyL210?=
 =?utf-8?B?ZEpGNzhZbVR6dEZVcGNvV0Y1SFRONzhvYWU4VHhCM2xmZUN2cWI2YzBEQVc4?=
 =?utf-8?B?VWxrYzBleHF5cktXN3M1ckJ6OE5ZWWlYaDlibU55SlZ2U3NpZnJCSGtSNzdq?=
 =?utf-8?B?RURKRXNJZ1RzN2VNcUtVelVGVEM3Y3Q0QlB0UlgraVpuK0tqUkpXeTBGdUpJ?=
 =?utf-8?B?aEpNVDdBclZBZTVNNnNHYjQ5VUgrUjFaRkFXNUZZblJRcThrZzFicHpuZzFF?=
 =?utf-8?B?SzlBNktnbWp6VEwzc0ZKbWF4R0h6MFYrZ1poQm56ZXZZQ0pEcnE5NFZESDFY?=
 =?utf-8?B?VWJnTXNPcVZycUdmajFseXR6Qm5MMGtqNC9uMlNtVXNvMGdwMGUwakExUXA4?=
 =?utf-8?B?M3FaNlc4N2kreVA3UWNxSUxQZG5JMGpFaW1Mb2tsbUdnazFjMUdFYm9WdkpD?=
 =?utf-8?B?SlZuZmV5VTlsa3c3WmJEOGd2NnQ4TVd3cG80aHdXU09wSC91ckpzcUFpdEpj?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41CBDF063F72D9499AC7F83BC37A1AE0@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WzQdjisrAiPxtFgsb76Xcx2Lmz2FN081aMLJYkdy9bARmrJgS+PnwB6iqLZzMod8b2gkwjmy4vXdmc/ySpwCM5py1qRoFuEciu8m/6HKmozzS2yxDE+vCYZN1h5KjBm1Ylw7eK+1kUvh/+q168HJxHFC8XVdIuTVEboYzvuLd0O+c81Vf/EkEUYR7At7HMpuh6I2mD7qJrxIk0Vcl8fY0kUZ5sx2H5RutbUzDLzwGN7CnjKygm5l+zEgbIAc1tVuGApEMXqYOC9OXy9GX5tu8UIwXGtQB6CZzWD/1aW/BYBpvV3JHYswg+BHN4KEbLnc8bbUcV1ek4SUmviZpUygTCJS92SwzW1QQ4hth1PalEhb2goua68s7CRo0LXwfJWCxLD24BoehvUSRoWwluGz9ePvYsyprhgeWjeUiwIsWBMBH/SzeZzRw/2rVsC3kMQoP267T6zRtQWooqfrV7/rEVoV99C6JLr1aCM4m8YrkAcMvMEAqIl2lsAtDwYW1r3xXG53sTkQgpyR68Tt/3Pc+u9rbsWlTUxSQ+rnsMalXMyopfXuXBzq1FeJpqDzMDAdcvIGRpAgJ5LQCNPUH+x8DOneY/56eVIvIhye5thBwiVm1JZjwKKBMGPKBo0LuUHszdY3uXvKcVxOEGiQQpQb+oWBb4noQBtCETL64eoHhz5Lk+zTxKX9lPad5w0uBdB1xzicrKHfjT4ppSyigEMKiVtXgvnSjmj5sCuOarUoJNa7/2QwWdoDmYNg++gP/aNnEUOGgnqYX4XEvMIs8mmQCxku14xbZ8ntspaFF7ayekA=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10390.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1566d4-9033-4c37-dd6e-08db24f7fbb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 01:52:50.1462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2Nr+ObfWqtppPgwStdVHTVGWyvwsxJAYMGZJsuqm4H11/lM/AjcViL9E7sRsr0ZfipPsBD9pGXL3jWaiB0tHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10854
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

DQoNCk9uIDE1LzAzLzIwMjMgMDE6MTUsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgKGdpdCkgd3Jv
dGU6DQo+IEZyb206ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNv
bT4NCj4gDQo+IFRoZSBSRE1BIGNvZGUgaGFzIHJldHVybi1wYXRoIGhhbmRsaW5nIGNvZGUsIGJ1
dCBpdCdzIG9ubHkgZW5hYmxlZA0KPiBpZiBwb3N0Y29weSBpcyBlbmFibGVkOyBpZiB0aGUgJ3Jl
dHVybi1wYXRoJyBtaWdyYXRpb24gY2FwYWJpbGl0eQ0KPiBpcyBlbmFibGVkLCB0aGUgcmV0dXJu
IHBhdGggaXMgTk9UIHNldHVwIGJ1dCB0aGUgY29yZSBtaWdyYXRpb24NCj4gY29kZSBzdGlsbCB0
cmllcyB0byB1c2UgaXQgYW5kIGJyZWFrcy4NCj4gDQo+IEVuYWJsZSB0aGUgUkRNQSByZXR1cm4g
cGF0aCBpZiBlaXRoZXIgcG9zdGNvcHkgb3IgdGhlIHJldHVybi1wYXRoDQo+IGNhcGFiaWxpdHkg
aXMgZW5hYmxlZC4NCj4gDQo+IGJ6OiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19i
dWcuY2dpP2lkPTIwNjM2MTUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERyLiBEYXZpZCBBbGFuIEdp
bGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+DQoNCkxHVE0uDQoNClJldmlld2VkLWJ5OiBMaSBa
aGlqaWFuIDxsaXpoaWppYW5AZnVqaXRzdS5jb20+DQoNCg0KDQo+IC0tLQ0KPiAgIG1pZ3JhdGlv
bi9yZG1hLmMgfCA4ICsrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9taWdyYXRpb24vcmRtYS5jIGIv
bWlncmF0aW9uL3JkbWEuYw0KPiBpbmRleCAyODhlYWRjMmQyLi45ZDcwZTk4ODViIDEwMDY0NA0K
PiAtLS0gYS9taWdyYXRpb24vcmRtYS5jDQo+ICsrKyBiL21pZ3JhdGlvbi9yZG1hLmMNCj4gQEAg
LTMzNzMsNyArMzM3Myw4IEBAIHN0YXRpYyBpbnQgcWVtdV9yZG1hX2FjY2VwdChSRE1BQ29udGV4
dCAqcmRtYSkNCj4gICAgICAgICogaW5pdGlhbGl6ZSB0aGUgUkRNQUNvbnRleHQgZm9yIHJldHVy
biBwYXRoIGZvciBwb3N0Y29weSBhZnRlciBmaXJzdA0KPiAgICAgICAgKiBjb25uZWN0aW9uIHJl
cXVlc3QgcmVhY2hlZC4NCj4gICAgICAgICovDQo+IC0gICAgaWYgKG1pZ3JhdGVfcG9zdGNvcHko
KSAmJiAhcmRtYS0+aXNfcmV0dXJuX3BhdGgpIHsNCj4gKyAgICBpZiAoKG1pZ3JhdGVfcG9zdGNv
cHkoKSB8fCBtaWdyYXRlX3VzZV9yZXR1cm5fcGF0aCgpKQ0KPiArICAgICAgICAmJiAhcmRtYS0+
aXNfcmV0dXJuX3BhdGgpIHsNCj4gICAgICAgICAgIHJkbWFfcmV0dXJuX3BhdGggPSBxZW11X3Jk
bWFfZGF0YV9pbml0KHJkbWEtPmhvc3RfcG9ydCwgTlVMTCk7DQo+ICAgICAgICAgICBpZiAocmRt
YV9yZXR1cm5fcGF0aCA9PSBOVUxMKSB7DQo+ICAgICAgICAgICAgICAgcmRtYV9hY2tfY21fZXZl
bnQoY21fZXZlbnQpOw0KPiBAQCAtMzQ1NSw3ICszNDU2LDggQEAgc3RhdGljIGludCBxZW11X3Jk
bWFfYWNjZXB0KFJETUFDb250ZXh0ICpyZG1hKQ0KPiAgICAgICB9DQo+ICAgDQo+ICAgICAgIC8q
IEFjY2VwdCB0aGUgc2Vjb25kIGNvbm5lY3Rpb24gcmVxdWVzdCBmb3IgcmV0dXJuIHBhdGggKi8N
Cj4gLSAgICBpZiAobWlncmF0ZV9wb3N0Y29weSgpICYmICFyZG1hLT5pc19yZXR1cm5fcGF0aCkg
ew0KPiArICAgIGlmICgobWlncmF0ZV9wb3N0Y29weSgpIHx8IG1pZ3JhdGVfdXNlX3JldHVybl9w
YXRoKCkpDQo+ICsgICAgICAgICYmICFyZG1hLT5pc19yZXR1cm5fcGF0aCkgew0KPiAgICAgICAg
ICAgcWVtdV9zZXRfZmRfaGFuZGxlcihyZG1hLT5jaGFubmVsLT5mZCwgcmRtYV9hY2NlcHRfaW5j
b21pbmdfbWlncmF0aW9uLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKShpbnRwdHJfdClyZG1hLT5y
ZXR1cm5fcGF0aCk7DQo+IEBAIC00MTkyLDcgKzQxOTQsNyBAQCB2b2lkIHJkbWFfc3RhcnRfb3V0
Z29pbmdfbWlncmF0aW9uKHZvaWQgKm9wYXF1ZSwNCj4gICAgICAgfQ0KPiAgIA0KPiAgICAgICAv
KiBSRE1BIHBvc3Rjb3B5IG5lZWQgYSBzZXBhcmF0ZSBxdWV1ZSBwYWlyIGZvciByZXR1cm4gcGF0
aCAqLw0KPiAtICAgIGlmIChtaWdyYXRlX3Bvc3Rjb3B5KCkpIHsNCj4gKyAgICBpZiAobWlncmF0
ZV9wb3N0Y29weSgpIHx8IG1pZ3JhdGVfdXNlX3JldHVybl9wYXRoKCkpIHsNCj4gICAgICAgICAg
IHJkbWFfcmV0dXJuX3BhdGggPSBxZW11X3JkbWFfZGF0YV9pbml0KGhvc3RfcG9ydCwgZXJycCk7
DQo+ICAgDQo+ICAgICAgICAgICBpZiAocmRtYV9yZXR1cm5fcGF0aCA9PSBOVUxMKSB7

