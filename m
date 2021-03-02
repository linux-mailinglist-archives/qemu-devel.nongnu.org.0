Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68232AA82
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:43:14 +0100 (CET)
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAvJ-0001mW-1e
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lHAtE-0000lR-UB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:41:04 -0500
Received: from mail-bn8nam08on2128.outbound.protection.outlook.com
 ([40.107.100.128]:63745 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lHAtC-0006Mw-Pl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:41:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7Sc6QfCueXZOqJd1bQm4P9jH7nGGuUGftc9ogkVf/aK/zNK/OM9CLGAw6IYBIQu3naeXXbTusyHRsRmSzDpHazKxKtGs4jwR3GduCQd/9GKWdiv1oWXEPt21HTxiEIpxWolKd4i6FxPtPXe7jWQGNyA1v0g+kJH1riWx3rsO5SC8Ltw0XheX5/HWw3AS1ET11GjhwR9Kueyb09muq38qIYrw+GGci1WDSu21GKmM4lBwanwRWW5+Vyqwfhm7sS7PmD+d2DuLgsFSblPBHde6FX56kDjXOSJ2IwJYhIgV0bXnvNvetneJTqF1X5raLaAFxu/H0ilFz7wPTnahcD4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U920G3lqqRVPiK+dVl7jBiHqWdJKT9fXlek51zaJN3A=;
 b=RFP6Yf/EzfTdKCYL2FEDcQxblMIMdoRZEV65AWLgrU1W1H++OetZx1fRUkHtykejOwxItw3EjYyzG1TqcKSCFfDvT0GDvu7YzTbG75SCTqG6oiFgIHXyGx2M9R8Rn10HN8hCtDRPV7ET+Tt5b8d2RMBxEam7wDBJy2SMdwY2uijtI8vD9AlAbGoF+kpHiWO5uYI978W4Z4LYWr2EL135Av7OaJGaE2vb/viSlu0KvKgAVNXxcRUHrEspESklM2t1WzfDDvSWjveO6oRXa9yqwQBc/aTSh/3euRSTmJIqOq5A45qjG115UTX1MsJcNKUUC507tDIFNTLY09TvXTOGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U920G3lqqRVPiK+dVl7jBiHqWdJKT9fXlek51zaJN3A=;
 b=C+s06LafEkeNOBPVGlN8FSJX7l8krxCzFTj9/9dHO/FJoV9odvapl5I+wuikIUQm7ChIK8Hn1ZW5ra+dfWveNlnltugnJsbl/4muIYjIDbgyHAolLDCNpC7A1D2l4DwYUQB1aoqwldPWTQ5oJgDqCaCtGH8JLi3P3ChPdRDwHwI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BL0PR01MB4291.prod.exchangelabs.com (2603:10b6:208:4b::28) by
 MN2PR01MB5808.prod.exchangelabs.com (2603:10b6:208:179::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Tue, 2 Mar 2021 19:40:59 +0000
Received: from BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::2867:4b4e:c7c:623f]) by BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::2867:4b4e:c7c:623f%7]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 19:40:58 +0000
Date: Tue, 2 Mar 2021 14:41:13 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Message-ID: <YD6U2dC1dWbixriR@strawberry.localdomain>
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
 <YDQYrptOxAjs0Pf0@strawberry.localdomain>
 <YDVrYk9O2gBPwxe4@strawberry.localdomain>
 <YD5atyGBcnxG8+ZK@strawberry.localdomain>
 <87sg5dilp7.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sg5dilp7.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::12) To BL0PR01MB4291.prod.exchangelabs.com
 (2603:10b6:208:4b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0097.namprd13.prod.outlook.com (2603:10b6:208:2b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.16 via Frontend
 Transport; Tue, 2 Mar 2021 19:40:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88bad879-dfe3-4c65-9385-08d8ddb31a6e
X-MS-TrafficTypeDiagnostic: MN2PR01MB5808:
X-Microsoft-Antispam-PRVS: <MN2PR01MB5808D25DE9FADB4C346326C58A999@MN2PR01MB5808.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/OUXN0UlnnYpsvOStisvUQWirTyWBvQO9AxEX6fy+M27jZwA1nYDh/lO+kA3JbmJ3wnvhhWecYc3300XtC9OERomNUXwUV92ZidMrD1LFmtc9wK2VJpXsjLvW/hN5NtyliT0OL3jGeSMffLUK35g6udiNIAxdO7E6XCUkmG9lga2WG8ZZVEZFUvCEFuXxCf4Kpn6zMro4OzvYtW4ajRrdSq5kkoTjXkRL0sULsosVmpNBlcyuFx3X2BpMcIKeNx1AUujgFowNg1OdcFwYeB4EKE3x/pFnUjALDAM9Dk8N+adCz4V1QwZS4f97K7ub3G6fThl1CAf55S/+K8ugWAKuiyOZzUVerHzub4Bn7+a7fqoDOWk+LPkoGsSnary1OTOAd29aoDgbMaawBASzPtHVNmqbvMZLAqovgZINsYVFdzi948+2Dc3OrEtfrMQlUk4MPyQ1LWWsaiuod2EkG5PfamyxB/Klm6APCxXl3tTMfg5XuZKJugYN4xx+AEyDE6U50worDK3PnPJQzv1A7TaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4291.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(186003)(8676002)(956004)(8936002)(52116002)(26005)(83380400001)(6666004)(9686003)(55016002)(478600001)(316002)(2906002)(6506007)(6916009)(66556008)(4326008)(86362001)(16526019)(66476007)(7696005)(5660300002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?E2NOvpuFB+SGj41WVWauS86aa7e+MpeSbC/XC2tzvleGay0q/qD5S6ABsm?=
 =?iso-8859-1?Q?eAdlNkqW/pTAM00UPZTn6YnpkrrVZlkKgCzYlMo3hXvVAUmMXB7of2cFn8?=
 =?iso-8859-1?Q?TPFemsQ21WvPYj303EB3NB/nZcHqJkCF8qTLTi+KmVUdb7eBhy4WKmKSPH?=
 =?iso-8859-1?Q?be7xwFXjIWMZyR5iqoT+oHEDiv/5IQEwHMbLXNa7QCUEhHvq/WX4Q/B4Dv?=
 =?iso-8859-1?Q?y6qm38CrAcg45kyugsfMgQ+o/tf2/hOjd7KOZFMKiqLxCEcS/dXyCKSBBy?=
 =?iso-8859-1?Q?ZU2TRO03veWShh20jwXoWah/T35X556chhF0WEHGfy79oCaiZI7WRfA1Wh?=
 =?iso-8859-1?Q?q8uaSxZuZglDRxG+FrsiRoY7g+khSTO14kGwwN8es8iPvg+iLVNFEsyV/4?=
 =?iso-8859-1?Q?sDAWKlJdCf+MQIYI0gkV9tNBhEF6aMFVOn7C1JYcV7aVT55SDdO/A8OzhB?=
 =?iso-8859-1?Q?By5nBDihM/0s805HKzwYcxZ9hNq+EOSF/J2M/XAwDXl8g62cFT/800uT/0?=
 =?iso-8859-1?Q?qb0Sk6DnFHu5ogCHbtc7qJLvjDUb+s3tj2oPLKfSD4u69Yvt1PyFvtHH1u?=
 =?iso-8859-1?Q?dDxKvhGC3N564kFnFMR8UI0bAaRbPL6aIdPWXPrh04UxvqwGYFAukJnOio?=
 =?iso-8859-1?Q?SBfpeI5oN3rHIFQt+9cr3ItMdxYumGWqfVZ9FxL4hxBS3apu6Qa5Bw0Vvq?=
 =?iso-8859-1?Q?9rxZeha1hE5FfoJQVwwqd2aE2rzxklilRhN8mc1NR1YqcvPPeR1kntdeDy?=
 =?iso-8859-1?Q?4BAr1an+SyT+9PrUA3E5VP8VTeU7M12kwDDzTPDX3Du60Twc/3fsEc3vqZ?=
 =?iso-8859-1?Q?46YRvqHCavyIrQYbNmgShaO0tyMNLRlOAMNcMvhRpur5JbvYqxhv46avJN?=
 =?iso-8859-1?Q?KxHg5440KwK4ABAMjA1fc65j672dzb8iNzMB/25faaFTOxGnx6QzPpFcD3?=
 =?iso-8859-1?Q?GqXMmRK/IUI6LKhoaPRKP7Fd6FRnltlxqG9oKHDyKCaFS02wtuUZawGOsJ?=
 =?iso-8859-1?Q?7sZWSRJxJnifpFzFvuS6DEFTCYLG99osB1x8gNxkxsHjJz/gCNwPoq3bnu?=
 =?iso-8859-1?Q?ajtJOcKVXJgbfdUN+WEJM+642y7jcmrViv9qABhMcwaf3PBWgPluPNYcrD?=
 =?iso-8859-1?Q?RaPOajbux6CXWn8Deu3qMhgWhh4ofy6SQkEH69y8g5HrAKJz2C3rYinhmv?=
 =?iso-8859-1?Q?XXTNly9Pf+6Lb/XXVnCypFEzBl57omwbsHZCz4oV4UfaDqulBY+54Es4jL?=
 =?iso-8859-1?Q?TgHJRw2LduUIpe5/eif4YSB2f8NhyNegrjG6xiXMjI9LGqHWgt2vRh5c2/?=
 =?iso-8859-1?Q?5Ikw/Uw5e0s45bgrmo/088tEQaWG1Axec+pgRh0aOI7E9ovhQV7gdkyKrP?=
 =?iso-8859-1?Q?zpkSVj8uLs?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bad879-dfe3-4c65-9385-08d8ddb31a6e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4291.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 19:40:58.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+rUmF7U5ABOUBQY8fQc1QJNhMqzWvkZKAMjBROTmI6DgvPXmcgSL2btak/1MWaxb+OGgXzuUuRNaj9XmZyvTK897qm7i4vhK7D/n1GmzxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5808
Received-SPF: pass client-ip=40.107.100.128;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Mar 02 16:06, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > On Feb 23 15:53, Aaron Lindsay wrote:
> >> On Feb 22 15:48, Aaron Lindsay wrote:
> >> > On Feb 22 19:30, Alex Bennée wrote:
> >> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >> > > That said I think we could add an additional helper to translate a
> >> > > hwaddr to a global address space address. I'm open to suggestions of the
> >> > > best way to structure this.
> >> > 
> >> > Haven't put a ton of thought into it, but what about something like this
> >> > (untested):
> >> > 
> >> > uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
> >> > {
> >> > #ifdef CONFIG_SOFTMMU
> >> >     if (haddr) {
> >> >         if (!haddr->is_io) {
> >> >             RAMBlock *block;
> >> >             ram_addr_t offset;
> >> > 
> >> >             block = qemu_ram_block_from_host((void *) haddr->v.ram.hostaddr, false, &offset);
> >> >             if (!block) {
> >> >                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
> >> >                 abort();
> >> >             }
> >> > 
> >> >             return block->offset + offset + block->mr->addr;
> >> >         } else {
> >> >             MemoryRegionSection *mrs = haddr->v.io.section;
> >> >             return haddr->v.io.offset + mrs->mr->addr;
> >> >         }
> >> >     }
> >> > #endif
> >> >     return 0;
> >> > }
> >> 
> >> This appears to successfully return correct physical addresses for RAM
> >> at least, though I've not tested it thoroughly for MMIO yet.
> >> 
> >> If it ends up being desirable based on the discussion elsewhere on this
> >> thread I am willing to perform more complete testing, turn this into a
> >> patch, and submit it.
> >
> > Ping - Is this something worth me pursuing?
> 
> Yes please. 

Okay, I'll work on it. Is your thinking that this would this be a
separate call as shown above, or a replacement of the existing
qemu_plugin_hwaddr_device_offset function? And, if a replacement, should
we keep the name similar to retain compatibility, or make a clean break?

It seemed like Peter may have been saying the device offset shouldn't be
exposed at all (leading me to consider full replacement), but I also
don't see a definitive resolution of that conversation.

-Aaron

