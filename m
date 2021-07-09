Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E025A3C1FF4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:22:10 +0200 (CEST)
Received: from localhost ([::1]:49164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kpt-0003z4-VD
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1koZ-0002tr-HX; Fri, 09 Jul 2021 03:20:47 -0400
Received: from mail-vi1eur05on2106.outbound.protection.outlook.com
 ([40.107.21.106]:56257 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1koW-0001X1-C4; Fri, 09 Jul 2021 03:20:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUxJbn8KVCONqwxDjo9Wa3kLKYBQcWr0GsZdkxa69wmLxqHOph8CAHTTjKpJIhmAv6pmRA9dqaF2dHQtsn0X2PAQ+/qWgBgYT+HVl38G14HeN6iDemMRrWH+ajV55yGwrYv1qR33GhULhswxv4pZnyy7vIyTvOwu2xI2iGZIFEbS6rbbS2hiaxmiL7UdyCouusjZ6B9tYGWsxwsz2ySRDXdCJ/GdyJksS+wlv+4s8/4qC2gH2hqlAXrcjNVJel4MgP5xg6WWSZakGo+s72JK9dbr0Ox74mKZrpj4JwnUkrsBH+bFBu++rMKtolKNAcysLZClmMmNM+jY4B7CXmb2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqKHcveRI8YIbzmvL7S0KQfZK7QQNrDyiIfWK0EDH+8=;
 b=kpxmMjs/pnGwAvnZoPlf8c4AnrV8571IaXgarCmQnK7MJC4l969FwooP1Cnk3Hh20BsQ1AzM7ibrW3lYtT3AxhBYh15Fo5egg03VCxrJEJ4gDJUlKxR9JuvFfwaDu41Bosc/514cizJffewCYMjkaT0jSPYYSkkiQIc8szj8gFf8LQCQ+HurnJUy/Ghj3ue3zDkTCDoFnbD9X23LRxl5E0ZMaaCNb3mfp8F4MQrLQFmK8nNxSrCZVQBeFIPfhoi7rZkBVCOzQRLg16Pquuutq9gYzC3cHYLhUNpJhodWmQZgx1bxhUet76kRO/6xuGhKfcxsCW7eoRzDxqtuojIALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqKHcveRI8YIbzmvL7S0KQfZK7QQNrDyiIfWK0EDH+8=;
 b=Xt9djeyvgMgO+s3vi7+fcjB5MX4R2TvFjeBOngQN+2Ckuezfrh4R+JzLW+FjDS+kQmUuuK9Qrv1xJHNvxLRhrj9O7JLc/zEmIsMWzbV9lSoo38AUuSZeFZcbGCQA0at1ANptf4g80vRn2cid+imFUPJmJz45rT/Py02ZYGOZRuY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 9 Jul
 2021 07:20:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 07:20:39 +0000
Subject: Re: [PATCH v3 2/4] replication: Reduce usage of s->hidden_disk and
 s->secondary_disk
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <55248d9609e35b5ec0625a770cc99c5d36a7326f.1625680555.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <11299a9e-b1dc-f8f9-8c32-72a455641f83@virtuozzo.com>
Date: Fri, 9 Jul 2021 10:20:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <55248d9609e35b5ec0625a770cc99c5d36a7326f.1625680555.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::40)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Fri, 9 Jul 2021 07:20:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7bb70be-63e3-41b6-aaab-08d942aa0e06
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990B4A5D8130ECCDD42EFF9C1189@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ase5Ae69onws/fey/d24Ztneg88HiBJIzwOCKZGvvK7emBIKiPpdy0Ud2Pgd+X9SNYi0AZ0pE0iN4VfagMsLRgwGS594vwxwogAXAEIsQpUCw8hQU8rEjb2zZumLjgGMYjvcQ1emisrl0TjvCDYEoo2yMfYQacu1VKyOPYT4ry6C+j6QumqZt+jpYnSOA74RTUJTTzSlqS3Bl9/aOE/bLnUXxy9Puo4Su27+3TVP6F+1XRVBdt+V4Uqthoolf/KaOfBI4tCxkDs35uk9DvTfSSQ/u+UBcSyZkn6QNfb7SAGilz7Br9yvNKb43kUK3QTTsymMa/3Rc3Zu023gLfA2az/F2UN278Xp8RWqvJGY5BX3O24sefepQlwe0c9SdqEyMtnbic/W34D0NggxUdlE8YAvOh/r80jdWnk5oNVKOEMNK8d8+SwjqzCvBHN73XCA5v9PKsqfVquSxZEdR2dEOeUCEpq56CEpdboeQGe+9RcO1wnWarY9Ne/LLWs+ZbQM0CswRxd8dxjPi6G3I17+NFJMIT1h6Ax28Rjozv9Nt2h8DJgFVnjQDoZw3U0GAc8c2AupeqXuq+y1I6cwKJzkzCethf+WFMUP5mBJ4GnCLKW/I8i6oyaeVGqTmd/bQpaAjwdWlEulFySvVX+XUInxlbs+x9daXeKGFhRaoDz4A3S/w7Qo3cDWVLaL/nREQbih9AwwFkmXGcY59YAsctVJ32ePogCon9RKc5e4AJM0ZfUgTKF8OZo4S87gcrwShcntQNKBtXctRmwIK2Y/JdOdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(366004)(376002)(396003)(38350700002)(86362001)(38100700002)(5660300002)(956004)(6486002)(316002)(2616005)(26005)(31696002)(8676002)(186003)(2906002)(478600001)(8936002)(66476007)(83380400001)(4326008)(66556008)(66946007)(36756003)(31686004)(52116002)(54906003)(4744005)(110136005)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Vm77v4qeJoL5VfcEZhQiyjlb7MFG+ghm1NGLCD6wn53VMwJvboAWWKnv?=
 =?Windows-1252?Q?gp5IrrCTyX0ypkoPBDewAE4FA7LzLCM0Cn8sIYECdepRxvPOnIFNb3px?=
 =?Windows-1252?Q?DRJz463Cj0lb1B7itXNvHMux78V1taYx1S7Aowtz6/YNs7uC3qGzkXS+?=
 =?Windows-1252?Q?h8IxwChhsTiKE5I/5XIDIArYS3qDndYCFWKyf6qbcHXWIWZViJ6FADRg?=
 =?Windows-1252?Q?MHHH58ShtVsQR6U07bH/YhvFOVRv2iQ+EvbOBSt714w5qPJ7vIP5SlpY?=
 =?Windows-1252?Q?M9vLXUO41A4slsG4W5fxuvWJu63ximvqnspICj/6Fd/8+dSeARa8pWju?=
 =?Windows-1252?Q?9DZ+dBZhU5cRpZHOvJZUA2roUJk+zXbMxTY8UhLYYa/VeY2lf9WxGdHA?=
 =?Windows-1252?Q?HKvsHpq/8w990gcaZ676qspC01YztshWpm5Q2JlqONf2ZLyWMSuvsf9I?=
 =?Windows-1252?Q?QHzgmeQfRfz5n4Ym58FPJdgYKMtStmS/hPCncyuJQFGFfQ9XkiC3zTUR?=
 =?Windows-1252?Q?iFgsFC3K67g07kc858qKgG/NTWSSckfiRoszZceosI4czf9yqsYZJ91u?=
 =?Windows-1252?Q?OZeapnle8bevetSMhJjWiVehkYTDpBI2cAFhUlQvWJesoEGhNEiu5SbF?=
 =?Windows-1252?Q?wFsD/YE3MlkQa5UqMc9Ux7fpTxYcXfi9KXSDszWOWTNfGJzzF/ZwGRVS?=
 =?Windows-1252?Q?CfG+WrdO4NWQ0fW1BprECWRNMSpAxdh1I+VqGYzSu0mPLU2BPI8Rb8NQ?=
 =?Windows-1252?Q?xZnxm4+vxNi6IzFmSxCgEfwc4svmAXaGMFUw2kftsL+++mosUluCs9pr?=
 =?Windows-1252?Q?CfQK4cFSRlz2jRsp96ZNSW/XDIN47II/EH2REUQ3o602tRALOvoaDCI4?=
 =?Windows-1252?Q?usS8cYThf1mk/Vnz7K65gbtirsVA37LuYDI1BJnrzj/OJwZttD/A25iB?=
 =?Windows-1252?Q?6ZLa038EObJAjZ5vz0CfW+aPt2oJ7KHT6KFZckHBFsFGDs4JjTk90HHx?=
 =?Windows-1252?Q?ONOmELHm52cjRTljfipJJuS4kR7c3qfNVtKSEiCwJJpwS5yfs6rEdZrv?=
 =?Windows-1252?Q?1AP2Qe5eNrn6CMsRiDl5RZz/8YgbrWJVx1Q47f2tG9DDFNycwm9q6NqD?=
 =?Windows-1252?Q?mMK76CYoFu1BpTrDZZFjk+ocHIfVnI2mjmmYPviPCyLBpMRQw84RlV2I?=
 =?Windows-1252?Q?IeJqG+mj1w0YaRtNMzrf61+862bintYt9oCjoqZ94isJHXNhLkZYykUP?=
 =?Windows-1252?Q?ljTD7sDlnei97vESiDQAB8T1ncMl4Y4F5iy5Q7aAFYgfe/HFG6NgeLMl?=
 =?Windows-1252?Q?V+I/JqquZS9VYpd7mAYugxemLa1BWBvFPgUZNuXwv22KYtgI3cOgqq+f?=
 =?Windows-1252?Q?cU0B5h7DvClKNEI7er0rMP7qKMKXBGrhx1syYM+qaU9aoUB4cKJIxMlm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bb70be-63e3-41b6-aaab-08d942aa0e06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 07:20:39.8221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xO2Kjwqbzluir3NMt+qf80Ftg3jglsTkaiFNuYkpvk9gKX7Ogeok61vNn3zZFhKdSoWCxPj8BCeX2IYAZ80Yc5xb1SIRip6UeBQfjw9P9m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.21.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

07.07.2021 21:15, Lukas Straub wrote:
> In preparation for the next patch, initialize s->hidden_disk and
> s->secondary_disk later and replace access to them with local variables
> in the places where they aren't initialized yet.
> 
> Signed-off-by: Lukas Straub<lukasstraub2@web.de>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

