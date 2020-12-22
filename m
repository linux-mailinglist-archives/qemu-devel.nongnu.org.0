Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927472E09C0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 12:35:10 +0100 (CET)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfwb-0007ZO-5N
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 06:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfvC-00074H-Lp
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:33:42 -0500
Received: from mail-oln040092253070.outbound.protection.outlook.com
 ([40.92.253.70]:35232 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfvB-0007DI-5N
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:33:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JllwvmPkLQJIX2U9BpgjuX+6ENx+vwlf7Ulk1NZch0SIJEHoHKb+eyc1UYUq4SYrlpn1tcVNjZMYrKMPfNgQS9gBsUg3mzfZ3YXh+WyeWNSDWsY7SIrzuqg26n+Ne5TVEhUz0h6d3Vnu++Xb8Fe5HiFR76wd+neUh6JJWbh4wkmYzrWgo1OVwHPuKxDjzs4+wLX7FMLhfv6Azs4LYc4bAio0JZqu+JAmEXKp3GRZ4x6ESZRbJ237jK1jrLWoJN6bvz9O+XPNhN+aRY9ysWbvMJ/52mFuUWskdsa74jqt0i0QZ1DhFTrEuFmbkYf80tLEBhHAIrxCv/1InC+hbB8QGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt/F9w28Ko6pcm7rqMIW2rj9j6DztPPsrknlWZyaSmA=;
 b=E06jRWaPmcCIbY54mdxA0OCT1KyDtkrhzKu9n7kjpeZtVYP6fDhvKGAJTCI7QgnAGak0Q4ChJ65BmtaVCOutoprKMG7u3oPZNLth06Xf9VjUcNsDyVnAAixbFAhPJSXdSBDZqmcXWQkM57iombbIpYAgVLqMgCOcfnaOlQ85ngM9junlPNRq+HEN2J0KE1Zt2rot0jLB795s/BiePGkjZxjxuMQtIbWAkiTvAFSXtVthG27VXYkAi30oa24V9P9obbrrKxZJSL/W+ggVoZcgK0YNwNl73hbH4+TxPdy2AHd6UFb7sY+XFfEuy34zrq9cyjeN2mhq8nfOA95ZL+RUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt/F9w28Ko6pcm7rqMIW2rj9j6DztPPsrknlWZyaSmA=;
 b=hosJU/j5FzbEkRAnQiqYOvQGYKVZ9BS24HE2hl+VsPhZyBzeeUOSg+zDML07WQKbo8Noqb7ADwV2SrwcU1VjcQ4zDT2cWI5NutIl7wmd2taCKFT8dUTvTkt0w6XKfUv8zGeOD+glckByxLg1ignGDQfI66TUP04Ox4/X18GFNHgq2zlV4OA5NGbsmoAm0dwd/6iQ596qkr5fQiiyx6YKHjSh5iEq8vclzhObjlCD5BZbkR5Q3FBslZli0o6X+3YgqhgKApXU7/vVhDtXks7ZvKOBt71ADf7EtQprdBWRSl/WlSur1ErJUgwNaI82F+OWs92VCrrGlAmk5vHSlb8m+w==
Received: from PU1APC01FT044.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4a) by
 PU1APC01HT115.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::375)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Tue, 22 Dec
 2020 11:18:19 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebe::42)
 by PU1APC01FT044.mail.protection.outlook.com
 (2a01:111:e400:7ebe::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Tue, 22 Dec 2020 11:18:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:11B02CCC7631BDEF927498A2C3AD94B858B0C26CC338AB6F9218CEC08F36E1C9;
 UpperCasedChecksum:95D12F61FB62A74CF9CB974F8B0BF6379C5EA4AB79BCEFEA1E29EE3413903295;
 SizeAsReceived:8634; Count:47
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 11:18:19 +0000
Message-ID: <SYYP282MB1501CCE6246E1DA6B475804FFCDF0@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 1/4] fuzz: refine crash detection mechanism
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Date: Tue, 22 Dec 2020 19:18:09 +0800
In-Reply-To: <87v9cv3skv.fsf@stormtrooper.vrmnet>
References: <87v9cv3skv.fsf@stormtrooper.vrmnet>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [1bQcn9a80G/57S4ou1F7C2hSpDprFEVn]
X-ClientProxiedBy: OS0PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:604:99::25) To SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:da::15)
X-Microsoft-Original-Message-ID: <77bb779c6e5490ad150cf950ded33a453ff59a5b.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (204.124.180.84) by
 OS0PR01CA0078.jpnprd01.prod.outlook.com (2603:1096:604:99::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Tue, 22 Dec 2020 11:18:15 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8c832a18-e80b-49af-a69d-08d8a66b4934
X-MS-TrafficTypeDiagnostic: PU1APC01HT115:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1PInTts/lvzUH0zkaYVPsWNvR8RxCvLhiCA2ijc/cLPOCNpDUHkJ2LvbZTy6VjojMY4vYJyOjzxhWkqjsiBTT/1bMzab74TsKYMF2DT9okyIEk9/5zi9aY6UPpKN2BGqucErvDxjHrW8j66cJKsW2JpRNJpj5wfk3cePmacsWOBaojdNfrcnf//8bvcSq4+MNs8t/+j+qK9INKYnFezPmtfRjKNZknUUy37ERqfg0kpGBldDgKxvVWc40tCvOR9F
X-MS-Exchange-AntiSpam-MessageData: IQzmuAHhNQAye/vy3AzLusRJgzTjQzqz3znUGXfB3KpGBfcRhgu8QATargSq6BzXTkKssQNYf2DSa0MMRjkSlpMxV0zQf+sPcB7OvEuPcvYEu5qzS2Hpdiqz4k0YL3obl6tBQIAlB9wBk9PYlsUPrw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 11:18:19.2037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c832a18-e80b-49af-a69d-08d8a66b4934
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT115
Received-SPF: pass client-ip=40.92.253.70; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This email looks empty. Is this intentional?

On Mon, 2020-12-21 at 13:46 -0500, Alexander Bulekov wrote:
> 


